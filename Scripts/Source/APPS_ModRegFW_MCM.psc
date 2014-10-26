ScriptName APPS_ModRegFW_MCM Extends SKI_ConfigBase
Import StorageUtil
Int FileLogLevel
String[] Ordering
String[] LogLevel
String[] LoggingModMenuOptions
String Property SUKEY_REGISTERED_MODS = "APPS.RegisteredMods" AutoReadOnly Hidden
String Property SUKEY_MENU_OPTIONS = "APPS.MCM.RegisteredMods" AutoReadOnly Hidden
String Property SUKEY_INSTALL_MODS = "APPS.InstallMods" AutoReadOnly Hidden
String Property SUKEY_INSTALL_MODS_TOOLTIP = "APPS.InstallMods.Tooltip" AutoReadOnly Hidden
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
Quest Property APPS_Framework_Init Auto



Event OnConfigInit()
	Pages = new String[4]
	Pages[0] = "$REGISTRY"
	Pages[1] = "$LOGGING"
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
	ElseIf (asPage == Pages[1])	;logging
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("$GENERAL_SETTINGS")
		AddToggleOptionST("EnableLogging", "$ENABLE_LOGGING", Utility.GetINIBool("bEnableLogging:Papyrus"))
		AddEmptyOption()
		AddHeaderOption("$MOD_SPECIFIC_SETTINGS")
		AddMenuOptionST("LoggingModMenu", "PLACEHOLDER", "PLACEHOLDER")
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
		If (InitSafetyLock || UninstSafetyLock || StringListCount(None, SUKEY_INSTALL_MODS) == 0) 
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
		
		Int InstalledMods = FormListCount(None, SUKEY_INSTALL_MODS)
		Int i = InstalledMods
		
		While (i > 0)
			IntListAdd(None, SUKEY_MENU_OPTIONS, AddMenuOption(StringListGet(None, SUKEY_INSTALL_MODS, i - 1), "#" + (InstalledMods + 1 - i) As String + ": ", InitControlFlags))
			StringListAdd(None, SUKEY_MENU_OPTIONS, StringListGet(None, SUKEY_INSTALL_MODS, i - 1))
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

State LoggingModMenu
	Event OnMenuOpenST()
		Int RegisteredMods = StringListCount(None, SUKEY_REGISTERED_MODS)
		LoggingModMenuOptions = PapyrusUtil.StringArray(RegisteredMods - 1)
		Int i
		
			While (i < RegisteredMods)
				LoggingModMenuOptions[i] = StringListGet(None, SUKEY_REGISTERED_MODS, i)
				i += 1
			EndWhile
			
		SetMenuDialogOptions(LoggingModMenuOptions)
		;SetMenuDialogStartIndex
		;SetMenuDialogDefaultIndex
	EndEvent
	
	Event OnMenuAcceptST(int aiSelectedOption)
		;LoggingModMenuOptions = PapyrusUtil.StringArray(RegisteredMods - 1)
		SetMenuOptionValueST(LoggingModMenuOptions[aiSelectedOption])
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
		
		SetSliderOptionValueST(TimeToNextInit, "{1} seconds")
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
			;TODO show a "close menu" message
			InitSafetyLock = true
			SetTextOptionValueST("$INITIALIZING")
			ForcePageReset()	;this ensures install order is displayed again with OPTION_FLAG_DISABLED			
			Utility.Wait(0.1)
			
			While (StringListCount(None, SUKEY_INSTALL_MODS) > 0)
				String ModToInit = StringListGet(None, SUKEY_INSTALL_MODS, 0)
				Debug.Notification(ModToInit)
				InitializeMod(ModToInit, abSafetyLock = false) ;SafetyLock is handled by line InitSafetyLock = true
				Utility.Wait(TimeToNextInit)
			EndWhile
			
			Debug.MessageBox("$INITIALIZATION_SEQUENCE_COMPLETE")
			
			InitSafetyLock = false
			SetTextOptionValueST("$GO")
			ForcePageReset()
		EndIf
	EndEvent
