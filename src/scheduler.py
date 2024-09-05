import json
from icalendar import Calendar, Event
from datetime import datetime

class ICSFileCreator:
    def __init__(self, json_file):
        self.json_file = json_file
        self.events = []

    def parse_json(self):
        """Parse the JSON file to extract event details."""
        with open(self.json_file, 'r') as file:
            data = json.load(file)
            self.events = data.get('events', [])

    def create_event(self, name, date, time, repeat_number, repeat_interval):
        """Create an iCalendar event with a specific time and repeat interval."""
        event = Event()
        event.add('summary', name)
        datetime_str = f"{date} {time}"
        event.add('dtstart', datetime.strptime(datetime_str, '%Y-%m-%d %H:%M:%S'))

        if repeat_interval and repeat_number > 1:
            event.add('rrule', {
                'freq': repeat_interval.upper(),
                'count': repeat_number
            })

        return event

    def create_ics(self, output_file):
        """Create an .ics file from the events."""
        cal = Calendar()

        for event in self.events:
            name = event.get('name')
            date = event.get('date')
            time = event.get('time')
            repeat_number = event.get('repeat_number', 1)
            repeat_interval = event.get('repeat_interval', None)
            cal_event = self.create_event(name, date, time, repeat_number, repeat_interval)
            cal.add_component(cal_event)

        with open(output_file, 'wb') as f:
            f.write(cal.to_ical())

    def run(self, output_file='output.ics'):
        """Execute the process of parsing JSON and creating an ICS file."""
        self.parse_json()
        self.create_ics(output_file)
        print(f"ICS file '{output_file}' created successfully!")

# Example usage:
ics_creator = ICSFileCreator('events.json')
ics_creator.run('my_calendar.ics')
