Scriptname APPS_RSFW_Test2Script Extends APPS_ModRegFW_Functions
Quest Property InitQuest Auto

Event OnInit()
	RegisterMod()
	RegisterInitQuest(InitQuest, 0)
	RegisterForExceptionModule("APPS_Test2")
	SetInfoHandling(True, True)
	SetErrorHandling(True, False)
EndEvent