ScriptName APPS_Framework_MCM Extends SKI_ConfigBase
Import StorageUtil

Int FileLogLevel
String[] InitOrdering
String[] LogLevel
String[] InfoManagerModsListOptions
String[] SyncModeNPCListOptions
String[] LoggingMethod
String[] RS_PriorityOrdering
Int InfoManagerModsListSelection
Int SyncModeNPCListSelection
Quest InfoManagerToken
Actor SyncModeNPC
Int USE_MOD_USER_LOG = 0
Int USE_FRAMEWORK_LOG = 1
Int USE_PAPYRUS_LOG = 2
Int MOD_NOT_FOUND = -1
Int MOVE_TOP = 0
Int MOVE_UP = 1
Int MOVE_DOWN = 3
Int MOVE_BOTTOM = 4
Int INITIALIZE_MOD = 6
String FW_LOG = "APPS - Framework"
String MOD_NAME = "APPS.Framework.RegisteredMods.ModName"
String EXCEPTIONS_LOGFILE = "APPS.Framework.InfoManager.LogFile"
String EXCEPTIONS_LOGNAME = "APPS.Framework.InfoManager.LogName"
String DISPLAY_ERRORS = "APPS.Framework.InfoManager.DisplayErrors"
String DISPLAY_WARNINGS = "APPS.Framework.InfoManager.DisplayWarnings"
String DISPLAY_INFOS = "APPS.Framework.InfoManager.DisplayInfos"
String LOG_ERRORS = "APPS.Framework.InfoManager.LogErrors"
String LOG_WARNINGS = "APPS.Framework.InfoManager.LogWarnings"
String LOG_INFOS = "APPS.Framework.InfoManager.LogInfos"
String REGISTERED_MODS = "APPS.Framework.RegisteredMods"
String MENU_OPTIONS = "APPS.Framework.MCM.MenuOptions"
String INIT_MODS = "APPS.Framework.InitMods"
String INIT_QUEST = "APPS.Framework.InitMods.InitQuest"
String INIT_STAGE = "APPS.Framework.InitMods.InitStage"
String INIT_MODS_TOOLTIP = "APPS.Framework.InitMods.Tooltip"
String UNINSTALL_MODS = "APPS.Framework.UninstallMods"
String UNINSTALL_QUEST = "APPS.Framework.UninstallMods.UninstallQuest"
String UNINSTALL_STAGE = "APPS.Framework.UninstallMods.UninstallStage"
String REGISTERED_RS = "APPS.Framework.Relationship.RegisteredMods"
String SYNC_MODE_CHANGELIST = "APPS.Framework.Relationship.SyncMode.ChangeList"
String SYNC_MODE_NPC_CHANGELIST = "APPS.Framework.Relationship.SyncMode.NPC.ChangeList"
String RS_MULTI_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.Global.ChangeList"
String RS_MULTI_NPC_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.NPC.ChangeList"
String RS_MULTI_S0_S1_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S0_S1.ChangeList"
String RS_MULTI_S1_S2_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S1_S2.ChangeList"
String RS_MULTI_S2_S3_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S2_S3.ChangeList"
String RS_MULTI_S3_S4_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S3_S4.ChangeList"
String RS_MULTI_S4_S5_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S4_S5.ChangeList"
String RS_MULTI_S5_S4_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S5_S4.ChangeList"
String RS_MULTI_S4_S3_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S4_S3.ChangeList"
String RS_MULTI_S3_S2_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S3_S2.ChangeList"
String RS_MULTI_S2_S1_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S2_S1.ChangeList"
String RS_MULTI_S1_S0_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S1_S0.ChangeList"
String RS_MULTI_S0_SM1_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S0_S-1.ChangeList"
String RS_MULTI_SM1_SM2_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S-1_S-2.ChangeList"
String RS_MULTI_SM2_SM3_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S-2_S-3.ChangeList"
String RS_MULTI_SM3_SM4_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S-3_S-4.ChangeList"
String RS_MULTI_SM4_SM5_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S-4_S-5.ChangeList"
String RS_MULTI_SM5_SM4_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S-5_S-4.ChangeList"
String RS_MULTI_SM4_SM3_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S-4_S-3.ChangeList"
String RS_MULTI_SM3_SM2_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S-3_S-2.ChangeList"
String RS_MULTI_SM2_SM1_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S-2_S-1.ChangeList"
String RS_MULTI_SM1_S0_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S-1_S0.ChangeList"
Int InitControlFlags 
Int UninstallControlFlags 
Int NPCSyncModeOptionFlag
Float TimeToNextInit = 1.0
Bool InitSafetyLock = False 
Bool UninstSafetyLock = False 

Event OnConfigInit()
	Pages = new String[9]
	Pages[0] = "$REGISTRY"
	Pages[1] = "$INFO_MANAGER"
	Pages[2] = "$INITIALIZATION_MANAGER"
	Pages[3] = "$UNINSTALL_MANAGER"
