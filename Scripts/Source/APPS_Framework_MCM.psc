ScriptName APPS_Framework_MCM Extends SKI_ConfigBase
Import StorageUtil

Int FileLogLevel
String[] InitOrdering
String[] LogLevel
String[] InfoManagerModsListOptions
String[] LoggingMethod
String[] RS_PriorityOrdering
Int InfoManagerModsListSelection
Quest InfoManagerToken
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
String SUKEY_EXCEPTIONS_LOGFILE = "APPS.Framework.InfoManager.LogFile"
String SUKEY_EXCEPTIONS_LOGNAME = "APPS.Framework.InfoManager.LogName"
String SUKEY_DISPLAY_ERRORS = "APPS.Framework.InfoManager.DisplayErrors"
String SUKEY_DISPLAY_WARNINGS = "APPS.Framework.InfoManager.DisplayWarnings"
String SUKEY_DISPLAY_INFOS = "APPS.Framework.InfoManager.DisplayInfos"
String SUKEY_LOG_ERRORS = "APPS.Framework.InfoManager.LogErrors"
String SUKEY_LOG_WARNINGS = "APPS.Framework.InfoManager.LogWarnings"
String SUKEY_LOG_INFOS = "APPS.Framework.InfoManager.LogInfos"
String SUKEY_REGISTERED_MODS = "APPS.Framework.RegisteredMods"
String SUKEY_MENU_OPTIONS = "APPS.Framework.MCM.RegisteredMods"
String SUKEY_INIT_MODS = "APPS.Framework.InitMods"
String SUKEY_INIT_MODS_TOOLTIP = "APPS.Framework.InitMods.Tooltip"
String SUKEY_UNINSTALL_MODS = "APPS.Framework.UninstallMods"
String SUKEY_REGISTERED_RS = "APPS.Framework.Relationship.RegisteredMods"
Int InitControlFlags 
Int UninstallControlFlags 
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
	Pages[5] = "RS - Global Sync Mode changes"
	Pages[6] = "RS - Local Sync Mode changes"
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
EndEvent

