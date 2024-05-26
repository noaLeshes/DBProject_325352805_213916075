
[General]
Version=1

[Preferences]
Username=
Password=2875
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=HADASNOA
Name=HALL
Count=100

[Record]
Name=CAPACITY
Type=NUMBER
Size=5
Data=Random(20, 100)
Master=

[Record]
Name=SCHEDULE
Type=VARCHAR2
Size=50
Data=List('Zumba ', 'HIIT Fit', 'Dance Cardio' ,'Spinning', 'Body Sculpt', 'Pilates', 'Lift and Tone')+
= Random(10, 14)+':00'+' ' + List('Zumba ', 'HIIT Fit', 'Dance Cardio' ,'Spinning', 'Body Sculpt', 'Pilates', 'Lift and Tone')+
= Random(15, 19)+':00'
Master=

[Record]
Name=HALL_NUMBER
Type=NUMBER
Size=5
Data=Sequence(1)
Master=

[Record]
Name=GYM_NUMBER
Type=NUMBER
Size=5
Data=List(select gym_number from gym)
Master=