;Just adding a pile of work you ;)
	Pages[4] = "RS - Priority"
	Pages[5] = "RS - Global Sync Mode"
	Pages[6] = "RS - NPC Sync Mode"
	Pages[7] = "RS - Global RS Multiplier"
	Pages[8] = "RS - Local RS Multiplier"

	InitOrdering = New String[7]
	InitOrdering[0] = "$MOVE_TOP"
	InitOrdering[1] = "$MOVE_UP"
	InitOrdering[2] = "---------------"
	InitOrdering[3] = "$MOVE_DOWN"
	InitOrdering[4] = "$MOVE_BOTTOM"
	InitOrdering[5] = "---------------"
	InitOrdering[6] = "$INITIALIZE_MOD"
	
	RS_PriorityOrdering = New String[5]
	RS_PriorityOrdering[0] = "$MOVE_TOP"
	RS_PriorityOrdering[1] = "$MOVE_UP"
	RS_PriorityOrdering[2] = "---------------"
	RS_PriorityOrdering[3] = "$MOVE_DOWN"
	RS_PriorityOrdering[4] = "$MOVE_BOTTOM"

	LogLevel = New String[4]
	LogLevel[0] = "$EVERYTHING"
	LogLevel[1] = "$WARNINGS_AND_ERRORS"
	LogLevel[2] = "$ONLY_ERRORS"
	LogLevel[3] = "$NOTHING"

	LoggingMethod = New String[3]
	LoggingMethod[0] = "$USE_MOD_USER_LOG"
	LoggingMethod[1] = "$USE_FRAMEWORK_LOG"
	LoggingMethod[2] = "$USE_PAPYRUS_LOG"
	
	NPCSyncModeOptionFlag = OPTION_FLAG_HIDDEN
EndEvent

