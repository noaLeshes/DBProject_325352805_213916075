
[General]
Version=1

[Preferences]
Username=
Password=2083
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=HADASNOA
Name=TRAINS_IN
Count=400

[Record]
Name=GYM_NUMBER
Type=NUMBER
Size=5
Data=List(select gym_number from gym)
Master=

[Record]
Name=PERSON_ID
Type=NUMBER
Size=10
Data=List(select person_id from trainee)
Master=

