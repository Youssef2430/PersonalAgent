FasdUAS 1.101.10   ��   ��    k             l       	  r      
  
 m        �    L e c t u r e  o      ���� (0 targetcalendarname targetCalendarName  6 0 Change this to the name of your target calendar    	 �   `   C h a n g e   t h i s   t o   t h e   n a m e   o f   y o u r   t a r g e t   c a l e n d a r      l        r        c    
    l    ����  4    �� 
�� 
psxf  m       �   � / U s e r s / y o u s s e f c h o u a y / P r o g r a m m i n g / P e r s o n a l A g e n t / m e d i a / s c h e d u l e / l e c t u r e . i c s��  ��    m    	��
�� 
alis  o      ���� 0 thepath thePath    Path to your .ics file     �   .   P a t h   t o   y o u r   . i c s   f i l e      l     ��������  ��  ��         l   � !���� ! O    � " # " k    � $ $  % & % I   ������
�� .miscactvnull��� ��� null��  ��   &  ' ( ' l   ��������  ��  ��   (  ) * ) l   �� + ,��   + c ] Get the application's name (presumably either "iCal" or "Calendar") for GUI Scripting later.    , � - - �   G e t   t h e   a p p l i c a t i o n ' s   n a m e   ( p r e s u m a b l y   e i t h e r   " i C a l "   o r   " C a l e n d a r " )   f o r   G U I   S c r i p t i n g   l a t e r . *  . / . r      0 1 0 n    2 3 2 1    ��
�� 
pnam 3  g     1 o      ���� 0 icalname iCalName /  4 5 4 l  ! !��������  ��  ��   5  6 7 6 l  ! !�� 8 9��   8 ' ! Find the target calendar by name    9 � : : B   F i n d   t h e   t a r g e t   c a l e n d a r   b y   n a m e 7  ; < ; r   ! $ = > = m   ! "��
�� 
null > o      ����  0 targetcalendar targetCalendar <  ? @ ? Y   % X A�� B C�� A k   5 S D D  E F E r   5 = G H G 4   5 9�� I
�� 
wres I o   7 8���� 0 i   H o      ���� 0 thiscalendar thisCalendar F  J�� J Z   > S K L���� K l  > E M���� M =  > E N O N n   > C P Q P 1   A C��
�� 
pnam Q o   > A���� 0 thiscalendar thisCalendar O o   C D���� (0 targetcalendarname targetCalendarName��  ��   L k   H O R R  S T S r   H M U V U o   H K���� 0 thiscalendar thisCalendar V o      ����  0 targetcalendar targetCalendar T  W�� W  S   N O��  ��  ��  ��  �� 0 i   B m   ( )����  C I  ) 0�� X��
�� .corecnte****       **** X 2  ) ,��
�� 
wres��  ��   @  Y Z Y l  Y Y��������  ��  ��   Z  [ \ [ l  Y Y�� ] ^��   ] - ' Check if the target calendar was found    ^ � _ _ N   C h e c k   i f   t h e   t a r g e t   c a l e n d a r   w a s   f o u n d \  `�� ` Z   Y � a b���� a =  Y \ c d c o   Y Z����  0 targetcalendar targetCalendar d m   Z [��
�� 
null b k   _ � e e  f g f I  _ ��� h i
�� .sysodlogaskr        TEXT h b   _ h j k j b   _ d l m l m   _ b n n � o o  C a l e n d a r   ' m o   b c���� (0 targetcalendarname targetCalendarName k m   d g p p � q q  '   n o t   f o u n d . i �� r s
�� 
btns r J   k p t t  u�� u m   k n v v � w w  O K��   s �� x y
�� 
dflt x m   s v z z � { {  O K y �� |��
�� 
disp | m   y z����  ��   g  }�� } L   � �����  ��  ��  ��  ��   # 5    �� ~��
�� 
capp ~ m       � � �  c o m . a p p l e . i C a l
�� kfrmID  ��  ��      � � � l     ��������  ��  ��   �  � � � l  � � ����� � I  � ��� ���
�� .sysodelanull��� ��� nmbr � m   � ����� ��  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � B < "Double-click" the file to open and import it into Calendar    � � � � x   " D o u b l e - c l i c k "   t h e   f i l e   t o   o p e n   a n d   i m p o r t   i t   i n t o   C a l e n d a r �  � � � l  � � ����� � O  � � � � � I  � ��� ���
�� .aevtodocnull  �    alis � 4   � ��� �
�� 
file � o   � ����� 0 thepath thePath��   � m   � � � ��                                                                                  MACS  alis    @  Macintosh HD               �횘BD ����
Finder.app                                                     �����횘        ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��  ��   �  � � � l     ��������  ��  ��   �  ��� � l  �P ����� � O   �P � � � O   �O � � � k   �N � �  � � � l  � ��� � ���   � J D Hedge bets over the name of the "Add Event" or "Add Events" window.    � � � � �   H e d g e   b e t s   o v e r   t h e   n a m e   o f   t h e   " A d d   E v e n t "   o r   " A d d   E v e n t s "   w i n d o w . �  ��� � O   �N � � � k   �M � �  � � � W   � � � � � I  � ��� ���
�� .sysodelanull��� ��� nmbr � m   � � � � ?ə�������   � l  � � ����� � I  � ��� ���
�� .coredoexnull���     **** �  g   � ���  ��  ��   �  � � � I  � ��� ���
�� .prcsclicnull��� ��� uiel � 4   � ��� �
�� 
popB � m   � ����� ��   �  � � � W   �
 � � � I  ��� ���
�� .sysodelanull��� ��� nmbr � m   � � � ?ə�������   � l  � � ����� � I  � ��� ���
�� .coredoexnull���     **** � n   � � � � � 4   � ��� �
�� 
menE � m   � �����  � 4   � ��� �
�� 
popB � m   � ����� ��  ��  ��   �  � � � l ��������  ��  ��   �  � � � l �� � ���   � < 6 Select the target calendar from the list of calendars    � � � � l   S e l e c t   t h e   t a r g e t   c a l e n d a r   f r o m   t h e   l i s t   o f   c a l e n d a r s �  � � � I �� ���
�� .prcsclicnull��� ��� uiel � n   � � � 4  �� �
�� 
menI � o  ���� (0 targetcalendarname targetCalendarName � n   � � � 4  �� �
�� 
menE � m  ����  � 4  �� �
�� 
popB � m  ���� ��   �  � � � V   @ � � � I 4;�� ���
�� .sysodelanull��� ��� nmbr � m  47 � � ?ə�������   � l $3 ���~ � I $3�} ��|
�} .coredoexnull���     **** � n  $/ � � � 4  */�{ �
�{ 
menE � m  -.�z�z  � 4  $*�y �
�y 
popB � m  ()�x�x �|  �  �~   �  � � � l AA�w�v�u�w  �v  �u   �  � � � l AA�t � ��t   � * $ Confirm by clicking the "OK" button    � � � � H   C o n f i r m   b y   c l i c k i n g   t h e   " O K "   b u t t o n �  ��s � I AM�r ��q
�r .prcsclicnull��� ��� uiel � 4  AI�p �
�p 
butT � m  EH � � � � �  O K�q  �s   � l  � � ��o�n � 6  � � � � � 4  � ��m �
�m 
cwin � m   � ��l�l  � C  � � � � � 1   � ��k
�k 
titl � m   � � � � � � �  A d d   e v e n t�o  �n  ��   � 4   � ��j �
�j 
prcs � o   � ��i�i 0 icalname iCalName � m   � � � ��                                                                                  sevs  alis    \  Macintosh HD               �횘BD ����System Events.app                                              �����횘        ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  ��  ��  ��       
�h � �  � � � ��g�f�h   � �e�d�c�b�a�`�_�^
�e .aevtoappnull  �   � ****�d (0 targetcalendarname targetCalendarName�c 0 thepath thePath�b 0 icalname iCalName�a  0 targetcalendar targetCalendar�` 0 thiscalendar thisCalendar�_  �^   � �] ��\�[ � ��Z
�] .aevtoappnull  �   � **** � k    P � �   � �   � �   � �  � � �  �    ��Y�Y  �\  �[   � �X�X 0 i   � , �W�V �U�T�S �R�Q�P�O�N�M�L�K�J n p�I v�H z�G�F�E�D ��C�B ��A�@�? ��> ��=�<�;�:�9 ��W (0 targetcalendarname targetCalendarName
�V 
psxf
�U 
alis�T 0 thepath thePath
�S 
capp
�R kfrmID  
�Q .miscactvnull��� ��� null
�P 
pnam�O 0 icalname iCalName
�N 
null�M  0 targetcalendar targetCalendar
�L 
wres
�K .corecnte****       ****�J 0 thiscalendar thisCalendar
�I 
btns
�H 
dflt
�G 
disp�F 
�E .sysodlogaskr        TEXT
�D .sysodelanull��� ��� nmbr
�C 
file
�B .aevtodocnull  �    alis
�A 
prcs
�@ 
cwin  
�? 
titl
�> .coredoexnull���     ****
�= 
popB
�< .prcsclicnull��� ��� uiel
�; 
menE
�: 
menI
�9 
butT�ZQ�E�O)��/�&E�O)���0 t*j 	O*�,E�O�E�O 2k*�-j kh  *�/E` O_ �,�  _ E�OY h[OY��O��  )a �%a %a a kva a a ja  OhY hUOkj Oa  *a �/j UOa  �*a �/ �*a  k/a ![a ",\Za #>1 � h*j $a %j [OY��O*a &k/j 'O h*a &k/a (k/j $a %j [OY��O*a &k/a (k/a )�/j 'O h*a &k/a (k/j $a %j [OY��O*a *a +/j 'UUU �~alis    z   Macintosh HD               �횘BD ����lecture.ics                                                    ������.        ����  J cu            J/:Users:youssefchouay:Programming:PersonalAgent:media:schedule:lecture.ics    l e c t u r e . i c s    M a c i n t o s h   H D  HUsers/youssefchouay/Programming/PersonalAgent/media/schedule/lecture.ics  /    ��   � �  C a l e n d a r �  �8�7�                                                                                  wrbt  alis    8  Macintosh HD               �횘BD ����Calendar.app                                                   �����횘        ����  
 cu             Applications  #/:System:Applications:Calendar.app/     C a l e n d a r . a p p    M a c i n t o s h   H D   System/Applications/Calendar.app  / ��  
�8 
wres � H 6 D 0 C 2 6 0 1 - C 2 2 5 - 4 E 4 4 - 9 6 0 9 - 6 A F 9 1 6 3 F 9 5 5 8
�7 kfrmID  �g  �f   ascr  ��ޭ