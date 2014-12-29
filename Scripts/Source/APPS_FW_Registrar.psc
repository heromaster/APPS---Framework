ScriptName APPS_FW_Registrar Extends APPS_FW_Core
Import StorageUtil

Int Property USE_MOD_USER_LOG = 0 AutoReadOnly Hidden
Int Property USE_FRAMEWORK_LOG = 1 AutoReadOnly Hidden
Int Property USE_PAPYRUS_LOG = 2 AutoReadOnly Hidden
Int Property MOD_NOT_FOUND = -1 AutoReadOnly Hidden
String Property ModName Auto
String Property FW_LOG = "APPS - Framework" AutoReadOnly Hidden
String Property IS_EMPTY = "" AutoReadOnly Hidden

;/ |------------------------------------------------------------------------------------------------------------|
   |Registers a mod to access advanced functions of the framework.												|
   |If a mod wants to update its token, this function should be called again with a different Quest.			|
   |------------------------------------------------------------------------------------------------------------|
   |Return value: Bool																							|
   |Returns True if the mod is successfully registered, the token is updated or the token is already in the		|
   |registration list.																							|
   |Returns False if no name of the mod is delivered(No quest full name or ModName property set)				|
   |------------------------------------------------------------------------------------------------------------| /;
Bool Function RegisterMod()
	;If no mod name was given (no ModName property or quest name set) it will not register the mod
	If(ModName == IS_EMPTY)
		If(_GetFormNameIfAvailable(Self) == IS_EMPTY)
			Exception.Throw(FW_LOG, "No mod name was given. Can't register mod with ID: " + Self.GetFormID() + ".", "Registration failed")
			Return False
		Else
			ModName = Self.GetName()
		EndIf
	EndIf

	Int ModIndex = _GetModIndexFromForm(Self, REGISTERED_MODS) ;Look up if this mod is already registered with the framework

	If(ModIndex > MOD_NOT_FOUND)
		;Check if the token is the same one when the mod has been already registered
		If(Self == FormListGet(None, REGISTERED_MODS, ModIndex))
			Exception.Warn(FW_LOG, "Mod " + ModName + " is already registered.")
		;It's not the same token, so just update the entry with the new token
		Else
			FormListSet(None, REGISTERED_MODS, ModIndex, Self)
			Exception.Notify(FW_LOG, "Mod " + ModName + " found in registration list. Updated to new token.")
		EndIf
	Else
		SetStringValue(Self, MOD_NAME, ModName)
		FormListAdd(None, REGISTERED_MODS, Self)
		Exception.Notify(FW_LOG, "Mod " + ModName + " is registered.")
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
		Exception.Throw(FW_LOG, "Can't register initialization quest from " + ModName + " because none was submitted and stage 0 for this quest is invalid.", "Invalid stage submitted")
		Return False
	EndIf
	
	If(aiSetStage < 0)
		Exception.Throw(FW_LOG, "Stage " + aiSetStage + " from " + ModName + " is an invalid stage.", "Invalid stage submitted")
		Return False
	EndIf

	If(akInitQuest == None)
		InitQuest = Self
	Else
		InitQuest = akInitQuest
	EndIf
	
	If (GetFormValue(Self, INIT_QUEST) == InitQuest)
		Exception.Warn(FW_LOG, "Init quest already registered for " + ModName + ". Nothing will be changed.")
		Return False
	ElseIf (GetFormValue(Self, INIT_QUEST))
		Exception.Throw(FW_LOG, ModName + " tried to register another init quest but there is already one registered. Aborting changes", "Two init quests are not allowed")
		Return False
	Else
		SetFormValue(Self, INIT_QUEST, InitQuest)
		SetIntValue(Self, INIT_STAGE, aiSetStage)
		FormListAdd(None, INIT_MODS, Self)
	EndIf
	
	If(asTooltip != IS_EMPTY)
		SetStringValue(Self, INIT_MODS_TOOLTIP, asTooltip)
	EndIf

	Exception.Notify(FW_LOG, ModName + " registered an initialization quest.", True, False)
	Return True
