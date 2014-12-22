ScriptName APPS_Framework_MCM Extends SKI_ConfigBase
Import StorageUtil

Int FileLogLevel
String[] InitOrdering
String[] LogLevel
String[] InfoManagerModsListOptions
String[] SyncModeNPCListOptions
String[] GlobalRSMultiModsListOptions
String[] LocalRSMultiActorsListOptions
String[] LocalRSMultiModsListOptions
String[] LoggingMethod
String[] RS_PriorityOrdering
Int InfoManagerModsListSelection
Int SyncModeNPCListSelection
Int GlobalRSMultiModsListSelection
Int LocalRSMultiActorsListSelection
Int LocalRSMultiModsListSelection
Quest InfoManagerToken
Quest GlobalRSMultiMod
Quest LocalRSMultiMod
Actor LocalRSMultiActor
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
String RESET_MENUS_ON_CLOSE = "APPS.Framework.MCM.ResetMenusOnClose"
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
Int InitControlFlag
Int UninstallControlFlag
Int NPCSyncModeOptionFlag
Int GlobalRSMultiOptionFlag
Int LocalRSMultiActorOptionFlag
Int LocalRSMultiModOptionFlag
Float TimeToNextInit = 1.0
Bool InitSafetyLock = False
Bool UninstSafetyLock = False