Event OnPageReset(String asPage)
	IntListClear(None, MENU_OPTIONS)
	StringListClear(None, MENU_OPTIONS)
	FormListClear(None, MENU_OPTIONS)

	If (asPage == Pages[0])	;registry
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("$REGISTERED_MODS")
		AddEmptyOption()
		
		Int RegisteredMods = FormListCount(None, REGISTERED_MODS)
		Int i

		While (i < RegisteredMods)
			AddTextOption(_GetModNameFromFormList(REGISTERED_MODS, i), "")
			i += 1
		EndWhile
		
	ElseIf (asPage == Pages[1])	;info manager
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("$GENERAL_SETTINGS")
		AddToggleOptionST("EnableLogging", "$ENABLE_LOGGING", Utility.GetINIBool("bEnableLogging:Papyrus"))
		AddEmptyOption()
		AddHeaderOption("$MOD_SPECIFIC_SETTINGS")
		AddMenuOptionST("InfoManagerModsList", "", "$SELECT_MOD")
		AddEmptyOption()
		AddMenuOptionST("LoggingMethod", "$LOGGING_METHOD", "", OPTION_FLAG_DISABLED)
		AddTextOptionST("LogName", "Log Name", "", OPTION_FLAG_DISABLED)
		
		;filling up the InfoManagerModsListOptions array with the names of the registered mods, to be shown as a menu later
		Int RegisteredMods = FormListCount(None, REGISTERED_MODS)
		InfoManagerModsListOptions = PapyrusUtil.StringArray(RegisteredMods)
		Int i

			While (i < RegisteredMods)
				InfoManagerModsListOptions[i] = _GetModNameFromFormList(REGISTERED_MODS, i)
				i += 1
			EndWhile
		
		SetCursorPosition(1)	;go to top of right column
		AddHeaderOption("$INFOS")
		AddToggleOptionST("DisplayInfos", "$DISPLAY_ON_SCREEN", False, OPTION_FLAG_DISABLED)
		AddToggleOptionST("LogInfos", "$LOG_TO_FILE", False, OPTION_FLAG_DISABLED)
		AddHeaderOption("$WARNINGS")
		AddToggleOptionST("DisplayWarnings", "$DISPLAY_ON_SCREEN", False, OPTION_FLAG_DISABLED)
		AddToggleOptionST("LogWarnings", "$LOG_TO_FILE", False, OPTION_FLAG_DISABLED)
		AddHeaderOption("$ERRORS")
		AddToggleOptionST("DisplayErrors", "$DISPLAY_ON_SCREEN", False, OPTION_FLAG_DISABLED)
		AddToggleOptionST("LogErrors", "$LOG_TO_FILE", False, OPTION_FLAG_DISABLED)
		
	ElseIf (asPage == Pages[2])	;initialization manager
		If (InitSafetyLock || UninstSafetyLock || FormListCount(None, INIT_MODS) == 0) 
			InitControlFlags = OPTION_FLAG_DISABLED
		Else
			InitControlFlags = OPTION_FLAG_NONE
		EndIf

		SetCursorFillMode(TOP_TO_BOTTOM)
		AddSliderOptionST("WaitingTimeBetweenInits", "$WAITING_TIME_BETWEEN_INITS", 1.0, "{1} seconds", InitControlFlags)

		If (InitSafetyLock)
			AddHeaderOption("$INIT_IN_PROGRESS")
		ElseIf (UninstSafetyLock)
			AddHeaderOption("$UNINST_IN_PROGRESS")
		Else
			AddTextOptionST("StartInitialization", "$START_INITIALIZATION_SEQUENCE", "$GO")
		EndIf

		AddEmptyOption()
		AddHeaderOption("$INITIALIZATION_ORDER")
		AddEmptyOption()

		Int i

		While (i < FormListCount(None, INIT_MODS))
			IntListAdd(None, MENU_OPTIONS, AddMenuOption("#" + (i + 1) As String + ": ", _GetModNameFromFormList(INIT_MODS, i), InitControlFlags))
			;StringListAdd(None, MENU_OPTIONS, _GetModNameFromFormList(INIT_MODS, i))
			FormListAdd(None, MENU_OPTIONS, FormListGet(None, INIT_MODS, i))
			i += 1
		EndWhile
		
	ElseIf (asPage == Pages[3])	;uninstall manager
		If (InitSafetyLock || UninstSafetyLock || FormListCount(None, UNINSTALL_MODS) == 0)
			UninstallControlFlags = OPTION_FLAG_DISABLED
		Else
			UninstallControlFlags = OPTION_FLAG_NONE
		EndIf

		SetCursorFillMode(TOP_TO_BOTTOM)

		If (InitSafetyLock)
			AddHeaderOption("$INIT_IN_PROGRESS")
		ElseIf (UninstSafetyLock)
			AddHeaderOption("$UNINST_IN_PROGRESS")
		Else
			AddEmptyOption()
		EndIf

		AddHeaderOption("$MODS_WITH_UNINSTALL_FEATURE")
		AddEmptyOption()

		Int UninstallMods = FormListCount(None, UNINSTALL_MODS)
		Int i = UninstallMods

		While (i < FormListCount(None, UNINSTALL_MODS))
			IntListAdd(None, MENU_OPTIONS, AddTextOption(_GetModNameFromFormList(UNINSTALL_MODS, i), "", UninstallControlFlags))
			;StringListAdd(None, MENU_OPTIONS, _GetModNameFromFormList(UNINSTALL_MODS, i))
			FormListAdd(None, MENU_OPTIONS, FormListGet(None, UNINSTALL_MODS, i))
			i += 1
		EndWhile
		
	ElseIf (asPage == Pages[4])	;RS - Priority
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		AddHeaderOption("$RELATIONSHIP_PRIORITY")
		AddEmptyOption()
		
		Int i

		While (i < FormListCount(None, REGISTERED_RS))
			IntListAdd(None, MENU_OPTIONS, AddMenuOption("#" + (i + 1) As String + ": ", StringListGet(None, REGISTERED_RS, i)))
			StringListAdd(None, MENU_OPTIONS, StringListGet(None, REGISTERED_RS, i))
			i += 1
		EndWhile
		
	ElseIf (asPage == Pages[5])	;RS - Global Sync Mode changes
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		AddHeaderOption("$RELATIONSHIP")
		AddTextOption("", "$GLOBAL_SYNC_MODE_CHANGES")
		AddEmptyOption()
		
		Int ModsAffectingSyncMode = FormListCount(None, SYNC_MODE_CHANGELIST)
		String SyncMode
		Int i
		
		While (i < ModsAffectingSyncMode)
			;convert SyncMode from Int to String
			If (IntListGet(None, SYNC_MODE_CHANGELIST, i) == 0)
				SyncMode == "$DISABLE"
			ElseIf (IntListGet(None, SYNC_MODE_CHANGELIST, i) == 1)
				SyncMode == "$VANILLA_TO_RS"
			ElseIf (IntListGet(None, SYNC_MODE_CHANGELIST, i) == 2)
				SyncMode == "$RS_TO_VANILLA"
			ElseIf (IntListGet(None, SYNC_MODE_CHANGELIST, i) == 3)
				SyncMode == "$BOTH_WAYS"
			EndIf
			
			Quest Token = FormListGet(None, SYNC_MODE_CHANGELIST, i) as Quest
			Int ModIndex = FormListFind(None, REGISTERED_RS, Token)
			String ModName = StringListGet(None, REGISTERED_RS, ModIndex)
			
			AddTextOption(ModName, SyncMode)
			
			i += 1
		EndWhile
		
	ElseIf (asPage == Pages[6])	;RS - NPC Sync Mode changes
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		AddHeaderOption("$NPCs_WITH_SPECIAL_SYNCMODE")
		AddEmptyOption()
		AddMenuOptionST("SyncModeNPCList", "", "$SELECT_NPC")
		
		;filling up the SyncModeNPCListOptions array with the names of the NPCs, to be shown as a menu later.
		Int iSyncModeNPCs = FormListCount(None, SYNC_MODE_NPC_CHANGELIST)
		SyncModeNPCListOptions = PapyrusUtil.StringArray(iSyncModeNPCs)
		Int i
		
			While (i < iSyncModeNPCs)
				SyncModeNPCListOptions[i] = FormListGet(None, SYNC_MODE_NPC_CHANGELIST, i).GetName()
				i += 1
			EndWhile
		
		SetCursorPosition(1)	;go to top of right column
		AddHeaderOption("$MODS_AFFECTING_ACTOR")
		AddEmptyOption()
		
		NPCSyncModeOptionFlag = OPTION_FLAG_DISABLED
		Int ModsAffectingSyncModeNPC = FormListCount(SyncModeNPC, SYNC_MODE_CHANGELIST)
		String SyncMode
		Int j
		
			While (j < ModsAffectingSyncModeNPC)
				;convert SyncMode from Int to String
				If (IntListGet(SyncModeNPC, SYNC_MODE_CHANGELIST, i) == 0)
					SyncMode == "$DISABLE"
				ElseIf (IntListGet(SyncModeNPC, SYNC_MODE_CHANGELIST, i) == 1)
					SyncMode == "$VANILLA_TO_RS"
				ElseIf (IntListGet(SyncModeNPC, SYNC_MODE_CHANGELIST, i) == 2)
					SyncMode == "$RS_TO_VANILLA"
				ElseIf (IntListGet(SyncModeNPC, SYNC_MODE_CHANGELIST, i) == 3)
					SyncMode == "$BOTH_WAYS"
				EndIf
				
				Quest Token = FormListGet(SyncModeNPC, SYNC_MODE_CHANGELIST, i) as Quest
				Int ModIndex = FormListFind(None, REGISTERED_RS, Token)
				String ModName = StringListGet(None, REGISTERED_RS, ModIndex)
				
				AddTextOption(ModName, SyncMode, NPCSyncModeOptionFlag)
				j += 1
			EndWhile
			
