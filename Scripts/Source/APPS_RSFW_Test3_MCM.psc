ScriptName APPS_RSFW_Test3_MCM Extends SKI_ConfigBase
Import StorageUtil
APPS_FW_Relationship Property RSFW Auto
Actor Property SigridREF Auto

Event OnConfigInit()
	Pages = new String[1]
	Pages[0] = "Test 3"
EndEvent

Event OnPageReset(String asPage)
	SetCursorFillMode(TOP_TO_BOTTOM)
	
	;convert SyncMode from Int to String
	String SyncMode

	If (RSFW.GetSyncMode(SigridREF) == 0)
		SyncMode = "$DISABLE"
	ElseIf (RSFW.GetSyncMode(SigridREF) == 1)
		SyncMode = "$VANILLA_TO_RS"
	ElseIf (RSFW.GetSyncMode(SigridREF) == 2)
		SyncMode = "$RS_TO_VANILLA"
	ElseIf (RSFW.GetSyncMode(SigridREF) == 3)
		SyncMode = "$BOTH_WAYS"
	EndIf

	AddHeaderOption(SigridREF.GetActorBase().GetName())
	AddEmptyOption()
	AddTextOption("SyncMode", SyncMode)
	AddTextOption("SyncMode Changes", RSFW.GetSyncModeChanges(SigridREF))
	AddTextOption("SyncMode Position", RSFW.GetSyncModePriority(Self, SigridREF))
	AddEmptyOption()
	AddTextOption("RS Points", RSFW.GetRelationshipPoints(SigridREF))
	AddTextOption("To next rank", RSFW.GetRPForNextRank(SigridREF))
	AddTextOption("To previous rank", RSFW.GetRPForPreviousRank(SigridREF))
	
	SetCursorPosition(1)
	AddHeaderOption("RS Multipliers")
	AddEmptyOption()
	AddTextOption("$S0_S1", RSFW.GetRelationshipMulti(SigridREF, 0, 1))
	AddTextOption("$S1_S2", RSFW.GetRelationshipMulti(SigridREF, 1, 2))
	AddTextOption("$S2_S3", RSFW.GetRelationshipMulti(SigridREF, 2, 3))
	AddTextOption("$S3_S4", RSFW.GetRelationshipMulti(SigridREF, 3, 4))
	AddTextOption("$S4_S5", RSFW.GetRelationshipMulti(SigridREF, 4, 5))
	AddTextOption("$S5_S4", RSFW.GetRelationshipMulti(SigridREF, 5, 4))
	AddTextOption("$S4_S3", RSFW.GetRelationshipMulti(SigridREF, 4, 3))
	AddTextOption("$S3_S2", RSFW.GetRelationshipMulti(SigridREF, 3, 2))
	AddTextOption("$S2_S1", RSFW.GetRelationshipMulti(SigridREF, 2, 1))
	AddTextOption("$S1_S0", RSFW.GetRelationshipMulti(SigridREF, 1, 0))
	AddTextOption("$S0_S-1", RSFW.GetRelationshipMulti(SigridREF, 0, -1))
	AddTextOption("$S-1_S-2", RSFW.GetRelationshipMulti(SigridREF, -1, -2))
	AddTextOption("$S-2_S-3", RSFW.GetRelationshipMulti(SigridREF, -2, -3))
	AddTextOption("$S-3_S-4", RSFW.GetRelationshipMulti(SigridREF, -3, -4))
	AddTextOption("$S-4_S-5", RSFW.GetRelationshipMulti(SigridREF, -4, -5))
	AddTextOption("$S-5_S-4", RSFW.GetRelationshipMulti(SigridREF, -5, -4))
	AddTextOption("$S-4_S-3", RSFW.GetRelationshipMulti(SigridREF, -4, -3))
	AddTextOption("$S-3_S-2", RSFW.GetRelationshipMulti(SigridREF, -3, -2))
	AddTextOption("$S-2_S-1", RSFW.GetRelationshipMulti(SigridREF, -2, -1))
	AddTextOption("$S-1_S0", RSFW.GetRelationshipMulti(SigridREF, -1, 0))
EndEvent