Event OnConfigInit()
	Pages = new String[12]
	Pages[0] = "$REGISTRY"
	Pages[1] = "$INFO_MANAGER"
	Pages[2] = "$INITIALIZATION_MANAGER"
	Pages[3] = "$UNINSTALL_MANAGER"
	Pages[4] = "RS - Priority"
	Pages[5] = "RS - Global Sync Mode"
	Pages[6] = "RS - NPC Sync Mode"
	Pages[7] = "RS - Global Multipliers"
	Pages[8] = "RS - Local Multipliers"

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
			AddTextOption(_GetNameOfModFromModFormList(REGISTERED_MODS, i), "")
			i += 1
		EndWhile

		SetCursorPosition(1)	;go to top of right column
		AddToggleOptionST("ResetMenusOnClose", "$RESET_MENUS_ON_CLOSE", False)

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
				InfoManagerModsListOptions[i] = _GetNameOfModFromModFormList(REGISTERED_MODS, i)
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
			InitControlFlag = OPTION_FLAG_DISABLED
		Else
			InitControlFlag = OPTION_FLAG_NONE
		EndIf

		SetCursorFillMode(TOP_TO_BOTTOM)
		AddSliderOptionST("WaitingTimeBetweenInits", "$WAITING_TIME_BETWEEN_INITS", 1.0, "{1} seconds", InitControlFlag)

		If (InitSafetyLock)
			AddHeaderOption("$INIT_IN_PROGRESS")
		ElseIf (UninstSafetyLock)
			AddHeaderOption("$UNINST_IN_PROGRESS")
		Else
			AddTextOptionST("StartInitialization", "$START_INITIALIZATION_SEQUENCE", "$GO", InitControlFlag)
		EndIf

		AddEmptyOption()
		AddHeaderOption("$INITIALIZATION_ORDER")
		AddEmptyOption()

		Int i

		While (i < FormListCount(None, INIT_MODS))
			IntListAdd(None, MENU_OPTIONS, AddMenuOption("#" + (i + 1) As String + ": ", _GetNameOfModFromModFormList(INIT_MODS, i), InitControlFlag))
			;StringListAdd(None, MENU_OPTIONS, _GetNameOfModFromModFormList(INIT_MODS, i))
			FormListAdd(None, MENU_OPTIONS, FormListGet(None, INIT_MODS, i))
			i += 1
		EndWhile

	ElseIf (asPage == Pages[3])	;uninstall manager
		If (InitSafetyLock || UninstSafetyLock || FormListCount(None, UNINSTALL_MODS) == 0)
			UninstallControlFlag = OPTION_FLAG_DISABLED
		Else
			UninstallControlFlag = OPTION_FLAG_NONE
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
			IntListAdd(None, MENU_OPTIONS, AddTextOption(_GetNameOfModFromModFormList(UNINSTALL_MODS, i), "", UninstallControlFlag))
			;StringListAdd(None, MENU_OPTIONS, _GetNameOfModFromModFormList(UNINSTALL_MODS, i))
			FormListAdd(None, MENU_OPTIONS, FormListGet(None, UNINSTALL_MODS, i))
			i += 1
		EndWhile

	ElseIf (asPage == Pages[4])	;RS - Priority
		SetCursorFillMode(TOP_TO_BOTTOM)

		AddHeaderOption("$RELATIONSHIP_PRIORITY")
		AddEmptyOption()

		Int i

		While (i < FormListCount(None, REGISTERED_RS))
			IntListAdd(None, MENU_OPTIONS, AddMenuOption("#" + (i + 1) As String + ": ", _GetNameOfModFromModFormList(REGISTERED_RS, i)))
			;StringListAdd(None, MENU_OPTIONS, StringListGet(None, REGISTERED_RS, i))
			FormListAdd(None, MENU_OPTIONS, FormListGet(None, REGISTERED_RS, i))
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
				SyncMode = "$DISABLE"
			ElseIf (IntListGet(None, SYNC_MODE_CHANGELIST, i) == 1)
				SyncMode = "$VANILLA_TO_RS"
			ElseIf (IntListGet(None, SYNC_MODE_CHANGELIST, i) == 2)
				SyncMode = "$RS_TO_VANILLA"
			ElseIf (IntListGet(None, SYNC_MODE_CHANGELIST, i) == 3)
				SyncMode = "$BOTH_WAYS"
			EndIf

			Quest Token = FormListGet(None, SYNC_MODE_CHANGELIST, i) as Quest
			Int ModIndex = FormListFind(None, REGISTERED_RS, Token)
			String NameOfMod = StringListGet(None, REGISTERED_RS, ModIndex)

			AddTextOption(NameOfMod, SyncMode)

			i += 1
		EndWhile

	ElseIf (asPage == Pages[6])	;RS - NPC Sync Mode changes
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("$NPCs_WITH_SPECIAL_SYNCMODE")
		AddEmptyOption()

		If (!SyncModeNPC)
			NPCSyncModeOptionFlag = OPTION_FLAG_DISABLED
			AddMenuOptionST("SyncModeNPCList", "", "$SELECT_NPC")	;disable options if the user has not yet selected a SyncModeNPC
		Else
			NPCSyncModeOptionFlag = OPTION_FLAG_NONE
			AddMenuOptionST("SyncModeNPCList", "", SyncModeNPC.GetActorBase().GetName())
		EndIf

		;filling up the SyncModeNPCListOptions array with the names of the NPCs, to be shown as a menu later.
		Int iSyncModeNPCs = FormListCount(None, SYNC_MODE_NPC_CHANGELIST)
		SyncModeNPCListOptions = PapyrusUtil.StringArray(iSyncModeNPCs)
		Int i

			While (i < iSyncModeNPCs)
				SyncModeNPCListOptions[i] = (FormListGet(None, SYNC_MODE_NPC_CHANGELIST, i) As Actor).GetActorBase().GetName()
				i += 1
			EndWhile

		i = 0

		SetCursorPosition(1)	;go to top of right column
		AddHeaderOption("$MODS_AFFECTING_ACTOR")
		AddEmptyOption()

		If (SyncModeNPC)
			Int ModsAffectingSyncModeNPC = FormListCount(SyncModeNPC, SYNC_MODE_CHANGELIST)
			String SyncMode
			i = 0

			While (i < ModsAffectingSyncModeNPC)
				;convert SyncMode from Int to String
				If (IntListGet(SyncModeNPC, SYNC_MODE_CHANGELIST, i) == 0)
					SyncMode = "$DISABLE"
				ElseIf (IntListGet(SyncModeNPC, SYNC_MODE_CHANGELIST, i) == 1)
					SyncMode = "$VANILLA_TO_RS"
				ElseIf (IntListGet(SyncModeNPC, SYNC_MODE_CHANGELIST, i) == 2)
					SyncMode = "$RS_TO_VANILLA"
				ElseIf (IntListGet(SyncModeNPC, SYNC_MODE_CHANGELIST, i) == 3)
					SyncMode = "$BOTH_WAYS"
				EndIf

				Quest Token = FormListGet(SyncModeNPC, SYNC_MODE_CHANGELIST, i) as Quest
				Int ModIndex = FormListFind(None, REGISTERED_RS, Token)
				String NameOfMod = StringListGet(None, REGISTERED_RS, ModIndex)

				AddTextOption(NameOfMod, SyncMode, NPCSyncModeOptionFlag)
				i += 1
			EndWhile
		Else
			AddTextOption("$PLEASE_SELECT_NPC_FIRST", "", OPTION_FLAG_DISABLED)
		EndIf

	ElseIf (asPage == Pages[7])	;RS - Global Multipliers
		SetCursorFillMode(TOP_TO_BOTTOM)

		;filling up the GlobalRSMultiModsListOptions array with the names of the mods, to be shown as a menu later.
		Int iGlobalRSMultiMods = FormListCount(None, RS_MULTI_CHANGELIST)
		GlobalRSMultiModsListOptions = PapyrusUtil.StringArray(iGlobalRSMultiMods)
		Int i

			While (i < iGlobalRSMultiMods)
				GlobalRSMultiModsListOptions[i] = _GetNameOfModFromModFormList(RS_MULTI_CHANGELIST, i)
				i += 1
			EndWhile

		AddHeaderOption("$RELATIONSHIP")
		AddTextOption("", "$MODS_AFFECTING_GLOBAL_RS_MULTIPLIERS")
		AddEmptyOption()

		Int GlobalRSMultiModIndex

		If (!GlobalRSMultiMod)
			GlobalRSMultiOptionFlag = OPTION_FLAG_DISABLED	;;disable options if the user has not yet selected a GlobalRSMultiMod and fetch ModIndex if GlobalRSMultiMod has been selected
			AddMenuOptionST("GlobalRSMultiModsList", "", "$SELECT_MOD")
		Else
			GlobalRSMultiOptionFlag = OPTION_FLAG_NONE
			GlobalRSMultiModIndex = FormListFind(None, RS_MULTI_CHANGELIST, GlobalRSMultiMod)
			AddMenuOptionST("GlobalRSMultiModsList", "", _GetNameOfModFromModForm(GlobalRSMultiMod))
		EndIf

		SetCursorPosition(1)	;go to top of right column
		AddHeaderOption("$GLOBAL_RS_MULTIPLIERS")
		AddEmptyOption()
		AddTextOption("$S0_S1", FloatListGet(None, RS_MULTI_S0_S1_CHANGELIST, GlobalRSMultiModIndex) as String, GlobalRSMultiOptionFlag)
		AddTextOption("$S1_S2", FloatListGet(None, RS_MULTI_S1_S2_CHANGELIST, GlobalRSMultiModIndex) as String, GlobalRSMultiOptionFlag)
		AddTextOption("$S2_S3", FloatListGet(None, RS_MULTI_S2_S3_CHANGELIST, GlobalRSMultiModIndex) as String, GlobalRSMultiOptionFlag)
		AddTextOption("$S3_S4", FloatListGet(None, RS_MULTI_S3_S4_CHANGELIST, GlobalRSMultiModIndex) as String, GlobalRSMultiOptionFlag)
		AddTextOption("$S4_S5", FloatListGet(None, RS_MULTI_S4_S5_CHANGELIST, GlobalRSMultiModIndex) as String, GlobalRSMultiOptionFlag)
		AddTextOption("$S5_S4", FloatListGet(None, RS_MULTI_S5_S4_CHANGELIST, GlobalRSMultiModIndex) as String, GlobalRSMultiOptionFlag)
		AddTextOption("$S4_S3", FloatListGet(None, RS_MULTI_S4_S3_CHANGELIST, GlobalRSMultiModIndex) as String, GlobalRSMultiOptionFlag)
		AddTextOption("$S3_S2", FloatListGet(None, RS_MULTI_S3_S2_CHANGELIST, GlobalRSMultiModIndex) as String, GlobalRSMultiOptionFlag)
		AddTextOption("$S2_S1", FloatListGet(None, RS_MULTI_S2_S1_CHANGELIST, GlobalRSMultiModIndex) as String, GlobalRSMultiOptionFlag)
		AddTextOption("$S1_S0", FloatListGet(None, RS_MULTI_S1_S0_CHANGELIST, GlobalRSMultiModIndex) as String, GlobalRSMultiOptionFlag)
		AddTextOption("$S0_S-1", FloatListGet(None, RS_MULTI_S0_SM1_CHANGELIST, GlobalRSMultiModIndex) as String, GlobalRSMultiOptionFlag)
		AddTextOption("$S-1_S-2", FloatListGet(None, RS_MULTI_SM1_SM2_CHANGELIST, GlobalRSMultiModIndex) as String, GlobalRSMultiOptionFlag)
		AddTextOption("$S-2_S-3", FloatListGet(None, RS_MULTI_SM2_SM3_CHANGELIST, GlobalRSMultiModIndex) as String, GlobalRSMultiOptionFlag)
		AddTextOption("$S-3_S-4", FloatListGet(None, RS_MULTI_SM3_SM4_CHANGELIST, GlobalRSMultiModIndex) as String, GlobalRSMultiOptionFlag)
		AddTextOption("$S-4_S-5", FloatListGet(None, RS_MULTI_SM4_SM5_CHANGELIST, GlobalRSMultiModIndex) as String, GlobalRSMultiOptionFlag)
		AddTextOption("$S-5_S-4", FloatListGet(None, RS_MULTI_SM5_SM4_CHANGELIST, GlobalRSMultiModIndex) as String, GlobalRSMultiOptionFlag)
		AddTextOption("$S-4_S-3", FloatListGet(None, RS_MULTI_SM4_SM3_CHANGELIST, GlobalRSMultiModIndex) as String, GlobalRSMultiOptionFlag)
		AddTextOption("$S-3_S-2", FloatListGet(None, RS_MULTI_SM3_SM2_CHANGELIST, GlobalRSMultiModIndex) as String, GlobalRSMultiOptionFlag)
		AddTextOption("$S-2_S-1", FloatListGet(None, RS_MULTI_SM2_SM1_CHANGELIST, GlobalRSMultiModIndex) as String, GlobalRSMultiOptionFlag)
		AddTextOption("$S-1_S0", FloatListGet(None, RS_MULTI_SM1_S0_CHANGELIST, GlobalRSMultiModIndex) as String, GlobalRSMultiOptionFlag)

	ElseIf (asPage == Pages[8])	;RS - Local Multipliers
		SetCursorFillMode(TOP_TO_BOTTOM)

		;filling up the LocalRSMultiActorsListOptions array with the names of the actors, to be shown as a menu later.
		Int iLocalRSMultiActors = FormListCount(None, RS_MULTI_NPC_CHANGELIST)
		LocalRSMultiActorsListOptions = PapyrusUtil.StringArray(iLocalRSMultiActors)
		Int i

		While (i < iLocalRSMultiActors)
			LocalRSMultiActorsListOptions[i] = (FormListGet(None, RS_MULTI_NPC_CHANGELIST, i) As Actor).GetActorBase().GetName()
			i += 1
		EndWhile

		AddHeaderOption("$RELATIONSHIP")
		AddTextOption("", "$NPCs_WITH_SPECIAL_RS_MULTIPLIERS")
		AddEmptyOption()

		If (!LocalRSMultiActor)
			LocalRSMultiActorOptionFlag = OPTION_FLAG_DISABLED
			AddMenuOptionST("LocalRSMultiActorsList", "", "$SELECT_NPC")
		Else
			;filling up the LocalRSMultiModsListOptions array with the names of the mods, to be shown as a menu later.
			Int iLocalRSMultiMods = FormListCount(LocalRSMultiActor, RS_MULTI_CHANGELIST)
			LocalRSMultiModsListOptions = PapyrusUtil.StringArray(iLocalRSMultiMods)
			i = 0

				While (i < iLocalRSMultiMods)
					LocalRSMultiModsListOptions[i] = _GetNameOfModFromModFormList(RS_MULTI_CHANGELIST, i)
					i += 1
				EndWhile

			LocalRSMultiActorOptionFlag = OPTION_FLAG_NONE
			AddMenuOptionST("LocalRSMultiActorsList", "", LocalRSMultiActor.GetActorBase().GetName())
		EndIf

		AddEmptyOption()

		Int LocalRSMultiModIndex

		If (!LocalRSMultiMod)
			LocalRSMultiModOptionFlag = OPTION_FLAG_DISABLED
			AddMenuOptionST("LocalRSMultiModsList", "", "$SELECT_MOD")
		Else
			LocalRSMultiModOptionFlag = OPTION_FLAG_NONE
			LocalRSMultiModIndex = FormListFind(LocalRSMultiActor, RS_MULTI_CHANGELIST, LocalRSMultiMod)
			AddMenuOptionST("LocalRSMultiModsList", "", _GetNameOfModFromModForm(LocalRSMultiMod))
		EndIf

		SetCursorPosition(1)	;go to top of right column
		AddHeaderOption("$NPC_RS_MULTIPLIERS")
		AddEmptyOption()

		If (LocalRSMultiActor)
			AddTextOption("$S0_S1", FloatListGet(LocalRSMultiActor, RS_MULTI_S0_S1_CHANGELIST, LocalRSMultiModIndex) as String, LocalRSMultiModOptionFlag)
			AddTextOption("$S1_S2", FloatListGet(LocalRSMultiActor, RS_MULTI_S1_S2_CHANGELIST, LocalRSMultiModIndex) as String, LocalRSMultiModOptionFlag)
			AddTextOption("$S2_S3", FloatListGet(LocalRSMultiActor, RS_MULTI_S2_S3_CHANGELIST, LocalRSMultiModIndex) as String, LocalRSMultiModOptionFlag)
			AddTextOption("$S3_S4", FloatListGet(LocalRSMultiActor, RS_MULTI_S3_S4_CHANGELIST, LocalRSMultiModIndex) as String, LocalRSMultiModOptionFlag)
			AddTextOption("$S4_S5", FloatListGet(LocalRSMultiActor, RS_MULTI_S4_S5_CHANGELIST, LocalRSMultiModIndex) as String, LocalRSMultiModOptionFlag)
			AddTextOption("$S5_S4", FloatListGet(LocalRSMultiActor, RS_MULTI_S5_S4_CHANGELIST, LocalRSMultiModIndex) as String, LocalRSMultiModOptionFlag)
			AddTextOption("$S4_S3", FloatListGet(LocalRSMultiActor, RS_MULTI_S4_S3_CHANGELIST, LocalRSMultiModIndex) as String, LocalRSMultiModOptionFlag)
			AddTextOption("$S3_S2", FloatListGet(LocalRSMultiActor, RS_MULTI_S3_S2_CHANGELIST, LocalRSMultiModIndex) as String, LocalRSMultiModOptionFlag)
			AddTextOption("$S2_S1", FloatListGet(LocalRSMultiActor, RS_MULTI_S2_S1_CHANGELIST, LocalRSMultiModIndex) as String, LocalRSMultiModOptionFlag)
			AddTextOption("$S1_S0", FloatListGet(LocalRSMultiActor, RS_MULTI_S1_S0_CHANGELIST, LocalRSMultiModIndex) as String, LocalRSMultiModOptionFlag)
			AddTextOption("$S0_S-1", FloatListGet(LocalRSMultiActor, RS_MULTI_S0_SM1_CHANGELIST, LocalRSMultiModIndex) as String, LocalRSMultiModOptionFlag)
			AddTextOption("$S-1_S-2", FloatListGet(LocalRSMultiActor, RS_MULTI_SM1_SM2_CHANGELIST, LocalRSMultiModIndex) as String, LocalRSMultiModOptionFlag)
			AddTextOption("$S-2_S-3", FloatListGet(LocalRSMultiActor, RS_MULTI_SM2_SM3_CHANGELIST, LocalRSMultiModIndex) as String, LocalRSMultiModOptionFlag)
			AddTextOption("$S-3_S-4", FloatListGet(LocalRSMultiActor, RS_MULTI_SM3_SM4_CHANGELIST, LocalRSMultiModIndex) as String, LocalRSMultiModOptionFlag)
			AddTextOption("$S-4_S-5", FloatListGet(LocalRSMultiActor, RS_MULTI_SM4_SM5_CHANGELIST, LocalRSMultiModIndex) as String, LocalRSMultiModOptionFlag)
			AddTextOption("$S-5_S-4", FloatListGet(LocalRSMultiActor, RS_MULTI_SM5_SM4_CHANGELIST, LocalRSMultiModIndex) as String, LocalRSMultiModOptionFlag)
			AddTextOption("$S-4_S-3", FloatListGet(LocalRSMultiActor, RS_MULTI_SM4_SM3_CHANGELIST, LocalRSMultiModIndex) as String, LocalRSMultiModOptionFlag)
			AddTextOption("$S-3_S-2", FloatListGet(LocalRSMultiActor, RS_MULTI_SM3_SM2_CHANGELIST, LocalRSMultiModIndex) as String, LocalRSMultiModOptionFlag)
			AddTextOption("$S-2_S-1", FloatListGet(LocalRSMultiActor, RS_MULTI_SM2_SM1_CHANGELIST, LocalRSMultiModIndex) as String, LocalRSMultiModOptionFlag)
			AddTextOption("$S-1_S0", FloatListGet(LocalRSMultiActor, RS_MULTI_SM1_S0_CHANGELIST, LocalRSMultiModIndex) as String, LocalRSMultiModOptionFlag)
		Else
			AddTextOption("$PLEASE_SELECT_NPC_FIRST", "", OPTION_FLAG_DISABLED)
		EndIf
	EndIf
