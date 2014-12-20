Scriptname APPS_RSFW_Test1InitScript extends Quest  
Quest Property DialogueQuest Auto

Event OnInit()
	If(!Self.IsRunning())
		Return
	EndIf

	DialogueQuest.Start()
	Exception.Warn("APPS Test 1", "Done! Test1 used the 'init quest is different from register quest' method and has no stages")
EndEvent