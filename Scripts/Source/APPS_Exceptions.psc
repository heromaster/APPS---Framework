ScriptName Exception Hidden
Import Debug
Import StorageUtil

Function Notify(String asModName, String asMessage, Bool abDisplayOnScreen = True, Bool abAsNotification = True) Global
	Quest Token
	Int ModIndex = StringListFind(None, "APPS.RegisteredMods", asModName)

	If( ModIndex > -1)
		Token = FormListGet(None, "APPS.RegisteredMods", ModIndex) As Quest
	Else
		Return
	EndIf

	If(HasIntValue(Token, "APPS.Exceptions.LogInfos"))
		If(GetIntValue(Token, "APPS.Exceptions.LogFile") == 2)
			Trace("Source: " + asModName + "\nInfo: " + asMessage)
		Else
			If(GetIntValue(Token, "APPS.Exceptions.LogFile") == 0)
				OpenUserLog(asModName)
			ElseIf(GetIntValue(Token, "APPS.Exceptions.LogFile") == 1)
				OpenUserLog("APPS - Framework")
			EndIf

			TraceUser(asModName, "Source: " + asModName)
			TraceUser(asModName, "Info: " + asMessage)
		EndIf
	EndIf

	If(HasIntValue(Token, "APPS.Exceptions.DisplayInfos") && abDisplayOnScreen && !abAsNotification)
		MessageBox("Source: " + asModname + "\nInfo: " + asMessage)
	ElseIf(HasIntValue(Token, "APPS.Exceptions.DisplayInfos") && abDisplayOnScreen && abAsNotification)
		Notification("Source: " + asModname + "\nInfo: " + asMessage)
	EndIf
EndFunction

Function Warn(String asModName, String asMessage, String asReason = "", Bool abAsNotification = False) Global
	Quest Token
	Int ModIndex = StringListFind(None, "APPS.RegisteredMods", asModName)

	If( ModIndex > -1)
		Token = FormListGet(None, "APPS.RegisteredMods", ModIndex) As Quest
	Else
		Return
	EndIf

	If(HasIntValue(Token, "APPS.Exceptions.LogWarnings"))
		If(GetIntValue(Token, "APPS.Exceptions.LogFile") == 2)
			If(asReason != "")
				Trace("Source: " + asModName + "\nReason: " + asReason + "\nWarning: " + asMessage)
			Else
				Trace("Source: " + asModName + "\nWarning: " + asMessage)
			EndIf
		Else
			If(GetIntValue(Token, "APPS.Exceptions.LogFile") == 0)
				OpenUserLog(asModName)
			ElseIf(GetIntValue(Token, "APPS.Exceptions.LogFile") == 2)
				OpenUserLog("APPS - Framework")
			EndIf

			TraceUser(asModName, "Source: " + asModName)

			If(asReason != "")
				TraceUser(asModName, "Reason: " + asReason)
			EndIf

			TraceUser(asModName, "Warning: " + asMessage)
		EndIf
	EndIf

	If(HasIntValue(Token, "APPS.Exceptions.DisplayWarnings"))
		If(asReason != "")
			MessageBox("Source: " + asModName + "\nReason: " + asReason + "\nWarning: " + asMessage)
		Else
			MessageBox("Source: " + asModname + "\nWarning: " + asMessage)
		EndIf
	EndIf
EndFunction

Function Throw(String asModName, String asMessage, String asReason) Global
	Quest Token
	Int ModIndex = StringListFind(None, "APPS.RegisteredMods", asModName)

	If( ModIndex > -1)
		Token = FormListGet(None, "APPS.RegisteredMods", ModIndex) As Quest
	Else
		Return
	EndIf

	If(HasIntValue(Token, "APPS.Exceptions.LogErrors"))
		If(GetIntValue(Token, "APPS.Exceptions.LogFile") == 2)
			Trace("Source: " + asModName + "\nReason: " + asReason + "\nWarning: " + asMessage)
		Else
			If(GetIntValue(Token, "APPS.Exceptions.LogFile") == 0)
				OpenUserLog(asModName)
			ElseIf(GetIntValue(Token, "APPS.Exceptions.LogFile") == 2)
				OpenUserLog("APPS - Framework")
			EndIf

			TraceUser(asModName, "Source: " + asModName)
			TraceUser(asModName, "Reason: " + asReason)
			TraceUser(asModName, "Warning: " + asMessage)
		EndIf
	EndIf

	If(HasIntValue(Token, "APPS.Exceptions.DisplayErrors"))
		MessageBox("Source: " + asModName + "\nReason: " + asReason + "\nWarning: " + asMessage)
	EndIf
EndFunction