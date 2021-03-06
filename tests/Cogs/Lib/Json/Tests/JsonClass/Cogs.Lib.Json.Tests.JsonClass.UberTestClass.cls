/// Copyright (c) 2017 MemCog Ltd
/// Set GitHub documentation for help
Class Cogs.Lib.Json.Tests.JsonClass.UberTestClass Extends Cogs.JsonClass
{

Property TestBooleanYes As %Boolean;

Property TestBooleanNo As %Boolean;

Property TestNotBoolean1 As %String;

Property TestNotBoolean2 As %String;

Property TestNullString As %String;

Property TestStringNotNull As %String;

Property TestNullBoolean As %Boolean;

Property TestNullInteger As %Integer;

Property TestNullDate As %Date;

Property TestNullTimestamp As %TimeStamp;

Property TestTime As %Time;

Property TestStringOfJSON As %String;

Property TestInteger As %Integer;

Property TestDate As %Date;

Property TestTimestamp As %TimeStamp;

Property TestTimestampShort As %TimeStamp;

Property TestEscapes As %String;

Property TestString As %String;

Property TestZero As %Integer;

Property TestRawJson As Cogs.Lib.Types.Json;

Property TestLongString As %String;

Property TestLongNumber As %Integer;

Property TestAllAsciiChars As %String;

Property TestListOfString As list Of %String;

Property TestEmptyListOfString As list Of %String;

Property TestListOfBoolean As list Of %Boolean;

Property TestEmptyListOfBoolean As list Of %Boolean;

Property TestListOfOfDate As list Of %Date;

Property TestEmptyListOfOfDate As list Of %Date;

Property TestListOfOfInteger As list Of %Integer;

Property TestEmptyListOfOfInteger As list Of %Integer;

Property TestArrayOfString As array Of %String;

Property TestEmptyArrayOfString As array Of %String;

Property TestArrayOfBoolean As array Of %Boolean;

Property TestEmptyArrayOfBoolean As array Of %Boolean;

Property TestArrayOfDate As array Of %Date;

Property TestEmptyArrayOfDate As array Of %Date;

Property TestArrayOfInteger As array Of %Integer;

Property TestEmptyArrayOfInteger As array Of %Integer;

Property TestSingleObject As Cogs.Lib.Json.Tests.JsonClass.UberTestClass;

Property TestListOfObject As list Of Cogs.Lib.Json.Tests.JsonClass.UberTestClass;

Property TestArrayOfObject As array Of Cogs.Lib.Json.Tests.JsonClass.UberTestClass;

Property TestIgnoreFlag As %String(JSONIGNORE = 1);

Property ZTestJsonName As %String(JSONNAME = "_id");

Property ZTestJsonMethod As %String(JSONMETHOD = "..ToUpper(..TestLongString)");

ClassMethod ToUpper(pText As %String) As %String
{
	Quit $ZCVT(pText,"U")
}

ClassMethod CreateTestObject1() As Cogs.Lib.Json.Tests.JsonClass.UberTestClass
{
	set test=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).%New()
	set test.TestBooleanYes=1
	set test.TestBooleanNo=0
	set test.TestNotBoolean1="true"
	set test.TestNotBoolean2="false"
	set test.TestStringNotNull=""
	set test.TestNullString=$c(0)
	set test.TestNullBoolean=""
	set test.TestNullInteger=""
	set test.TestNullDate=""
	set test.TestStringOfJSON="{""menu"": { ""id"": ""file"", ""value"": ""File"", ""popup"": { ""menuitem"": [ {""value"": ""New"", ""onclick"": ""CreateNewdoc()""}, {""value"": ""Open"", ""onclick"": ""Opendoc()""}, {""value"": ""Close"", ""onclick"": ""Closedoc()""} ] }}}"
	set test.TestInteger=42
	set test.TestDate=+$H
	set test.TestTimestamp="1966-01-27 23:12:02"
	set test.TestTimestampShort="1966-01-27 00:00:00"
	set test.TestTime=4444
	set test.TestEscapes="\""\""/"""_$C(8,9,10,12,13)
	set test.TestIgnoreFlag="WARNING, THIS IS PRIVATE AND SHOULD NOT BE SERIALISED INTO JSON!"
	set test.TestLongString="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
	set test.TestLongNumber=49947976805055875840000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
	set test.TestString="{[{\}[/][{[""FOO"","""""""""""""""""""""""""""""""""",""BAR""]}]{\}[/]]}"
	for i=0:1:127 set all=$get(all)_$c(i)
	set test.TestAllAsciiChars=all
	do test.TestListOfString.Insert("Sherlock Holmes")
	do test.TestListOfString.Insert("221B Baker Street")
	do test.TestListOfString.Insert("Marylebone")
	do test.TestListOfString.Insert("London W1")
	do test.TestListOfString.Insert("UK")
	do test.TestListOfString.Insert($c(0))
	do test.TestListOfString.Insert("{[{\}[/][{[FOO,BAR]}]{\}[/]]}")
	do test.TestListOfString.Insert("\""\""/"""_$C(8,9,10,12,13))
	do test.TestListOfString.Insert(0)
	do test.TestListOfString.Insert(1)
	do test.TestListOfString.Insert(345345345345345345354.00)
	do test.TestListOfBoolean.Insert(1)
	do test.TestListOfBoolean.Insert(0)
	do test.TestListOfBoolean.Insert(0)
	do test.TestListOfBoolean.Insert("")
	do test.TestListOfBoolean.Insert(1)
	do test.TestListOfBoolean.Insert(0)
	do test.TestListOfBoolean.Insert(1)
	do test.TestListOfBoolean.Insert(1)
	do test.TestListOfBoolean.Insert(0)
	do test.TestListOfOfDate.Insert(0)
	do test.TestListOfOfDate.Insert(10)
	do test.TestListOfOfDate.Insert(100)
	do test.TestListOfOfDate.Insert(1000)
	do test.TestListOfOfDate.Insert("")
	do test.TestListOfOfDate.Insert(10000)
	do test.TestListOfOfDate.Insert(100000)
	do test.TestListOfOfDate.Insert(1000000)
	do test.TestListOfOfInteger.Insert(0)
	do test.TestListOfOfInteger.Insert(43564356546456)
	do test.TestListOfOfInteger.Insert(0.345)
	do test.TestListOfOfInteger.Insert(.2)
	do test.TestListOfOfInteger.Insert("")
	do test.TestListOfOfInteger.Insert(-464356.75675)
	do test.TestListOfOfInteger.Insert(76567)
	do test.TestListOfOfInteger.Insert(3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117067982148086513282306647093844609550582231725359408128481)
	do test.TestListOfOfInteger.Insert(7653475667)
	do test.TestListOfOfInteger.Insert(-65753)
	do test.TestListOfOfInteger.Insert(45676.56)
	do test.TestListOfOfInteger.Insert(-78456/101+100*345/34.3)
	do test.TestArrayOfBoolean.SetAt(1,"ALPHA")
	do test.TestArrayOfBoolean.SetAt(0,"CHARLIE")
	do test.TestArrayOfBoolean.SetAt("","DELTA")
	do test.TestArrayOfBoolean.SetAt(0,"ECHO")
	do test.TestArrayOfBoolean.SetAt(1,"FOXTROT")
	do test.TestArrayOfString.SetAt("Sherlock Holmes","Detective")
	do test.TestArrayOfString.SetAt("221B Baker Street","Street")
	do test.TestArrayOfString.SetAt("Marylebone","District")
	do test.TestArrayOfString.SetAt("London W1","City")
	do test.TestArrayOfString.SetAt("UK","Country")
	do test.TestArrayOfString.SetAt("\""\""/"""_$C(8,9,10,12,13),"b4d,Th1ng5!")
	do test.TestArrayOfString.SetAt("{[{\}[/][{[FOO,BAR]}]{\}[/]]}","FOOBAR")
	do test.TestArrayOfString.SetAt($c(0),"nully")
	do test.TestArrayOfString.SetAt("","not-nully")
	do test.TestArrayOfDate.SetAt(0,"Happy-Horolog :)")
	do test.TestArrayOfDate.SetAt(+$H,"doB")
	do test.TestArrayOfDate.SetAt($H+40000,"doB")
	do test.TestArrayOfDate.SetAt("","nully")
	do test.TestArrayOfInteger.SetAt(1,"ONE")
	do test.TestArrayOfInteger.SetAt(2,"TWO")
	do test.TestArrayOfInteger.SetAt(3,"THREE")
	do test.TestArrayOfInteger.SetAt(99,"NINETY NINE")
	do test.TestArrayOfInteger.SetAt(1000,"A THOUSAND!")
	do test.TestArrayOfInteger.SetAt(59546526326827,"WORLD DEBT $")
	do test.TestArrayOfInteger.SetAt(241000000000000,"WORLD WORTH $")
	do test.TestArrayOfInteger.SetAt("","nully")
	set test.ZTestJsonName="FOO"
	Quit test
}

