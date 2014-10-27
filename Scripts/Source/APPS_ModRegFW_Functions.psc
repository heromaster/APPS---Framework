ScriptName APPS_ModRegFW_Functions Extends APPS_FW_Core
Import StorageUtil

Int Property USE_MOD_USER_LOG = 0 AutoReadOnly Hidden
Int Property USE_FRAMEWORK_LOG = 1 AutoReadOnly Hidden
Int Property USE_PAPYRUS_LOG = 2 AutoReadOnly Hidden
Int Property MOD_NOT_FOUND = -1 AutoReadOnly Hidden
String Property ModName Auto
String Property SUKEY_EXCEPTIONS_LOGFILE = "APPS.Exceptions.LogFile" AutoReadOnly Hidden
String Property SUKEY_DISPLAY_ERRORS = "APPS.Exceptions.DisplayErrors" AutoReadOnly Hidden
String Property SUKEY_DISPLAY_WARNINGS = "APPS.Exceptions.DisplayWarnings" AutoReadOnly Hidden
String Property SUKEY_DISPLAY_INFOS = "APPS.Exceptions.DisplayInfos" AutoReadOnly Hidden
String Property SUKEY_LOG_ERRORS = "APPS.Exceptions.LogErrors" AutoReadOnly Hidden
String Property SUKEY_LOG_WARNINGS = "APPS.Exceptions.LogWarnings" AutoReadOnly Hidden
String Property SUKEY_LOG_INFOS = "APPS.Exceptions.LogInfos" AutoReadOnly Hidden
String Property SUKEY_REGISTERED_MODS = "APPS.RegisteredMods" AutoReadOnly Hidden
String Property SUKEY_INIT_MODS = "APPS.InitMods" AutoReadOnly Hidden
String Property SUKEY_INIT_MODS_TOOLTIP = "APPS.InitMods.Tooltip" AutoReadOnly Hidden
String Property SUKEY_UNINSTALL_MODS = "APPS.UninstallMods" AutoReadOnly Hidden
String Property SUKEY_EXCEPTIONS_LOGNAME = "APPS.Exceptions.LogName" AutoReadOnly Hidden
String Property IS_EMPTY = "" AutoReadOnly Hidden

;/ |------------------------------------------------------------------------------------------------------------|
   |Registers a mod to access advanced functions of the framework.												|
   |If a mod wants to update its token, this function should be called again with a different Quest.			|
   |------------------------------------------------------------------------------------------------------------|																		|
   |Return value: Bool																							|
   |Returns True if the mod is successfully registered, the token is updated or the token is already in the		|
   |registration list.																							|
   |Returns False if no name of the mod is delivered(No quest full name or ModName property set)				|
   |------------------------------------------------------------------------------------------------------------| /;
Bool Function RegisterMod()
	;If no mod name was given (no ModName property or quest name set) it will not register the mod
	If(ModName == IS_EMPTY)
		If(_GetFormNameIfAvailable(Self) == IS_EMPTY)
			Exception.Throw("APPS - Framework", "No mod name was given. Can't register your mod.", "Registration failed")
			Return False
		Else
			ModName = Self.GetName()
		EndIf
	EndIf

	Int ModIndex = _GetModIndexFromString(ModName, SUKEY_REGISTERED_MODS) ;Look up if this mod is already registered with the framework

	If(ModIndex > MOD_NOT_FOUND)
		;Check if the token is the same one when the mod has been already registered
		If(Self == FormListGet(None, SUKEY_REGISTERED_MODS, ModIndex))
			Exception.Warn("APPS - Framework", "Mod " + ModName + " is already registered.")
		;It's not the same token, so just update the entry with the new token
		Else
			FormListSet(None, SUKEY_REGISTERED_MODS, ModIndex, Self)
			Exception.Notify("APPS - Framework", "Mod " + ModName + " found in registration list. Updated to new token.")
		EndIf
	Else
		StringListInsert(None, SUKEY_REGISTERED_MODS, 0, ModName)
		FormListInsert(None, SUKEY_REGISTERED_MODS, 0, Self)
		Exception.Notify("APPS - Framework", "Mod " + ModName + " is successfully registered.")
	EndIf

	Return True
EndFunction

;/ |------------------------------------------------------------------------------------------------------------|
   |Registers a quest to initialize this mod in a more safe and controlled way.									|
   |------------------------------------------------------------------------------------------------------------|
   |Optional parameter: akInstallQuest																			|
   |Default value: None																							|
   |If no parameter was submitted this function assumes that the delivered install quest is this quest.			|
   |------------------------------------------------------------------------------------------------------------|
   |Optional parameter: aiSetStage																				|
   |Default value: 0																							|
   |This tells the framework which stage the quest should be set to initialize itself. Usually a quest has its	|
   |startup stage at stage 0. However, if this quest should initialize the mod, then aiSetStage has to be set	|
   |to another stage than 0 because this would be an invalid stage.												|
   |------------------------------------------------------------------------------------------------------------|
   |Return value: Bool																							|
   |Returns True if the install quest is successfully registered.												|
   |Returns False if Self is the install quest and no stage was submitted.										|
   |------------------------------------------------------------------------------------------------------------| /;