Event OnPageReset(String asPage)
	IntListClear(None, SUKEY_MENU_OPTIONS)
	StringListClear(None, SUKEY_MENU_OPTIONS)

	If (asPage == Pages[0])	;registry
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("$REGISTERED_MODS")
		AddEmptyOption()
		
		Int RegisteredMods = StringListCount(None, SUKEY_REGISTERED_MODS)
		Int i

		While (i < RegisteredMods)
			AddTextOption(StringListGet(None, SUKEY_REGISTERED_MODS, i), "")
			i += 1
		EndWhile
	ElseIf (asPage == Pages[1])	;info manager
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("$GENERAL_SETTINGS")
		AddToggleOptionST("EnableLogging", "$ENABLE_LOGGING", Utility.GetINIBool("bEnableLogging:Papyrus"))
		AddEmptyOption()
		AddHeaderOption("$MOD_SPECIFIC_SETTINGS")
		AddMenuOptionST("InfoManagerModsList", "", "$SELECT")
		AddEmptyOption()
		AddMenuOptionST("LoggingMethod", "$LOGGING_METHOD", "", OPTION_FLAG_DISABLED)
		AddTextOptionST("LogName", "Log Name", "", OPTION_FLAG_DISABLED)
		
		;filling up the InfoManagerModsListOptions array with the names of the registered mods, to be shown as a menu later
		Int RegisteredMods = StringListCount(None, SUKEY_REGISTERED_MODS)
		InfoManagerModsListOptions = PapyrusUtil.StringArray(RegisteredMods)
		Int i

			While (i < RegisteredMods)
				InfoManagerModsListOptions[i] = StringListGet(None, SUKEY_REGISTERED_MODS, i)
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
		If (InitSafetyLock || UninstSafetyLock || StringListCount(None, SUKEY_INIT_MODS) == 0) 
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

		While (i < FormListCount(None, SUKEY_INIT_MODS))
			IntListAdd(None, SUKEY_MENU_OPTIONS, AddMenuOption(StringListGet(None, SUKEY_INIT_MODS, i), "#" + (i + 1) As String + ": ", InitControlFlags))
			StringListAdd(None, SUKEY_MENU_OPTIONS, StringListGet(None, SUKEY_INIT_MODS, i))
			i += 1
		EndWhile
	ElseIf (asPage == Pages[3])	;uninstall manager
		If (InitSafetyLock || UninstSafetyLock || StringListCount(None, SUKEY_UNINSTALL_MODS) == 0)
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

		Int UninstallMods = FormListCount(None, SUKEY_UNINSTALL_MODS)
		Int i = UninstallMods

		While (i < FormListCount(None, SUKEY_UNINSTALL_MODS))
			IntListAdd(None, SUKEY_MENU_OPTIONS, AddTextOption(StringListGet(None, SUKEY_UNINSTALL_MODS, i), "", UninstallControlFlags))
			StringListAdd(None, SUKEY_MENU_OPTIONS, StringListGet(None, SUKEY_UNINSTALL_MODS, i))
			i += 1
		EndWhile
	ElseIf (asPage == Pages[4])	;RS - Priority
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		AddHeaderOption("$RELATIONSHIP_PRIORITY")
		AddEmptyOption()
		
		Int i

		While (i < FormListCount(None, SUKEY_REGISTERED_RS))
			IntListAdd(None, SUKEY_MENU_OPTIONS, AddMenuOption(StringListGet(None, SUKEY_REGISTERED_RS, i), "#" + (i + 1) As String + ": "))
			StringListAdd(None, SUKEY_MENU_OPTIONS, StringListGet(None, SUKEY_REGISTERED_RS, i))
			i += 1
		EndWhile
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
		Utility.WaitMenuMode(0.5)
		
		InfoManagerToken = FormListGet(None, SUKEY_REGISTERED_MODS, aiSelectedOption) as Quest ;save the user's selection as a variable to be used for toggling the Info Manager's options

		;fetching the Int contents of SUKEY_EXCEPTIONS_LOGFILE array and converting them to strings
		String TokenLoggingMethod

		If(!Utility.GetINIBool("bEnableLogging:Papyrus"))
			OptionFlag = OPTION_FLAG_DISABLED
		EndIf

		If (GetIntValue(InfoManagerToken, SUKEY_EXCEPTIONS_LOGFILE) == USE_MOD_USER_LOG)
			TokenLoggingMethod = LoggingMethod[0]
		ElseIf (GetIntValue(InfoManagerToken, SUKEY_EXCEPTIONS_LOGFILE) == USE_FRAMEWORK_LOG)
			TokenLoggingMethod = LoggingMethod[1]
		ElseIf (GetIntValue(InfoManagerToken, SUKEY_EXCEPTIONS_LOGFILE) == USE_PAPYRUS_LOG)
			TokenLoggingMethod = LoggingMethod[2]
		EndIf

		SetMenuOptionValueST(InfoManagerModsListOptions[aiSelectedOption])
		SetTextOptionValueST(InfoManagerModsListOptions[aiSelectedOption], True, "ModSettings")
		SetMenuOptionValueST(TokenLoggingMethod, True, "LoggingMethod")
		SetTextOptionValueST(GetStringValue(InfoManagerToken, SUKEY_EXCEPTIONS_LOGNAME), True, "LogName")
		SetToggleOptionValueST(HasIntValue(InfoManagerToken, SUKEY_DISPLAY_INFOS), True, "DisplayInfos")
		SetToggleOptionValueST(HasIntValue(InfoManagerToken, SUKEY_LOG_INFOS), True, "LogInfos")
		SetToggleOptionValueST(HasIntValue(InfoManagerToken, SUKEY_DISPLAY_WARNINGS), True, "DisplayWarnings")
		SetToggleOptionValueST(HasIntValue(InfoManagerToken, SUKEY_LOG_WARNINGS), True, "LogWarnings")
		SetToggleOptionValueST(HasIntValue(InfoManagerToken, SUKEY_DISPLAY_ERRORS), True, "DisplayErrors")
		SetToggleOptionValueST(HasIntValue(InfoManagerToken, SUKEY_LOG_ERRORS), True, "LogErrors")
		SetOptionFlagsST(OptionFlag, True, "ModSettings")
		SetOptionFlagsST(OptionFlag, True, "LoggingMethod")
		SetOptionFlagsST(OptionFlag, True, "LogName")
		SetOptionFlagsST(OptionFlag, True, "DisplayInfos")
		SetOptionFlagsST(OptionFlag, True, "LogInfos")
		SetOptionFlagsST(OptionFlag, True, "DisplayWarnings")
		SetOptionFlagsST(OptionFlag, True, "LogWarnings")
		SetOptionFlagsST(OptionFlag, True, "DisplayErrors")
		SetOptionFlagsST(OptionFlag, False, "LogErrors")
		
		InfoManagerModsListSelection = aiSelectedOption	;store the user's selection as a variable to be used the next time the menu is displayed
	EndEvent

	Event OnHighlightST()
		SetInfoText("$EXPLAIN_INFO_MANAGER_MODS_LIST")
	EndEvent
