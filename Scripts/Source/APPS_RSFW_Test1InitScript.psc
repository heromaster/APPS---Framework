Scriptname APPS_RSFW_Test1InitScript extends APPS_FW_Registrar
Quest Property InitQuest Auto
Quest Property UninstallQuest Auto
Import StorageUtil

Event OnInit()
	Utility.Wait(0.5)
	AdjustIntValue(Self, "OnInitCounter", 1)

	Exception.Notify("APPS - Framework", "Counter of " + Self.GetName() + ": " + GetIntValue(Self, "OnInitCounter"))
	
	If(GetIntValue(Self, "OnInitCounter") > 1)
		RegisterMod()
		RegisterInitQuest(InitQuest, 0, "Uses a different quest for init which has no stages!")
		Exception.Notify("APPS - Framework", "I am registering because counter is " + GetIntValue(Self, "OnInitCounter"))
		RegisterUninstallQuest(UninstallQuest)
		RegisterForExceptionModule("APPS_Test1")
		RegisterForRelationshipModule()
		UnsetIntValue(Self, "OnInitCounter")
	EndIf
EndEvent