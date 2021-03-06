/// Copyright (c) 2017 MemCog Ltd
/// Test fix for repeating object references
Class Cogs.Lib.Json.Tests.JsonClass.JsonClassTest3 Extends Cogs.Touchstone.TestClass
{

Parameter TestSuiteName = "Cogs.Lib.JsonClassSuite";

Method OnBeforeAllTests() As %Status
{
	
	do ##class(Cogs.Lib.Json.Tests.JsonClass.ChildTestClass).%DeleteExtent()
	do ##class(Cogs.Lib.Json.Tests.JsonClass.ParentTestClass).%DeleteExtent()
	
	//create parent
	set parent=##class(Cogs.Lib.Json.Tests.JsonClass.ParentTestClass).%New()
	set parent.Foo="World"
	set sc=parent.%Save()
	do ..AssertEquals(sc,$$$OK,"Parent should save")

	//create child
	set child=##class(Cogs.Lib.Json.Tests.JsonClass.ChildTestClass).%New()
	set child.Bar="Hello"
	set child.Parent=parent
	set child.SameParent=parent
	set sc=child.%Save()
	do ..AssertEquals(sc,$$$OK,"Child should save")
	
	//update parent
	set parent.Child=child
	set parent.SameChild=child
	set sc=parent.%Save()
	do ..AssertEquals(sc,$$$OK,"Parent should save")
	
	quit $$$OK
}

Method Test1() As %Status(UNITTEST=1)
{
	set parent=##class(Cogs.Lib.Json.Tests.JsonClass.ParentTestClass).%OpenId(1)
	set json=parent.toJSON()
	do ..AssertEquals(json,"{""Child"":{""Bar"":""Hello"",""Parent"":{},""SameParent"":{}},""Foo"":""World"",""SameChild"":{""Bar"":""Hello"",""Parent"":{},""SameParent"":{}}}","Should not fall into an infinite loop")
	quit $$$OK
}

}

