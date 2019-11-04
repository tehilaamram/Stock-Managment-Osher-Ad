
[General]
Version=1

[Preferences]
Username=
Password=2224
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=TAMRAM
Name=ORDEREDPRODUCT
Count=3000..3000

[Record]
Name=PRODUCTBARCODE
Type=NUMBER
Size=10
Data=List(select productbarcode from product)
Master=

[Record]
Name=ORDERNUMBER
Type=NUMBER
Size=9
Data=List(select ordernumber from orderFromBasement)
Master=

[Record]
Name=ORDERAMOUNT
Type=NUMBER
Size=
Data=Random(0, 10000)
Master=

[Record]
Name=EXPIRYDATE
Type=DATE
Size=
Data=Random(1/1/1990, 1/1/2025)
Master=

[Record]
Name=SOLDAMOUNT
Type=NUMBER
Size=
Data=Random(0, 4000)
Master=

