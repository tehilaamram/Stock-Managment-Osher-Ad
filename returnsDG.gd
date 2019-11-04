
[General]
Version=1

[Preferences]
Username=
Password=2473
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=TAMRAM
Name=RETURNS
Count=3000..3000

[Record]
Name=RETURNSREASON
Type=VARCHAR2
Size=500
Data=Components.Description
Master=

[Record]
Name=RETURNSID
Type=NUMBER
Size=9
Data=Sequence(10, [Inc], [WithinParent])
Master=

[Record]
Name=RETURNSDATE
Type=DATE
Size=
Data=Random(1/1/2000, 1/1/2018)
Master=

[Record]
Name=PRODUCTBARCODE
Type=NUMBER
Size=10
Data=List(select productBarcode from product)
Master=