EndFunction

Bool Function RegisterUninstallQuest(Quest akUninstallQuest = None, Int aiSetStage = 0)
	Quest UninstallQuest = Self

	If(akUninstallQuest == None && aiSetStage == 0)
		Exception.Throw(FW_LOG, "Can't register uninstall quest because none was submitted and stage 0 for this quest is invalid.", "Invalid stage submitted")
		Return False
	EndIf
	
	If(aiSetStage < -1)
		Exception.Throw(FW_LOG, "Stage " + aiSetStage + " from " + ModName + " is an invalid stage.", "Invalid stage submitted")
		Return False
	EndIf

	If(akUninstallQuest != None)
		UninstallQuest = akUninstallQuest
	EndIf
	
	If (GetFormValue(Self, UNINSTALL_QUEST) == UninstallQuest)
		Exception.Warn(FW_LOG, "Uninstall quest already registered for " + ModName + ". Nothing will be changed.")
		Return False
	ElseIf (GetFormValue(Self, UNINSTALL_QUEST))
		Exception.Throw(FW_LOG, ModName + " tried to register another uninstall quest but there is already one registered. Aborting changes", "Two uninstall quests are not allowed")
		Return False
	Else
		SetFormValue(Self, UNINSTALL_QUEST, UninstallQuest)
		SetIntValue(Self, UNINSTALL_STAGE, aiSetStage)
		FormListAdd(None, UNINSTALL_MODS, Self)
	EndIf

	Exception.Notify(FW_LOG, "Quest registered an uninstallation quest.", False)

	Return True
EndFunction

Function RegisterForExceptionModule(String asLogName)
	SetStringValue(Self, LOGNAME, asLogName)
	SetIntValue(Self, LOGFILE, USE_MOD_USER_LOG)
	SetIntValue(Self, DISPLAY_WARNINGS, 1)
	SetIntValue(Self, DISPLAY_ERRORS, 1)
	SetIntValue(Self, LOG_INFOS, 1)
	SetIntValue(Self, LOG_WARNINGS, 1)
	SetIntValue(Self, LOG_ERRORS, 1)
EndFunction

Function SetInfoHandling(Bool abLogInfos = True, Bool abDisplayInfos = False)
	If(abLogInfos)
		SetIntValue(Self, LOG_INFOS, 1)
	Else
		UnsetIntValue(Self, LOG_INFOS)
	EndIf

	If(abDisplayInfos)
		SetIntValue(Self, DISPLAY_INFOS, 1)
	Else
		UnsetIntValue(Self, DISPLAY_INFOS)
	EndIf
EndFunction

Function SetWarningHandling(Bool abLogWarnings = True, Bool abDisplayWarnings = True)
	If(abLogWarnings)
		SetIntValue(Self, LOG_WARNINGS, 1)
	Else
		UnsetIntValue(Self, LOG_WARNINGS)
	EndIf

	If(abDisplayWarnings)
		SetIntValue(Self, DISPLAY_WARNINGS, 1)
	Else
		UnsetIntValue(Self, DISPLAY_WARNINGS)
	EndIf
EndFunction

Function SetErrorHandling(Bool abLogErrors = True, Bool abDisplayErrors = True)
	If(abLogErrors)
		SetIntValue(Self, LOG_ERRORS, 1)
	Else
		UnsetIntValue(Self, LOG_ERRORS)
	EndIf

	If(abDisplayErrors)
		SetIntValue(Self, DISPLAY_ERRORS, 1)
	Else
		UnsetIntValue(Self, DISPLAY_ERRORS)
	EndIf
EndFunction

Bool Function RegisterForRelationshipModule()
;ANTONO TODO require to be registered with the framework in general
	If(FormListAdd(None, REGISTERED_RS, Self, False) > -1)
		Exception.Notify(FW_LOG, ModName + " is now registered for the relationship module.", False)
		StringListAdd(None, REGISTERED_RS, ModName, False)
		Return True
	Else
		Exception.Warn(FW_LOG, ModName + " is already registered for the relationship module.")
		Return False
	EndIf
EndFunction