ScriptName APPS_FW_SelfInit Extends Quest
Import StorageUtil

Event OnInit()
	SetIntValue(Self, "APPS.Exceptions.DisplayErrors", 1)
	SetIntValue(Self, "APPS.Exceptions.DisplayWarnings", 1)
	SetIntValue(Self, "APPS.Exceptions.DisplayInfos", 1)
	SetIntValue(Self, "APPS.Exceptions.LogErrors", 1)
	SetIntValue(Self, "APPS.Exceptions.LogWarnings", 1)
	SetIntValue(Self, "APPS.Exceptions.LogInfos", 1)
	SetIntValue(Self, "APPS.Exceptions.LogFile", 1)
	SetStringValue(Self, "APPS.Exceptions.LogName", "APPS_Framework")
	StringListAdd(None, "APPS.RegisteredMods", "APPS - Framework")
	FormListAdd(None, "APPS.RegisteredMods", Self)

	Exception.Notify("APPS - Framework", "APPS - Framework initialized")
EndEvent