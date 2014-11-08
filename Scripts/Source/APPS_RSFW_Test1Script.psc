Scriptname APPS_RSFW_Test1Script Extends APPS_FW_Registrar
Quest Property InitQuest Auto
Quest Property UninstallQuest Auto

Event OnInit()
	RegisterMod()
	RegisterInitQuest(InitQuest, 0, "Uses a different quest for init which has no stages!")
	RegisterUninstallQuest(UninstallQuest)
	RegisterForExceptionModule("APPS_Test1")
EndEvent