ClassMethod CreateTestObject2() As Cogs.Lib.Json.Tests.JsonClass.UberTestClass
{
	set test=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).%New()
	set test.TestBooleanYes=1
	set test.TestBooleanNo=0
	set test.TestNotBoolean1="true"
	set test.TestNotBoolean2="false"
	set test.TestStringNotNull=""
	set test.TestNullString=$c(0)
	set test.TestNullBoolean=""
	set test.TestNullInteger=""
	set test.TestNullDate=""
	set test.TestStringOfJSON="{""menu"": { ""id"": ""file"", ""value"": ""File"", ""popup"": { ""menuitem"": [ {""value"": ""New"", ""onclick"": ""CreateNewdoc()""}, {""value"": ""Open"", ""onclick"": ""Opendoc()""}, {""value"": ""Close"", ""onclick"": ""Closedoc()""} ] }}}"
	set test.TestInteger=42
	set test.TestDate=+$H
	set test.TestTimestamp="1966-01-27 23:12:02"
	set test.TestTimestampShort="1966-01-27 00:00:00"
	set test.TestTime=4444
	set test.TestEscapes="\""\""/"""_$C(8,9,10,12,13)
	set test.TestIgnoreFlag="WARNING, THIS IS PRIVATE AND SHOULD NOT BE SERIALISED INTO JSON!"
	set test.TestLongString="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
	set test.TestLongNumber=49947976805055875840000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
	set test.TestString="{[{\}[/][{[""FOO"","""""""""""""""""""""""""""""""""",""BAR""]}]{\}[/]]}"
	set test.TestRawJson="{""TestAllAsciiChars"":"" !\""#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"_$c(127)_""",""TestArrayOfBoolean"":{""ALPHA"":true,""CHARLIE"":false,""DELTA"":null,""ECHO"":false,""FOXTROT"":true},""TestArrayOfDate"":{""Happy-Horolog :)"":""1840-12-31"",""doB"":""2126-12-16"",""nully"":null},""TestArrayOfInteger"":{""A THOUSAND!"":1000,""NINETY NINE"":99,""ONE"":1,""THREE"":3,""TWO"":2,""WORLD DEBT $"":59546526326827,""WORLD WORTH $"":241000000000000,""nully"":null},""TestArrayOfObject"":{},""TestArrayOfString"":{""City"":""London W1"",""Country"":""UK"",""Detective"":""Sherlock Holmes"",""District"":""Marylebone"",""FOOBAR"":""{[{\\}[/][{[FOO,BAR]}]{\\}[/]]}"",""Street"":""221B Baker Street"",""b4d,Th1ng5!"":""\\\""\\\""/\""\b\t\n\f\r"",""not-nully"":"""",""nully"":null},""TestBooleanNo"":false,""TestBooleanYes"":true,""TestDate"":""2017-06-10"",""TestEmptyArrayOfBoolean"":{},""TestEmptyArrayOfDate"":{},""TestEmptyArrayOfInteger"":{},""TestEmptyArrayOfString"":{},""TestEmptyListOfBoolean"":[],""TestEmptyListOfOfDate"":[],""TestEmptyListOfOfInteger"":[],""TestEmptyListOfString"":[],""TestEscapes"":""\\\""\\\""/\""\b\t\n\f\r"",""TestInteger"":42,""TestListOfBoolean"":[true,false,false,null,true,false,true,true,false],""TestListOfObject"":[],""TestListOfOfDate"":[""1840-12-31"",""1841-01-10"",""1841-04-10"",""1843-09-27"",null,""1868-05-18"",""2114-10-16"",""4578-11-27""],""TestListOfOfInteger"":[""0"",43564356546456,0.345,0.2,null,-464356.75675,76567,3.141592653589793238,7653475667,-65753,45676.56,-6807.383887076754324],""TestListOfString"":[""Sherlock Holmes"",""221B Baker Street"",""Marylebone"",""London W1"",""UK"",null,""{[{\\}[/][{[FOO,BAR]}]{\\}[/]]}"",""\\\""\\\""/\""\b\t\n\f\r"",""0"",""1"",""345345345345345345400""],""TestLongNumber"":49947976805055875840000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,""TestLongString"":""Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"",""TestNotBoolean1"":""true"",""TestNotBoolean2"":""false"",""TestNullBoolean"":null,""TestNullDate"":null,""TestNullInteger"":null,""TestNullString"":null,""TestNullTimestamp"":null,""TestRawJson"":"""",""TestSingleObject"":"""",""TestString"":""{[{\\}[/][{[\""FOO\"",\""\""\""\""\""\""\""\""\""\""\""\""\""\""\""\""\"",\""BAR\""]}]{\\}[/]]}"",""TestStringNotNull"":"""",""TestStringOfJSON"":""{\""menu\"": { \""id\"": \""file\"", \""value\"": \""File\"", \""popup\"": { \""menuitem\"": [ {\""value\"": \""New\"", \""onclick\"": \""CreateNewdoc()\""}, {\""value\"": \""Open\"", \""onclick\"": \""Opendoc()\""}, {\""value\"": \""Close\"", \""onclick\"": \""Closedoc()\""} ] }}}"",""TestTime"":""01:14:04"",""TestTimestamp"":""1966-01-27T23:12:02"",""TestTimestampShort"":""1966-01-27T00:00:00"",""TestZero"":null,""ZTestJsonMethod"":""LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. DUIS AUTE IRURE DOLOR IN REPREHENDERIT IN VOLUPTATE VELIT ESSE CILLUM DOLORE EU FUGIAT NULLA PARIATUR. EXCEPTEUR SINT OCCAECAT CUPIDATAT NON PROIDENT, SUNT IN CULPA QUI OFFICIA DESERUNT MOLLIT ANIM ID EST LABORUM. SED UT PERSPICIATIS UNDE OMNIS ISTE NATUS ERROR SIT VOLUPTATEM ACCUSANTIUM DOLOREMQUE LAUDANTIUM, TOTAM REM APERIAM, EAQUE IPSA QUAE AB ILLO INVENTORE VERITATIS ET QUASI ARCHITECTO BEATAE VITAE DICTA SUNT EXPLICABO. NEMO ENIM IPSAM VOLUPTATEM QUIA VOLUPTAS SIT ASPERNATUR AUT ODIT AUT FUGIT, SED QUIA CONSEQUUNTUR MAGNI DOLORES EOS QUI RATIONE VOLUPTATEM SEQUI NESCIUNT. NEQUE PORRO QUISQUAM EST, QUI DOLOREM IPSUM QUIA DOLOR SIT AMET, CONSECTETUR, ADIPISCI VELIT, SED QUIA NON NUMQUAM EIUS MODI TEMPORA INCIDUNT UT LABORE ET DOLORE MAGNAM ALIQUAM QUAERAT VOLUPTATEM. UT ENIM AD MINIMA VENIAM, QUIS NOSTRUM EXERCITATIONEM ULLAM CORPORIS SUSCIPIT LABORIOSAM, NISI UT ALIQUID EX EA COMMODI CONSEQUATUR? QUIS AUTEM VEL EUM IURE REPREHENDERIT QUI IN EA VOLUPTATE VELIT ESSE QUAM NIHIL MOLESTIAE CONSEQUATUR, VEL ILLUM QUI DOLOREM EUM FUGIAT QUO VOLUPTAS NULLA PARIATUR?"",""_id"":""FOO""}"
	for i=0:1:127 set all=$get(all)_$c(i)
	set test.TestAllAsciiChars=all
	do test.TestListOfString.Insert("Sherlock Holmes")
	do test.TestListOfString.Insert("221B Baker Street")
	do test.TestListOfString.Insert("Marylebone")
	do test.TestListOfString.Insert("London W1")
	do test.TestListOfString.Insert("UK")
	do test.TestListOfString.Insert($c(0))
	do test.TestListOfString.Insert("{[{\}[/][{[FOO,BAR]}]{\}[/]]}")
	do test.TestListOfString.Insert("\""\""/"""_$C(8,9,10,12,13))
	do test.TestListOfString.Insert(0)
	do test.TestListOfString.Insert(1)
	do test.TestListOfString.Insert(345345345345345345354.00)
	do test.TestListOfBoolean.Insert(1)
	do test.TestListOfBoolean.Insert(0)
	do test.TestListOfBoolean.Insert(0)
	do test.TestListOfBoolean.Insert("")
	do test.TestListOfBoolean.Insert(1)
	do test.TestListOfBoolean.Insert(0)
	do test.TestListOfBoolean.Insert(1)
	do test.TestListOfBoolean.Insert(1)
	do test.TestListOfBoolean.Insert(0)
	do test.TestListOfOfDate.Insert(0)
	do test.TestListOfOfDate.Insert(10)
	do test.TestListOfOfDate.Insert(100)
	do test.TestListOfOfDate.Insert(1000)
	do test.TestListOfOfDate.Insert("")
	do test.TestListOfOfDate.Insert(10000)
	do test.TestListOfOfDate.Insert(100000)
	do test.TestListOfOfDate.Insert(1000000)
	do test.TestListOfOfInteger.Insert(0)
	do test.TestListOfOfInteger.Insert(43564356546456)
	do test.TestListOfOfInteger.Insert(0.345)
	do test.TestListOfOfInteger.Insert(.2)
	do test.TestListOfOfInteger.Insert("")
	do test.TestListOfOfInteger.Insert(-464356.75675)
	do test.TestListOfOfInteger.Insert(76567)
	do test.TestListOfOfInteger.Insert(3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117067982148086513282306647093844609550582231725359408128481)
	do test.TestListOfOfInteger.Insert(7653475667)
	do test.TestListOfOfInteger.Insert(-65753)
	do test.TestListOfOfInteger.Insert(45676.56)
	do test.TestListOfOfInteger.Insert(-78456/101+100*345/34.3)
	do test.TestArrayOfBoolean.SetAt(1,"ALPHA")
	do test.TestArrayOfBoolean.SetAt(0,"CHARLIE")
	do test.TestArrayOfBoolean.SetAt("","DELTA")
	do test.TestArrayOfBoolean.SetAt(0,"ECHO")
	do test.TestArrayOfBoolean.SetAt(1,"FOXTROT")
	do test.TestArrayOfString.SetAt("Sherlock Holmes","Detective")
	do test.TestArrayOfString.SetAt("221B Baker Street","Street")
	do test.TestArrayOfString.SetAt("Marylebone","District")
	do test.TestArrayOfString.SetAt("London W1","City")
	do test.TestArrayOfString.SetAt("UK","Country")
	do test.TestArrayOfString.SetAt("\""\""/"""_$C(8,9,10,12,13),"b4d,Th1ng5!")
	do test.TestArrayOfString.SetAt("{[{\}[/][{[FOO,BAR]}]{\}[/]]}","FOOBAR")
	do test.TestArrayOfString.SetAt($c(0),"nully")
	do test.TestArrayOfString.SetAt("","not-nully")
	do test.TestArrayOfDate.SetAt(0,"Happy-Horolog :)")
	do test.TestArrayOfDate.SetAt(+$H,"doB")
	do test.TestArrayOfDate.SetAt($H+40000,"doB")
	do test.TestArrayOfDate.SetAt("","nully")
	do test.TestArrayOfInteger.SetAt(1,"ONE")
	do test.TestArrayOfInteger.SetAt(2,"TWO")
	do test.TestArrayOfInteger.SetAt(3,"THREE")
	do test.TestArrayOfInteger.SetAt(99,"NINETY NINE")
	do test.TestArrayOfInteger.SetAt(1000,"A THOUSAND!")
	do test.TestArrayOfInteger.SetAt(59546526326827,"WORLD DEBT $")
	do test.TestArrayOfInteger.SetAt(241000000000000,"WORLD WORTH $")
	do test.TestArrayOfInteger.SetAt("","nully")
	set test.ZTestJsonName="FOO"
	Quit test
}

