
[General]
Version=1

[Preferences]
Username=
Password=2815
Database=
DateFormat=dd-mm-yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=HADASNOA
Name=TRAINEE
Count=250

[Record]
Name=SUBSCRIPTION
Type=VARCHAR2
Size=50
Data=List('Basic Membership', 'Standard Membership', 'Premium Membership', 'Family Membership', 'Personal Training Membership')
Master=

[Record]
Name=TRAINING_PLAN
Type=VARCHAR2
Size=50
Data=List('Sun-Tue ') + List('Zumba ', 'HIIT', 'Cardio' ,'Spinning', 'Body Sculpt', 'Pilates', 'Lift-Tone') +' '+
=List('Mon-Wed ') + List('Zumba ', 'HIIT, 'Cardio' ,'Spinning', 'Body Sculpt', 'Pilates', 'Lift-Tone') 
Master=

[Record]
Name=HEALTH
Type=VARCHAR2
Size=50
Data=List('Full Health', 'Heart Disease', 'High Blood Pressure', 'Injuries', 'Chronic Respiratory Conditions')
Master=

[Record]
Name=PAYMENT_DETAILS
Type=VARCHAR2
Size=50
Data=List('cash', 'credit card', 'coupon')
Master=

[Record]
Name=AGE
Type=NUMBER
Size=5
Data=Random(14, 99)
Master=

[Record]
Name=JOINING_DATE
Type=DATE
Size=
Data=Random(1/1/2024, 26/5/2024)
Master=

[Record]
Name=PERSON_ID
Type=NUMBER
Size=10
Data=List(select person_id from person)
Master=

