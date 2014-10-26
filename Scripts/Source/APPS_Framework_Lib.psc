ScriptName APPS_Framework_Lib

Int Function DecToHex(Int aiDecimal)
	Int i
	Int Rest
	Float SUKey = Utility.RandomFloat(0, 65535)
	String Result

	If(aiDecimal < 0)
		Return -1
	EndIf

	While(Rest != 0)
		Rest %= aiDecimal

		If(Rest == 10)
			StorageUtil.StringListAdd(None, "APPS.DecToHexConverter." + SUKey, "A")
		ElseIf(Rest == 11)
			StorageUtil.StringListAdd(None, "APPS.DecToHexConverter." + SUKey, "B")
		ElseIf(Rest == 12)
			StorageUtil.StringListAdd(None, "APPS.DecToHexConverter." + SUKey, "C")
		ElseIf(Rest == 13)
			StorageUtil.StringListAdd(None, "APPS.DecToHexConverter." + SUKey, "D")
		ElseIf(Rest == 14)
			StorageUtil.StringListAdd(None, "APPS.DecToHexConverter." + SUKey, "E")
		ElseIf(Rest == 15)
			StorageUtil.StringListAdd(None, "APPS.DecToHexConverter." + SUKey, "F")
		Else
			StorageUtil.StringListAdd(None, "APPS.DecToHexConverter." + SUKey, Rest As String)
		EndIf

		aiDecimal /= 16
	EndWhile

	i = StorageUtil.StringListCount(None, "APPS.DecToHexConverter." + SUKey) - 1

	While(i >= 0)
		Result = Result + StorageUtil.StringListGet(None, "APPS.DecToHexConverter." + SUKey, i)
	EndWhile

	Result = "0x" + Result
	StorageUtil.StringListClear(None, "APPS.DecToHexConverter." + SUKEY)

	Return Result As Int
EndFunction

Int Function HexToDec(Int aiHexadecimal)
	Int HexLength = StringUtil.GetHexLength(aiHexadecimal As String)
	Int i = HexLength
	Int Sum
	String HexAsStr = aiHexadecimal As String
	String Char

	If(aiHexadecimal < 0)
		Return -1
	EndIf

	While(HexLength > 0)
		Char = StringUtil.SubString(HexAsStr, i, 1)
	
		If(Char == "0" || Char == "1" || Char == "2" || Char == "3" || Char == "4" || Char == "5" || Char == "6" || Char == "7" || Char == "8" || Char == "9")
			Sum += (Char As Int) * Math.Pow(16, (HexLength - 1))
		EndIf

		HexLength -= 1
	EndWhile
	
	Return Sum
EndFunction