ClassMethod CreateTestObject3() As Cogs.Lib.Json.Tests.JsonClass.UberTestClass
{
	#dim uber as Cogs.Lib.Json.Tests.JsonClass.UberTestClass
	set uber=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject1()
	set uber.TestSingleObject=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject1()
	do uber.TestListOfObject.Insert(##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject1())
	do uber.TestListOfObject.Insert(##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject1())
	do uber.TestListOfObject.Insert(##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject1())
	do uber.TestArrayOfObject.SetAt(##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject1(),"TEST3.1")
	do uber.TestArrayOfObject.SetAt(##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject1(),"TEST3.2")
	do uber.TestArrayOfObject.SetAt(##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject1(),"TEST3.3")
	quit uber
}

ClassMethod CreateTestObject4() As Cogs.Lib.Json.Tests.JsonClass.UberTestClass
{
	#dim uber as Cogs.Lib.Json.Tests.JsonClass.UberTestClass
	set uber=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject3()
	set uber.TestSingleObject=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject3()
	do uber.TestListOfObject.Insert(##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject3())
	do uber.TestListOfObject.Insert(##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject3())
	do uber.TestListOfObject.Insert(##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject3())
	do uber.TestArrayOfObject.SetAt(##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject3(),"TEST4.1")
	do uber.TestArrayOfObject.SetAt(##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject3(),"TEST4.2")
	do uber.TestArrayOfObject.SetAt(##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject3(),"TEST4.3")
	quit uber
}

ClassMethod CreateTestObject5() As Cogs.Lib.Json.Tests.JsonClass.UberTestClass
{
	#dim uber as Cogs.Lib.Json.Tests.JsonClass.UberTestClass
	set uber=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject4()
	set uber.TestSingleObject=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject4()
	do uber.TestListOfObject.Insert(##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject4())
	do uber.TestArrayOfObject.SetAt(##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject4(),"TEST5.1")
	quit uber
}

}