;/	ElseIf (asPage == Pages[7])	;RS - Global RS Multiplier
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		AddHeaderOption("$RELATIONSHIP")
		AddTextOption("", "$GLOBAL_RELATIONSHIP_MULTIPLIERS")
		AddEmptyOption()
		
		;filling up the GlobalRSMultiModsListOptions array with the names of the mods, to be shown as a menu later.
		Int iGlobalRSMultiMods = FormListCount(None, RS)
		Int i
		/;
		
	EndIf
EndEvent

State EnableLogging
	Event OnSelectST()
		If(Utility.GetINIBool("bEnableLogging:Papyrus"))
			If(!ShowMessage("$DISABLES_EVERY_LOG"))
				Return
			EndIf
		EndIf

		Utility.SetINIBool("bEnableLogging:Papyrus", !Utility.GetINIBool("bEnableLogging:Papyrus"))
		SetToggleOptionValueST(Utility.GetINIBool("bEnableLogging:Papyrus"))

		ForcePageReset()
	EndEvent

	Event OnHighlightST()
		SetInfoText("$EXPLAIN_ENABLE_LOGGING")
	EndEvent
EndState

State InfoManagerModsList
	Event OnMenuOpenST()
		SetMenuDialogOptions(InfoManagerModsListOptions)
		SetMenuDialogStartIndex(InfoManagerModsListSelection)
	EndEvent

	Event OnMenuAcceptST(int aiSelectedOption)
		Int OptionFlag = OPTION_FLAG_NONE
		InfoManagerModsListSelection = aiSelectedOption	;store the user's selection as a variable to be used the next time the menu is displayed
		Utility.WaitMenuMode(0.5)
		
		If(!Utility.GetINIBool("bEnableLogging:Papyrus"))
			OptionFlag = OPTION_FLAG_DISABLED
		EndIf
		
		InfoManagerToken = FormListGet(None, REGISTERED_MODS, aiSelectedOption) as Quest ;save the user's selection as a variable to be used for toggling the Info Manager's options

		;fetching the Int contents of EXCEPTIONS_LOGFILE array and converting them to strings
		String TokenLoggingMethod

		If (GetIntValue(InfoManagerToken, EXCEPTIONS_LOGFILE) == USE_MOD_USER_LOG)
			TokenLoggingMethod = LoggingMethod[0]
		ElseIf (GetIntValue(InfoManagerToken, EXCEPTIONS_LOGFILE) == USE_FRAMEWORK_LOG)
			TokenLoggingMethod = LoggingMethod[1]
		ElseIf (GetIntValue(InfoManagerToken, EXCEPTIONS_LOGFILE) == USE_PAPYRUS_LOG)
			TokenLoggingMethod = LoggingMethod[2]
		EndIf

		SetMenuOptionValueST(InfoManagerModsListOptions[aiSelectedOption])
		SetTextOptionValueST(InfoManagerModsListOptions[aiSelectedOption], True, "ModSettings")
		SetMenuOptionValueST(TokenLoggingMethod, True, "LoggingMethod")
		SetTextOptionValueST(GetStringValue(InfoManagerToken, EXCEPTIONS_LOGNAME), True, "LogName")
		SetToggleOptionValueST(HasIntValue(InfoManagerToken, DISPLAY_INFOS), True, "DisplayInfos")
		SetToggleOptionValueST(HasIntValue(InfoManagerToken, LOG_INFOS), True, "LogInfos")
		SetToggleOptionValueST(HasIntValue(InfoManagerToken, DISPLAY_WARNINGS), True, "DisplayWarnings")
		SetToggleOptionValueST(HasIntValue(InfoManagerToken, LOG_WARNINGS), True, "LogWarnings")
		SetToggleOptionValueST(HasIntValue(InfoManagerToken, DISPLAY_ERRORS), True, "DisplayErrors")
		SetToggleOptionValueST(HasIntValue(InfoManagerToken, LOG_ERRORS), True, "LogErrors")
		SetOptionFlagsST(OptionFlag, True, "ModSettings")
		SetOptionFlagsST(OptionFlag, True, "LoggingMethod")
		SetOptionFlagsST(OptionFlag, True, "LogName")
		SetOptionFlagsST(OptionFlag, True, "DisplayInfos")
		SetOptionFlagsST(OptionFlag, True, "LogInfos")
		SetOptionFlagsST(OptionFlag, True, "DisplayWarnings")
		SetOptionFlagsST(OptionFlag, True, "LogWarnings")
		SetOptionFlagsST(OptionFlag, True, "DisplayErrors")
		SetOptionFlagsST(OptionFlag, False, "LogErrors")
		
	EndEvent

	Event OnHighlightST()
		SetInfoText("$EXPLAIN_INFO_MANAGER_MODS_LIST")
	EndEvent
