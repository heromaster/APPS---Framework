ScriptName APPS_FW_Core Extends Quest
String Property SUKEY_DISPLAY_ERRORS = "APPS.InfoManager.DisplayErrors" AutoReadOnly Hidden
String Property SUKEY_DISPLAY_INFOS = "APPS.InfoManager.DisplayInfos" AutoReadOnly Hidden
String Property SUKEY_DISPLAY_WARNINGS = "APPS.InfoManager.DisplayWarnings" AutoReadOnly Hidden
String Property SUKEY_INIT_MODS = "APPS.InitMods" AutoReadOnly Hidden
String Property SUKEY_INIT_MODS_TOOLTIP = "APPS.InitMods.Tooltip" AutoReadOnly Hidden
String Property SUKEY_LOG_ERRORS = "APPS.InfoManager.LogErrors" AutoReadOnly Hidden
String Property SUKEY_LOG_INFOS = "APPS.InfoManager.LogInfos" AutoReadOnly Hidden
String Property SUKEY_LOG_WARNINGS = "APPS.InfoManager.LogWarnings" AutoReadOnly Hidden
String Property SUKEY_LOGFILE = "APPS.InfoManager.LogFile" AutoReadOnly Hidden
String Property SUKEY_LOGNAME = "APPS.InfoManager.LogName" AutoReadOnly Hidden
String Property SUKEY_REGISTERED_MODS = "APPS.RegisteredMods" AutoReadOnly Hidden
String Property SUKEY_REGISTERED_RS = "APPS.Relationship.RegisteredMods" AutoReadOnly Hidden
String Property SUKEY_UNINSTALL_MODS = "APPS.UninstallMods" AutoReadOnly Hidden

;/ |------------------------------------------------------------------------------------------------------------|
   |Checks if the mod is registered with the framework.															|
   |------------------------------------------------------------------------------------------------------------|
   |Parameter: asModName																						|
   |The name of the mod to look up.																				|
   |------------------------------------------------------------------------------------------------------------|
   |Return value: Bool																							|
   |Returns True if the specified mod is registered with the framework.											|
   |Returns False if the specified mod was not found in the registration list.									|
   |------------------------------------------------------------------------------------------------------------| /;
Bool Function IsModRegistered(String asModName)
	If(_GetModIndexFromString(asModName, SUKEY_REGISTERED_MODS) > -1)
		Return True
	Else
		Return False
	EndIf
EndFunction

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