Scriptname APPS_RSFW_Test3Script Extends APPS_ModRegFW_Functions

Event OnInit()
	RegisterMod()
	RegisterInstallQuest(Self, 10)
	RegisterUninstallQuest(Self, 20)
EndEvent