EndState

State DisplayInfos
	Event OnSelectST()
		If(HasIntValue(InfoManagerToken, DISPLAY_INFOS))
			UnsetIntValue(InfoManagerToken, DISPLAY_INFOS)
		Else
			SetIntValue(InfoManagerToken, DISPLAY_INFOS, 1)
		EndIf

		SetToggleOptionValueST(HasIntValue(InfoManagerToken, DISPLAY_INFOS))
	EndEvent

	Event OnHighlightST()
		SetInfoText("$EXPLAIN_DISPLAY_INFOS")
	EndEvent
EndState

State DisplayWarnings
	Event OnSelectST()
		If(HasIntValue(InfoManagerToken, DISPLAY_WARNINGS))
			UnsetIntValue(InfoManagerToken, DISPLAY_WARNINGS)
		Else
			SetIntValue(InfoManagerToken, DISPLAY_WARNINGS, 1)
		EndIf

		SetToggleOptionValueST(HasIntValue(InfoManagerToken, DISPLAY_WARNINGS))
	EndEvent

	Event OnHighlightST()
		SetInfoText("$EXPLAIN_DISPLAY_WARNINGS")
	EndEvent
EndState

State DisplayErrors
	Event OnSelectST()
		If(HasIntValue(InfoManagerToken, DISPLAY_ERRORS))
			UnsetIntValue(InfoManagerToken, DISPLAY_ERRORS)
		Else
			SetIntValue(InfoManagerToken, DISPLAY_ERRORS, 1)
		EndIf

		SetToggleOptionValueST(HasIntValue(InfoManagerToken, DISPLAY_ERRORS))
	EndEvent

	Event OnHighlightST()
		SetInfoText("$EXPLAIN_DISPLAY_ERRORS")
	EndEvent
EndState

State LogInfos
	Event OnSelectST()
		If(HasIntValue(InfoManagerToken, LOG_INFOS))
			UnsetIntValue(InfoManagerToken, LOG_INFOS)
		Else
			SetIntValue(InfoManagerToken, LOG_INFOS, 1)
		EndIf

		SetToggleOptionValueST(HasIntValue(InfoManagerToken, LOG_INFOS))
	EndEvent

	Event OnHighlightST()
		SetInfoText("$EXPLAIN_LOG_INFOS")
	EndEvent
EndState

State LogWarnings
	Event OnSelectST()
		If(HasIntValue(InfoManagerToken, LOG_WARNINGS))
			UnsetIntValue(InfoManagerToken, LOG_WARNINGS)
		Else
			SetIntValue(InfoManagerToken, LOG_WARNINGS, 1)
		EndIf

		SetToggleOptionValueST(HasIntValue(InfoManagerToken, LOG_WARNINGS))
	EndEvent

	Event OnHighlightST()
		SetInfoText("$EXPLAIN_LOG_WARNINGS")
	EndEvent
EndState

State LogErrors
	Event OnSelectST()
		If(HasIntValue(InfoManagerToken, LOG_ERRORS))
			UnsetIntValue(InfoManagerToken, LOG_ERRORS)
		Else
			SetIntValue(InfoManagerToken, LOG_ERRORS, 1)
		EndIf

		SetToggleOptionValueST(HasIntValue(InfoManagerToken, LOG_ERRORS))
	EndEvent

	Event OnHighlightST()
		SetInfoText("$EXPLAIN_LOG_ERRORS")
	EndEvent
EndState

