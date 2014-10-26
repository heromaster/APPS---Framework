ScriptName APPS_ModRegFW_MCM Extends SKI_ConfigBase
Import StorageUtil

Int FileLogLevel
String[] Ordering
String[] LogLevel
String Property SUKEY_REGISTERED_MODS = "APPS.RegisteredMods" AutoReadOnly Hidden
String Property SUKEY_MENU_OPTIONS = "APPS.MCM.RegisteredMods" AutoReadOnly Hidden
Int Property MOVE_TOP = 0 AutoReadOnly Hidden
Int Property MOVE_UP = 1 AutoReadOnly Hidden
Int Property MOVE_DOWN = 2 AutoReadOnly Hidden
Int Property MOVE_BOTTOM = 3 AutoReadOnly Hidden

Event OnConfigInit()
	Pages = new String[2]
	Pages[0] = "$LOGGING"
	Pages[1] = "$INSTALL_MANAGER"
	Ordering = New String[5]
	Ordering[0] = "$MOVE_TOP"
	Ordering[1] = "$MOVE_UP"
	Ordering[2] = "$MOVE_DOWN"
	Ordering[3] = "$MOVE_BOTTOM"
	Ordering[4] = "$CHANGE_NOTHING"
	LogLevel = New String[4]
	LogLevel[0] = "$EVERYTHING"
	LogLevel[1] = "$WARNINGS_AND_ERRORS"
	LogLevel[2] = "$ONLY_ERRORS"
	LogLevel[3] = "$NOTHING"
EndEvent

Event OnPageReset(String asPage)
	IntListClear(None, SUKEY_MENU_OPTIONS)
	StringListClear(None, SUKEY_MENU_OPTIONS)

	If(asPage == Pages[0])
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("$LOG_OVERVIEW")
		AddToggleOptionST("EnableLogs", "$ENABLE_LOGS", Utility.GetINIBool("bEnableLogging:Papyrus"))
		AddMenuOptionST("LogLevelFile", "$LOG_LEVEL", LogLevel[FileLogLevel])
		AddHeaderOption("$DISPLAY_MESSAGES")
		AddHeaderOption("$ERROR_REDIRECT")
		AddMenuOptionST("LogRedirectMenu", "$LOG_REDIRECT_MENU", "Nothing")
	ElseIf(asPage == Pages[1])
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("Registered mods")
		AddEmptyOption()
		
		Int RegisteredMods = FormListCount(None, SUKEY_REGISTERED_MODS)
		Int i = RegisteredMods
		
		;SUKEY_REGISTERED_MODS: [3, 2, 1]
		While(i > 0)
			IntListAdd(None, SUKEY_MENU_OPTIONS, AddMenuOption(StringListGet(None, SUKEY_REGISTERED_MODS, i - 1), "#" + (RegisteredMods + 1 - i) As String + ": ")) ;IntSUKEY_MENU_OPTIONS: [1, 2, 3]
			StringListAdd(None, SUKEY_MENU_OPTIONS, StringListGet(None, SUKEY_REGISTERED_MODS, i - 1)) ;StringSUKEY_MENU_OPTIONS: [1, 2, 3]
			i -= 1
		EndWhile
	EndIf
EndEvent

State EnableLogs
	Event OnSelectST()
		Utility.SetINIBool("bEnableLogging:Papyrus", !Utility.GetINIBool("bEnableLogging:Papyrus"))
		SetToggleOptionValueST(Utility.GetINIBool("bEnableLogging:Papyrus"))
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$EXPLAIN_ENABLE_LOGS")
	EndEvent
EndState

Event OnOptionMenuOpen(Int aiOption)
	Int i

	While(i < IntListCount(None, SUKEY_MENU_OPTIONS))
		If(IntListGet(None, SUKEY_MENU_OPTIONS, i) == aiOption)
			SetMenuDialogDefaultIndex(4)
			SetMenuDialogStartIndex(0)
			SetMenuDialogOptions(Ordering)
			i = IntListCount(None, SUKEY_MENU_OPTIONS)
		Else
			i += 1
		EndIf
	EndWhile
EndEvent

Event OnOptionMenuAccept(Int aiOpenedMenu, Int aiSelectedOption)
	Int i
	
	While(i < IntListCount(None, SUKEY_MENU_OPTIONS))
		If(aiOpenedMenu == IntListGet(None, SUKEY_MENU_OPTIONS, i))
			ChangeModPriority(StringListGet(None, SUKEY_MENU_OPTIONS, i), aiSelectedOption)
			i = IntListCount(None, SUKEY_MENU_OPTIONS)
		Else
			i += 1
		EndIf
	EndWhile

	ForcePageReset()
EndEvent

Function ChangeModPriority(String asModName, Int aiPositionChange)
	Int ModIndex = StringListFind(None, SUKEY_REGISTERED_MODS, asModName)
	Form QuestToken = FormListGet(None, SUKEY_REGISTERED_MODS, ModIndex)

	ShowMessage("Index: " + ModIndex + "\nQuest: " + (QuestToken As Quest).GetName(), False)

	If(aiPositionChange == MOVE_TOP)
		If(ModIndex == (StringListCount(None, SUKEY_REGISTERED_MODS) - 1))
			Return
		EndIf

		FormListRemove(None, SUKEY_REGISTERED_MODS, QuestToken)
		FormListAdd(None, SUKEY_REGISTERED_MODS, QuestToken)
		
		StringListRemove(None, SUKEY_REGISTERED_MODS, asModName)
		StringListAdd(None, SUKEY_REGISTERED_MODS, asModName)
	ElseIf(aiPositionChange == MOVE_UP)
		If(ModIndex == (StringListCount(None, SUKEY_REGISTERED_MODS) - 1))
			Return
		EndIf
		
		If(ModIndex == (StringListCount(None, SUKEY_REGISTERED_MODS) - 2)) ;this is equivalent to MOVE_TOP
		
			FormListRemove(None, SUKEY_REGISTERED_MODS, QuestToken)
			FormListAdd(None, SUKEY_REGISTERED_MODS, QuestToken)
			
			StringListRemove(None, SUKEY_REGISTERED_MODS, asModName)
			StringListAdd(None, SUKEY_REGISTERED_MODS, asModName)			
		Else
			FormListRemove(None, SUKEY_REGISTERED_MODS, QuestToken)
			FormListInsert(None, SUKEY_REGISTERED_MODS, (ModIndex + 1), QuestToken)
			
			StringListRemove(None, SUKEY_REGISTERED_MODS, asModName)
			StringListInsert(None, SUKEY_REGISTERED_MODS, (ModIndex + 1), asModName)
		EndIf
	ElseIf(aiPositionChange == MOVE_DOWN)
		If(ModIndex == 0)
			Return
		EndIf
		
		FormListRemove(None, SUKEY_REGISTERED_MODS, QuestToken)
		FormListInsert(None, SUKEY_REGISTERED_MODS, (ModIndex - 1), QuestToken)
		
		StringListRemove(None, SUKEY_REGISTERED_MODS, asModName)
		StringListInsert(None, SUKEY_REGISTERED_MODS, (ModIndex - 1), asModName)
	ElseIf(aiPositionChange == MOVE_BOTTOM)
		If(ModIndex == 0)
			Return
		EndIf
		
		FormListRemove(None, SUKEY_REGISTERED_MODS, QuestToken)
		FormListInsert(None, SUKEY_REGISTERED_MODS, 0, QuestToken)
		
		StringListRemove(None, SUKEY_REGISTERED_MODS, asModName)
		StringListInsert(None, SUKEY_REGISTERED_MODS, 0, asModName)
	EndIf
EndFunction
