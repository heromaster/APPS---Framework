ScriptName Exception Hidden
Import Debug
Import StorageUtil

Function Notify(String asModName, String asMessage, Bool abDisplayOnScreen = True, Bool abAsNotification = True) Global
	Quest Token
	Int i
	Int j = StorageUtil.FormListCount(None, "APPS.Framework.RegisteredMods")
	
	While (i < j)
		Quest Mod = FormListGet(None, "APPS.Framework.RegisteredMods", i) as Quest
		
		If (Mod)
			String ModName = GetStringValue(Mod, "APPS.Framework.RegisteredMods.ModName")
			
			If (ModName == asModName)
				Token = Mod			
			EndIf
		EndIf
		i += 1
	EndWhile
	
	If (!Token)
		Return
	EndIf

	String LogName = GetStringValue(Token, "APPS.Framework.InfoManager.LogName")

	If(HasIntValue(Token, "APPS.Framework.InfoManager.LogInfos") && Utility.GetINIBool("bEnableLogging:Papyrus"))
		If(GetIntValue(Token, "APPS.Framework.InfoManager.LogFile") == 2) ;2 - Writes into Papyrus log
			Trace("Source: " + asModName + "\nInfo: " + asMessage)
		Else
			If(GetIntValue(Token, "APPS.Framework.InfoManager.LogFile") == 0) ;0 - Writes into mod's user log
				If(!OpenUserLog(LogName))
					LogName = "APPS_Framework"
					OpenUserLog("APPS_Framework")
					TraceUser(LogName, "Error: Log file " + LogName + " from mod " + asModName + "couldn't be opened!")
				EndIf
			ElseIf(GetIntValue(Token, "APPS.Framework.InfoManager.LogFile") == 1) ;1 - Writes into APPS_Framework user log
				OpenUserLog("APPS_Framework")
			EndIf

			TraceUser(LogName, "Info: " + asMessage)
			TraceUser(LogName, "Source: " + asModName)
		EndIf
	EndIf

	If(HasIntValue(Token, "APPS.Framework.InfoManager.DisplayInfos") && abDisplayOnScreen && !abAsNotification)
		MessageBox("Source: " + asModName + "\nInfo: " + asMessage)
	ElseIf(HasIntValue(Token, "APPS.Framework.InfoManager.DisplayInfos") && abDisplayOnScreen && abAsNotification)
		Notification("Info: " + asMessage)
		Notification("Source: " + asModName)
	EndIf
EndFunction

Function Warn(String asModName, String asMessage, String asReason = "", Bool abAsNotification = False) Global
	Quest Token
	Int i
	Int j = StorageUtil.FormListCount(None, "APPS.Framework.RegisteredMods")
	
	While (i < j)
		Quest Mod = FormListGet(None, "APPS.Framework.RegisteredMods", i) as Quest
		
		If (Mod)
			String ModName = GetStringValue(Mod, "APPS.Framework.RegisteredMods.ModName")
			
			If (ModName == asModName)
				Token = Mod			
			EndIf
		EndIf
		i += 1
	EndWhile
	
	If (!Token)
		Return
	EndIf

	String LogName = GetStringValue(Token, "APPS.Framework.InfoManager.LogName")

	If(HasIntValue(Token, "APPS.Framework.InfoManager.LogWarnings") && Utility.GetINIBool("bEnableLogging:Papyrus"))
		If(GetIntValue(Token, "APPS.Framework.InfoManager.LogFile") == 2) ;2 - Writes into Papyrus log
			If(asReason != "")
				Trace("Source: " + asModName + "\nReason: " + asReason + "\nWarning: " + asMessage)
			Else
				Trace("Source: " + asModName + "\nWarning: " + asMessage)
			EndIf
		Else
			If(GetIntValue(Token, "APPS.Framework.InfoManager.LogFile") == 0) ;0 - Writes into mod's user log
				OpenUserLog(LogName)
			ElseIf(GetIntValue(Token, "APPS.Framework.InfoManager.LogFile") == 1) ;1 - Writes into APPS_Framework user log
				OpenUserLog("APPS_Framework")
			EndIf

			TraceUser(LogName, "Warning: " + asMessage)

			If(asReason != "")
				TraceUser(LogName, "Reason: " + asReason)
			EndIf

			TraceUser(LogName, "Source: " + asModName)
		EndIf
	EndIf

	If(HasIntValue(Token, "APPS.Framework.InfoManager.DisplayWarnings") && !abAsNotification)
		If(asReason != "")
			MessageBox("Source: " + asModName + "\nReason: " + asReason + "\nWarning: " + asMessage)
		Else
			MessageBox("Source: " + asModName + "\nWarning: " + asMessage)
		EndIf
	ElseIf(HasIntValue(Token, "APPS.Framework.InfoManager.DisplayWarnings") && abAsNotification)
		If(asReason != "")
			Notification("Warning: " + asMessage)
			Notification("Reason: " + asReason)
			Notification("Source: " + asModName)
		Else
			Notification("Warning: " + asMessage)
			Notification("Source: " + asModName)
		EndIf
	EndIf
EndFunction

Function Throw(String asModName, String asMessage, String asReason) Global
	Quest Token
	Int i
	Int j = StorageUtil.FormListCount(None, "APPS.Framework.RegisteredMods")
	
	While (i < j)
		Quest Mod = FormListGet(None, "APPS.Framework.RegisteredMods", i) as Quest
		
		If (Mod)
			String ModName = GetStringValue(Mod, "APPS.Framework.RegisteredMods.ModName")
			
			If (ModName == asModName)
				Token = Mod			
			EndIf
		EndIf
		i += 1
	EndWhile
	
	If (!Token)
		Return
	EndIf

	String LogName = GetStringValue(Token, "APPS.Framework.InfoManager.LogName")

	If(HasIntValue(Token, "APPS.Framework.InfoManager.LogErrors") && Utility.GetINIBool("bEnableLogging:Papyrus"))
		If(GetIntValue(Token, "APPS.Framework.InfoManager.LogFile") == 2) ;2 - Writes into Papyrus log
			Trace("Source: " + asModName + "\nReason: " + asReason + "\nWarning: " + asMessage)
		Else
			If(GetIntValue(Token, "APPS.Framework.InfoManager.LogFile") == 0) ;0 - Writes into mod's user log
				OpenUserLog(LogName)
			ElseIf(GetIntValue(Token, "APPS.Framework.InfoManager.LogFile") == 1) ;1 - Writes into APPS_Framework user log
				OpenUserLog("APPS_Framework")
			EndIf

			TraceUser(LogName, "Error: " + asMessage)
			TraceUser(LogName, "Reason: " + asReason)
			TraceUser(LogName, "Source: " + asModName)
		EndIf
	EndIf

	If(HasIntValue(Token, "APPS.Framework.InfoManager.DisplayErrors"))
		MessageBox("Source: " + asModName + "\nReason: " + asReason + "\nError: " + asMessage)
	EndIf
EndFunction