EndState
;/	one ring (button) to uninstall them all
State UninstallAll
	Event OnHighlightST()
		SetInfoText("$EXPLAIN_UNINSTALL_ALL")
	EndEvent
	
	Event OnSelectST()
		If (ShowMessage("$UNINSTALL_ALL_CONFIRMATION") == true)
			SafetyLock = true
			SetTextOptionValueST("$UNINSTALLING")
			ForcePageReset()	;this ensures uninstall list is displayed again with OPTION_FLAG_DISABLED
			
			While (StringListCount(None, SUKEY_UNINSTALL_MODS) > 0)
				String ModName = StringListGet(None, SUKEY_UNINSTALL_MODS, 0)
				UninstallMod(ModName)
			EndWhile
			
			ShowMessage("$UNINSTALL_SEQUENCE_COMPLETE")
			
			SafetyLock = false
			SetTextOptionValueST("$GO")
			ForcePageReset()
		EndIf
	EndEvent
EndState			
/;
Event OnOptionHighlight(Int aiOption)
		Int i
		
		While (i < IntListCount(None, SUKEY_MENU_OPTIONS))
			If (aiOption == IntListGet(None, SUKEY_MENU_OPTIONS, i))
				If (CurrentPage == Pages[2])
					SetInfoText(StringListGet(None, SUKEY_INSTALL_MODS_TOOLTIP, i))
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
				i = IntListCount(None, SUKEY_MENU_OPTIONS)
			ElseIf (aiSelectedOption == INITIALIZE_MOD)
				If (ShowMessage("$INITIALIZE_MOD_CONFIRMATION") == true)
					InitializeMod(StringListGet(None, SUKEY_MENU_OPTIONS, i))
					i = IntListCount(None, SUKEY_MENU_OPTIONS)
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
	Int ModIndex = StringListFind(None, SUKEY_INSTALL_MODS, asModName)
	Form InitQuest = FormListGet(None, SUKEY_INSTALL_MODS, ModIndex)
	Int iSetStage = IntListGet(None, SUKEY_INSTALL_MODS, ModIndex)

	;ShowMessage("Index: " + ModIndex + "\nQuest: " + (InitQuest As Quest).GetName(), False)

	If(aiPositionChange == MOVE_TOP)
		If(ModIndex == (StringListCount(None, SUKEY_INSTALL_MODS) - 1))
			Return
		EndIf

		FormListRemove(None, SUKEY_INSTALL_MODS, InitQuest)
		FormListAdd(None, SUKEY_INSTALL_MODS, InitQuest)
		
		StringListRemove(None, SUKEY_INSTALL_MODS, asModName)
		StringListAdd(None, SUKEY_INSTALL_MODS, asModName)
		
		IntListRemove(None, SUKEY_INSTALL_MODS, iSetStage)
		IntListAdd(None, SUKEY_INSTALL_MODS, iSetStage)
	ElseIf(aiPositionChange == MOVE_UP)
		If(ModIndex == (StringListCount(None, SUKEY_INSTALL_MODS) - 1))
			Return
		EndIf
		
		If(ModIndex == (StringListCount(None, SUKEY_INSTALL_MODS) - 2)) ;this is equivalent to MOVE_TOP, errors otherwise
		
			FormListRemove(None, SUKEY_INSTALL_MODS, InitQuest)
			FormListAdd(None, SUKEY_INSTALL_MODS, InitQuest)
			
			StringListRemove(None, SUKEY_INSTALL_MODS, asModName)
			StringListAdd(None, SUKEY_INSTALL_MODS, asModName)

			IntListRemove(None, SUKEY_INSTALL_MODS, iSetStage)
			IntListAdd(None, SUKEY_INSTALL_MODS, iSetStage)
		Else
			FormListRemove(None, SUKEY_INSTALL_MODS, InitQuest)
			FormListInsert(None, SUKEY_INSTALL_MODS, (ModIndex + 1), InitQuest)
			
			StringListRemove(None, SUKEY_INSTALL_MODS, asModName)
			StringListInsert(None, SUKEY_INSTALL_MODS, (ModIndex + 1), asModName)
			
			IntListRemove(None, SUKEY_INSTALL_MODS, iSetStage)
			IntListAdd(None, SUKEY_INSTALL_MODS, (ModIndex +1), iSetStage)
		EndIf
	ElseIf(aiPositionChange == MOVE_DOWN)
		If(ModIndex == 0)
			Return
		EndIf
		
		FormListRemove(None, SUKEY_INSTALL_MODS, InitQuest)
		FormListInsert(None, SUKEY_INSTALL_MODS, (ModIndex - 1), InitQuest)
		
		StringListRemove(None, SUKEY_INSTALL_MODS, asModName)
		StringListInsert(None, SUKEY_INSTALL_MODS, (ModIndex - 1), asModName)
		
		IntListRemove(None, SUKEY_INSTALL_MODS, iSetStage)
		IntListAdd(None, SUKEY_INSTALL_MODS, (ModIndex - 1), iSetStage)
	ElseIf(aiPositionChange == MOVE_BOTTOM)
		If(ModIndex == 0)
			Return
		EndIf
		
		FormListRemove(None, SUKEY_INSTALL_MODS, InitQuest)
		FormListInsert(None, SUKEY_INSTALL_MODS, 0, InitQuest)
		
		StringListRemove(None, SUKEY_INSTALL_MODS, asModName)
		StringListInsert(None, SUKEY_INSTALL_MODS, 0, asModName)
		
		IntListRemove(None, SUKEY_INSTALL_MODS, iSetStage)
		IntListAdd(None, SUKEY_INSTALL_MODS, 0, iSetStage)
	EndIf
