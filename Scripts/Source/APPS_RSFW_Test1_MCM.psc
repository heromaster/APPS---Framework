ScriptName APPS_RSFW_Test1_MCM Extends SKI_ConfigBase
Import StorageUtil
APPS_FW_Relationship Property RSFW Auto

Actor Property AlvorREF Auto

Event OnConfigInit()
	Pages = new String[1]
	Pages[0] = "Test 1"
EndEvent

Event OnPageReset(String asPage)
	SetCursorPosition(TOP_TO_BOTTOM)
	
	;convert SyncMode from Int to String
	String SyncMode
	
	If (RSFW.GetSyncMode(AlvorREF) == 0)
		SyncMode == "$DISABLE"
	ElseIf (RSFW.GetSyncMode(AlvorREF) == 1)
		SyncMode == "$VANILLA_TO_RS"
	ElseIf (RSFW.GetSyncMode(AlvorREF) == 2)
		SyncMode == "$RS_TO_VANILLA"
	ElseIf (RSFW.GetSyncMode(AlvorREF) == 3)
		SyncMode == "$BOTH_WAYS"
	EndIf
	
	AddHeaderOption(AlvorREF.GetName())
	AddEmptyOption()
	AddTextOption("SyncMode", SyncMode)
	AddTextOption("SyncMode Changes", RSFW.GetSyncModeChanges(AlvorREF) as String)
	AddTextOption("SyncMode Position", RSFW.GetSyncModePos(Self, AlvorREF) as String)
	AddEmptyOption()
	AddTextOption("RS Points", RSFW.GetRelationshipPoints(AlvorREF) as String)
	AddTextOption("To next rank", RSFW.GetRPForNextRank(AlvorREF) as String)
	AddTextOption("To previous rank", RSFW.GetRPForPreviousRank(AlvorREF) as String)
	
	SetCursorPosition(1)
	AddHeaderOption("RS Multipliers")
	AddEmptyOption()
	AddTextOption("$S0_S1", RSFW.GetRelationshipMulti(AlvorREF, 0, 1) as String)
	AddTextOption("$S1_S2", RSFW.GetRelationshipMulti(AlvorREF, 1, 2) as String)
	AddTextOption("$S2_S3", RSFW.GetRelationshipMulti(AlvorREF, 2, 3) as String)
	AddTextOption("$S3_S4", RSFW.GetRelationshipMulti(AlvorREF, 3, 4) as String)
	AddTextOption("$S4_S5", RSFW.GetRelationshipMulti(AlvorREF, 4, 5) as String)
	AddTextOption("$S5_S4", RSFW.GetRelationshipMulti(AlvorREF, 5, 4) as String)
	AddTextOption("$S4_S3", RSFW.GetRelationshipMulti(AlvorREF, 4, 3) as String)
	AddTextOption("$S3_S2", RSFW.GetRelationshipMulti(AlvorREF, 3, 2) as String)
	AddTextOption("$S2_S1", RSFW.GetRelationshipMulti(AlvorREF, 2, 1) as String)
	AddTextOption("$S1_S0", RSFW.GetRelationshipMulti(AlvorREF, 1, 0) as String)
	AddTextOption("$S0_S-1", RSFW.GetRelationshipMulti(AlvorREF, 0, -1) as String)
	AddTextOption("$S-1_S-2", RSFW.GetRelationshipMulti(AlvorREF, -1, -2) as String)
	AddTextOption("$S-2_S-3", RSFW.GetRelationshipMulti(AlvorREF, -2, -3) as String)
	AddTextOption("$S-3_S-4", RSFW.GetRelationshipMulti(AlvorREF, -3, -4) as String)
	AddTextOption("$S-4_S-5", RSFW.GetRelationshipMulti(AlvorREF, -4, -5) as String)
	AddTextOption("$S-5_S-4", RSFW.GetRelationshipMulti(AlvorREF, -5, -4) as String)
	AddTextOption("$S-4_S-3", RSFW.GetRelationshipMulti(AlvorREF, -4, -3) as String)
	AddTextOption("$S-3_S-2", RSFW.GetRelationshipMulti(AlvorREF, -3, -2) as String)
	AddTextOption("$S-2_S-1", RSFW.GetRelationshipMulti(AlvorREF, -2, -1) as String)
	AddTextOption("$S-1_S0", RSFW.GetRelationshipMulti(AlvorREF, -1, 0) as String)
EndEvent