EndEvent

State ResetMenusOnClose
	Event OnSelectST()
		If (GetIntValue(None, RESET_MENUS_ON_CLOSE) == 0)
			SetIntValue(None, RESET_MENUS_ON_CLOSE, 1)
		Else
			(SetIntValue(None, RESET_MENUS_ON_CLOSE, 0))
		EndIf

		SetToggleOptionValueST(GetIntValue(None, RESET_MENUS_ON_CLOSE))
	EndEvent

	Event OnHighlightST()
		SetInfoText("$EXPLAIN_RESET_MENUS_ON_CLOSE")
	EndEvent
EndState

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
				String NameOfMod = _GetNameOfModFromModForm(ModToInit)
				Exception.Notify(FW_LOG, NameOfMod)
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

		;set the SyncModeNPC, remove the disabled flag and let the OnPageReset() handle the rest
		SyncModeNPC = FormListGet(None, SYNC_MODE_NPC_CHANGELIST, aiSelectedOption) As Actor
		NPCSyncModeOptionFlag = OPTION_FLAG_NONE

		ForcePageReset()
	EndEvent

	Event OnHighlightST()
		SetInfoText("$EXPLAIN_SYNCMODE_NPC_LIST")
	EndEvent
EndState

State GlobalRSMultiModsList
	Event OnMenuOpenST()
		SetMenuDialogOptions(GlobalRSMultiModsListOptions)
		SetMenuDialogStartIndex(GlobalRSMultiModsListSelection)
	EndEvent

	Event OnMenuAcceptST(Int aiSelectedOption)
		GlobalRSMultiModsListSelection = aiSelectedOption ;store the user's selection as a variable to be used the next time the menu is displayed

		;set the GlobalRSMultiMod, remove the disabled flag and let the OnPageReset() handle the rest
		GlobalRSMultiMod = FormListGet(None, RS_MULTI_CHANGELIST, aiSelectedOption) as Quest
		GlobalRSMultiOptionFlag = OPTION_FLAG_NONE

		ForcePageReset()
	EndEvent

	Event OnHighlightST()
		SetInfoText("$EXPLAIN_GLOBAL_RS_MULTI_MODS_LIST")
	EndEvent
