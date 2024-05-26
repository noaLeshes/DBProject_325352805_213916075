
[General]
Version=1

[Preferences]
Username=
Password=2086
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=HADASNOA
Name=TAKES
Count=500

[Record]
Name=PERSON_ID
Type=NUMBER
Size=10
Data=List(select person_id from trainee)
Master=

[Record]
Name=CLASS_NUMBER
Type=NUMBER
Size=5
Data=List(select class_number from class_lesson)
Master=

