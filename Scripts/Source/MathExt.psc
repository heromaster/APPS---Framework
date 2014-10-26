ScriptName MathExt
;TO-DO: Write a statement to check if the array with the SUKey already exists
Int Function DecToHex(Int aiDecimal) Global
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

Int Function HexToDec(Int aiHexadecimal) Global
	Int i = StringUtil.GetLength(aiHexadecimal As String)
	Int Sum
	String HexAsStr = aiHexadecimal As String
	String Char

	If(aiHexadecimal < 0)
		Return -1
	EndIf

	While(i > 0)
		Char = StringUtil.SubString(HexAsStr, i, 1)
	
		If(Char == "a" || Char == "A")
			Char = "10"
		ElseIf(Char == "b" || Char == "B")
			Char = "11"
		ElseIf(Char == "c" || Char == "C")
			Char = "12"
		ElseIf(Char == "d" || Char == "D")
			Char = "13"
		ElseIf(Char == "e" || Char == "E")
			Char = "14"
		ElseIf(Char == "f" || Char == "F")
			Char = "15"
		EndIf

		Sum += ((Char As Float) * Math.Pow(16, (i - 1))) As Int

		i -= 1
	EndWhile
	
	Return Sum
EndFunction