EndState

State LocalRSMultiActorsList
	Event OnMenuOpenST()
		SetMenuDialogOptions(LocalRSMultiActorsListOptions)
		SetMenuDialogStartIndex(LocalRSMultiActorsListSelection)
	EndEvent

	Event OnMenuAcceptST(Int aiSelectedOption)
		;set the LocalRSMultiActor, remove the disabled flag, clear the LocalRSMultiMod and let the OnPageReset() handle the rest
		LocalRSMultiActor = FormListGet(None, RS_MULTI_NPC_CHANGELIST, aiSelectedOption) as Actor
		LocalRSMultiActorOptionFlag = OPTION_FLAG_NONE
		LocalRSMultiMod = None

		ForcePageReset()
	EndEvent

	Event OnHighlightST()
		SetInfoText("$EXPLAIN_LOCAL_RS_MULTI_ACTORS_LIST")
	EndEvent
EndState

State LocalRSMultiModsList
	Event OnMenuOpenST()
		SetMenuDialogOptions(LocalRSMultiModsListOptions)
		SetMenuDialogStartIndex(LocalRSMultiModsListSelection)
	EndEvent

	Event OnMenuAcceptST(Int aiSelectedOption)
		;set the LocalRSMultiMod, remove the disabled flag and let the OnPageReset() handle the rest
		LocalRSMultiMod = FormListGet(LocalRSMultiActor, RS_MULTI_CHANGELIST, aiSelectedOption) as Quest
		LocalRSMultiModOptionFlag = OPTION_FLAG_NONE

		ForcePageReset()
	EndEvent

	Event OnHighlightST()
		SetInfoText("$EXPLAIN_LOCAL_RS_MULTI_MODS_LIST")
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

