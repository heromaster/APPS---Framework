ScriptName APPS_ModRegFW_MCM Extends SKI_ConfigBase
Import StorageUtil
Int FileLogLevel
String[] Ordering
String[] LogLevel
String[] InfoManagerModsListOptions
Int InfoManagerModsListSelection
Quest InfoManagerToken
String Property SUKEY_EXCEPTIONS_LOGFILE = "APPS.Exceptions.LogFile" AutoReadOnly Hidden
String Property SUKEY_EXCEPTIONS_LOGNAME = "APPS.Exceptions.LogName" AutoReadOnly Hidden
String Property SUKEY_DISPLAY_ERRORS = "APPS.Exceptions.DisplayErrors" AutoReadOnly Hidden
String Property SUKEY_DISPLAY_WARNINGS = "APPS.Exceptions.DisplayWarnings" AutoReadOnly Hidden
String Property SUKEY_DISPLAY_INFOS = "APPS.Exceptions.DisplayInfos" AutoReadOnly Hidden
String Property SUKEY_LOG_ERRORS = "APPS.Exceptions.LogErrors" AutoReadOnly Hidden
String Property SUKEY_LOG_WARNINGS = "APPS.Exceptions.LogWarnings" AutoReadOnly Hidden
String Property SUKEY_LOG_INFOS = "APPS.Exceptions.LogInfos" AutoReadOnly Hidden
String Property SUKEY_REGISTERED_MODS = "APPS.RegisteredMods" AutoReadOnly Hidden
String Property SUKEY_MENU_OPTIONS = "APPS.MCM.RegisteredMods" AutoReadOnly Hidden
String Property SUKEY_INIT_MODS = "APPS.InitMods" AutoReadOnly Hidden
String Property SUKEY_INIT_MODS_TOOLTIP = "APPS.InitMods.Tooltip" AutoReadOnly Hidden
String Property SUKEY_UNINSTALL_MODS = "APPS.UninstallMods" AutoReadOnly Hidden
Int Property MOVE_TOP = 0 AutoReadOnly Hidden
Int Property MOVE_UP = 1 AutoReadOnly Hidden
Int Property MOVE_DOWN = 2 AutoReadOnly Hidden
Int Property MOVE_BOTTOM = 3 AutoReadOnly Hidden
Int Property INITIALIZE_MOD = 5 AutoReadOnly Hidden
Int InitControlFlags 
Int UninstallControlFlags 
Float Property TimeToNextInit = 1.0 Auto Hidden
Bool InitSafetyLock = False 
Bool UninstSafetyLock = False 



Event OnConfigInit()
	Pages = new String[4]
	Pages[0] = "$REGISTRY"
	Pages[1] = "$INFO_MANAGER"
	Pages[2] = "$INITIALIZATION_MANAGER"
	Pages[3] = "$UNINSTALL_MANAGER"
	
	Ordering = New String[7]
	Ordering[0] = "$MOVE_TOP"
	Ordering[1] = "$MOVE_UP"
	Ordering[2] = "$CHANGE_NOTHING"
	Ordering[3] = "$MOVE_DOWN"
	Ordering[4] = "$MOVE_BOTTOM"
	Ordering[5] = "--------------"
	Ordering[6] = "$INITIALIZE_MOD"
	
	LogLevel = New String[4]
	LogLevel[0] = "$EVERYTHING"
	LogLevel[1] = "$WARNINGS_AND_ERRORS"
	LogLevel[2] = "$ONLY_ERRORS"
	LogLevel[3] = "$NOTHING"
EndEvent

