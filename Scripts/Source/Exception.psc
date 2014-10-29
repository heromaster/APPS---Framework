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

	LogName = GetStringValue(Token, "APPS.InfoManager.LogName")

	If(HasIntValue(Token, "APPS.InfoManager.LogInfos") && Utility.GetINIBool("bEnableLogging:Papyrus"))
		If(GetIntValue(Token, "APPS.InfoManager.LogFile") == 2) ;2 - Writes into Papyrus log
			Trace("Source: " + asModName + "\nInfo: " + asMessage)
		Else
			If(GetIntValue(Token, "APPS.InfoManager.LogFile") == 0) ;0 - Writes into mod's user log
				If(!OpenUserLog(LogName))
					LogName = "APPS_Framework"
					OpenUserLog("APPS_Framework")
					TraceUser(LogName, "Error: Log file " + LogName + " from mod " + asModName + "couldn't be opened!")
				EndIf
			ElseIf(GetIntValue(Token, "APPS.InfoManager.LogFile") == 1) ;1 - Writes into APPS_Framework user log
				OpenUserLog("APPS_Framework")
			EndIf

			TraceUser(LogName, "Info: " + asMessage)
			TraceUser(LogName, "Source: " + asModName)
		EndIf
	EndIf

	If(HasIntValue(Token, "APPS.InfoManager.DisplayInfos") && abDisplayOnScreen && !abAsNotification)
		MessageBox("Source: " + asModname + "\nInfo: " + asMessage)
	ElseIf(HasIntValue(Token, "APPS.InfoManager.DisplayInfos") && abDisplayOnScreen && abAsNotification)
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

	LogName = GetStringValue(Token, "APPS.InfoManager.LogName")

	If(HasIntValue(Token, "APPS.InfoManager.LogWarnings") && Utility.GetINIBool("bEnableLogging:Papyrus"))
		If(GetIntValue(Token, "APPS.InfoManager.LogFile") == 2) ;2 - Writes into Papyrus log
			If(asReason != "")
				Trace("Source: " + asModName + "\nReason: " + asReason + "\nWarning: " + asMessage)
			Else
				Trace("Source: " + asModName + "\nWarning: " + asMessage)
			EndIf
		Else
			If(GetIntValue(Token, "APPS.InfoManager.LogFile") == 0) ;0 - Writes into mod's user log
				OpenUserLog(LogName)
			ElseIf(GetIntValue(Token, "APPS.InfoManager.LogFile") == 1) ;1 - Writes into APPS_Framework user log
				OpenUserLog("APPS_Framework")
			EndIf

			TraceUser(LogName, "Warning: " + asMessage)

			If(asReason != "")
				TraceUser(LogName, "Reason: " + asReason)
			EndIf

			TraceUser(LogName, "Source: " + asModName)
		EndIf
	EndIf

	If(HasIntValue(Token, "APPS.InfoManager.DisplayWarnings") && !abAsNotification)
		If(asReason != "")
			MessageBox("Source: " + asModName + "\nReason: " + asReason + "\nWarning: " + asMessage)
		Else
			MessageBox("Source: " + asModname + "\nWarning: " + asMessage)
		EndIf
	ElseIf(HasIntValue(Token, "APPS.InfoManager.DisplayWarnings") && abAsNotification)
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

	LogName = GetStringValue(Token, "APPS.InfoManager.LogName")

	If(HasIntValue(Token, "APPS.InfoManager.LogErrors") && Utility.GetINIBool("bEnableLogging:Papyrus"))
		If(GetIntValue(Token, "APPS.InfoManager.LogFile") == 2) ;2 - Writes into Papyrus log
			Trace("Source: " + asModName + "\nReason: " + asReason + "\nWarning: " + asMessage)
		Else
			If(GetIntValue(Token, "APPS.InfoManager.LogFile") == 0) ;0 - Writes into mod's user log
				OpenUserLog(LogName)
			ElseIf(GetIntValue(Token, "APPS.InfoManager.LogFile") == 1) ;1 - Writes into APPS_Framework user log
				OpenUserLog("APPS_Framework")
			EndIf

			TraceUser(LogName, "Error: " + asMessage)
			TraceUser(LogName, "Reason: " + asReason)
			TraceUser(LogName, "Source: " + asModName)
		EndIf
	EndIf

	If(HasIntValue(Token, "APPS.InfoManager.DisplayErrors"))
		MessageBox("Source: " + asModName + "\nReason: " + asReason + "\nError: " + asMessage)
	EndIf
EndFunction