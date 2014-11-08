ScriptName APPS_FW_SelfInit Extends Quest
Import StorageUtil

Faction Property PotentialFollowerFaction Auto
Faction Property PotentialHireling Auto

Event OnInit()
	SetIntValue(Self, "APPS.Framework.InfoManager.DisplayErrors", 1)
	SetIntValue(Self, "APPS.Framework.InfoManager.DisplayWarnings", 1)
	SetIntValue(Self, "APPS.Framework.InfoManager.DisplayInfos", 1)
	SetIntValue(Self, "APPS.Framework.InfoManager.LogErrors", 1)
	SetIntValue(Self, "APPS.Framework.InfoManager.LogWarnings", 1)
	SetIntValue(Self, "APPS.Framework.InfoManager.LogInfos", 1)
	SetIntValue(Self, "APPS.Framework.InfoManager.LogFile", 1)
	SetStringValue(Self, "APPS.Framework.InfoManager.LogName", "APPS_Framework")
	StringListAdd(None, "APPS.Framework.RegisteredMods", "APPS - Framework")
	FormListAdd(None, "APPS.Framework.RegisteredMods", Self)
	SetFloatValue(None, "APPS.Framework.RelationshipModS0_1", 1.0)
	SetFloatValue(None, "APPS.Framework.RelationshipModS1_2", 0.5)
	SetFloatValue(None, "APPS.Framework.RelationshipModS2_3", 0.25)
	SetFloatValue(None, "APPS.Framework.RelationshipModS3_4", 0.125)
	SetFloatValue(None, "APPS.Framework.RelationshipModS4_5", 0.0625)
	SetFloatValue(None, "APPS.Framework.RelationshipModS0_-1", 1.0)
	SetFloatValue(None, "APPS.Framework.RelationshipModS-1_-2", 0.5)
	SetFloatValue(None, "APPS.Framework.RelationshipModS-2_-3", 0.25)
	SetFloatValue(None, "APPS.Framework.RelationshipModS-3_-4", 0.125)
	SetFloatValue(None, "APPS.Framework.RelationshipModS-4_-5", 0.0625)
	SetFloatValue(None, "APPS.Framework.RelationshipModS5_4", 0.125)
	SetFloatValue(None, "APPS.Framework.RelationshipModS4_3", 0.25)
	SetFloatValue(None, "APPS.Framework.RelationshipModS3_2", 0.5)
	SetFloatValue(None, "APPS.Framework.RelationshipModS2_1", 1.0)
	SetFloatValue(None, "APPS.Framework.RelationshipModS1_0", 2.0)
	SetFloatValue(None, "APPS.Framework.RelationshipModS-5_-4", 0.125)
	SetFloatValue(None, "APPS.Framework.RelationshipModS-4_-3", 0.25)
	SetFloatValue(None, "APPS.Framework.RelationshipModS-3_-2", 0.5)
	SetFloatValue(None, "APPS.Framework.RelationshipModS-2_-1", 1.0)
	SetFloatValue(None, "APPS.Framework.RelationshipModS-1_0", 2.0)
	SetIntValue(None, "APPS.Framework.Relationship.SyncMode", 3)
	FormListAdd(None, "APPS.Framework.Relationship.BlockedFactions", PotentialFollowerFaction)
	FormListAdd(None, "APPS.Framework.Relationship.BlockedFactions", PotentialHireling)
	Exception.Notify("APPS - Framework", "APPS - Framework initialized")
EndEvent