State LoggingMethod
	Event OnMenuOpenST()
		SetMenuDialogOptions(LoggingMethod)

		If (GetIntValue(InfoManagerToken, EXCEPTIONS_LOGFILE) == USE_MOD_USER_LOG)
			SetMenuDialogStartIndex(0)
		ElseIf (GetIntValue(InfoManagerToken, EXCEPTIONS_LOGFILE) == USE_FRAMEWORK_LOG)
			SetMenuDialogStartIndex(1)
		ElseIf (GetIntValue(InfoManagerToken, EXCEPTIONS_LOGFILE) == USE_PAPYRUS_LOG)
			SetMenuDialogStartIndex(2)
		Else
			SetMenuDialogStartIndex(0)
		EndIf
	EndEvent

	Event OnMenuAcceptST(int aiSelectedOption)
		Utility.WaitMenuMode(0.5)	;waiting time to fix strange mix up of variables (SkyUI bug?)
		SetMenuOptionValueST(LoggingMethod[aiSelectedOption])
		SetIntValue(InfoManagerToken, EXCEPTIONS_LOGFILE, aiSelectedOption)
	EndEvent

	Event OnHighlightST()
		SetInfoText("$EXPLAIN_LOGGING_METHOD")
	EndEvent
EndState

State WaitingTimeBetweenInits
	Event OnSliderOpenST()
		SetSliderDialogStartValue(TimeToNextInit)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 5.0)
		SetSliderDialogInterval(0.1)
	EndEvent

	Event OnSliderAcceptST(float afSelectedValue)
		If (0.0 < afSelectedValue && afSelectedValue < 0.5)	;waiting times < 0.5 seconds are prone to errors (Heromaster)
			TimeToNextInit = 0.5
		Else
			TimeToNextInit = afSelectedValue
		EndIf

		SetSliderOptionValueST(TimeToNextInit, "{1} sec")
	EndEvent

	Event OnHighlightST()
		SetInfoText("$EXPLAIN_WAITING_TIME_BETWEEN_INITS")
	EndEvent
EndState

State StartInitialization
	Event OnHighlightST()
		SetInfoText("$EXPLAIN_START_INITIALIZATION")
	EndEvent

	Event OnSelectST()
		If (ShowMessage("$START_INITIALIZATION_CONFIRMATION") == True)
			ShowMessage("$CLOSE_MCM", False, "$OK")
			InitSafetyLock = True
			SetTextOptionValueST("$INITIALIZING", False, "StartInitialization")
			ForcePageReset()	;this ensures install order is displayed again with OPTION_FLAG_DISABLED			
			Utility.Wait(0.1)	;forces the user to close the menu

			While (FormListCount(None, INIT_MODS) > 0)
				Quest ModToInit = FormListGet(None, INIT_MODS, 0) as Quest
				String ModName = GetStringValue(ModToInit, MOD_NAME)
				Exception.Notify(FW_LOG, ModName)
				InitializeMod(ModToInit, abSafetyLock = False) ;SafetyLock is handled by line InitSafetyLock = True
				Utility.Wait(TimeToNextInit)
			EndWhile

			Exception.Notify(FW_LOG, "$INITIALIZATION_SEQUENCE_COMPLETE")

			InitSafetyLock = False
			SetTextOptionValueST("$GO", False, "StartInitialization")
			ForcePageReset()
		EndIf
	EndEvent
EndState

State SyncModeNPCList
	Event OnMenuOpenST()
		SetMenuDialogOptions(SyncModeNPCListOptions)
		SetMenuDialogStartIndex(SyncModeNPCListSelection)
	EndEvent
	
	Event OnMenuAcceptST(Int aiSelectedOption)
		SyncModeNPCListSelection = aiSelectedOption	;store the user's selection as a variable to be used the next time the menu is displayed
		
		;set the NPC, remove the disabled flag and let the OnPageReset() handle the rest
		NPCSyncModeOptionFlag = OPTION_FLAG_NONE		
		SyncModeNPC = FormListGet(None, SYNC_MODE_NPC_CHANGELIST, aiSelectedOption) as Actor
		
		ForcePageReset()
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$EXPLAIN_SYNCMODE_NPC_LIST")
	EndEvent
EndState

Event OnOptionHighlight(Int aiOption)
	Int i
	Int MenuOptions = IntListCount(None, MENU_OPTIONS)

	While (i < MenuOptions)
		If (aiOption == IntListGet(None, MENU_OPTIONS, i))
			If (CurrentPage == Pages[2])
				Form InitQuest = FormListGet(None, INIT_MODS, i)
				If (HasStringValue(InitQuest, INIT_MODS_TOOLTIP))
					SetInfoText(GetStringValue(InitQuest, INIT_MODS_TOOLTIP))
				EndIf
			
			ElseIf (CurrentPage == Pages[3])
				SetInfoText("$EXPLAIN_UNINSTALL")
			ElseIf (CurrentPage == Pages[4])
				SetInfoText("$EXPLAIN_RELATIONSHIP_PRIORITY")
			ElseIf (CurrentPage == Pages[3])
				SetInfoText("$EXPLAIN_RS_GLOBAL_SYNC_MODE_CHANGES")
			EndIf
			
			i = MenuOptions
		Else
			i += 1
		EndIf
	EndWhile
EndEvent

