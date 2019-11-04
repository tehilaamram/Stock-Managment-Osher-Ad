
[General]
Version=1

[Preferences]
Username=
Password=2324
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=TAMRAM
Name=COMPANY
Count=3000..3000

[Record]
Name=COMPANYID
Type=NUMBER
Size=9
Data=Sequence(10, [Inc], [WithinParent])
Master=

[Record]
Name=COMPANYNAME
Type=VARCHAR2
Size=30
Data=Company
Master=

[Record]
Name=COMPANYCOUNTRY
Type=VARCHAR2
Size=30
Data=Country
Master=

[Record]
Name=COMPANYESTABLISHEDYEAR
Type=DATE
Size=
Data=Random(1/1/1900, 1/1/2000)
Master=

