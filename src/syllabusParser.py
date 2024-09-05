import os
import re
import json
from dotenv import load_dotenv
import pdfplumber
from langchain_openai import ChatOpenAI
from langchain_core.prompts import PromptTemplate
import subprocess



load_dotenv()  # This line brings all environment variables from .env into os.environ
OPENAI_API_KEY = os.environ['OPENAI_API_KEY']

class SyllabusParser:
    def __init__(self, folder_path, output_folder='/Users/youssefchouay/Library/Mobile Documents/iCloud~md~obsidian/Documents/mainVault/MainVault/Courses/'):
        self.folder_path = folder_path
        self.files = os.listdir(folder_path)
        self.llm = ChatOpenAI(model_name="gpt-4o", openai_api_key=OPENAI_API_KEY)
        self.output_folder = output_folder
        self.assignment_paths = []

    def extract_text_from_pdf(self, pdf_path):
        with pdfplumber.open(pdf_path) as pdf:
            text = ''
            for page in pdf.pages:
                text += page.extract_text()
        return text

    def extract_between_brackets(self, text):
        # Define a regular expression pattern for each section
        title_pattern = r'<file_title_starts>(.*?)<file_title_ends>'
        contents_pattern = r'<file_contents_starts>(.*?)<file_contents_ends>'

        # Use re.findall to extract the text between the tags
        title = re.findall(title_pattern, text, re.DOTALL)
        contents = re.findall(contents_pattern, text, re.DOTALL)

        return {
            'title': title[0] if title else None,
            'contents': contents[0] if contents else None
        }

    def extract_schedule(self, text):
        # Define a regular expression pattern for each section
        lecture_pattern = r'<lecture_start>(.*?)<lecture_end>'
        midterm_pattern = r'<midterm_start>(.*?)<midterm_end>'

        # Use re.findall to extract the text between the tags
        lectures = re.findall(lecture_pattern, text, re.DOTALL)
        midterms = re.findall(midterm_pattern, text, re.DOTALL)

        return {
            'lecture': lectures[0] if lectures else None,
            'midterm': midterms[0] if midterms else None
        }

    def extract_assignments(self, text):
        # Load the JSON content into a Python dictionary
        json_text = text.replace("```json\n", "").replace("\n```", "")

        # Directly load the cleaned JSON string into a Python dictionary
        data = json.loads(json_text)

        assignments = data.get("assignments", [])

        for assignment in assignments:
            # Extract the title and content
            assignment_title = assignment.get("assignmentTitle")
            content = assignment.get("content")

            # Save the content to a file
            assignment_title = assignment_title.strip("?").strip()
            assignment_path = self.output_folder + "Assignments/" + assignment_title
            self.assignment_paths.append("MainVault/Courses/Assignments/" + assignment_title)
            print(assignment_title)
            with open(assignment_path, 'w', encoding='utf-8') as f:
                f.write(content.strip())




    def analyze(self, text):
        # Open the MD file containing the file structure
        course_structure = open('templates/course_template.md', 'r')
        # Defining the template
        template = """Extract the following information from the syllabus text and output the result as an MD file:
                    0. CourseTitle
                    1. ProfessorName
                    2. ProfessorEmail
                    3. Assignments (with names and due dates if available) [It should be in a table format]
                    4. MidtermExam (with dates and weights if available) [It should be in a table format]
                    5. FinalExam (with dates and weights if available) [It should be in a table format]
                    6. ClassCalendar with weekly work (if available) [It should be in a table format]
                    7. OfficeHours
                    8. Any other important information

                    You HAVE to use the following template to output the result: \n"""+ course_structure.read() + """\n The syllabus text is as follows:
                    {input}"""
        prompt = PromptTemplate.from_template(template)
        # Create a chain using the LLM and the chat prompt template
        chain = prompt | self.llm
        response = chain.invoke(input=text)

        informed_text = self.extract_between_brackets(response.content)

        title = informed_text['title']
        content = informed_text['contents']
        print(title)
        title = title.strip("?").strip()
        output_file = self.output_folder + title

        self.generate_assignments(content.strip())
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(content.strip())
            f.write("\n\n")
            for i, assignment_path in enumerate(self.assignment_paths):
                f.write("[[" + assignment_path + "|Assignment "+ str(i) +"]]\n\n")
        return None

    def generate_assignments(self, text):
        # Open the MD file containing the file structure
        assignment_structure = open('templates/assignement_template.md', 'r')
        # Defining the template
        template = """You need to extract from the following MD file every Assignment with its due date
                    You HAVE to use the following template to output the result (JSON format DIRECTLY): \n""" + assignment_structure.read().replace("{", "{{").replace("}", "}}") + """\n The syllabus text is as follows:
                    {input}"""
        prompt = PromptTemplate.from_template(template)
        # Create a chain using the LLM and the chat prompt template
        chain = prompt | self.llm
        response = chain.invoke(input=text)

        self.extract_assignments(response.content)
        return None

    def run_applescript(self, type):
        script_path_lectures = "/Users/youssefchouay/Programming/PersonalAgent/scripts/lectureScheduler.scpt"
        script_path_midterms = "/Users/youssefchouay/Programming/PersonalAgent/scripts/midtermScheduler.scpt"
        if type == "lecture":
            script_path = script_path_lectures
        elif type == "midterm":
            script_path = script_path_midterms

        try:
            # Use osascript to run the .scpt file
            subprocess.run(["osascript", script_path], check=True)
            print(f"Successfully ran the script: {script_path}")
        except subprocess.CalledProcessError as e:
            print(f"An error occurred while running the script: {e}")


    def generateSchedule(self, text):
        # Open the MD file containing the file structure
        schedule_structure = open('templates/schedule_template.md', 'r')
        # Defining the template
        template = """Extract the following information from the syllabus text and output the result as an ics file:
                    Lectures (name (lecture + course name), dates, time slots, how many occurences, place...)
                    Midterm (time slots, dates, place...)

                    FOCUS ON GETTING THE DATES AND TIMES CORRECTLY
                    The lectures are usually 1 hour and 30 minutes long (unless specified otherwise), and the midterms are usually the same.
                    You HAVE to use the following template to output the result: \n"""+ schedule_structure.read() + """\n The syllabus text is as follows:
                    {input}"""
        prompt = PromptTemplate.from_template(template)
        # Create a chain using the LLM and the chat prompt template
        chain = prompt | self.llm
        response = chain.invoke(input=text)
        # print(response.content)
        result = self.extract_schedule(response.content)
        lecture = result['lecture']
        midterm = result['midterm']
        # Write the schedule to a ics file
        with open("media/schedule/lecture.ics", 'w', encoding='utf-8') as f:
            f.write(lecture.strip())
        with open("media/schedule/midterm.ics", 'w', encoding='utf-8') as f:
            f.write(midterm.strip())

        self.run_applescript("lecture")
        self.run_applescript("midterm")

        return None

    def run(self):
        for filename in self.files:
            if filename.endswith(".pdf"):
                pdf_path = os.path.join(self.folder_path, filename)
                text = self.extract_text_from_pdf(pdf_path)
                self.analyze(text)
                self.generateSchedule(text)


if __name__ == '__main__':
    folder_path = '/Users/youssefchouay/Programming/PersonalAgent/media/syllabus/'
    parser = SyllabusParser(folder_path)
    parser.run()
