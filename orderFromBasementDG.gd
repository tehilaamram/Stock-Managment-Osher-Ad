
[General]
Version=1

[Preferences]
Username=
Password=2200
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=TAMRAM
Name=ORDERFROMBASEMENT
Count=3000..3000

[Record]
Name=ORDERNUMBER
Type=NUMBER
Size=9
Data=Sequence(10, [Inc], [WithinParent])
Master=

[Record]
Name=BRANCHID
Type=NUMBER
Size=9
Data=List(select branchid from branch)
Master=

[Record]
Name=AGENTID
Type=NUMBER
Size=9
Data=List(select agentid from agent)
Master=

[Record]
Name=ORDERDATE
Type=DATE
Size=
Data=Random(1/1/2000, 1/1/2020)
Master=