Event OnPageReset(String asPage)
	IntListClear(None, SUKEY_MENU_OPTIONS)
	StringListClear(None, SUKEY_MENU_OPTIONS)

	If (asPage == Pages[0])	;registry
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("$REGISTERED_MODS")
		AddEmptyOption()
		
		Int RegisteredMods = StringListCount(None, SUKEY_REGISTERED_MODS)
		Int i = RegisteredMods
		
		While (i > 0)
			AddTextOption(StringListGet(None, SUKEY_REGISTERED_MODS, i - 1), "")
			i -= 1
		EndWhile		
	ElseIf (asPage == Pages[1])	;info manager
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("$GENERAL_SETTINGS")
		AddToggleOptionST("EnableLogging", "$ENABLE_LOGGING", Utility.GetINIBool("bEnableLogging:Papyrus"))
		AddEmptyOption()
		AddHeaderOption("$MOD_SPECIFIC_SETTINGS")
		AddMenuOptionST("InfoManagerModsList", "$FOR", "$SELECT")
		
		SetCursorPosition(1)	;go to top of right column
		AddHeaderOption("$INFORMATIONS")
		AddToggleOptionST("DisplayInfos", "$DISPLAY_ON_SCREEN", HasIntValue(InfoManagerToken, SUKEY_DISPLAY_INFOS))
		AddToggleOptionST("InfosLog", "$LOG_TO_FILE", HasIntValue(InfoManagerToken, SUKEY_LOG_INFOS))
		AddEmptyOption()		
		AddHeaderOption("$WARNINGS")
		AddEmptyOption()		
		AddHeaderOption("$ERRORS")
		
		
		;/
		AddHeaderOption("$LOG_OVERVIEW")
		AddToggleOptionST("EnableLogs", "$ENABLE_LOGS", Utility.GetINIBool("bEnableLogging:Papyrus"))
		AddMenuOptionST("LogLevelFile", "$LOG_LEVEL", LogLevel[FileLogLevel])
		AddHeaderOption("$DISPLAY_MESSAGES")
		AddToggleOptionST("DisplayInfoMessage", "$DISPLAY_INFO_MSG", Core.DisplayInfo)
		AddToggleOptionST("DisplayWarningMessage", "$DISPLAY_WARNING_MSG", Core.DisplayWarning)
		AddToggleOptionST("DisplayErrorMessage", "$DISPLAY_ERROR_MSG", Core.DisplayError)
		AddHeaderOption("$ERROR_REDIRECT")
		AddMenuOptionST("LogRedirectMenu", "$LOG_REDIRECT_MENU", "Nothing")
		/;
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
		
		Int InitMods = FormListCount(None, SUKEY_INIT_MODS)
		Int i = InitMods
		
		While (i > 0)
			IntListAdd(None, SUKEY_MENU_OPTIONS, AddMenuOption(StringListGet(None, SUKEY_INIT_MODS, i - 1), "#" + (InitMods + 1 - i) As String + ": ", InitControlFlags))
			StringListAdd(None, SUKEY_MENU_OPTIONS, StringListGet(None, SUKEY_INIT_MODS, i - 1))
			i -= 1
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
		
		;AddTextOptionST("UninstallAll", "$UNINSTALL_ALL", "$GO", UninstallControlFlags)	;one ring (button) to uninstall them all
		;AddEmptyOption()
		AddHeaderOption("$MODS_WITH_UNINSTALL_FEATURE")
		AddEmptyOption()
		
		Int UninstallMods = FormListCount(None, SUKEY_UNINSTALL_MODS)
		Int i = UninstallMods
		
		While (i > 0)
			IntListAdd(None, SUKEY_MENU_OPTIONS, AddTextOption(StringListGet(None, SUKEY_UNINSTALL_MODS, i - 1), "", UninstallControlFlags))
			StringListAdd(None, SUKEY_MENU_OPTIONS, StringListGet(None, SUKEY_UNINSTALL_MODS, i - 1))
			i -= 1
		EndWhile		
	EndIf
EndEvent

State EnableLogging
	Event OnSelectST()
		Utility.SetINIBool("bEnableLogging:Papyrus", !Utility.GetINIBool("bEnableLogging:Papyrus"))
		SetToggleOptionValueST(Utility.GetINIBool("bEnableLogging:Papyrus"))
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$EXPLAIN_ENABLE_LOGGING")
	EndEvent
EndState

State InfoManagerModsList
	Event OnMenuOpenST()
		Int RegisteredMods = StringListCount(None, SUKEY_REGISTERED_MODS)
		InfoManagerModsListOptions = PapyrusUtil.StringArray(RegisteredMods)
		Int i
		
			While (i < RegisteredMods)
				InfoManagerModsListOptions[i] = StringListGet(None, SUKEY_REGISTERED_MODS, i)
				i += 1
			EndWhile
			
		SetMenuDialogOptions(InfoManagerModsListOptions)
		SetMenuDialogStartIndex(InfoManagerModsListSelection)
		;SetMenuDialogDefaultIndex
	EndEvent
	
	Event OnMenuAcceptST(int aiSelectedOption)
		SetMenuOptionValueST(InfoManagerModsListOptions[aiSelectedOption])
		
		InfoManagerToken = FormListGet(None, SUKEY_REGISTERED_MODS, aiSelectedOption) as Quest ;save the user's selection as a variable to be used for toggling the Info Manager's options
		InfoManagerModsListSelection = aiSelectedOption	;store the user's selection as a variable to be used the next time the menu is displayed
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$EXPLAIN_INFO_MANAGER_MODS_LIST")
	EndEvent