Event OnOptionMenuOpen(Int aiOption)
	Int i
	Int MenuOptions = IntListCount(None, MENU_OPTIONS)

	While(i < MenuOptions)
		If(aiOption == IntListGet(None, MENU_OPTIONS, i))
			SetMenuDialogDefaultIndex(2)
			SetMenuDialogStartIndex(2)
			
			If (CurrentPage == Pages[2])
				SetMenuDialogOptions(InitOrdering)
			ElseIf (CurrentPage == Pages[4])
				SetMenuDialogOptions(RS_PriorityOrdering)
			EndIf
			
			i = MenuOptions
		Else
			i += 1
		EndIf
	EndWhile
EndEvent

Event OnOptionMenuAccept(Int aiOpenedMenu, Int aiSelectedOption)
	Int i
	Int MenuOptions = IntListCount(None, MENU_OPTIONS)

	While (i < MenuOptions)
		If(aiOpenedMenu == IntListGet(None, MENU_OPTIONS, i))
			If (aiSelectedOption == MOVE_TOP || aiSelectedOption == MOVE_UP || aiSelectedOption == MOVE_DOWN || aiSelectedOption == MOVE_BOTTOM)
				If (CurrentPage == Pages[2])
					ChangeOrder(FormListGet(None, MENU_OPTIONS, i) as Quest, INIT_MODS, aiSelectedOption)
				ElseIf (CurrentPage == Pages[4])
					ChangeOrder(FormListGet(None, MENU_OPTIONS, i) as Quest, REGISTERED_RS, aiSelectedOption)
				EndIf
				
			ElseIf (aiSelectedOption == INITIALIZE_MOD)
				If (ShowMessage("$INITIALIZE_MOD_CONFIRMATION") == True)
					ShowMessage("$CLOSE_MCM", False, "$OK")
					Quest ModToInit = FormListGet(None, MENU_OPTIONS, i) as Quest
					Utility.Wait(0.1)	;forces the user to close the menu

					InitializeMod(ModToInit)
				EndIf
				
			i = MenuOptions	;stops the loop
			EndIf
			
		i = MenuOptions	;stops the loop
		Else
			i += 1
		EndIf
	EndWhile

	ForcePageReset()
EndEvent

Event OnOptionSelect(Int aiOption)
	If (CurrentPage == Pages[3])
		Int i
		Int MenuOptions = IntListCount(None, MENU_OPTIONS)

		While (i < MenuOptions)
			If (aiOption == IntListGet(None, MENU_OPTIONS, i))
				If (ShowMessage("$UNINSTALL_MOD_CONFIRMATION") == True)
					Quest ModToUninstall = FormListGet(None, MENU_OPTIONS, i) as Quest
					UninstallMod(ModToUninstall)
				EndIf
			i = MenuOptions
			Else
				i += 1
			EndIf
		EndWhile
		
	EndIf
	
	ForcePageReset()
EndEvent

Event OnConfigClose()
	IntListClear(None, MENU_OPTIONS)
	StringListClear(None, MENU_OPTIONS)
	FormListClear(None, MENU_OPTIONS)
EndEvent

Function ChangeOrder(Quest akMod, String asArray, Int aiPositionChange)
	If (asArray != INIT_MODS && asArray != REGISTERED_RS)
		Return
	EndIf

	Int ModIndex = FormListFind(None, asArray, akMod)

	If(aiPositionChange == MOVE_TOP)
		If(ModIndex == 0)
			Return
		EndIf

		FormListRemove(None, asArray, akMod)
		FormListInsert(None, asArray, 0, akMod)

	ElseIf(aiPositionChange == MOVE_UP)
		If(ModIndex == 0)
			Return
		EndIf

		FormListRemove(None, asArray, akMod)
		FormListInsert(None, asArray, (ModIndex - 1), akMod)

	ElseIf(aiPositionChange == MOVE_DOWN)
		If(ModIndex == (FormListCount(None, asArray) - 1))
			Return
		EndIf

		If(ModIndex == (FormListCount(None, asArray) - 2)) ;this is equivalent to MOVE_BOTTOM
			FormListRemove(None, asArray, akMod)
			FormListAdd(None, asArray, akMod)
		Else
			FormListRemove(None, asArray, akMod)
			FormListInsert(None, asArray, (ModIndex + 1), akMod)
		EndIf
		
	ElseIf(aiPositionChange == MOVE_BOTTOM)
		If(ModIndex == FormListCount(None, asArray) - 1)
			Return
		EndIf

		FormListRemove(None, asArray, akMod)
		FormListAdd(None, asArray, akMod)

	EndIf
EndFunction