Bool Function RegisterInitQuest(Quest akInitQuest = None, Int aiSetStage = 0, String asTooltip = "")
	Quest InitQuest

	If(akInitQuest == None && aiSetStage == 0)
		Exception.Throw("APPS - Framework", "Can't register install quest because none was submitted and stage 0 for this quest is invalid.", "Invalid stage submitted")
		Return False
	EndIf
	
	If(aiSetStage < 0)
		Exception.Throw("APPS - Framework", "Stage " + aiSetStage + " is an invalid stage.", "Invalid stage submitted")
		Return False
	EndIf

	If(akInitQuest == None)
		InitQuest = Self
	Else
		InitQuest = akInitQuest
	EndIf

	FormListAdd(None, SUKEY_INIT_MODS, InitQuest)
	IntListAdd(None, SUKEY_INIT_MODS, aiSetStage)
	StringListAdd(None, SUKEY_INIT_MODS, ModName)

	If(asTooltip != IS_EMPTY)
		SetStringValue(Self, SUKEY_INIT_MODS_TOOLTIP, asTooltip)
	EndIf

	Exception.Notify("APPS - Framework", ModName + " successfully registered an installation quest.")
	Return True
EndFunction

Bool Function RegisterUninstallQuest(Quest akUninstallQuest = None, Int aiSetStage = 0)
	Quest UninstallQuest = Self

	If(akUninstallQuest == None && aiSetStage == 0)
		Exception.Throw("APPS - Framework", "Can't register uninstall quest because none was submitted and stage 0 for this quest is invalid.", "Invalid stage submitted")
		Return False
	EndIf
	
	If(aiSetStage < 0)
		Exception.Throw("APPS - Framework", "Stage " + aiSetStage + " is an invalid stage.", "Invalid stage submitted")
		Return False
	EndIf

	If(akUninstallQuest != None)
		UninstallQuest = akUninstallQuest
	EndIf

	FormListAdd(None, SUKEY_UNINSTALL_MODS, UninstallQuest)
	IntListAdd(None, SUKEY_UNINSTALL_MODS, aiSetStage)
	StringListAdd(None, SUKEY_UNINSTALL_MODS, ModName)
	Exception.Notify("APPS - Framework", "Quest successfully registered to be uninstalled at a later point.")
	Return True
EndFunction

Function RegisterForExceptionModule(String asLogName)
	SetStringValue(Self, SUKEY_EXCEPTIONS_LOGNAME, asLogName)
	SetIntValue(Self, SUKEY_EXCEPTIONS_LOGFILE, USE_MOD_USER_LOG)
	SetIntValue(Self, SUKEY_DISPLAY_WARNINGS, 1)
	SetIntValue(Self, SUKEY_DISPLAY_ERRORS, 1)
	SetIntValue(Self, SUKEY_LOG_INFOS, 1)
	SetIntValue(Self, SUKEY_LOG_WARNINGS, 1)
	SetIntValue(Self, SUKEY_LOG_ERRORS, 1)
EndFunction

Function SetInfoHandling(Bool abLogInfos = True, Bool abDisplayInfos = False)
	If(abLogInfos)
		SetIntValue(Self, SUKEY_LOG_INFOS, 1)
	Else
		UnsetIntValue(Self, SUKEY_LOG_INFOS)
	EndIf

	If(abDisplayInfos)
		SetIntValue(Self, SUKEY_DISPLAY_INFOS, 1)
	Else
		UnsetIntValue(Self, SUKEY_DISPLAY_INFOS)
	EndIf
EndFunction

Function SetWarningHandling(Bool abLogWarnings = True, Bool abDisplayWarnings = True)
	If(abLogWarnings)
		SetIntValue(Self, SUKEY_LOG_WARNINGS, 1)
	Else
		UnsetIntValue(Self, SUKEY_LOG_WARNINGS)
	EndIf

	If(abDisplayWarnings)
		SetIntValue(Self, SUKEY_DISPLAY_WARNINGS, 1)
	Else
		UnsetIntValue(Self, SUKEY_DISPLAY_WARNINGS)
	EndIf
EndFunction

Function SetErrorHandling(Bool abLogErrors = True, Bool abDisplayErrors = True)
	If(abLogErrors)
		SetIntValue(Self, SUKEY_LOG_ERRORS, 1)
	Else
		UnsetIntValue(Self, SUKEY_LOG_ERRORS)
	EndIf

	If(abDisplayErrors)
		SetIntValue(Self, SUKEY_DISPLAY_ERRORS, 1)
	Else
		UnsetIntValue(Self, SUKEY_DISPLAY_ERRORS)
	EndIf
EndFunction

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