EndState

;/
State DisplayInfoMessage
	Event OnSelectST()
		Core.DisplayInfo = !Core.DisplayInfo
		SetToggleOptionValueST(Core.DisplayInfo)
	EndEvent
EndState

State DisplayWarningMessage
	Event OnSelectST()
		Core.DisplayInfo = !Core.DisplayWarning
		SetToggleOptionValueST(Core.DisplayWarning)
	EndEvent
EndState

State DisplayErrorMessage
	Event OnSelectST()
		Core.DisplayInfo = !Core.DisplayError
		SetToggleOptionValueST(Core.DisplayError)
	EndEvent
EndState
/;
State WaitingTimeBetweenInits
	Event OnSliderOpenST()
		SetSliderDialogStartValue(TimeToNextInit)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 5.0)
		SetSliderDialogInterval(0.1)
	EndEvent
	
	Event OnSliderAcceptST(float a_value)
		If (a_value < 0.5)	;waiting times < 0.5 seconds are prone to errors (Heromaster)
			TimeToNextInit = 0.0
		Else
			TimeToNextInit = a_value
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
		If (ShowMessage("$START_INITIALIZATION_CONFIRMATION") == true)
			ShowMessage("$CLOSE_MCM", false, "$OK")
			InitSafetyLock = true
			SetTextOptionValueST("$INITIALIZING")
			ForcePageReset()	;this ensures install order is displayed again with OPTION_FLAG_DISABLED			
			Utility.Wait(0.1)	;forces the user to close the menu
			
			While (StringListCount(None, SUKEY_INIT_MODS) > 0)
				String ModToInit = StringListGet(None, SUKEY_INIT_MODS, 0)
				Debug.Notification(ModToInit)
				InitializeMod(ModToInit, abSafetyLock = false, abVerbose = true) ;SafetyLock is handled by line InitSafetyLock = true, abVerbose will show notifications as each mod is initialized
				Utility.Wait(TimeToNextInit)
			EndWhile
			
			Debug.MessageBox("$INITIALIZATION_SEQUENCE_COMPLETE")
			
			InitSafetyLock = false
			SetTextOptionValueST("$GO")
			ForcePageReset()
		EndIf
	EndEvent
EndState

Event OnOptionHighlight(Int aiOption)
		Int i
		
		While (i < IntListCount(None, SUKEY_MENU_OPTIONS))
			If (aiOption == IntListGet(None, SUKEY_MENU_OPTIONS, i))
				If (CurrentPage == Pages[2])
					SetInfoText(StringListGet(None, SUKEY_INIT_MODS_TOOLTIP, i))
					i = IntListCount(None, SUKEY_MENU_OPTIONS)
				ElseIf (CurrentPage == Pages[3])
					SetInfoText("$EXPLAIN_UNINSTALL")
					i = IntListCount(None, SUKEY_MENU_OPTIONS)
				EndIf
			Else
				i += 1
			EndIf
		EndWhile
EndEvent
			
Event OnOptionMenuOpen(Int aiOption)
	Int i

	While(i < IntListCount(None, SUKEY_MENU_OPTIONS))
		If(aiOption == IntListGet(None, SUKEY_MENU_OPTIONS, i))
			SetMenuDialogDefaultIndex(2)
			SetMenuDialogStartIndex(2)
			SetMenuDialogOptions(Ordering)
			i = IntListCount(None, SUKEY_MENU_OPTIONS)
		Else
			i += 1
		EndIf
	EndWhile
EndEvent

Event OnOptionMenuAccept(Int aiOpenedMenu, Int aiSelectedOption)
	Int i
	
	While (i < IntListCount(None, SUKEY_MENU_OPTIONS))
		If(aiOpenedMenu == IntListGet(None, SUKEY_MENU_OPTIONS, i))
			If (aiSelectedOption == MOVE_TOP || aiSelectedOption == MOVE_UP || aiSelectedOption == MOVE_DOWN || aiSelectedOption == MOVE_BOTTOM)
				ChangeInitOrder(StringListGet(None, SUKEY_MENU_OPTIONS, i), aiSelectedOption)
				i = IntListCount(None, SUKEY_MENU_OPTIONS)	;stops the loop
			ElseIf (aiSelectedOption == INITIALIZE_MOD)
				If (ShowMessage("$INITIALIZE_MOD_CONFIRMATION") == true)
					ShowMessage("$CLOSE_MCM", false, "$OK")
					String ModToInit = StringListGet(None, SUKEY_MENU_OPTIONS, i)
					Utility.Wait(0.1)	;forces the user to close the menu
					
					If (InitializeMod(ModToInit))
						Debug.MessageBox(ModToInit + "$INITIALIZED")
					EndIf
					
					i = IntListCount(None, SUKEY_MENU_OPTIONS)	;stops the loop
				EndIf
			EndIf
		Else
			i += 1
		EndIf
	EndWhile

	ForcePageReset()