EndState

State DisplayInfos
	Event OnSelectST()
		If(HasIntValue(InfoManagerToken, SUKEY_DISPLAY_INFOS))
			UnsetIntValue(InfoManagerToken, SUKEY_DISPLAY_INFOS)
		Else
			SetIntValue(InfoManagerToken, SUKEY_DISPLAY_INFOS, 1)
		EndIf

		SetToggleOptionValueST(HasIntValue(InfoManagerToken, SUKEY_DISPLAY_INFOS))
	EndEvent

	Event OnHighlightST()
		SetInfoText("$EXPLAIN_DISPLAY_INFOS")
	EndEvent
EndState

State DisplayWarnings
	Event OnSelectST()
		If(HasIntValue(InfoManagerToken, SUKEY_DISPLAY_WARNINGS))
			UnsetIntValue(InfoManagerToken, SUKEY_DISPLAY_WARNINGS)
		Else
			SetIntValue(InfoManagerToken, SUKEY_DISPLAY_WARNINGS, 1)
		EndIf

		SetToggleOptionValueST(HasIntValue(InfoManagerToken, SUKEY_DISPLAY_WARNINGS))
	EndEvent

	Event OnHighlightST()
		SetInfoText("$EXPLAIN_DISPLAY_WARNINGS")
	EndEvent
EndState

State DisplayErrors
	Event OnSelectST()
		If(HasIntValue(InfoManagerToken, SUKEY_DISPLAY_ERRORS))
			UnsetIntValue(InfoManagerToken, SUKEY_DISPLAY_ERRORS)
		Else
			SetIntValue(InfoManagerToken, SUKEY_DISPLAY_ERRORS, 1)
		EndIf

		SetToggleOptionValueST(HasIntValue(InfoManagerToken, SUKEY_DISPLAY_ERRORS))
	EndEvent

	Event OnHighlightST()
		SetInfoText("$EXPLAIN_DISPLAY_ERRORS")
	EndEvent
EndState

State LogInfos
	Event OnSelectST()
		If(HasIntValue(InfoManagerToken, SUKEY_LOG_INFOS))
			UnsetIntValue(InfoManagerToken, SUKEY_LOG_INFOS)
		Else
			SetIntValue(InfoManagerToken, SUKEY_LOG_INFOS, 1)
		EndIf

		SetToggleOptionValueST(HasIntValue(InfoManagerToken, SUKEY_LOG_INFOS))
	EndEvent

	Event OnHighlightST()
		SetInfoText("$EXPLAIN_LOG_INFOS")
	EndEvent
EndState

