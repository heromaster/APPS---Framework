ScriptName APPS_FW_SelfInit Extends Quest
Import StorageUtil

Event OnInit()
	SetIntValue(Self, "APPS.InfoManager.DisplayErrors", 1)
	SetIntValue(Self, "APPS.InfoManager.DisplayWarnings", 1)
	SetIntValue(Self, "APPS.InfoManager.DisplayInfos", 1)
	SetIntValue(Self, "APPS.InfoManager.LogErrors", 1)
	SetIntValue(Self, "APPS.InfoManager.LogWarnings", 1)
	SetIntValue(Self, "APPS.InfoManager.LogInfos", 1)
	SetIntValue(Self, "APPS.InfoManager.LogFile", 1)
	SetStringValue(Self, "APPS.InfoManager.LogName", "APPS_Framework")
	StringListAdd(None, "APPS.RegisteredMods", "APPS - Framework")
	FormListAdd(None, "APPS.RegisteredMods", Self)

	Exception.Notify("APPS - Framework", "APPS - Framework initialized")
EndEvent