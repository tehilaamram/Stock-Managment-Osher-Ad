
[General]
Version=1

[Preferences]
Username=
Password=2764
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=TAMRAM
Name=CATEGORY
Count=3000..3000

[Record]
Name=CATEGORYID
Type=NUMBER
Size=9
Data=Sequence(10, [Inc], [WithinParent])
Master=

[Record]
Name=CATEGORYNAME
Type=VARCHAR2
Size=20
Data=Elements.Name
Master=

