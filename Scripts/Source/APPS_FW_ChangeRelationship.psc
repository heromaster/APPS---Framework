Scriptname APPS_FW_ChangeRelationship Extends Quest
Import StorageUtil

Actor Property PlayerRef Auto
APPS_FW_Relationship Property RS Auto

Event OnStoryRelationshipChange(ObjectReference akActor1, ObjectReference akActor2, Int auiOldRelationship, Int auiNewRelationship)
	Actor PC
	Actor NPC
	Int i

	If((akActor1 As Actor) == PlayerRef)
		PC = akActor1 As Actor
		NPC = akActor2 As Actor
	Else
		PC = akActor2 As Actor
		NPC = akActor1 As Actor
	EndIf

	If(RS.GetSyncMode(NPC) <= 1)
		Stop()
		Return
	EndIf

	If(HasIntValue(NPC, "APPS.Framework.Relationship.IgnoreRankChange"))
		UnsetIntValue(NPC, "APPS.Framework.Relationship.IgnoreRankChange")
		Stop()
		Return
	EndIf

	While(i < FormListCount(None, "APPS.Framework.Relationship.BlockedFactions"))
		If(NPC.IsInFaction(FormListGet(None, "APPS.Framework.Relationship.BlockedFactions", i) As Faction))
			Stop()
			Return
		EndIf

		i += 1
	EndWhile

	SetIntValue(NPC, "APPS.Framework.Relationship.IgnoreRankChange", 2)
	RS.SetRelationshipPoints(NPC, auiNewRelationship * 100)
	UnsetIntValue(NPC, "APPS.Framework.Relationship.IgnoreRankChange")

	Stop()
EndEvent