State LogWarnings
	Event OnSelectST()
		If(HasIntValue(InfoManagerToken, SUKEY_LOG_WARNINGS))
			UnsetIntValue(InfoManagerToken, SUKEY_LOG_WARNINGS)
		Else
			SetIntValue(InfoManagerToken, SUKEY_LOG_WARNINGS, 1)
		EndIf

		SetToggleOptionValueST(HasIntValue(InfoManagerToken, SUKEY_LOG_WARNINGS))
	EndEvent

	Event OnHighlightST()
		SetInfoText("$EXPLAIN_LOG_WARNINGS")
	EndEvent
EndState

State LogErrors
	Event OnSelectST()
		If(HasIntValue(InfoManagerToken, SUKEY_LOG_ERRORS))
			UnsetIntValue(InfoManagerToken, SUKEY_LOG_ERRORS)
		Else
			SetIntValue(InfoManagerToken, SUKEY_LOG_ERRORS, 1)
		EndIf

		SetToggleOptionValueST(HasIntValue(InfoManagerToken, SUKEY_LOG_ERRORS))
	EndEvent

	Event OnHighlightST()
		SetInfoText("$EXPLAIN_LOG_ERRORS")
	EndEvent
EndState

State LoggingMethod
	Event OnMenuOpenST()
		SetMenuDialogOptions(LoggingMethod)

		If (GetIntValue(InfoManagerToken, SUKEY_EXCEPTIONS_LOGFILE) == USE_MOD_USER_LOG)
			SetMenuDialogStartIndex(0)
		ElseIf (GetIntValue(InfoManagerToken, SUKEY_EXCEPTIONS_LOGFILE) == USE_FRAMEWORK_LOG)
			SetMenuDialogStartIndex(1)
		ElseIf (GetIntValue(InfoManagerToken, SUKEY_EXCEPTIONS_LOGFILE) == USE_PAPYRUS_LOG)
			SetMenuDialogStartIndex(2)
		Else
			SetMenuDialogStartIndex(0)
		EndIf
	EndEvent

	Event OnMenuAcceptST(int aiSelectedOption)
		Utility.WaitMenuMode(0.5)	;waiting time to fix strange mix up of variables (SkyUI bug?)
		SetMenuOptionValueST(LoggingMethod[aiSelectedOption])
		SetIntValue(InfoManagerToken, SUKEY_EXCEPTIONS_LOGFILE, aiSelectedOption)
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

			While (StringListCount(None, SUKEY_INIT_MODS) > 0)
				String ModToInit = StringListGet(None, SUKEY_INIT_MODS, 0)
				Exception.Notify(FW_LOG, ModToInit)
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

Event OnOptionHighlight(Int aiOption)	
	Int i
	Int MenuOptions = IntListCount(None, SUKEY_MENU_OPTIONS)

	While (i < MenuOptions)
		If (aiOption == IntListGet(None, SUKEY_MENU_OPTIONS, i))
			If (CurrentPage == Pages[2])
				Form InitQuest = FormListGet(None, SUKEY_INIT_MODS, i)
				If (HasStringValue(InitQuest, SUKEY_INIT_MODS_TOOLTIP))
					SetInfoText(GetStringValue(InitQuest, SUKEY_INIT_MODS_TOOLTIP))	
				EndIf
			
			ElseIf (CurrentPage == Pages[3])
				SetInfoText("$EXPLAIN_UNINSTALL")
			ElseIf (CurrentPage == Pages[4])
				SetInfoText("$EXPLAIN_RELATIONSHIP_PRIORITY")				
			EndIf
			
			i = MenuOptions
		Else
			i += 1
		EndIf
	EndWhile
EndEvent

