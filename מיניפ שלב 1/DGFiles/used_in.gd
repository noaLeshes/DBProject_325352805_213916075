
[General]
Version=1

[Preferences]
Username=
Password=2917
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=HADASNOA
Name=USED_IN
Count=500

[Record]
Name=CLASS_NUMBER
Type=NUMBER
Size=5
Data=List(select class_number from class_lesson)
Master=

[Record]
Name=DEVICE_NUMBER
Type=NUMBER
Size=10
Data=List(select device_number from device)
Master=

