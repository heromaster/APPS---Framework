ScriptName APPS_FW_Core Extends Quest
String Property DISPLAY_ERRORS = "APPS.Framework.InfoManager.DisplayErrors" AutoReadOnly Hidden
String Property DISPLAY_INFOS = "APPS.Framework.InfoManager.DisplayInfos" AutoReadOnly Hidden
String Property DISPLAY_WARNINGS = "APPS.Framework.InfoManager.DisplayWarnings" AutoReadOnly Hidden
String Property INIT_MODS = "APPS.Framework.InitMods" AutoReadOnly Hidden
String Property INIT_QUEST = "APPS.Framework.InitMods.InitQuest" AutoReadOnly Hidden
String Property INIT_STAGE = "APPS.Framework.InitMods.InitStage" AutoReadOnly Hidden
String Property INIT_MODS_TOOLTIP = "APPS.Framework.InitMods.Tooltip" AutoReadOnly Hidden
String Property LOG_ERRORS = "APPS.Framework.InfoManager.LogErrors" AutoReadOnly Hidden
String Property LOG_INFOS = "APPS.Framework.InfoManager.LogInfos" AutoReadOnly Hidden
String Property LOG_WARNINGS = "APPS.Framework.InfoManager.LogWarnings" AutoReadOnly Hidden
String Property LOGFILE = "APPS.Framework.InfoManager.LogFile" AutoReadOnly Hidden
String Property LOGNAME = "APPS.Framework.InfoManager.LogName" AutoReadOnly Hidden
String Property REGISTERED_MODS = "APPS.Framework.RegisteredMods" AutoReadOnly Hidden
String Property REGISTERED_RS = "APPS.Framework.Relationship.RegisteredMods" AutoReadOnly Hidden
String Property UNINSTALL_MODS = "APPS.Framework.UninstallMods" AutoReadOnly Hidden
String Property UNINSTALL_QUEST = "APPS.Framework.UninstallMods.UninstallQuest" AutoReadOnly Hidden
String Property UNINSTALL_STAGE = "APPS.Framework.UninstallMods.UninstallStage" AutoReadOnly Hidden
String Property MOD_NAME = "APPS.Framework.RegisteredMods.ModName" AutoReadOnly Hidden

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

APPS_FW_Registrar Function GetBaseAPI() Global
	Return Game.GetFormFromFile(0xD62, "APPS - Framework.esm") As APPS_FW_Registrar
EndFunction


Bool Function IsModRegistered(String asModName)
	Int RegisteredMods = StorageUtil.FormListCount(None, REGISTERED_MODS)
	Int i
		
		While (i < RegisteredMods)
			Quest Mod = StorageUtil.FormListGet(None, REGISTERED_MODS, i) as Quest
			If (StorageUtil.GetStringValue(Mod, MOD_NAME) == asModName)
				Return True
			Else
				i += 1
			EndIf
		EndWhile
	
	Return False
EndFunction

Bool Function IsModRegisteredWithRSMod(String asModName)
	Int RegisteredMods = StorageUtil.FormListCount(None, REGISTERED_RS)
	Int i
		
		While (i < RegisteredMods)
			Quest Mod = StorageUtil.FormListGet(None, REGISTERED_RS, i) as Quest
			If (StorageUtil.GetStringValue(Mod, MOD_NAME) == asModName)
				Return True
			Else
				i += 1
			EndIf
		EndWhile
	
	Return False
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