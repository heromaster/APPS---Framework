ScriptName APPS_RSFW_Test2_MCM Extends SKI_ConfigBase
Import StorageUtil
APPS_FW_Relationship Property RSFW Auto
Actor Property AlvorREF Auto
Quest Property Token Auto
Faction Property RelationshipRankFaction Auto

Event OnInit()
	If(!Self.IsRunning())
		Return
	Else
		Parent.OnInit()
	EndIf
EndEvent

Event OnPageReset(String asPage)
	SetCursorFillMode(TOP_TO_BOTTOM)
	
	;convert SyncMode from Int to String
	String SyncMode

	If (RSFW.GetSyncMode(AlvorREF) == 0)
		SyncMode = "$DISABLE"
	ElseIf (RSFW.GetSyncMode(AlvorREF) == 1)
		SyncMode = "$VANILLA_TO_RS"
	ElseIf (RSFW.GetSyncMode(AlvorREF) == 2)
		SyncMode = "$RS_TO_VANILLA"
	ElseIf (RSFW.GetSyncMode(AlvorREF) == 3)
		SyncMode = "$BOTH_WAYS"
	EndIf
	
	;convert vanilla GetFactionRank() return to a more useful result
	Int CurrentRank
	
	If(!AlvorREF.IsInFaction(RelationshipRankFaction))
		CurrentRank = 0
	Else
		CurrentRank = AlvorREF.GetFactionRank(RelationshipRankFaction)
	EndIf

	AddHeaderOption(AlvorREF.GetActorBase().GetName())
	AddEmptyOption()
	AddTextOption("SyncMode", SyncMode)
	AddTextOption("SyncMode Changes", RSFW.GetSyncModeChanges(AlvorREF))
	AddTextOption("SyncMode Position", RSFW.GetSyncModePriority(Token, AlvorREF))
	AddEmptyOption()
	AddTextOption("Current rank", CurrentRank)
	AddTextOption("RS Points", RSFW.GetRelationshipPoints(AlvorREF))
	AddTextOption("To next rank", RSFW.GetRPForNextRank(AlvorREF))
	AddTextOption("To previous rank", RSFW.GetRPForPreviousRank(AlvorREF))
	
	SetCursorPosition(1)
	AddHeaderOption("RS Multipliers")
	AddEmptyOption()
	AddTextOption("$S0_S1", RSFW.GetRelationshipMulti(AlvorREF, 0, 1))
	AddTextOption("$S1_S2", RSFW.GetRelationshipMulti(AlvorREF, 1, 2))
	AddTextOption("$S2_S3", RSFW.GetRelationshipMulti(AlvorREF, 2, 3))
	AddTextOption("$S3_S4", RSFW.GetRelationshipMulti(AlvorREF, 3, 4))
	AddTextOption("$S4_S5", RSFW.GetRelationshipMulti(AlvorREF, 4, 5))
	AddTextOption("$S5_S4", RSFW.GetRelationshipMulti(AlvorREF, 5, 4))
	AddTextOption("$S4_S3", RSFW.GetRelationshipMulti(AlvorREF, 4, 3))
	AddTextOption("$S3_S2", RSFW.GetRelationshipMulti(AlvorREF, 3, 2))
	AddTextOption("$S2_S1", RSFW.GetRelationshipMulti(AlvorREF, 2, 1))
	AddTextOption("$S1_S0", RSFW.GetRelationshipMulti(AlvorREF, 1, 0))
	AddTextOption("$S0_S-1", RSFW.GetRelationshipMulti(AlvorREF, 0, -1))
	AddTextOption("$S-1_S-2", RSFW.GetRelationshipMulti(AlvorREF, -1, -2))
	AddTextOption("$S-2_S-3", RSFW.GetRelationshipMulti(AlvorREF, -2, -3))
	AddTextOption("$S-3_S-4", RSFW.GetRelationshipMulti(AlvorREF, -3, -4))
	AddTextOption("$S-4_S-5", RSFW.GetRelationshipMulti(AlvorREF, -4, -5))
	AddTextOption("$S-5_S-4", RSFW.GetRelationshipMulti(AlvorREF, -5, -4))
	AddTextOption("$S-4_S-3", RSFW.GetRelationshipMulti(AlvorREF, -4, -3))
	AddTextOption("$S-3_S-2", RSFW.GetRelationshipMulti(AlvorREF, -3, -2))
	AddTextOption("$S-2_S-1", RSFW.GetRelationshipMulti(AlvorREF, -2, -1))
	AddTextOption("$S-1_S0", RSFW.GetRelationshipMulti(AlvorREF, -1, 0))
EndEvent
