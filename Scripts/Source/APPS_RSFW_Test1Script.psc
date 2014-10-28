Scriptname APPS_RSFW_Test1Script Extends APPS_ModRegFW_Functions
Quest Property InitQuest Auto
Quest Property UninstallQuest Auto

Event OnInit()
	RegisterMod()
	RegisterInitQuest(InitQuest, -1, "Uses a different quest for init which has no stages!")
	RegisterUninstallQuest(UninstallQuest, -1)
	RegisterForExceptionModule("APPS_Test1")
EndEvent
