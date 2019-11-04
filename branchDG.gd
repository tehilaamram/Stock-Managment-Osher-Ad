
[General]
Version=1

[Preferences]
Username=
Password=2997
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=TAMRAM
Name=BRANCH
Count=3000..3000

[Record]
Name=BRANCHID
Type=NUMBER
Size=9
Data=Sequence(10, [Inc], [WithinParent])
Master=

[Record]
Name=BRANCHNAME
Type=VARCHAR2
Size=30
Data=Elements.Name
Master=

[Record]
Name=CITYNAME
Type=VARCHAR2
Size=20
Data=List(select cityName from city)
Master=