Bool Function InitializeMod(Quest akModToInit, Bool abSafetyLock = True)
	Int ModIndex = FormListFind(None, INIT_MODS, akModToInit)
	String ModName = GetStringValue(akModToInit, MOD_NAME)
	Quest InitQuest = GetFormValue(akModToInit, INIT_QUEST) as Quest
	Int iSetStage = GetIntValue(akModToInit, INIT_STAGE)
	Bool result = True

	If (abSafetyLock)
		InitSafetyLock = True
	EndIf

	If(iSetStage == 0)
		If(!InitQuest.Start())
			result = False
		EndIf
	Else
		If(!InitQuest.SetStage(iSetStage))
			result = False
		EndIf
	EndIf

	If(result)
		Exception.Notify(FW_LOG, ModName + "$INITIALIZED")
	Else
		Exception.Throw(FW_LOG, "Failed to initialize mod", ModName + "$FAILED_TO_INITIALIZE")
		FormListRemove(None, REGISTERED_MODS, akModToInit)
	EndIf

	If (abSafetyLock)
		InitSafetyLock = False
	EndIf

	UnsetFormValue(akModToInit, INIT_QUEST)
	UnsetIntValue(akModToInit, INIT_STAGE)
	UnsetStringValue(akModToInit, INIT_MODS_TOOLTIP)
	FormListRemove(None, INIT_MODS, akModToInit)

	Return result
EndFunction

Bool Function UninstallMod(Quest ModToUninstall, Bool abSafetyLock = True)
	Int ModIndex = FormListFind(None, UNINSTALL_MODS, ModToUninstall)
	String ModName = GetStringValue(ModToUninstall, MOD_NAME)
	Quest UninstallQuest = GetFormValue(ModToUninstall, UNINSTALL_QUEST) as Quest
	Int iSetStage = GetIntValue(ModToUninstall, UNINSTALL_STAGE)
	Bool result = True

	If (abSafetyLock)
		UninstSafetyLock = True
	EndIf

	If(iSetStage == 0)
		If (!UninstallQuest.Start())
			Exception.Throw(FW_LOG, "Uninstallation failed", ModName + "$FAILED_TO_UNINSTALL")
			result = False
		EndIf
	Else
		If(!UninstallQuest.SetStage(iSetStage))
			Exception.Throw(FW_LOG, "Uninstallation failed", ModName + "$FAILED_TO_UNINSTALL")
			result = False
		EndIf
	EndIf

	If (abSafetyLock)
		UninstSafetyLock = False
	EndIf

	UnsetFormValue(ModToUninstall, UNINSTALL_QUEST)
	UnsetIntValue(ModToUninstall, UNINSTALL_STAGE)
	UnsetStringValue(ModToUninstall, MOD_NAME)
	FormListRemove(None, UNINSTALL_MODS, ModToUninstall)
	FormListRemove(None, REGISTERED_MODS, ModToUninstall)

	Return result
EndFunction

String Function _GetModNameFromFormList(String asFormList, Int auiIndex, Actor akNPC = None)
	Quest Mod
	If (akNPC == None)	;ANTONO QUESTION	is this check really necessary?
		Mod = FormListGet(None, asFormList, auiIndex) as Quest
	Else
		Mod = FormListGet(akNPC, asFormList, auiIndex) as Quest
	EndIf
	
	If (!Mod)
		Return ""
	Else
		Return GetStringValue(Mod, MOD_NAME)
	EndIf
EndFunction

;/
DONE:
All tabs:
	- Switch from using UNINSTALL naming to INIT for functions and keys
Tab: Registry
	- Show a list of all registered mods
Tab: Info Manager
	- LogLevel to write to files (Info, Warning, Error) --> a) Three toggle buttons b) Menu(Everything, Only Warnings and Errors, Only Errors) (for each mod)
	- LogLevel to display MessageBoxes (Info, Warning, Error) --> a) Three toggle buttons b) Menu(Everything, Only Warnings and Errors, Only Errors) (for each mod)
	- Disable toggles when no mod selected
	- Move lines around to take better advantage of space
	- Enable/disable global file logging
	- Disable logging buttons if global glogging is disabled
	- Enable/disable framework logging
	- Mod settings could look like the Profile Menu form SexLab
	- Redirect log files to: Papyrus log, APPS - Framework user log, each mod with own user log
	- ShowMessage if file logging is enabled, that it will now be disabled for this game session
Tab: Initialization Manager
	- Move mods up and down the list to change initialize order
	- Menu point "Start Initialization" (Maybe with a ShowMessage where the user will be informed)
	- Disable above menu point if initialize Manager is initializing or if list is empty
	- Tooltips of every mod (will contain for some mods messages, in which order they need to be placed)
	- remove failed mods from the registry
	- Take advantage of tooltip functionality by heromaster
Tab: Uninstall Manager
	- Shows a list of all registered mods which have an uninstall quest	
	- ShowMessage(If mod will be uninstalled, it will uninstall completely)
	- Menu point "Uninstall all mods"
	- Disable above menu point if Uninstall Manager is uninstalling or if list is empty
	- remove failed mods from the registry
All tabs
	- disable everything if any mod is initializing or uninstalling
	- seperate init safety lockup from uninstall safety lockup and display messages accordingly
	- display instructions to close MCM menu
------------------------------------------------------------------------------------------------------------------------
TODO:
All tabs:
	- Max array size & MCM menu sice: 128
	- Fix Exception $translations
	- Rename MENU_OPTIONS and the corresponding string to a less confusing name
	- Optimize all increasing WHILE loops
	- Translate pages names
Tab: Uninstall Manager
	- Test manager
	- Decide if AddTextOption should work with the Text or the Value, i.e. whether "" should be the text or the value
/;