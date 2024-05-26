
[General]
Version=1

[Preferences]
Username=
Password=2673
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=HADASNOA
Name=COACH
Count=150

[Record]
Name=SPECIALITY
Type=VARCHAR2
Size=50
Data=List('Strength Training', 'Cardio Fitness', 'Yoga', 'Pilates', 'Nutrition Coaching', 'Weight Loss', 'Rehabilitation', 'Endurance Training', 'Bodybuilding')
Master=

[Record]
Name=SALARY
Type=NUMBER
Size=15
Data=Random(7000, 12000)
Master=

[Record]
Name=EXPERIENCE
Type=VARCHAR2
Size=50
Data=Random(3, 25) + ' years'
Master=

[Record]
Name=PERSON_ID
Type=NUMBER
Size=10
Data=List(select person_id from person)
Master=