EndEvent

Event OnOptionSelect(Int aiOption)
	Int i
	
	While (i < IntListCount(None, SUKEY_MENU_OPTIONS))
		If (aiOption == IntListGet(None, SUKEY_MENU_OPTIONS, i))
			If (ShowMessage("$UNINSTALL_MOD_CONFIRMATION") == true)
				UninstallMod(StringListGet(None, SUKEY_MENU_OPTIONS, i))
				i = IntListCount(None, SUKEY_MENU_OPTIONS)
			EndIf
		Else	
			i += 1
		EndIf
	EndWhile
EndEvent

Function ChangeInitOrder(String asModName, Int aiPositionChange)
	Int ModIndex = StringListFind(None, SUKEY_INIT_MODS, asModName)
	Form InitQuest = FormListGet(None, SUKEY_INIT_MODS, ModIndex)
	Int iSetStage = IntListGet(None, SUKEY_INIT_MODS, ModIndex)

	If(aiPositionChange == MOVE_TOP)
		If(ModIndex == (StringListCount(None, SUKEY_INIT_MODS) - 1))
			Return
		EndIf

		FormListRemove(None, SUKEY_INIT_MODS, InitQuest)
		FormListAdd(None, SUKEY_INIT_MODS, InitQuest)
		
		StringListRemove(None, SUKEY_INIT_MODS, asModName)
		StringListAdd(None, SUKEY_INIT_MODS, asModName)
		
		IntListRemove(None, SUKEY_INIT_MODS, iSetStage)
		IntListAdd(None, SUKEY_INIT_MODS, iSetStage)
	ElseIf(aiPositionChange == MOVE_UP)
		If(ModIndex == (StringListCount(None, SUKEY_INIT_MODS) - 1))
			Return
		EndIf
		
		If(ModIndex == (StringListCount(None, SUKEY_INIT_MODS) - 2)) ;this is equivalent to MOVE_TOP, errors otherwise
		
			FormListRemove(None, SUKEY_INIT_MODS, InitQuest)
			FormListAdd(None, SUKEY_INIT_MODS, InitQuest)
			
			StringListRemove(None, SUKEY_INIT_MODS, asModName)
			StringListAdd(None, SUKEY_INIT_MODS, asModName)

			IntListRemove(None, SUKEY_INIT_MODS, iSetStage)
			IntListAdd(None, SUKEY_INIT_MODS, iSetStage)
		Else
			FormListRemove(None, SUKEY_INIT_MODS, InitQuest)
			FormListInsert(None, SUKEY_INIT_MODS, (ModIndex + 1), InitQuest)
			
			StringListRemove(None, SUKEY_INIT_MODS, asModName)
			StringListInsert(None, SUKEY_INIT_MODS, (ModIndex + 1), asModName)
			
			IntListRemove(None, SUKEY_INIT_MODS, iSetStage)
			IntListAdd(None, SUKEY_INIT_MODS, (ModIndex +1), iSetStage)
		EndIf
	ElseIf(aiPositionChange == MOVE_DOWN)
		If(ModIndex == 0)
			Return
		EndIf
		
		FormListRemove(None, SUKEY_INIT_MODS, InitQuest)
		FormListInsert(None, SUKEY_INIT_MODS, (ModIndex - 1), InitQuest)
		
		StringListRemove(None, SUKEY_INIT_MODS, asModName)
		StringListInsert(None, SUKEY_INIT_MODS, (ModIndex - 1), asModName)
		
		IntListRemove(None, SUKEY_INIT_MODS, iSetStage)
		IntListAdd(None, SUKEY_INIT_MODS, (ModIndex - 1), iSetStage)
	ElseIf(aiPositionChange == MOVE_BOTTOM)
		If(ModIndex == 0)
			Return
		EndIf
		
		FormListRemove(None, SUKEY_INIT_MODS, InitQuest)
		FormListInsert(None, SUKEY_INIT_MODS, 0, InitQuest)
		
		StringListRemove(None, SUKEY_INIT_MODS, asModName)
		StringListInsert(None, SUKEY_INIT_MODS, 0, asModName)
		
		IntListRemove(None, SUKEY_INIT_MODS, iSetStage)
		IntListAdd(None, SUKEY_INIT_MODS, 0, iSetStage)
	EndIf