Event OnOptionMenuOpen(Int aiOption)
	Int i
	Int MenuOptions = IntListCount(None, SUKEY_MENU_OPTIONS)

	While(i < MenuOptions)
		If(aiOption == IntListGet(None, SUKEY_MENU_OPTIONS, i))
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
	Int MenuOptions = IntListCount(None, SUKEY_MENU_OPTIONS)

	While (i < MenuOptions)
		If(aiOpenedMenu == IntListGet(None, SUKEY_MENU_OPTIONS, i))
			If (aiSelectedOption == MOVE_TOP || aiSelectedOption == MOVE_UP || aiSelectedOption == MOVE_DOWN || aiSelectedOption == MOVE_BOTTOM)
				If (CurrentPage == Pages[2])
					ChangeOrder(StringListGet(None, SUKEY_MENU_OPTIONS, i), SUKEY_INIT_MODS, aiSelectedOption)
				ElseIf (CurrentPage == Pages[4])
					ChangeOrder(StringListGet(None, SUKEY_MENU_OPTIONS, i), SUKEY_REGISTERED_RS, aiSelectedOption)
				EndIf
				
			ElseIf (aiSelectedOption == INITIALIZE_MOD)
				If (ShowMessage("$INITIALIZE_MOD_CONFIRMATION") == True)
					ShowMessage("$CLOSE_MCM", False, "$OK")
					String ModToInit = StringListGet(None, SUKEY_MENU_OPTIONS, i)
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
		Int MenuOptions = IntListCount(None, SUKEY_MENU_OPTIONS)

		While (i < MenuOptions)
			If (aiOption == IntListGet(None, SUKEY_MENU_OPTIONS, i))
				If (ShowMessage("$UNINSTALL_MOD_CONFIRMATION") == True)
					UninstallMod(StringListGet(None, SUKEY_MENU_OPTIONS, i))
				EndIf
			i = MenuOptions
			Else
				i += 1
			EndIf
		EndWhile
		
	EndIf
	
	ForcePageReset()
EndEvent

Function ChangeOrder(String asModName, String aiArray, Int aiPositionChange)
	
	If (aiArray != SUKEY_INIT_MODS && aiArray != SUKEY_REGISTERED_RS)
		Return
	EndIf
	
	Int ModIndex = StringListFind(None, aiArray, asModName)
	Form kQuest = FormListGet(None, aiArray, ModIndex)
	Int iSetStage
	
	If (aiArray == SUKEY_INIT_MODS)
		iSetStage = IntListGet(None, aiArray, ModIndex)
	EndIf

	If(aiPositionChange == MOVE_TOP)
		If(ModIndex == 0)
			Return
		EndIf

		FormListRemove(None, aiArray, kQuest)
		FormListInsert(None, aiArray, 0, kQuest)

		StringListRemove(None, aiArray, asModName)
		StringListInsert(None, aiArray, 0, asModName)
		
		If (aiArray == SUKEY_INIT_MODS)
			IntListRemove(None, aiArray, iSetStage)
			IntListInsert(None, aiArray, 0, iSetStage)
		EndIf
	ElseIf(aiPositionChange == MOVE_UP)
		If(ModIndex == 0)
			Return
		EndIf

		FormListRemove(None, aiArray, kQuest)
		FormListInsert(None, aiArray, (ModIndex - 1), kQuest)

		StringListRemove(None, aiArray, asModName)
		StringListInsert(None, aiArray, (ModIndex - 1), asModName)
		
		If (aiArray == SUKEY_INIT_MODS)
			IntListRemove(None, aiArray, iSetStage)
			IntListInsert(None, aiArray, (ModIndex - 1), iSetStage)
		EndIf
	ElseIf(aiPositionChange == MOVE_DOWN)
		If(ModIndex == (StringListCount(None, aiArray) - 1))
			Return
		EndIf

		If(ModIndex == (StringListCount(None, SUKEY_INIT_MODS) - 2)) ;this is equivalent to MOVE_BOTTOM
			FormListRemove(None, aiArray, kQuest)
			FormListAdd(None, aiArray, kQuest)

			StringListRemove(None, aiArray, asModName)
			StringListAdd(None, aiArray, asModName)
			
			If (aiArray == SUKEY_INIT_MODS)
				IntListRemove(None, aiArray, iSetStage)
				IntListAdd(None, aiArray, iSetStage)
			EndIf
		Else
			FormListRemove(None, aiArray, kQuest)
			FormListInsert(None, aiArray, (ModIndex + 1), kQuest)

			StringListRemove(None, aiArray, asModName)
			
			StringListInsert(None, aiArray, (ModIndex +1), asModName)
			
			If (aiArray == SUKEY_INIT_MODS)
				IntListRemove(None, aiArray, iSetStage)
				IntListInsert(None, aiArray, (ModIndex + 1), iSetStage)
			EndIf
		EndIf
	ElseIf(aiPositionChange == MOVE_BOTTOM)
		If(ModIndex == StringListCount(None, aiArray) - 1)
			Return
		EndIf

		FormListRemove(None, aiArray, kQuest)
		FormListAdd(None, aiArray, kQuest)

		StringListRemove(None, aiArray, asModName)
		StringListAdd(None, aiArray, asModName)
		
		If (aiArray == SUKEY_INIT_MODS)
			IntListRemove(None, aiArray, iSetStage)
			IntListAdd(None, aiArray, iSetStage)
		EndIf
	EndIf