Event OnConfigOpen()
	If (GetIntValue(None, RESET_MENUS_ON_CLOSE))
		InfoManagerToken = None
		GlobalRSMultiMod = None
		LocalRSMultiMod = None
		LocalRSMultiActor = None
		SyncModeNPC = None
	EndIf
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
	String NameOfMod = _GetNameOfModFromModForm(akModToInit)
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
		Exception.Notify(FW_LOG, NameOfMod + "$INITIALIZED")
	Else
		Exception.Throw(FW_LOG, "Failed to initialize mod", NameOfMod + "$FAILED_TO_INITIALIZE")
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
	String NameOfMod = _GetNameOfModFromModForm(ModToUninstall)
	Quest UninstallQuest = GetFormValue(ModToUninstall, UNINSTALL_QUEST) as Quest
	Int iSetStage = GetIntValue(ModToUninstall, UNINSTALL_STAGE)
	Bool result = True

	If (abSafetyLock)
		UninstSafetyLock = True
	EndIf

	If(iSetStage == 0)
		If (!UninstallQuest.Start())
			Exception.Throw(FW_LOG, "Uninstallation failed", NameOfMod + "$FAILED_TO_UNINSTALL")
			result = False
		EndIf
	Else
		If(!UninstallQuest.SetStage(iSetStage))
			Exception.Throw(FW_LOG, "Uninstallation failed", NameOfMod + "$FAILED_TO_UNINSTALL")
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