EndFunction

Bool Function InitializeMod(String asModName, Bool abSafetyLock = true, Bool abVerbose = false)
	Int ModIndex = StringListFind(None, SUKEY_INIT_MODS, asModName)
	Quest InitQuest = FormListGet(None, SUKEY_INIT_MODS, ModIndex) as Quest
	Int iSetStage = IntListGet(None, SUKEY_INIT_MODS, ModIndex)
	Bool result = true
	
	If (abSafetyLock)
		InitSafetyLock = true
	EndIf
	
	If (iSetStage != -1)
		If (InitQuest.SetStage(iSetStage) == false)
			Debug.MessageBox(asModName + "$FAILED_TO_INITIALIZE")
			result == false
			
			StringListRemove(None, SUKEY_REGISTERED_MODS, asModName)
			FormListRemoveAt(None, SUKEY_REGISTERED_MODS, ModIndex)
		ElseIf (abVerbose)
			Debug.Notification(asModName + "$INITIALIZED")
		EndIf
	Else
		If (InitQuest.Start() == false)
			Debug.MessageBox(asModName + "$FAILED_TO_INITIALIZE")
			result == false
			
			StringListRemove(None, SUKEY_REGISTERED_MODS, asModName)
			FormListRemoveAt(None, SUKEY_REGISTERED_MODS, ModIndex)
		ElseIf (abVerbose)
			Debug.Notification(asModName + "$INITIALIZED")
		EndIf
	EndIf
	
	If (abSafetyLock)
		InitSafetyLock = false
	EndIf
	
	StringListRemove(None, SUKEY_INIT_MODS, asModName)
	FormListRemove(None, SUKEY_INIT_MODS, InitQuest)
	IntListRemove(None, SUKEY_INIT_MODS, iSetStage)
	
	Return result
EndFunction

Bool Function UninstallMod(String asModName, Bool abSafetyLock = true)
	Int ModIndex = StringListFind(None, SUKEY_UNINSTALL_MODS, asModName)
	Quest UninstallQuest = FormListGet(None, SUKEY_UNINSTALL_MODS, ModIndex) as Quest
	Int iSetStage = IntListGet(None, SUKEY_UNINSTALL_MODS, ModIndex)
	Bool result = true
	
	If (abSafetyLock)
		UninstSafetyLock = true
	EndIf
	
	If (iSetStage != -1)
		If (UninstallQuest.SetStage(iSetStage) == false)
			ShowMessage(asModName + "$FAILED_TO_UNINSTALL", false, "OK")
			Debug.MessageBox(asModName + "$FAILED_TO_UNINSTALL")
			result = false
		EndIf
	Else
		If (UninstallQuest.Start() == false)
			ShowMessage(asModName + "$FAILED_TO_UNINSTALL", false, "OK")
			Debug.MessageBox(asModName + "$FAILED_TO_UNINSTALL")
			result = false
		EndIf
	EndIf
	
	If (abSafetyLock)
		UninstSafetyLock = false
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
Tab: Initialization Manager
	- Move mods up and down the list to change initialize order
	- Menu point "Start Initialization" (Maybe with a ShowMessage where the user will be informed)
	- Disable above menu point if initialize Manager is initializing or if list is empty
	- Tooltips of every mod (will contain for some mods messages, in which order they need to be placed)
	- remove failed mods from the registry
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
	
	- Update ModIndex-related functions to use new Core helper functions
	- Max array size & MCM menu sice: 128
Tab: Init Manager
	- Take advantage of tooltip functionality by heromaster
Tab: Uninstall Manager

Tab: Exception Manager
	- Enable/disable global file logging
	- Disable logging buttons if global glogging is disabled
	- ShowMessage if file logging is enabled, that it will now be disabled for this game session
	- Enable/disable framework logging
	- LogLevel to write to files (Info, Warning, Error) --> a) Three toggle buttons b) Menu(Everything, Only Warnings and Errors, Only Errors) (for each mod)
	- LogLevel to display MessageBoxes (Info, Warning, Error) --> a) Three toggle buttons b) Menu(Everything, Only Warnings and Errors, Only Errors) (for each mod)
	- Redirect log files to: Papyrus log, APPS - Framework user log, each mod with own user log
	- Mod settings could look like the Profile Menu form SexLab
/;