EndFunction

Function InitializeMod(String asModName, Bool abSafetyLock = true)
	Int ModIndex = StringListFind(None, SUKEY_INSTALL_MODS, asModName)
	Quest InitQuest = FormListGet(None, SUKEY_INSTALL_MODS, ModIndex) as Quest
	Int iSetStage = IntListGet(None, SUKEY_INSTALL_MODS, ModIndex)
	;/
	If (abSafetyLock)
		InitSafetyLock = true
	EndIf
	/;
	If (InitQuest.SetStage(iSetStage) == false)
		Debug.MessageBox(asModName + "$MOD_FAILED_TO_INITIALIZE")
		
		StringListRemove(None, SUKEY_REGISTERED_MODS, asModName)
		FormListRemoveAt(None, SUKEY_REGISTERED_MODS, ModIndex)
	Else
		Debug.MessageBox("Mod Initialized")
	EndIf
	;/
	If (abSafetyLock)
		InitSafetyLock = false
	EndIf
	/;
	StringListRemove(None, SUKEY_INSTALL_MODS, asModName)
	FormListRemove(None, SUKEY_INSTALL_MODS, InitQuest)
	IntListRemove(None, SUKEY_INSTALL_MODS, iSetStage)
EndFunction

Function UninstallMod(String asModName, Bool abSafetyLock = true)
	Int ModIndex = StringListFind(None, SUKEY_UNINSTALL_MODS, asModName)
	Quest UninstallQuest = FormListGet(None, SUKEY_UNINSTALL_MODS, ModIndex) as Quest
	Int iSetStage = IntListGet(None, SUKEY_UNINSTALL_MODS, ModIndex)
	
	If (abSafetyLock)
		UninstSafetyLock = true
	EndIf
	
	If (UninstallQuest.SetStage(iSetStage) == false)
		ShowMessage(asModName + "$MOD_FAILED_TO_UNINSTALL", false, "OK")
		Debug.MessageBox(asModName + "$MOD_FAILED_TO_UNINSTALL")
	EndIf
	
	If (abSafetyLock)
		UninstSafetyLock = false
	EndIf
	
	StringListRemove(None, SUKEY_UNINSTALL_MODS, asModName)
	FormListRemove(None, SUKEY_UNINSTALL_MODS, UninstallQuest)
	IntListRemove(None, SUKEY_UNINSTALL_MODS, iSetStage)
	
	StringListRemove(None, SUKEY_REGISTERED_MODS, asModName)
	FormListRemoveAt(None, SUKEY_REGISTERED_MODS, ModIndex)
EndFunction

;/
DONE:
Tab: Registry
	- Show a list of all registered mods
Tab: Install Manager
	- Move mods up and down the list to change install order
	- Menu point "Start Initialization" (Maybe with a ShowMessage where the user will be informed)
	- Disable above menu point if Initialize Manager is installing or if list is empty
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
	- Initialization should be started through external quest
	- Remove mod from registry if failed to init
Tab: Uninstall Manager
	- Uninstall should be started through external quest
Tab: Exception Manager
	- Enable/disable global file logging
	- ShowMessage if file logging is enabled, that it will now be disabled for this game session
	- Enable/disable framework logging
	- LogLevel to write to files (Info, Warning, Error) --> a) Three toggle buttons b) Menu(Everything, Only Warnings and Errors, Only Errors) (for each mod)
	- LogLevel to display MessageBoxes (Info, Warning, Error) --> a) Three toggle buttons b) Menu(Everything, Only Warnings and Errors, Only Errors) (for each mod)
	- Redirect log files to: Papyrus log, APPS - Framework user log, each mod with own user log
	- Mod settings could look like the Profile Menu form SexLab
/;