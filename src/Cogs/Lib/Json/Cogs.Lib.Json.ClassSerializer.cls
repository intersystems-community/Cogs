/// Copyright (c) 2017 MemCog Ltd
/// Set GitHub documentation for help
Class Cogs.Lib.Json.ClassSerializer Extends Cogs.Lib.Json.Base
{

Method toJSON(parent = "", ByRef seen = "") As %String [ CodeMode = objectgenerator ]
{
	set x=%code
	d x.WriteLine(" if $g(seen($THIS))=1 quit ""{}""")
	d x.WriteLine(" set seen($THIS)=1")
	d x.WriteLine(" if $g(parent)'="""" set j=""{""""""_parent_"""""":""")
	d x.WriteLine(" set j=$g(j)_""{""")
	set co="",cc=0
	for i=1:1:%compiledclass.Properties.Count() {
		set p=%compiledclass.Properties.GetAt(i),name=p.Name
		if p.Parameters.GetAt("JSONIGNORE")=1 continue
		if $e(p.Name)'?1A continue
		if p.RuntimeType="%Library.RelationshipObject" continue
		if cc>0 set co=","
		set cc=cc+1
		if p.Parameters.GetAt("JSONNAME")'="" set name=p.Parameters.GetAt("JSONNAME")
		if p.Parameters.GetAt("JSONMETHOD")'="" {
			d x.WriteLine(" set j=j_"""_co_""""""_name_""""":""""""_"_p.Parameters.GetAt("JSONMETHOD")_"_""""""""")
			continue
		}
		if "%Collection.ArrayOfDT"=p.RuntimeType {
			d x.WriteLine(" set j=j_"""_co_""""""_name_""""":{"",c2="""",key=.."_p.Name_".Next("""")")
			d x.WriteLine(" while key'="""" {")
			d x.WriteLine("  set value=.."_p.Name_".GetAt(key)")
			d x.WriteLine("  Set j=j_c2_""""""""_key_""""""""_"":""_$s(value=$c(0):""null"",1:"_..getTypeWriter(p.Type)_")")
			d x.WriteLine("  set key=.."_p.Name_".Next(key),c2="",""")
			d x.WriteLine(" }")
			d x.WriteLine(" set j=j_""}""")
			continue						
		}
		if "%Collection.ArrayOfObj"=p.RuntimeType {
			d x.WriteLine(" set j=j_"""_co_""""""_name_""""":{"",c2="""",key=.."_p.Name_".Next("""")")
			d x.WriteLine(" while key'="""" {")
			d x.WriteLine("  set o=.."_p.Name_".GetAt(key)")
			d x.WriteLine("   set j=j_c2_""""""""_key_""""""""_"":""_o.toJSON(,.seen),c2="",""")
			d x.WriteLine("  set key=.."_p.Name_".Next(key),c2="",""")
			d x.WriteLine(" }")
			d x.WriteLine(" set j=j_""}""")
			continue					
		}
		if "%Collection.ListOfDT"=p.RuntimeType {
			d x.WriteLine(" set j=j_"""_co_""""""_name_""""":["",c2=""""")
			d x.WriteLine(" for i=1:1:.."_p.Name_".Count() {")
			d x.WriteLine("  set value=.."_p.Name_".GetAt(i)")
			d x.WriteLine("  set j=j_c2_$s(value=$c(0):""null"",1:"_..getTypeWriter(p.Type)_"),c2="",""")
			d x.WriteLine(" }")
			d x.WriteLine(" set j=j_""]""")
			continue					
		}
		if "%Collection.ListOfObj"=p.RuntimeType {
			d x.WriteLine(" set j=j_"""_co_""""""_name_""""":["",c2=""""")
			d x.WriteLine(" for i=1:1:.."_p.Name_".Count() {")
			d x.WriteLine("  set obj=.."_p.Name_".GetAt(i)")
			d x.WriteLine("  set j=j_c2_obj.toJSON(,.seen),c2="",""")
			d x.WriteLine(" }")
			d x.WriteLine(" set j=j_""]""")
			continue					
		}
		d x.WriteLine(" set value=.."_p.Name)
		d x.WriteLine(" Set j=j_"""_co_""""""_name_""""":""_$s(value=$c(0):""null"",1:"_..getTypeWriter(p.Type)_")")
	}
	d x.WriteLine(" set j=j_""}""")
	d x.WriteLine(" if $g(parent)'="""" set j=j_""}""")
	d x.WriteLine(" kill seen($THIS)")
	d x.WriteLine(" quit j")
	quit 1
}

Method outputJSON(parent = "", ByRef seen = "") [ CodeMode = objectgenerator ]
{
	set x=%code
	d x.WriteLine(" if $g(seen($THIS))=1 write ""{}""")
	d x.WriteLine(" set seen($THIS)=1")
	d x.WriteLine(" if $g(parent)'="""" write ""{""""""_parent_"""""":""")
	d x.WriteLine(" write ""{""")
	set co="",cc=0
	for i=1:1:%compiledclass.Properties.Count() {
		set p=%compiledclass.Properties.GetAt(i),name=p.Name
		if p.Parameters.GetAt("JSONIGNORE")=1 continue
		if $e(p.Name)'?1A continue
		if p.RuntimeType="%Library.RelationshipObject" continue
		if cc>0 set co=","
		set cc=cc+1
		if p.Parameters.GetAt("JSONNAME")'="" set name=p.Parameters.GetAt("JSONNAME")
		if p.Parameters.GetAt("JSONMETHOD")'="" {
			d x.WriteLine(" write """_co_""""""_name_""""":""""""_"_p.Parameters.GetAt("JSONMETHOD")_"_""""""""")
			continue
		}
		if "%Collection.ArrayOfDT"=p.RuntimeType {
			d x.WriteLine(" write """_co_""""""_name_""""":{"" set c2="""",key=.."_p.Name_".Next("""")")
			d x.WriteLine(" while key'="""" {")
			d x.WriteLine("  set value=.."_p.Name_".GetAt(key)")
			d x.WriteLine("  write c2_""""""""_key_""""""""_"":""_$s(value=$c(0):""null"",1:"_..getTypeWriter(p.Type,1)_")")
			d x.WriteLine("  set key=.."_p.Name_".Next(key),c2="",""")
			d x.WriteLine(" }")
			d x.WriteLine(" write ""}""")
			continue						
		}
		if "%Collection.ArrayOfObj"=p.RuntimeType {
			d x.WriteLine(" write """_co_""""""_name_""""":{"" set c2="""",key=.."_p.Name_".Next("""")")
			d x.WriteLine(" while key'="""" {")
			d x.WriteLine("  set o=.."_p.Name_".GetAt(key)")
			d x.WriteLine("   write c2_""""""""_key_""""""""_"":"" write o.outputJSON(,.seen) set c2="",""")
			d x.WriteLine("  set key=.."_p.Name_".Next(key),c2="",""")
			d x.WriteLine(" }")
			d x.WriteLine(" write ""}""")
			continue					
		}
		if "%Collection.ListOfDT"=p.RuntimeType {
			d x.WriteLine(" write """_co_""""""_name_""""":["" set c2=""""")
			d x.WriteLine(" for i=1:1:.."_p.Name_".Count() {")
			d x.WriteLine("  set value=.."_p.Name_".GetAt(i)")
			d x.WriteLine("  write c2_$s(value=$c(0):""null"",1:"_..getTypeWriter(p.Type,1)_") set c2="",""")
			d x.WriteLine(" }")
			d x.WriteLine(" write ""]""")
			continue					
		}
		if "%Collection.ListOfObj"=p.RuntimeType {
			d x.WriteLine(" write """_co_""""""_name_""""":["" set c2=""""")
			d x.WriteLine(" for i=1:1:.."_p.Name_".Count() {")
			d x.WriteLine("  set obj=.."_p.Name_".GetAt(i)")
			d x.WriteLine("  write c2 write obj.outputJSON(,.seen) set c2="",""")
			d x.WriteLine(" }")
			d x.WriteLine(" write ""]""")
			continue					
		}
		d x.WriteLine(" set value=.."_p.Name)
		d x.WriteLine(" write """_co_""""""_name_""""":"" write $s(value=$c(0):""null"",1:"_..getTypeWriter(p.Type,1)_")")
	}
	d x.WriteLine(" write ""}""")
	d x.WriteLine(" if $g(parent)'="""" write ""}""")
	d x.WriteLine(" kill seen($THIS)")
	d x.WriteLine(" quit """"")
	quit 1
}

ClassMethod getTypeWriter(type, mode = 0) [ Internal ]
{
	set quotes=""""""""""
	if "Cogs.Lib.Types.Json"=type q "$Select(value'="""":value,1:"""""""""""")"
	if "%Library.Time"=type q "$s(value'="""":"_quotes_"_$zt(value)_"_quotes_",1:""null"")"
	if "%Library.Date"=type q "$s(value'="""":"_quotes_"_$zd(value,3)_"_quotes_",1:""null"")"
	if "%Library.TimeStamp"=type q "$s(value'="""":"_quotes_"_$tr(value,"" "",""T"")_""Z""_"_quotes_",1:""null"")"
	if "%Library.Boolean"=type q "$s(value=1:""true"",value=0:""false"",1:""null"")"
	if "%Library.Float %Library.Integer %Library.Numeric %Library.Currency"[type q "$s($e(value,1,2)=""0."":value,$e(value,1)=""."":""0""_value,""0""=$e(value,1):""""""""_value_"""""""",value'="""":+value,1:""null"")"
	if "%"=$e(type) q quotes_"_..EscapeJSON(value)_"_quotes
	if mode=1 quit "$s($IsObject(value):value.outputJSON(,.seen),value="""":$C(34,34),1:"_quotes_"_..EscapeJSON(value)_"_quotes_")"
	quit "$s($IsObject(value):value.toJSON(,.seen),value="""":$C(34,34),1:"_quotes_"_..EscapeJSON(value)_"_quotes_")"
}

}