EndFunction

Bool Function InitializeMod(String asModName, Bool abSafetyLock = True)
	Int ModIndex = StringListFind(None, SUKEY_INIT_MODS, asModName)
	Quest InitQuest = FormListGet(None, SUKEY_INIT_MODS, ModIndex) as Quest
	Int iSetStage = IntListGet(None, SUKEY_INIT_MODS, ModIndex)
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
		Exception.Notify(FW_LOG, asModName + "$INITIALIZED")
	Else
		Exception.Throw(FW_LOG, "Failed to initialize mod", asModName + "$FAILED_TO_INITIALIZE")

		StringListRemove(None, SUKEY_REGISTERED_MODS, asModName)
		FormListRemoveAt(None, SUKEY_REGISTERED_MODS, ModIndex)
	EndIf

	If (abSafetyLock)
		InitSafetyLock = False
	EndIf

	StringListRemove(None, SUKEY_INIT_MODS, asModName)
	FormListRemove(None, SUKEY_INIT_MODS, InitQuest)
	IntListRemove(None, SUKEY_INIT_MODS, iSetStage)

	Return result
EndFunction

Bool Function UninstallMod(String asModName, Bool abSafetyLock = True)
	Int ModIndex = StringListFind(None, SUKEY_UNINSTALL_MODS, asModName)
	Quest UninstallQuest = FormListGet(None, SUKEY_UNINSTALL_MODS, ModIndex) as Quest
	Int iSetStage = IntListGet(None, SUKEY_UNINSTALL_MODS, ModIndex)
	Bool result = True

	If (abSafetyLock)
		UninstSafetyLock = True
	EndIf

	If(iSetStage == 0)
		If (!UninstallQuest.Start())
			Exception.Throw(FW_LOG, "Uninstallation failed", asModName + "$FAILED_TO_UNINSTALL")
			result = False
		EndIf
	Else
		If(!UninstallQuest.SetStage(iSetStage))
			Exception.Throw(FW_LOG, "Uninstallation failed", asModName + "$FAILED_TO_UNINSTALL")
			result = False
		EndIf
	EndIf

	If (abSafetyLock)
		UninstSafetyLock = False
	EndIf

	StringListRemove(None, SUKEY_UNINSTALL_MODS, asModName)
	FormListRemove(None, SUKEY_UNINSTALL_MODS, UninstallQuest)
	IntListRemove(None, SUKEY_UNINSTALL_MODS, iSetStage)

	StringListRemove(None, SUKEY_REGISTERED_MODS, asModName)
	FormListRemoveAt(None, SUKEY_REGISTERED_MODS, ModIndex)

	Return result
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
	- Rename SUKEY_MENU_OPTIONS and the corresponding string to a less confusing name
/;