String Function _GetNameOfModFromModFormList(String asFormList, Int auiIndex, Actor akNPC = None)
	Quest Mod = FormListGet(akNPC, asFormList, auiIndex) as Quest

	If (!Mod)
		Return ""
	Else
		Return GetStringValue(Mod, MOD_NAME)
	EndIf
EndFunction

String Function _GetNameOfModFromModForm(Quest akMod)
	If (!akMod)
		Return ""
	Else
		Return GetStringValue(akMod, MOD_NAME)
	EndIf
EndFunction

Quest Function _GetModFormFromNameOfMod(String asNameOfMod, String asFormList, Actor akNPC = None)	;contains a WHILE loop, don't use if other good alternative exists
	Int i
	Int ModsInList = FormListCount(akNPC, asFormList)

	While (i < ModsInList)
		Quest Mod = FormListGet(akNPC, asFormList, i) as Quest

		If (Mod)
			String NameOfMod = GetStringValue(Mod, MOD_NAME)

			If (NameOfMod == asNameOfMod)
				Return Mod
			EndIf
		EndIf
		i += 1
	EndWhile

	Return None
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
	- Optimize all increasing WHILE loops
	- Translate pages names
	- Clear stored menu selections (e.g. SyncModeNPC) OnConfigOpen
	- Experiment with OPTION_FLAG_HIDDEN
Tab: Uninstall Manager
	- Test manager
	- Decide if AddTextOption should work with the Text or the Value, i.e. whether "" should be the text or the value
Tab: All Relationship tabs
	- Brainstorm whether to keep StringList
/;