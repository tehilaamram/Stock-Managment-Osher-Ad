
[General]
Version=1

[Preferences]
Username=
Password=2580
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=TAMRAM
Name=PRODUCT
Count=30

[Record]
Name=PRODUCTBARCODE
Type=NUMBER
Size=10
Data=Sequence(10, [Inc], [WithinParent])
Master=

[Record]
Name=PRODUCTNAME
Type=CHAR
Size=30
Data=FirstName
Master=

[Record]
Name=CATEGORYID
Type=NUMBER
Size=9
Data=List(select categoryid from category)
Master=

[Record]
Name=COMPANYID
Type=NUMBER
Size=9
Data=List(select companyid from company)
Master=

[Record]
Name=PRODUCTPRICE
Type=FLOAT
Size=22
Data=Components.Price
Master=

