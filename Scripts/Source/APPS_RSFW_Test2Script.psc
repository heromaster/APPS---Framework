Scriptname APPS_RSFW_Test2Script Extends APPS_ModRegFW_Functions

Event OnInit()
	RegisterMod()
	RegisterInitQuest(Self, 10)
	RegisterUninstallQuest(Self, 20)
EndEvent
