ScriptName Exception Hidden
Import Debug
Import StorageUtil

Function Notify(String asModName, String asMessage, Bool abDisplayOnScreen = True, Bool abAsNotification = True) Global
	Int ModIndex = StringListFind(None, "APPS.RegisteredMods", asModName)
	Quest Token
	String LogName

	If( ModIndex > -1)
		Token = FormListGet(None, "APPS.RegisteredMods", ModIndex) As Quest
	Else
		Return
	EndIf

	LogName = GetStringValue(Token, "APPS.Exceptions.LogName")

	If(HasIntValue(Token, "APPS.Exceptions.LogInfos"))
		If(GetIntValue(Token, "APPS.Exceptions.LogFile") == 2)
			Trace("Source: " + asModName + "\nInfo: " + asMessage)
		Else
			If(GetIntValue(Token, "APPS.Exceptions.LogFile") == 0)
				If(!OpenUserLog(LogName))
					LogName = "APPS_Framework"
					OpenUserLog("APPS_Framework")
					TraceUser(LogName, "Error: Log file " + LogName + " from mod " + asModName + "couldn't be opened!")
				EndIf
			ElseIf(GetIntValue(Token, "APPS.Exceptions.LogFile") == 1)
				OpenUserLog("APPS_Framework")
			EndIf

			TraceUser(LogName, "Info: " + asMessage)
			TraceUser(LogName, "Source: " + asModName)
		EndIf
	EndIf

	If(HasIntValue(Token, "APPS.Exceptions.DisplayInfos") && abDisplayOnScreen && !abAsNotification)
		MessageBox("Source: " + asModname + "\nInfo: " + asMessage)
	ElseIf(HasIntValue(Token, "APPS.Exceptions.DisplayInfos") && abDisplayOnScreen && abAsNotification)
		Notification("Info: " + asMessage)
		Notification("Source: " + asModname)
	EndIf
EndFunction

Function Warn(String asModName, String asMessage, String asReason = "", Bool abAsNotification = False) Global
	Int ModIndex = StringListFind(None, "APPS.RegisteredMods", asModName)
	Quest Token
	String LogName

	If(ModIndex > -1)
		Token = FormListGet(None, "APPS.RegisteredMods", ModIndex) As Quest
	Else
		Return
	EndIf

	LogName = GetStringValue(Token, "APPS.Exceptions.LogName")

	If(HasIntValue(Token, "APPS.Exceptions.LogWarnings"))
		If(GetIntValue(Token, "APPS.Exceptions.LogFile") == 2)
			If(asReason != "")
				Trace("Source: " + asModName + "\nReason: " + asReason + "\nWarning: " + asMessage)
			Else
				Trace("Source: " + asModName + "\nWarning: " + asMessage)
			EndIf
		Else
			If(GetIntValue(Token, "APPS.Exceptions.LogFile") == 0)
				OpenUserLog(LogName)
			ElseIf(GetIntValue(Token, "APPS.Exceptions.LogFile") == 1)
				OpenUserLog("APPS_Framework")
			EndIf

			TraceUser(LogName, "Warning: " + asMessage)

			If(asReason != "")
				TraceUser(LogName, "Reason: " + asReason)
			EndIf

			TraceUser(LogName, "Source: " + asModName)
		EndIf
	EndIf

	If(HasIntValue(Token, "APPS.Exceptions.DisplayWarnings") && !abAsNotification)
		If(asReason != "")
			MessageBox("Source: " + asModName + "\nReason: " + asReason + "\nWarning: " + asMessage)
		Else
			MessageBox("Source: " + asModname + "\nWarning: " + asMessage)
		EndIf
	ElseIf(HasIntValue(Token, "APPS.Exceptions.DisplayWarnings") && abAsNotification)
		If(asReason != "")
			Notification("Warning: " + asMessage)
			Notification("Reason: " + asReason)
			Notification("Source: " + asModName)
		Else
			Notification("Warning: " + asMessage)
			Notification("Source: " + asModname)
		EndIf
	EndIf
EndFunction

Function Throw(String asModName, String asMessage, String asReason) Global
	Int ModIndex = StringListFind(None, "APPS.RegisteredMods", asModName)
	Quest Token
	String LogName

	If( ModIndex > -1)
		Token = FormListGet(None, "APPS.RegisteredMods", ModIndex) As Quest
	Else
		Return
	EndIf

	LogName = GetStringValue(Token, "APPS.Exceptions.LogName")

	If(HasIntValue(Token, "APPS.Exceptions.LogErrors"))
		If(GetIntValue(Token, "APPS.Exceptions.LogFile") == 2)
			Trace("Source: " + asModName + "\nReason: " + asReason + "\nWarning: " + asMessage)
		Else
			If(GetIntValue(Token, "APPS.Exceptions.LogFile") == 0)
				OpenUserLog(LogName)
			ElseIf(GetIntValue(Token, "APPS.Exceptions.LogFile") == 1)
				OpenUserLog("APPS_Framework")
			EndIf

			TraceUser(LogName, "Error: " + asMessage)
			TraceUser(LogName, "Reason: " + asReason)
			TraceUser(LogName, "Source: " + asModName)
		EndIf
	EndIf

	If(HasIntValue(Token, "APPS.Exceptions.DisplayErrors"))
		MessageBox("Source: " + asModName + "\nReason: " + asReason + "\nError: " + asMessage)
	EndIf
EndFunction