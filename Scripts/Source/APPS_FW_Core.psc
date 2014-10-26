ScriptName APPS_FW_Core Extends Quest

;/ |------------------------------------------------------------------------------------------------------------|
   |Private functions below. Unless you know what you are doing, don't use them.								|
   |------------------------------------------------------------------------------------------------------------| /;
Int Function _GetModIndexFromForm(Form akToken, String asKey, Actor akNPC = None)
	If(akNPC == None)
		Return StorageUtil.FormListFind(None, asKey, akToken)
	Else
		Return StorageUtil.FormListFind(akNPC, asKey, akToken)
	EndIf
EndFunction

Int Function _GetModIndexFromInt(Int auiToken, String asKey, Actor akNPC = None)
	If(akNPC == None)
		Return StorageUtil.IntListFind(None, asKey, auiToken)
	Else
		Return StorageUtil.IntListFind(akNPC, asKey, auiToken)
	EndIf
EndFunction

Int Function _GetModIndexFromFloat(Float afToken, String asKey, Actor akNPC = None)
	If(akNPC == None)
		Return StorageUtil.FloatListFind(None, asKey, afToken)
	Else
		Return StorageUtil.FloatListFind(akNPC, asKey, afToken)
	EndIf
EndFunction

Int Function _GetModIndexFromString(String asToken, String asKey, Actor akNPC = None)
	If(akNPC == None)
		Return StorageUtil.StringListFind(None, asKey, asToken)
	Else
		Return StorageUtil.StringListFind(akNPC, asKey, asToken)
	EndIf
EndFunction

String Function _GetFormNameIfAvailable(Quest akToken)
	If akToken.GetName() == ""
		Exception.Warn("APPS - Framework", "No mod name given!")
		Return ""
	Else
		Return akToken.GetName()
	EndIf
EndFunction