
[General]
Version=1

[Preferences]
Username=
Password=2355
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=TAMRAM
Name=REPRESENT
Count=3000..3000

[Record]
Name=COMPANYID
Type=NUMBER
Size=9
Data=List(select companyid from company)
Master=

[Record]
Name=AGENTID
Type=NUMBER
Size=9
Data=List(select agentid from agent)
Master=

