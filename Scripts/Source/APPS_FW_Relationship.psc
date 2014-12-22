Scriptname APPS_FW_Relationship Extends APPS_FW_Core
Import StorageUtil
Import Exception

Actor Property PlayerRef Auto
Faction Property RelationshipPointsFaction Auto
Faction Property RelationshipRankFaction Auto

Bool IsUninstallingAll = False
String Property SYNC_MODE = "APPS.Framework.Relationship.SyncMode" AutoReadOnly Hidden
String Property SYNC_MODE_CHANGELIST = "APPS.Framework.Relationship.SyncMode.ChangeList" AutoReadOnly Hidden
String Property SYNC_MODE_NPC_CHANGELIST = "APPS.Framework.Relationship.SyncMode.NPC.ChangeList" AutoReadOnly Hidden
String Property RS_MULTI_S0_S1 = "APPS.Framework.Relationship.RelationshipMulti.S0_S1" AutoReadOnly Hidden
String Property RS_MULTI_S1_S2 = "APPS.Framework.Relationship.RelationshipMulti.S1_S2" AutoReadOnly Hidden
String Property RS_MULTI_S2_S3 = "APPS.Framework.Relationship.RelationshipMulti.S2_S3" AutoReadOnly Hidden
String Property RS_MULTI_S3_S4 = "APPS.Framework.Relationship.RelationshipMulti.S3_S4" AutoReadOnly Hidden
String Property RS_MULTI_S4_S5 = "APPS.Framework.Relationship.RelationshipMulti.S4_S5" AutoReadOnly Hidden
String Property RS_MULTI_S5_S4 = "APPS.Framework.Relationship.RelationshipMulti.S5_S4" AutoReadOnly Hidden
String Property RS_MULTI_S4_S3 = "APPS.Framework.Relationship.RelationshipMulti.S4_S3" AutoReadOnly Hidden
String Property RS_MULTI_S3_S2 = "APPS.Framework.Relationship.RelationshipMulti.S3_S2" AutoReadOnly Hidden
String Property RS_MULTI_S2_S1 = "APPS.Framework.Relationship.RelationshipMulti.S2_S1" AutoReadOnly Hidden
String Property RS_MULTI_S1_S0 = "APPS.Framework.Relationship.RelationshipMulti.S1_S0" AutoReadOnly Hidden
String Property RS_MULTI_S0_SM1 = "APPS.Framework.Relationship.RelationshipMulti.S0_S-1" AutoReadOnly Hidden
String Property RS_MULTI_SM1_SM2 = "APPS.Framework.Relationship.RelationshipMulti.S-1_S-2" AutoReadOnly Hidden
String Property RS_MULTI_SM2_SM3 = "APPS.Framework.Relationship.RelationshipMulti.S-2_S-3" AutoReadOnly Hidden
String Property RS_MULTI_SM3_SM4 = "APPS.Framework.Relationship.RelationshipMulti.S-3_S-4" AutoReadOnly Hidden
String Property RS_MULTI_SM4_SM5 = "APPS.Framework.Relationship.RelationshipMulti.S-4_S-5" AutoReadOnly Hidden
String Property RS_MULTI_SM5_SM4 = "APPS.Framework.Relationship.RelationshipMulti.S-5_S-4" AutoReadOnly Hidden
String Property RS_MULTI_SM4_SM3 = "APPS.Framework.Relationship.RelationshipMulti.S-4_S-3" AutoReadOnly Hidden
String Property RS_MULTI_SM3_SM2 = "APPS.Framework.Relationship.RelationshipMulti.S-3_S-2" AutoReadOnly Hidden
String Property RS_MULTI_SM2_SM1 = "APPS.Framework.Relationship.RelationshipMulti.S-2_S-1" AutoReadOnly Hidden
String Property RS_MULTI_SM1_S0 = "APPS.Framework.Relationship.RelationshipMulti.S-1_S0" AutoReadOnly Hidden
String Property RS_MULTI_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.Global.ChangeList" AutoReadOnly Hidden
String Property RS_MULTI_NPC_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.NPC.ChangeList" AutoReadOnly Hidden
String Property RS_MULTI_S0_S1_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S0_S1.ChangeList" AutoReadOnly Hidden
String Property RS_MULTI_S1_S2_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S1_S2.ChangeList" AutoReadOnly Hidden
String Property RS_MULTI_S2_S3_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S2_S3.ChangeList" AutoReadOnly Hidden
String Property RS_MULTI_S3_S4_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S3_S4.ChangeList" AutoReadOnly Hidden
String Property RS_MULTI_S4_S5_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S4_S5.ChangeList" AutoReadOnly Hidden
String Property RS_MULTI_S5_S4_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S5_S4.ChangeList" AutoReadOnly Hidden
String Property RS_MULTI_S4_S3_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S4_S3.ChangeList" AutoReadOnly Hidden
String Property RS_MULTI_S3_S2_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S3_S2.ChangeList" AutoReadOnly Hidden
String Property RS_MULTI_S2_S1_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S2_S1.ChangeList" AutoReadOnly Hidden
String Property RS_MULTI_S1_S0_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S1_S0.ChangeList" AutoReadOnly Hidden
String Property RS_MULTI_S0_SM1_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S0_S-1.ChangeList" AutoReadOnly Hidden
String Property RS_MULTI_SM1_SM2_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S-1_S-2.ChangeList" AutoReadOnly Hidden
String Property RS_MULTI_SM2_SM3_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S-2_S-3.ChangeList" AutoReadOnly Hidden
String Property RS_MULTI_SM3_SM4_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S-3_S-4.ChangeList" AutoReadOnly Hidden
String Property RS_MULTI_SM4_SM5_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S-4_S-5.ChangeList" AutoReadOnly Hidden
String Property RS_MULTI_SM5_SM4_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S-5_S-4.ChangeList" AutoReadOnly Hidden
String Property RS_MULTI_SM4_SM3_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S-4_S-3.ChangeList" AutoReadOnly Hidden
String Property RS_MULTI_SM3_SM2_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S-3_S-2.ChangeList" AutoReadOnly Hidden
String Property RS_MULTI_SM2_SM1_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S-2_S-1.ChangeList" AutoReadOnly Hidden
String Property RS_MULTI_SM1_S0_CHANGELIST = "APPS.Framework.Relationship.RelationshipMulti.S-1_S0.ChangeList" AutoReadOnly Hidden
String Property RSP = "APPS.Framework.Relationship.RelationshipPoints" AutoReadOnly Hidden
String Property IGNORE_CHANGES = "APPS.Framework.Relationship.IgnoreRankChange" AutoReadOnly Hidden
String Property FW_LOG = "APPS - Framework" AutoReadOnly Hidden

;/
Global SyncMode convention:
0 - disabled
1 - from vanilla to rs
2 - from rs to vanilla
3 - both ways
/;

Int Function GetGlobalSyncMode()
	Return GetIntValue(None, SYNC_MODE)
EndFunction

Int Function GetGlobalSyncModeChanges()
	Return FormListCount(None, SYNC_MODE_CHANGELIST)
EndFunction

Int Function GetGlobalSyncModePriority(Quest akToken)
	Return _GetModIndexFromForm(akToken, SYNC_MODE_CHANGELIST) + 1
EndFunction

Bool Function SetGlobalSyncMode(Quest akToken, Int aiSyncMode)
	Int ModIndex = _GetModIndexFromForm(akToken, REGISTERED_RS)

	If(ModIndex == -1)
		Throw(FW_LOG, " A mod, which is not registered or sent an invalid Token, tried to access SetGlobalSyncMode(). The FormID of this token is " + akToken.GetFormID() + ".", "Access denied")
		Return False
	EndIf

	If(aiSyncMode < 0 || aiSyncMode > 3)
		Throw(FW_LOG, "Sync modus wasn't set correctly by " + ModName + ". The lower limit is 0 and the upper limit is 3", "Invalid arguments")
		Return False
	EndIf

	String ModName = GetStringValue(akToken, MOD_NAME)
	Int ModIndex2 = _GetModIndexFromForm(akToken, SYNC_MODE_CHANGELIST) ; Get position of current mod in this list
	Int SyncModeChanges = FormListCount(None, SYNC_MODE_CHANGELIST) ;Get the list of mods which do change the global sync mode

	;If the mod was found, update its new value
	If(ModIndex2 >= 0)
		IntListSet(None, SYNC_MODE_CHANGELIST, ModIndex2, aiSyncMode)
		Notify(FW_LOG, "Sync mode for " + ModName + " got updated.", False)

		;If the mod is also on the last position then also update the global sync mode
		If(ModIndex2 == SyncModeChanges - 1)
			SetIntValue(None, SYNC_MODE, aiSyncMode)
			Notify(FW_LOG, "Global sync mode for is changed by  " + ModName + ".", False)
			Return True
		Else
			Notify(FW_LOG, "Can't change the global sync mode for " + ModName + " because it is already set by a mod with higher priority. However, it will be set, if this mod has the highest priority.", False)
			Return True
		EndIf
	Else
		Int i = 0

		;Go through the list of changes to the global sync mode
		While(i < SyncModeChanges)
			Form ModToCmp = FormListGet(None, SYNC_MODE_CHANGELIST, i) ;Get mod at index i
			Int ModToCmpIdx = FormListFind(None, REGISTERED_RS, ModToCmp) ;Get priority of this comparing mod

			;If the actual mod has a higher priority than the comparing mod then continue cycling the list
			If(ModIndex > ModToCmpIdx)
				i += 1
			Else
				FormListInsert(None, SYNC_MODE_CHANGELIST, i, akToken) ;Insert the actual mod into the list before the comparing mod
				IntListInsert(None, SYNC_MODE_CHANGELIST, i, aiSyncMode) ;Insert the sync mode value as well
				Notify(FW_Log, "Can't change the global sync mode because it is already set by a mod with higher priority. However, the value will be set, if " + ModName + " becomes the highest priority.", False)
				Return True
			EndIf
		EndWhile
	EndIf

	;No changes made to the array, so just add the value to it and apply the changes to the framework
	FormListAdd(None, SYNC_MODE_CHANGELIST, akToken)
	IntListAdd(None, SYNC_MODE_CHANGELIST, aiSyncMode)
	SetIntValue(None, SYNC_MODE, aiSyncMode)
	Return True
EndFunction

Bool Function RemoveGlobalSyncMode(Quest akToken)
	If(_GetModIndexFromForm(akToken, REGISTERED_RS) == -1)
		Warn(FW_LOG, "A mod tried to remove its changes to the global sync mode. It passed a wrong token, however. FormID of the token is " + akToken.GetFormID() + ".")
		Return False
	ElseIf(_GetModIndexFromForm(akToken, SYNC_MODE_CHANGELIST) == -1)
		Notify(FW_LOG, "A mod tried to remove its changes to the global sync mode. But there were no changes made by this mod. FormID of the token is " + akToken.GetFormID() + ".")
		Return False
	EndIf

	Int ModIndex = _GetModIndexFromForm(akToken, SYNC_MODE_CHANGELIST)

	;If the global sync mode changelist only contains one element, remove the sync mode completely
	If(IntListCount(None, SYNC_MODE_CHANGELIST) == 1)
		UnsetIntValue(None, SYNC_MODE)
	;Else if the mod had the highest priority, do set the global sync mode to the value of the next mod
	ElseIf (ModIndex == IntListCount(None, SYNC_MODE_CHANGELIST) - 1)
		SetIntValue(None, SYNC_MODE, IntListGet(None, SYNC_MODE, ModIndex - 1))
	EndIf

	FormListRemove(None, SYNC_MODE_CHANGELIST, akToken)
	IntListRemoveAt(None, SYNC_MODE_CHANGELIST, ModIndex)
	
	;;if the changelists are now empty (e.g. the framework has been removed), clear them
	If (FormListCount(None, SYNC_MODE_CHANGELIST) == 0)
		FormListClear(None, SYNC_MODE_CHANGELIST)
		IntListClear(None, SYNC_MODE_CHANGELIST)
	EndIf
	
	Return True
EndFunction

Int Function GetSyncMode(Actor akNPC, Bool abGetGlobalIfNotFound = True)
	If(akNPC == None)
		Throw(FW_LOG, "Argument akNPC is None!", "Invalid arguments")
		Return -1
	EndIf

	If(!HasIntValue(akNPC, SYNC_MODE))
		If(abGetGlobalIfNotFound)
			Notify(FW_LOG, "Sync mode on " + akNPC.GetActorBase().GetName() + " was not set, returning global sync mode.", False)
			Return GetGlobalSyncMode()
		Else
			Notify(FW_LOG, "No mod changed the sync mode on " + akNPC.GetActorBase().GetName() + ".", False)
			Return -1
		EndIf
	EndIf

	Return GetIntValue(akNPC, SYNC_MODE)
EndFunction

Int Function GetSyncModeChanges(Actor akNPC)
	If(akNPC == None)
		Throw(FW_LOG, "Argument akNPC is None!", "Invalid arguments")
		Return -1
	EndIf

	Return FormListCount(akNPC, SYNC_MODE_CHANGELIST)
EndFunction

Int Function GetSyncModePriority(Quest akToken, Actor akNPC)
	If(akNPC == None)
		Throw(FW_LOG, "Argument akNPC is None!", "Invalid arguments")
		Return -1
	EndIf

	Return _GetModIndexFromForm(akToken, SYNC_MODE_CHANGELIST, akNPC) + 1
EndFunction

Bool Function SetSyncMode(Quest akToken, Actor akNPC, Int aiSyncMode = 1)
	Int ModIndex = _GetModIndexFromForm(akToken, REGISTERED_RS)

	If(ModIndex == -1)
		Throw(FW_LOG, " A mod, which is not registered or sent an invalid token, tried to access SetSyncMode(). The FormID of this token is " + akToken.GetFormID() + ".", "Access denied")
		Return False
	EndIf

	If(!akNPC)
		Throw(FW_LOG, "Argument akNPC for function SetSyncMode() is None!", "Invalid arguments")
		Return False
	EndIf

	If(!akNPC.GetActorBase().IsUnique())
		Throw(FW_LOG, "Actor " + akNPC.GetActorBase().GetName() + " must be an unique actor!", "Invalid arguments")
		Return False
	EndIf

	String ModName = GetStringValue(akToken, MOD_NAME)

	If(aiSyncMode < 0 || aiSyncMode > 3)
		Throw(FW_LOG, "Sync mode for " + akNPC.GetActorBase().GetName() + " was not correctly set by " + ModName + ". The lower limit is 0 and the upper limit is 3.", "Invalid arguments")
		Return False
	EndIf

	
	Int ModIndex2 = _GetModIndexFromForm(akToken, SYNC_MODE_CHANGELIST, akNPC) ; Get position of current mod in this list
	Int SyncModeChanges = FormListCount(akNPC, SYNC_MODE_CHANGELIST) ;Get the list of mods which do change the sync mode on an actor

	;If the mod was found, update its new value
	If(ModIndex2 >= 0)
		IntListSet(akNPC, SYNC_MODE_CHANGELIST, ModIndex2, aiSyncMode)
		
		Notify(FW_LOG, "Sync mode on " + akNPC.GetActorBase().GetName() + " got updated by " + ModName + ".", False)

		;If the mod is also on the last position then also update the global sync mode
		If(ModIndex2 == SyncModeChanges - 1)
			SetIntValue(akNPC, SYNC_MODE, aiSyncMode)
			Return True
		Else
			Notify(FW_LOG, "Can't change the sync mode on " + akNPC.GetActorBase().GetName() + " for " + ModName + " because it is already set by a mod with higher priority. However, it will be set, if this mod has the highest priority.", False)
			Return True
		EndIf
	Else
		Int i = 0

		;Go through the list of changes to the global sync mode
		While(i < SyncModeChanges)
			Form ModToCmp = FormListGet(akNPC, SYNC_MODE_CHANGELIST, i) ;Get mod at index i
			Int ModToCmpIdx = FormListFind(None, REGISTERED_RS, ModToCmp) ;Get priority of this comparing mod

			;If the actual mod has a higher priority than the comparing mod then continue cycling the list
			If(ModIndex > ModToCmpIdx)
				i += 1
			Else
				FormListInsert(akNPC, SYNC_MODE_CHANGELIST, i, akToken) ;Insert the actual mod into the list before the comparing mod
				IntListInsert(akNPC, SYNC_MODE_CHANGELIST, i, aiSyncMode) ;Insert the sync mode value as well
				Notify(FW_LOG, "Can't change the sync mode on " + akNPC.GetActorBase().GetName() + " for " + ModName + " because it is already set by a mod with higher priority. However, it will be set, if this mod has the highest priority.", False)
				Return True
			EndIf
		EndWhile
	EndIf
	
	;No changes made to the array, so just add the value to it and apply the changes to the framework
	FormListAdd(akNPC, SYNC_MODE_CHANGELIST, akToken)
	IntListAdd(akNPC, SYNC_MODE_CHANGELIST, aiSyncMode) 
	FormListAdd(None, SYNC_MODE_NPC_CHANGELIST, akNPC)
	SetIntValue(akNPC, SYNC_MODE, aiSyncMode)
	Return True
EndFunction

Bool Function RemoveSyncMode(Quest akToken, Actor akNPC)
	If(_GetModIndexFromForm(akToken, REGISTERED_RS) == -1)
		Warn(FW_LOG, "A mod tried to remove its changes to the actor " + akNPC.GetActorBase().GetName() + ". It passed a wrong token, however. FormID of the token is " + akToken.GetFormID() + ".")
		Return False
	EndIf
	
	If (FormListFind(None, SYNC_MODE_NPC_CHANGELIST, akNPC) == -1)
		Notify(FW_LOG, "A mod tried to remove its changes to the actor" + akNPC.GetActorBase().GetName() + ", but there had been no changes made specifically to this actor by any mod. FormID of the token is " + akToken.GetFormID() + ".")
		Return False
	ElseIf (_GetModIndexFromForm(akToken, SYNC_MODE_CHANGELIST, akNPC) == -1)
		Notify(FW_LOG, "A mod tried to remove its changes to the actor" + akNPC.GetActorBase().GetName() + ", but there had been no changes made to this actor by this mod. FormID of the token is " + akToken.GetFormID() + ".")
		Return False
	EndIf
	
	Int ModIndex = _GetModIndexFromForm(akToken, SYNC_MODE_CHANGELIST, akNPC)

	;If the npc sync mode changelist only contains one element, remove the sync mode completely from that npc and remove him from the list of npc's with local changelists
	If(IntListCount(akNPC, SYNC_MODE_CHANGELIST) == 1)
		UnsetIntValue(akNPC, SYNC_MODE)
		FormListRemove(None, SYNC_MODE_NPC_CHANGELIST, akNPC)
	;Else if the mod had the highest priority on the npc, do set the global sync mode to the value of the next mod on that npc
	ElseIf (ModIndex == IntListCount(akNPC, SYNC_MODE_CHANGELIST) - 1)
		SetIntValue(akNPC, SYNC_MODE, IntListGet(akNPC, SYNC_MODE, ModIndex - 1))
	EndIf

	FormListRemove(akNPC, SYNC_MODE_CHANGELIST, akToken)
	IntListRemoveAt(akNPC, SYNC_MODE_CHANGELIST, ModIndex)
	
	;if no NPC with local changes remains, clear the arrays
	If (FormListCount(None, SYNC_MODE_NPC_CHANGELIST) == 0)
		FormListClear(None, SYNC_MODE_NPC_CHANGELIST)
	EndIf
	
	;if the changelists are now empty (e.g. the framework has been removed), clear them
	If (FormListCount(akNPC, SYNC_MODE_CHANGELIST) == 0)
		FormListClear(akNPC, SYNC_MODE_CHANGELIST)
		IntListClear(akNPC, SYNC_MODE_CHANGELIST)
	EndIf
	
	Return True
EndFunction

Float Function GetGlobalRelationshipMulti(Int aiFromRelationshipRank, Int aiToRelationshipRank)
	If(aiFromRelationshipRank < -5 || aiFromRelationshipRank > 5)
		Throw(FW_LOG, "Argument aiFromRelationshipRank was not set correctly. The range is from -5 to 5.", "Invalid arguments")
		Return -1.0
	EndIf

	If(aiToRelationshipRank < -5 || aiToRelationshipRank > 5)
		Throw(FW_LOG, "Argument aiToRelationshipRank was not set correctly. The range is from -5 to 5.", "Invalid arguments")
		Return -1.0
	EndIf

	If(aiFromRelationshipRank == aiToRelationshipRank)
		Throw(FW_LOG, "Argument aiToRelationshipRank can not be the same value as aiFromRelationshipRank.", "Invalid arguments")
		Return -1.0
	EndIf

	If(aiFromRelationshipRank < aiToRelationshipRank && aiToRelationshipRank - aiFromRelationshipRank != 1)
		Throw(FW_LOG, "Multiplier can only be set for the next or previous rank. From Rank " + aiFromRelationshipRank + " to Rank " + aiToRelationshipRank + " is incorrect.", "Invalid arguments")
		Return -1.0
	ElseIf(aiToRelationshipRank < aiFromRelationshipRank && aiFromRelationshipRank - aiToRelationshipRank != 1)
		Throw(FW_LOG, "Multiplier can only be set for the next or previous rank. From Rank " + aiFromRelationshipRank + " to Rank " + aiToRelationshipRank + " is incorrect.", "Invalid arguments")
		Return -1.0
	EndIf

	String MultiplierString = "APPS.Framework.Relationship.RelationshipMulti.S" + aiFromRelationshipRank As String + "_" + "S" + aiToRelationshipRank As String
	Return GetFloatValue(None, MultiplierString)
EndFunction

Int Function GetGlobalRelationshipMultiPriority(Quest akToken)
	Return _GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST) + 1
EndFunction

Bool Function SetGlobalRelationshipMulti(Quest akToken, Int aiFromRelationshipRank, Int aiToRelationshipRank, Float auiMultiplier)
	Int ModIndex = _GetModIndexFromForm(akToken, REGISTERED_RS)

	If(ModIndex == -1)
		Throw(FW_LOG, " A mod, which is not registered or sent an invalid token, tried to access SetGlobalRelationshipMulti(). The FormID of this token is " + akToken.GetFormID() + ".", "Access denied")
		Return False
	EndIf

	If(aiFromRelationshipRank < -5 || aiFromRelationshipRank > 5)
		Throw(FW_LOG, "Argument aiFromRelationshipRank was not set correctly. The range is from -5 to 5.", "Invalid arguments")
		Return False
	EndIf

	If(aiToRelationshipRank < -5 || aiToRelationshipRank > 5)
		Throw(FW_LOG, "Argument aiToRelationshipRank was not set correctly. The range is from -5 to 5.", "Invalid arguments")
		Return False
	EndIf

	If(aiFromRelationshipRank == aiToRelationshipRank)
		Throw(FW_LOG, "Argument aiToRelationshipRank can not be the same value as aiFromRelationshipRank.", "Invalid arguments")
		Return False
	EndIf

	If(aiFromRelationshipRank < aiToRelationshipRank && aiToRelationshipRank - aiFromRelationshipRank != 1)
		Throw(FW_LOG, "Multiplier can only be set for the next or previous rank. From Rank " + aiFromRelationshipRank + " to Rank " + aiToRelationshipRank + " is incorrect.", "Invalid arguments")
		Return False
	ElseIf(aiToRelationshipRank < aiFromRelationshipRank && aiFromRelationshipRank - aiToRelationshipRank != 1)
		Throw(FW_LOG, "Multiplier can only be set for the next or previous rank. From Rank " + aiFromRelationshipRank + " to Rank " + aiToRelationshipRank + " is incorrect.", "Invalid arguments")
		Return False
	EndIf

	If(auiMultiplier <= 0)
		Throw(FW_LOG, "Multiplier can not be set to 0 or lower", "Invalid arguments")
		Return False
	EndIf

	String ModName = GetStringValue(akToken, MOD_NAME)
	Int ModIndex2 = _GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST) ; Get position of current mod in this list
	Int RSMultiChanges = FormListCount(None, RS_MULTI_CHANGELIST) ;Get the list of mods which do change the sync mode on an actor
	String MultiplierString = "S" + aiFromRelationshipRank As String + "_S" + aiToRelationshipRank As String

	;If the mod was found, update its new value
	If(ModIndex2 >= 0)
		If(MultiplierString == "S0_S1")
			FloatListSet(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex2, 1)	; 0: default framework values, 1: custom mod values
		ElseIf(MultiplierString == "S1_S2")
			FloatListSet(None, RS_MULTI_S1_S2_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(None, RS_MULTI_S1_S2_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S2_S3")
			FloatListSet(None, RS_MULTI_S2_S3_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(None, RS_MULTI_S2_S3_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S3_S4")
			FloatListSet(None, RS_MULTI_S3_S4_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(None, RS_MULTI_S3_S4_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S4_S5")
			FloatListSet(None, RS_MULTI_S4_S5_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(None, RS_MULTI_S4_S5_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S5_S4")
			FloatListSet(None, RS_MULTI_S5_S4_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(None, RS_MULTI_S5_S4_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S4_S3")
			FloatListSet(None, RS_MULTI_S4_S3_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(None, RS_MULTI_S4_S3_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S3_S2")
			FloatListSet(None, RS_MULTI_S3_S2_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(None, RS_MULTI_S3_S2_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S2_S1")
			FloatListSet(None, RS_MULTI_S2_S1_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(None, RS_MULTI_S2_S1_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S1_S0")
			FloatListSet(None, RS_MULTI_S1_S0_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(None, RS_MULTI_S1_S0_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S0_S-1")
			FloatListSet(None, RS_MULTI_S0_SM1_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(None, RS_MULTI_S0_SM1_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-1_S-2")
			FloatListSet(None, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(None, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-2_S-3")
			FloatListSet(None, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(None, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-3_S-4")
			FloatListSet(None, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(None, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-4_S-5")
			FloatListSet(None, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(None, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-5_S-4")
			FloatListSet(None, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(None, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-4_S-3")
			FloatListSet(None, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(None, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-3_S-2")
			FloatListSet(None, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(None, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-2_S-1")
			FloatListSet(None, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(None, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-1_S0")
			FloatListSet(None, RS_MULTI_SM1_S0_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(None, RS_MULTI_SM1_S0_CHANGELIST, ModIndex2, 1)
		EndIf

		Notify(FW_LOG, "Global multiplier for rank " + aiFromRelationshipRank + " to " + aiToRelationshipRank + " got updated by " + ModName + ".", False)

		;If the mod is also on the last position then also update the global relationship multiplier
		If(ModIndex2 == RSMultiChanges - 1)
			If(MultiplierString == "S0_S1")
				SetFloatValue(None, RS_MULTI_S0_S1, auiMultiplier)
			ElseIf(MultiplierString == "S1_S2")
				SetFloatValue(None, RS_MULTI_S1_S2, auiMultiplier)
			ElseIf(MultiplierString == "S2_S3")
				SetFloatValue(None, RS_MULTI_S2_S3, auiMultiplier)
			ElseIf(MultiplierString == "S3_S4")
				SetFloatValue(None, RS_MULTI_S3_S4, auiMultiplier)
			ElseIf(MultiplierString == "S4_S5")
				SetFloatValue(None, RS_MULTI_S4_S5, auiMultiplier)
			ElseIf(MultiplierString == "S5_S4")
				SetFloatValue(None, RS_MULTI_S5_S4, auiMultiplier)
			ElseIf(MultiplierString == "S4_S3")
				SetFloatValue(None, RS_MULTI_S4_S3, auiMultiplier)
			ElseIf(MultiplierString == "S3_S2")
				SetFloatValue(None, RS_MULTI_S3_S2, auiMultiplier)
			ElseIf(MultiplierString == "S2_S1")
				SetFloatValue(None, RS_MULTI_S2_S1, auiMultiplier)
			ElseIf(MultiplierString == "S1_S0")
				SetFloatValue(None, RS_MULTI_S1_S0, auiMultiplier)
			ElseIf(MultiplierString == "S0_S-1")
				SetFloatValue(None, RS_MULTI_S0_SM1, auiMultiplier)
			ElseIf(MultiplierString == "S-1_S-2")
				SetFloatValue(None, RS_MULTI_SM1_SM2, auiMultiplier)
			ElseIf(MultiplierString == "S-2_S-3")
				SetFloatValue(None, RS_MULTI_SM2_SM3, auiMultiplier)
			ElseIf(MultiplierString == "S-3_S-4")
				SetFloatValue(None, RS_MULTI_SM3_SM4, auiMultiplier)
			ElseIf(MultiplierString == "S-4_S-5")
				SetFloatValue(None, RS_MULTI_SM4_SM5, auiMultiplier)
			ElseIf(MultiplierString == "S-5_S-4")
				SetFloatValue(None, RS_MULTI_SM5_SM4, auiMultiplier)
			ElseIf(MultiplierString == "S-4_S-3")
				SetFloatValue(None, RS_MULTI_SM4_SM3, auiMultiplier)
			ElseIf(MultiplierString == "S-3_S-2")
				SetFloatValue(None, RS_MULTI_SM3_SM2, auiMultiplier)
			ElseIf(MultiplierString == "S-2_S-1")
				SetFloatValue(None, RS_MULTI_SM2_SM1, auiMultiplier)
			ElseIf(MultiplierString == "S-1_S0")
				SetFloatValue(None, RS_MULTI_SM1_S0, auiMultiplier)
			EndIf
		Else
			Notify(FW_LOG, "Can't change the global relationship multiplier for " + ModName + " because it is already set by a mod with higher priority. However, it will be set, if this mod has the highest priority.", False)
			Return True
		EndIf
	Else
		Int i = 0

		;Go through the list of changes to the global relationship multiplier
		While(i < RSMultiChanges)
			Form ModToCmp = FormListGet(None, RS_MULTI_CHANGELIST, i) ;Get mod at index i
			Int ModToCmpIdx = FormListFind(None, REGISTERED_RS, ModToCmp) ;Get priority of this comparing mod

			;If the actual mod has a higher priority than the comparing mod then continue cycling the list
			If(ModIndex > ModToCmpIdx)
				i += 1
			Else
				FormListInsert(None, RS_MULTI_CHANGELIST, i, akToken) ;Insert the actual mod into the list before the comparing mod
				FloatListInsert(None, RS_MULTI_S0_S1_CHANGELIST, i, 1.0)
				IntListInsert(None, RS_MULTI_S0_S1_CHANGELIST, i, 0)
				FloatListInsert(None, RS_MULTI_S1_S2_CHANGELIST, i, 0.5)
				IntListInsert(None, RS_MULTI_S1_S2_CHANGELIST, i, 0)
				FloatListInsert(None, RS_MULTI_S2_S3_CHANGELIST, i, 0.25)
				IntListInsert(None, RS_MULTI_S2_S3_CHANGELIST, i, 0)
				FloatListInsert(None, RS_MULTI_S3_S4_CHANGELIST, i, 0.125)
				IntListInsert(None, RS_MULTI_S3_S4_CHANGELIST, i, 0)
				FloatListInsert(None, RS_MULTI_S4_S5_CHANGELIST, i, 0.0625)
				IntListInsert(None, RS_MULTI_S4_S5_CHANGELIST, i, 0)
				FloatListInsert(None, RS_MULTI_S5_S4_CHANGELIST, i, 0.125)
				IntListInsert(None, RS_MULTI_S5_S4_CHANGELIST, i, 0)
				FloatListInsert(None, RS_MULTI_S4_S3_CHANGELIST, i, 0.25)
				IntListInsert(None, RS_MULTI_S4_S3_CHANGELIST, i, 0)
				FloatListInsert(None, RS_MULTI_S3_S2_CHANGELIST, i, 0.5)
				IntListInsert(None, RS_MULTI_S3_S2_CHANGELIST, i, 0)
				FloatListInsert(None, RS_MULTI_S2_S1_CHANGELIST, i, 1.0)
				IntListInsert(None, RS_MULTI_S2_S1_CHANGELIST, i, 0)
				FloatListInsert(None, RS_MULTI_S1_S0_CHANGELIST, i, 2.0)
				IntListInsert(None, RS_MULTI_S1_S0_CHANGELIST, i, 0)
				FloatListInsert(None, RS_MULTI_S0_SM1_CHANGELIST, i, 1.0)
				IntListInsert(None, RS_MULTI_S0_SM1_CHANGELIST, i, 0)
				FloatListInsert(None, RS_MULTI_SM1_SM2_CHANGELIST, i, 0.5)
				IntListInsert(None, RS_MULTI_SM1_SM2_CHANGELIST, i, 0)
				FloatListInsert(None, RS_MULTI_SM2_SM3_CHANGELIST, i, 0.25)
				IntListInsert(None, RS_MULTI_SM2_SM3_CHANGELIST, i, 0)
				FloatListInsert(None, RS_MULTI_SM3_SM4_CHANGELIST, i, 0.125)
				IntListInsert(None, RS_MULTI_SM3_SM4_CHANGELIST, i, 0)
				FloatListInsert(None, RS_MULTI_SM4_SM5_CHANGELIST, i, 0.0625)
				IntListInsert(None, RS_MULTI_SM4_SM5_CHANGELIST, i, 0)
				FloatListInsert(None, RS_MULTI_SM5_SM4_CHANGELIST, i, 0.125)
				IntListInsert(None, RS_MULTI_SM5_SM4_CHANGELIST, i, 0)
				FloatListInsert(None, RS_MULTI_SM4_SM3_CHANGELIST, i, 0.25)
				IntListInsert(None, RS_MULTI_SM4_SM3_CHANGELIST, i, 0)
				FloatListInsert(None, RS_MULTI_SM3_SM2_CHANGELIST, i, 0.5)
				IntListInsert(None, RS_MULTI_SM3_SM2_CHANGELIST, i, 0)
				FloatListInsert(None, RS_MULTI_SM2_SM1_CHANGELIST, i, 1.0)
				IntListInsert(None, RS_MULTI_SM2_SM1_CHANGELIST, i, 0)
				FloatListInsert(None, RS_MULTI_SM1_S0_CHANGELIST, i, 2.0)
				IntListInsert(None, RS_MULTI_SM1_S0_CHANGELIST, i, 0)

				If(MultiplierString == "S0_S1")
					FloatListSet(None, RS_MULTI_S0_S1_CHANGELIST, i, auiMultiplier)
					IntListSet(None, RS_MULTI_S0_S1_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S1_S2")
					FloatListSet(None, RS_MULTI_S1_S2_CHANGELIST, i, auiMultiplier)
					IntListSet(None, RS_MULTI_S1_S2_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S2_S3")
					FloatListSet(None, RS_MULTI_S2_S3_CHANGELIST, i, auiMultiplier)
					IntListSet(None, RS_MULTI_S2_S3_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S3_S4")
					FloatListSet(None, RS_MULTI_S3_S4_CHANGELIST, i, auiMultiplier)
					IntListSet(None, RS_MULTI_S3_S4_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S4_S5")
					FloatListSet(None, RS_MULTI_S4_S5_CHANGELIST, i, auiMultiplier)
					IntListSet(None, RS_MULTI_S4_S5_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S5_S4")
					FloatListSet(None, RS_MULTI_S5_S4_CHANGELIST, i, auiMultiplier)
					IntListSet(None, RS_MULTI_S5_S4_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S4_S3")
					FloatListSet(None, RS_MULTI_S4_S3_CHANGELIST, i, auiMultiplier)
					IntListSet(None, RS_MULTI_S4_S3_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S3_S2")
					FloatListSet(None, RS_MULTI_S3_S2_CHANGELIST, i, auiMultiplier)
					IntListSet(None, RS_MULTI_S3_S2_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S2_S1")
					FloatListSet(None, RS_MULTI_S2_S1_CHANGELIST, i, auiMultiplier)
					IntListSet(None, RS_MULTI_S2_S1_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S1_S0")
					FloatListSet(None, RS_MULTI_S1_S0_CHANGELIST, i, auiMultiplier)
					IntListSet(None, RS_MULTI_S1_S0_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S0_S-1")
					FloatListSet(None, RS_MULTI_S0_SM1_CHANGELIST, i, auiMultiplier)
					IntListSet(None, RS_MULTI_S0_SM1_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-1_S-2")
					FloatListSet(None, RS_MULTI_SM1_SM2_CHANGELIST, i, auiMultiplier)
					IntListSet(None, RS_MULTI_SM1_SM2_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-2_S-3")
					FloatListSet(None, RS_MULTI_SM2_SM3_CHANGELIST, i, auiMultiplier)
					IntListSet(None, RS_MULTI_SM2_SM3_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-3_S-4")
					FloatListSet(None, RS_MULTI_SM3_SM4_CHANGELIST, i, auiMultiplier)
					IntListSet(None, RS_MULTI_SM3_SM4_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-4_S-5")
					FloatListSet(None, RS_MULTI_SM4_SM5_CHANGELIST, i, auiMultiplier)
					IntListSet(None, RS_MULTI_SM4_SM5_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-5_S-4")
					FloatListSet(None, RS_MULTI_SM5_SM4_CHANGELIST, i, auiMultiplier)
					IntListSet(None, RS_MULTI_SM5_SM4_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-4_S-3")
					FloatListSet(None, RS_MULTI_SM4_SM3_CHANGELIST, i, auiMultiplier)
					IntListSet(None, RS_MULTI_SM4_SM3_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-3_S-2")
					FloatListSet(None, RS_MULTI_SM3_SM2_CHANGELIST, i, auiMultiplier)
					IntListSet(None, RS_MULTI_SM3_SM2_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-2_S-1")
					FloatListSet(None, RS_MULTI_SM2_SM1_CHANGELIST, i, auiMultiplier)
					IntListSet(None, RS_MULTI_SM2_SM1_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-1_S0")
					FloatListSet(None, RS_MULTI_SM1_S0_CHANGELIST, i, auiMultiplier)
					IntListSet(None, RS_MULTI_SM1_S0_CHANGELIST, i, 1)
				EndIf
	
				Notify(FW_LOG, "Can't change the global relationship multiplier for " + ModName + " because it is already set by a mod with higher priority. However, it will be set, if this mod has the highest priority.", False)
				Return True
			EndIf
		EndWhile
	EndIf

	;No changes made to the array, so just add the value to it and apply the changes to the framework
	FormListAdd(None, RS_MULTI_CHANGELIST, akToken)
	FloatListAdd(None, RS_MULTI_S0_S1_CHANGELIST, 1.0)
	IntListAdd(None, RS_MULTI_S0_S1_CHANGELIST, 0)
	FloatListAdd(None, RS_MULTI_S1_S2_CHANGELIST, 0.5)
	IntListAdd(None, RS_MULTI_S1_S2_CHANGELIST, 0)
	FloatListAdd(None, RS_MULTI_S2_S3_CHANGELIST, 0.25)
	IntListAdd(None, RS_MULTI_S2_S3_CHANGELIST, 0)
	FloatListAdd(None, RS_MULTI_S3_S4_CHANGELIST, 0.125)
	IntListAdd(None, RS_MULTI_S3_S4_CHANGELIST, 0)
	FloatListAdd(None, RS_MULTI_S4_S5_CHANGELIST, 0.0625)
	IntListAdd(None, RS_MULTI_S4_S5_CHANGELIST, 0)
	FloatListAdd(None, RS_MULTI_S5_S4_CHANGELIST, 0.125)
	IntListAdd(None, RS_MULTI_S5_S4_CHANGELIST, 0)
	FloatListAdd(None, RS_MULTI_S4_S3_CHANGELIST, 0.25)
	IntListAdd(None, RS_MULTI_S4_S3_CHANGELIST, 0)
	FloatListAdd(None, RS_MULTI_S3_S2_CHANGELIST, 0.5)
	IntListAdd(None, RS_MULTI_S3_S2_CHANGELIST, 0)
	FloatListAdd(None, RS_MULTI_S2_S1_CHANGELIST, 1.0)
	IntListAdd(None, RS_MULTI_S2_S1_CHANGELIST, 0)
	FloatListAdd(None, RS_MULTI_S1_S0_CHANGELIST, 2.0)
	IntListAdd(None, RS_MULTI_S1_S0_CHANGELIST, 0)
	FloatListAdd(None, RS_MULTI_S0_SM1_CHANGELIST, 1.0)
	IntListAdd(None, RS_MULTI_S0_SM1_CHANGELIST, 0)
	FloatListAdd(None, RS_MULTI_SM1_SM2_CHANGELIST, 0.5)
	IntListAdd(None, RS_MULTI_SM1_SM2_CHANGELIST, 0)
	FloatListAdd(None, RS_MULTI_SM2_SM3_CHANGELIST, 0.25)
	IntListAdd(None, RS_MULTI_SM2_SM3_CHANGELIST, 0)
	FloatListAdd(None, RS_MULTI_SM3_SM4_CHANGELIST, 0.125)
	IntListAdd(None, RS_MULTI_SM3_SM4_CHANGELIST, 0)
	FloatListAdd(None, RS_MULTI_SM4_SM5_CHANGELIST, 0.0625)
	IntListAdd(None, RS_MULTI_SM4_SM5_CHANGELIST, 0)
	FloatListAdd(None, RS_MULTI_SM5_SM4_CHANGELIST, 0.125)
	IntListAdd(None, RS_MULTI_SM5_SM4_CHANGELIST, 0)
	FloatListAdd(None, RS_MULTI_SM4_SM3_CHANGELIST, 0.25)
	IntListAdd(None, RS_MULTI_SM4_SM3_CHANGELIST, 0)
	FloatListAdd(None, RS_MULTI_SM3_SM2_CHANGELIST, 0.5)
	IntListAdd(None, RS_MULTI_SM3_SM2_CHANGELIST, 0)
	FloatListAdd(None, RS_MULTI_SM2_SM1_CHANGELIST, 1.0)
	IntListAdd(None, RS_MULTI_SM2_SM1_CHANGELIST, 0)
	FloatListAdd(None, RS_MULTI_SM1_S0_CHANGELIST, 2.0)
	Int i = IntListAdd(None, RS_MULTI_SM1_S0_CHANGELIST, 0)

	If(MultiplierString == "S0_S1")
		SetFloatValue(None, RS_MULTI_S0_S1, auiMultiplier)
		FloatListSet(None, RS_MULTI_S0_S1_CHANGELIST, i, auiMultiplier)
		IntListSet(None, RS_MULTI_S0_S1_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S1_S2")
		SetFloatValue(None, RS_MULTI_S1_S2, auiMultiplier)
		FloatListSet(None, RS_MULTI_S1_S2_CHANGELIST, i, auiMultiplier)
		IntListSet(None, RS_MULTI_S1_S2_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S2_S3")
		SetFloatValue(None, RS_MULTI_S2_S3, auiMultiplier)
		FloatListSet(None, RS_MULTI_S2_S3_CHANGELIST, i, auiMultiplier)
		IntListSet(None, RS_MULTI_S2_S3_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S3_S4")
		SetFloatValue(None, RS_MULTI_S3_S4, auiMultiplier)
		FloatListSet(None, RS_MULTI_S3_S4_CHANGELIST, i, auiMultiplier)
		IntListSet(None, RS_MULTI_S3_S4_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S4_S5")
		SetFloatValue(None, RS_MULTI_S4_S5, auiMultiplier)
		FloatListSet(None, RS_MULTI_S4_S5_CHANGELIST, i, auiMultiplier)
		IntListSet(None, RS_MULTI_S4_S5_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S5_S4")
		SetFloatValue(None, RS_MULTI_S5_S4, auiMultiplier)
		FloatListSet(None, RS_MULTI_S5_S4_CHANGELIST, i, auiMultiplier)
		IntListSet(None, RS_MULTI_S5_S4_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S4_S3")
		SetFloatValue(None, RS_MULTI_S4_S3, auiMultiplier)
		FloatListSet(None, RS_MULTI_S4_S3_CHANGELIST, i, auiMultiplier)
		IntListSet(None, RS_MULTI_S4_S3_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S3_S2")
		SetFloatValue(None, RS_MULTI_S3_S2, auiMultiplier)
		FloatListSet(None, RS_MULTI_S3_S2_CHANGELIST, i, auiMultiplier)
		IntListSet(None, RS_MULTI_S3_S2_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S2_S1")
		SetFloatValue(None, RS_MULTI_S2_S1, auiMultiplier)
		FloatListSet(None, RS_MULTI_S2_S1_CHANGELIST, i, auiMultiplier)
		IntListSet(None, RS_MULTI_S2_S1_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S1_S0")
		SetFloatValue(None, RS_MULTI_S1_S0, auiMultiplier)
		FloatListSet(None, RS_MULTI_S1_S0_CHANGELIST, i, auiMultiplier)
		IntListSet(None, RS_MULTI_S1_S0_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S0_S-1")
		SetFloatValue(None, RS_MULTI_S0_SM1, auiMultiplier)
		FloatListSet(None, RS_MULTI_S0_SM1_CHANGELIST, i, auiMultiplier)
		IntListSet(None, RS_MULTI_S0_SM1_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-1_S-2")
		SetFloatValue(None, RS_MULTI_SM1_SM2, auiMultiplier)
		FloatListSet(None, RS_MULTI_SM1_SM2_CHANGELIST, i, auiMultiplier)
		IntListSet(None, RS_MULTI_SM1_SM2_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-2_S-3")
		SetFloatValue(None, RS_MULTI_SM2_SM3, auiMultiplier)
		FloatListSet(None, RS_MULTI_SM2_SM3_CHANGELIST, i, auiMultiplier)
		IntListSet(None, RS_MULTI_SM2_SM3_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-3_S-4")
		SetFloatValue(None, RS_MULTI_SM3_SM4, auiMultiplier)
		FloatListSet(None, RS_MULTI_SM3_SM4_CHANGELIST, i, auiMultiplier)
		IntListSet(None, RS_MULTI_SM3_SM4_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-4_S-5")
		SetFloatValue(None, RS_MULTI_SM4_SM5, auiMultiplier)
		FloatListSet(None, RS_MULTI_SM4_SM5_CHANGELIST, i, auiMultiplier)
		IntListSet(None, RS_MULTI_SM4_SM5_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-5_S-4")
		SetFloatValue(None, RS_MULTI_SM5_SM4, auiMultiplier)
		FloatListSet(None, RS_MULTI_SM5_SM4_CHANGELIST, i, auiMultiplier)
		IntListSet(None, RS_MULTI_SM5_SM4_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-4_S-3")
		SetFloatValue(None, RS_MULTI_SM4_SM3, auiMultiplier)
		FloatListSet(None, RS_MULTI_SM4_SM3_CHANGELIST, i, auiMultiplier)
		IntListSet(None, RS_MULTI_SM4_SM3_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-3_S-2")
		SetFloatValue(None, RS_MULTI_SM3_SM2, auiMultiplier)
		FloatListSet(None, RS_MULTI_SM3_SM2_CHANGELIST, i, auiMultiplier)
		IntListSet(None, RS_MULTI_SM3_SM2_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-2_S-1")
		SetFloatValue(None, RS_MULTI_SM2_SM1, auiMultiplier)
		FloatListSet(None, RS_MULTI_SM2_SM1_CHANGELIST, i, auiMultiplier)
		IntListSet(None, RS_MULTI_SM2_SM1_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-1_S0")
		SetFloatValue(None, RS_MULTI_SM1_S0, auiMultiplier)
		FloatListSet(None, RS_MULTI_SM1_S0_CHANGELIST, i, auiMultiplier)
		IntListSet(None, RS_MULTI_SM1_S0_CHANGELIST, i, 1)
	EndIf

	Return True
EndFunction

Bool Function RemoveGlobalRelationshipMulti(Quest akToken, Int aiFromRelationshipRank, Int aiToRelationshipRank)
	If(_GetModIndexFromForm(akToken, REGISTERED_RS) == -1)
		Warn(FW_LOG, "A mod tried to remove its changes to the global relationship multipliers. It passed a wrong token, however. FormID of the token is " + akToken.GetFormID() + ".")
		Return False
	ElseIf(_GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST) == -1)
		Notify(FW_LOG, "A mod tried to remove its changes to the global relationship multipliers. But there were no changes made by this mod. FormID of the token is " + akToken.GetFormID() + ".")
		Return False
	EndIf

	If(aiFromRelationshipRank < -5 || aiFromRelationshipRank > 5)
		Throw(FW_LOG, "Argument aiFromRelationshipRank was not set correctly. The range is from -5 to 5.", "Invalid arguments")
		Return False
	EndIf

	If(aiToRelationshipRank < -5 || aiToRelationshipRank > 5)
		Throw(FW_LOG, "Argument aiToRelationshipRank was not set correctly. The range is from -5 to 5.", "Invalid arguments")
		Return False
	EndIf

	If(aiFromRelationshipRank == aiToRelationshipRank)
		Throw(FW_LOG, "Argument aiToRelationshipRank can not be the same value as aiFromRelationshipRank.", "Invalid arguments")
		Return False
	EndIf
	
	If(aiFromRelationshipRank - aiToRelationshipRank != 1 && aiFromRelationshipRank - aiToRelationshipRank != -1)
		Throw(FW_LOG, "Multiplier can only be set for the next or previous rank. From Rank " + aiFromRelationshipRank + " to Rank " + aiToRelationshipRank + " is incorrect.", "Invalid arguments")
		Return False
	EndIf
	
	Int ModIndex = _GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST)
	String MultiplierString = "S" + aiFromRelationshipRank As String + "_S" + aiToRelationshipRank As String
	
	;if this mod has not set a custom multiplier for this stage, return false (nothing to remove)
	If(MultiplierString == "S0_S1")
		If (IntListGet(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S1_S2")
		If (IntListGet(None, RS_MULTI_S1_S2_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S2_S3")
		If (IntListGet(None, RS_MULTI_S2_S3_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S3_S4")
		If (IntListGet(None, RS_MULTI_S3_S4_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S4_S5")
		If (IntListGet(None, RS_MULTI_S4_S5_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S5_S4")
		If (IntListGet(None, RS_MULTI_S5_S4_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S4_S3")
		If (IntListGet(None, RS_MULTI_S4_S3_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S3_S2")
		If (IntListGet(None, RS_MULTI_S3_S2_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S2_S1")
		If (IntListGet(None, RS_MULTI_S2_S1_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S1_S0")
		If (IntListGet(None, RS_MULTI_S1_S0_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S0_S-1")
		If (IntListGet(None, RS_MULTI_S0_SM1_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S-1_S-2")
		If (IntListGet(None, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S-2_S-3")
		If (IntListGet(None, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S-3_S-4")
		If (IntListGet(None, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S-4_S-5")
		If (IntListGet(None, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S-5_S-4")
		If (IntListGet(None, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S-4_S-3")
		If (IntListGet(None, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S-3_S-2")
		If (IntListGet(None, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S-2_S-1")
		If (IntListGet(None, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S-1_S0")
		If (IntListGet(None, RS_MULTI_SM1_S0_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	EndIf
	
	;if the mod does not affect any other multipliers, remove it from the arrays after checking in case it had highest priority
	If ((IntListGet(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex) + \
		IntListGet(None, RS_MULTI_S1_S2_CHANGELIST, ModIndex) + \
		IntListGet(None, RS_MULTI_S2_S3_CHANGELIST, ModIndex) + \
		IntListGet(None, RS_MULTI_S3_S4_CHANGELIST, ModIndex) + \
		IntListGet(None, RS_MULTI_S4_S5_CHANGELIST, ModIndex) + \
		IntListGet(None, RS_MULTI_S5_S4_CHANGELIST, ModIndex) + \
		IntListGet(None, RS_MULTI_S4_S3_CHANGELIST, ModIndex) + \
		IntListGet(None, RS_MULTI_S3_S2_CHANGELIST, ModIndex) + \
		IntListGet(None, RS_MULTI_S2_S1_CHANGELIST, ModIndex) + \
		IntListGet(None, RS_MULTI_S1_S0_CHANGELIST, ModIndex) + \
		IntListGet(None, RS_MULTI_S0_SM1_CHANGELIST, ModIndex) + \
		IntListGet(None, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex) + \
		IntListGet(None, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex) + \
		IntListGet(None, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex) + \
		IntListGet(None, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex) + \
		IntListGet(None, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex) + \
		IntListGet(None, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex) + \
		IntListGet(None, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex) + \
		IntListGet(None, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex) + \
		IntListGet(None, RS_MULTI_SM1_S0_CHANGELIST, ModIndex)) == 1)
		
		;if this is not the only mod in the multipliers changelist
		If (FormListCount(None, RS_MULTI_CHANGELIST) > 1)
			;if the mod had highest priority, then set the multiplier values to those specified by the next mod
			If (ModIndex == FormListCount(None, RS_MULTI_CHANGELIST) - 1)
				SetFloatValue(None, RS_MULTI_S0_S1, FloatListGet(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex - 1))
				SetFloatValue(None, RS_MULTI_S1_S2, FloatListGet(None, RS_MULTI_S1_S2_CHANGELIST, ModIndex - 1))
				SetFloatValue(None, RS_MULTI_S2_S3, FloatListGet(None, RS_MULTI_S2_S3_CHANGELIST, ModIndex - 1))
				SetFloatValue(None, RS_MULTI_S3_S4, FloatListGet(None, RS_MULTI_S3_S4_CHANGELIST, ModIndex - 1))
				SetFloatValue(None, RS_MULTI_S4_S5, FloatListGet(None, RS_MULTI_S4_S5_CHANGELIST, ModIndex - 1))
				SetFloatValue(None, RS_MULTI_S5_S4, FloatListGet(None, RS_MULTI_S5_S4_CHANGELIST, ModIndex - 1))
				SetFloatValue(None, RS_MULTI_S4_S3, FloatListGet(None, RS_MULTI_S4_S3_CHANGELIST, ModIndex - 1))
				SetFloatValue(None, RS_MULTI_S3_S2, FloatListGet(None, RS_MULTI_S3_S2_CHANGELIST, ModIndex - 1))
				SetFloatValue(None, RS_MULTI_S2_S1, FloatListGet(None, RS_MULTI_S2_S1_CHANGELIST, ModIndex - 1))
				SetFloatValue(None, RS_MULTI_S1_S0, FloatListGet(None, RS_MULTI_S1_S0_CHANGELIST, ModIndex - 1))
				SetFloatValue(None, RS_MULTI_S0_SM1, FloatListGet(None, RS_MULTI_S0_SM1_CHANGELIST, ModIndex - 1))
				SetFloatValue(None, RS_MULTI_SM1_SM2, FloatListGet(None, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex - 1))
				SetFloatValue(None, RS_MULTI_SM2_SM3, FloatListGet(None, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex - 1))
				SetFloatValue(None, RS_MULTI_SM3_SM4, FloatListGet(None, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex - 1))
				SetFloatValue(None, RS_MULTI_SM4_SM5, FloatListGet(None, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex - 1))
				SetFloatValue(None, RS_MULTI_SM5_SM4, FloatListGet(None, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex - 1))
				SetFloatValue(None, RS_MULTI_SM4_SM3, FloatListGet(None, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex - 1))
				SetFloatValue(None, RS_MULTI_SM3_SM2, FloatListGet(None, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex - 1))
				SetFloatValue(None, RS_MULTI_SM2_SM1, FloatListGet(None, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex - 1))
				SetFloatValue(None, RS_MULTI_SM1_S0, FloatListGet(None, RS_MULTI_SM1_S0_CHANGELIST, ModIndex - 1))
			EndIf
		EndIf
		
		;remove the mod from the arrays
		FloatListRemoveAt(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex)
		IntListRemoveAt(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex)
		FloatListRemoveAt(None, RS_MULTI_S1_S2_CHANGELIST, ModIndex)
		IntListRemoveAt(None, RS_MULTI_S1_S2_CHANGELIST, ModIndex)
		FloatListRemoveAt(None, RS_MULTI_S2_S3_CHANGELIST, ModIndex)
		IntListRemoveAt(None, RS_MULTI_S2_S3_CHANGELIST, ModIndex)
		FloatListRemoveAt(None, RS_MULTI_S3_S4_CHANGELIST, ModIndex)
		IntListRemoveAt(None, RS_MULTI_S3_S4_CHANGELIST, ModIndex)
		FloatListRemoveAt(None, RS_MULTI_S4_S5_CHANGELIST, ModIndex)
		IntListRemoveAt(None, RS_MULTI_S4_S5_CHANGELIST, ModIndex)
		FloatListRemoveAt(None, RS_MULTI_S5_S4_CHANGELIST, ModIndex)
		IntListRemoveAt(None, RS_MULTI_S5_S4_CHANGELIST, ModIndex)
		FloatListRemoveAt(None, RS_MULTI_S4_S3_CHANGELIST, ModIndex)
		IntListRemoveAt(None, RS_MULTI_S4_S3_CHANGELIST, ModIndex)
		FloatListRemoveAt(None, RS_MULTI_S3_S2_CHANGELIST, ModIndex)
		IntListRemoveAt(None, RS_MULTI_S3_S2_CHANGELIST, ModIndex)
		FloatListRemoveAt(None, RS_MULTI_S2_S1_CHANGELIST, ModIndex)
		IntListRemoveAt(None, RS_MULTI_S2_S1_CHANGELIST, ModIndex)
		FloatListRemoveAt(None, RS_MULTI_S1_S0_CHANGELIST, ModIndex)
		IntListRemoveAt(None, RS_MULTI_S1_S0_CHANGELIST, ModIndex)
		FloatListRemoveAt(None, RS_MULTI_S0_SM1_CHANGELIST, ModIndex)
		IntListRemoveAt(None, RS_MULTI_S0_SM1_CHANGELIST, ModIndex)
		FloatListRemoveAt(None, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex)
		IntListRemoveAt(None, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex)
		FloatListRemoveAt(None, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex)
		IntListRemoveAt(None, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex)
		FloatListRemoveAt(None, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex)
		IntListRemoveAt(None, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex)
		FloatListRemoveAt(None, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex)
		IntListRemoveAt(None, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex)
		FloatListRemoveAt(None, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex)
		IntListRemoveAt(None, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex)
		FloatListRemoveAt(None, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex)
		IntListRemoveAt(None, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex)
		FloatListRemoveAt(None, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex)
		IntListRemoveAt(None, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex)
		FloatListRemoveAt(None, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex)
		IntListRemoveAt(None, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex)
		FloatListRemoveAt(None, RS_MULTI_SM1_S0_CHANGELIST, ModIndex)
		IntListRemoveAt(None, RS_MULTI_SM1_S0_CHANGELIST, ModIndex)
		
		FormListRemoveAt(None, RS_MULTI_CHANGELIST, ModIndex)
		
		;if the arrays are now empty, clear them and unset the multipliers value
		If (FormListCount(None, RS_MULTI_CHANGELIST) == 0)
			FormListClear(None, RS_MULTI_CHANGELIST)
			
			FloatListClear(None, RS_MULTI_S0_S1_CHANGELIST)
			IntListClear(None, RS_MULTI_S0_S1_CHANGELIST)
			FloatListClear(None, RS_MULTI_S1_S2_CHANGELIST)
			IntListClear(None, RS_MULTI_S1_S2_CHANGELIST)
			FloatListClear(None, RS_MULTI_S2_S3_CHANGELIST)
			IntListClear(None, RS_MULTI_S2_S3_CHANGELIST)
			FloatListClear(None, RS_MULTI_S3_S4_CHANGELIST)
			IntListClear(None, RS_MULTI_S3_S4_CHANGELIST)
			FloatListClear(None, RS_MULTI_S4_S5_CHANGELIST)
			IntListClear(None, RS_MULTI_S4_S5_CHANGELIST)
			FloatListClear(None, RS_MULTI_S5_S4_CHANGELIST)
			IntListClear(None, RS_MULTI_S5_S4_CHANGELIST)
			FloatListClear(None, RS_MULTI_S4_S3_CHANGELIST)
			IntListClear(None, RS_MULTI_S4_S3_CHANGELIST)
			FloatListClear(None, RS_MULTI_S3_S2_CHANGELIST)
			IntListClear(None, RS_MULTI_S3_S2_CHANGELIST)
			FloatListClear(None, RS_MULTI_S2_S1_CHANGELIST)
			IntListClear(None, RS_MULTI_S2_S1_CHANGELIST)
			FloatListClear(None, RS_MULTI_S1_S0_CHANGELIST)
			IntListClear(None, RS_MULTI_S1_S0_CHANGELIST)
			FloatListClear(None, RS_MULTI_S0_SM1_CHANGELIST)
			IntListClear(None, RS_MULTI_S0_SM1_CHANGELIST)
			FloatListClear(None, RS_MULTI_SM1_SM2_CHANGELIST)
			IntListClear(None, RS_MULTI_SM1_SM2_CHANGELIST)
			FloatListClear(None, RS_MULTI_SM2_SM3_CHANGELIST)
			IntListClear(None, RS_MULTI_SM2_SM3_CHANGELIST)
			FloatListClear(None, RS_MULTI_SM3_SM4_CHANGELIST)
			IntListClear(None, RS_MULTI_SM3_SM4_CHANGELIST)
			FloatListClear(None, RS_MULTI_SM4_SM5_CHANGELIST)
			IntListClear(None, RS_MULTI_SM4_SM5_CHANGELIST)
			FloatListClear(None, RS_MULTI_SM5_SM4_CHANGELIST)
			IntListClear(None, RS_MULTI_SM5_SM4_CHANGELIST)
			FloatListClear(None, RS_MULTI_SM4_SM3_CHANGELIST)
			IntListClear(None, RS_MULTI_SM4_SM3_CHANGELIST)
			FloatListClear(None, RS_MULTI_SM3_SM2_CHANGELIST)
			IntListClear(None, RS_MULTI_SM3_SM2_CHANGELIST)
			FloatListClear(None, RS_MULTI_SM2_SM1_CHANGELIST)
			IntListClear(None, RS_MULTI_SM2_SM1_CHANGELIST)
			FloatListClear(None, RS_MULTI_SM1_S0_CHANGELIST)
			IntListClear(None, RS_MULTI_SM1_S0_CHANGELIST)
			
			UnSetFloatValue(None, RS_MULTI_S0_S1)
			UnSetFloatValue(None, RS_MULTI_S1_S2)
			UnSetFloatValue(None, RS_MULTI_S2_S3)
			UnSetFloatValue(None, RS_MULTI_S3_S4)
			UnSetFloatValue(None, RS_MULTI_S4_S5)
			UnSetFloatValue(None, RS_MULTI_S5_S4)
			UnSetFloatValue(None, RS_MULTI_S4_S3)
			UnSetFloatValue(None, RS_MULTI_S3_S2)
			UnSetFloatValue(None, RS_MULTI_S2_S1)
			UnSetFloatValue(None, RS_MULTI_S1_S0)
			UnSetFloatValue(None, RS_MULTI_S0_SM1)
			UnSetFloatValue(None, RS_MULTI_SM1_SM2)
			UnSetFloatValue(None, RS_MULTI_SM2_SM3)
			UnSetFloatValue(None, RS_MULTI_SM3_SM4)
			UnSetFloatValue(None, RS_MULTI_SM4_SM5)
			UnSetFloatValue(None, RS_MULTI_SM5_SM4)
			UnSetFloatValue(None, RS_MULTI_SM4_SM3)
			UnSetFloatValue(None, RS_MULTI_SM3_SM2)
			UnSetFloatValue(None, RS_MULTI_SM2_SM1)
			UnSetFloatValue(None, RS_MULTI_SM1_S0)
		EndIf
		
		Return True
		
	Else	;if the mod does affect other multipliers i.e. it will not be removed from the arrays
		;if the mod had the highest priority, update the actual multiplier value to the default framework value
		If (ModIndex == FormListCount(None, RS_MULTI_CHANGELIST) - 1)
			If(MultiplierString == "S0_S1")
				SetFloatValue(None, RS_MULTI_S0_S1_CHANGELIST, 1.0)
			ElseIf(MultiplierString == "S1_S2")
				SetFloatValue(None, RS_MULTI_S1_S2_CHANGELIST, 0.5)
			ElseIf(MultiplierString == "S2_S3")
				SetFloatValue(None, RS_MULTI_S2_S3_CHANGELIST, 0.25)
			ElseIf(MultiplierString == "S3_S4")
				SetFloatValue(None, RS_MULTI_S3_S4_CHANGELIST, 0.125)
			ElseIf(MultiplierString == "S4_S5")
				SetFloatValue(None, RS_MULTI_S4_S5_CHANGELIST, 0.0625)
			ElseIf(MultiplierString == "S5_S4")
				SetFloatValue(None, RS_MULTI_S5_S4_CHANGELIST, 0.125)
			ElseIf(MultiplierString == "S4_S3")
				SetFloatValue(None, RS_MULTI_S4_S3_CHANGELIST, 0.25)
			ElseIf(MultiplierString == "S3_S2")
				SetFloatValue(None, RS_MULTI_S3_S2_CHANGELIST, 0.5)
			ElseIf(MultiplierString == "S2_S1")
				SetFloatValue(None, RS_MULTI_S2_S1_CHANGELIST, 1.0)
			ElseIf(MultiplierString == "S1_S0")
				SetFloatValue(None, RS_MULTI_S1_S0_CHANGELIST, 2.0)
			ElseIf(MultiplierString == "S0_S-1")
				SetFloatValue(None, RS_MULTI_S0_SM1_CHANGELIST, 1.0)
			ElseIf(MultiplierString == "S-1_S-2")
				SetFloatValue(None, RS_MULTI_SM1_SM2_CHANGELIST, 0.5)
			ElseIf(MultiplierString == "S-2_S-3")
				SetFloatValue(None, RS_MULTI_SM2_SM3_CHANGELIST, 0.25)
			ElseIf(MultiplierString == "S-3_S-4")
				SetFloatValue(None, RS_MULTI_SM3_SM4_CHANGELIST, 0.125)
			ElseIf(MultiplierString == "S-4_S-5")
				SetFloatValue(None, RS_MULTI_SM4_SM5_CHANGELIST, 0.0625)
			ElseIf(MultiplierString == "S-5_S-4")
				SetFloatValue(None, RS_MULTI_SM5_SM4_CHANGELIST, 0.125)
			ElseIf(MultiplierString == "S-4_S-3")
				SetFloatValue(None, RS_MULTI_SM4_SM3_CHANGELIST, 0.25)
			ElseIf(MultiplierString == "S-3_S-2")
				SetFloatValue(None, RS_MULTI_SM3_SM2_CHANGELIST, 0.5)
			ElseIf(MultiplierString == "S-2_S-1")
				SetFloatValue(None, RS_MULTI_SM2_SM1_CHANGELIST, 1.0)
			ElseIf(MultiplierString == "S-1_S0")
				SetFloatValue(None, RS_MULTI_SM1_S0_CHANGELIST, 2.0)
			EndIf
		EndIf
		
		;update all the mod's changes
		If(MultiplierString == "S0_S1")
			FloatListSet(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex, 1.0)
			IntListSet(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S1_S2")
			FloatListSet(None, RS_MULTI_S1_S2_CHANGELIST, ModIndex, 0.5)
			IntListSet(None, RS_MULTI_S1_S2_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S2_S3")
			FloatListSet(None, RS_MULTI_S2_S3_CHANGELIST, ModIndex, 0.25)
			IntListSet(None, RS_MULTI_S2_S3_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S3_S4")
			FloatListSet(None, RS_MULTI_S3_S4_CHANGELIST, ModIndex, 0.125)
			IntListSet(None, RS_MULTI_S3_S4_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S4_S5")
			FloatListSet(None, RS_MULTI_S4_S5_CHANGELIST, ModIndex, 0.0625)
			IntListSet(None, RS_MULTI_S4_S5_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S5_S4")
			FloatListSet(None, RS_MULTI_S5_S4_CHANGELIST, ModIndex, 0.125)
			IntListSet(None, RS_MULTI_S5_S4_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S4_S3")
			FloatListSet(None, RS_MULTI_S4_S3_CHANGELIST, ModIndex, 0.25)
			IntListSet(None, RS_MULTI_S4_S3_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S3_S2")
			FloatListSet(None, RS_MULTI_S3_S2_CHANGELIST, ModIndex, 0.5)
			IntListSet(None, RS_MULTI_S3_S2_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S2_S1")
			FloatListSet(None, RS_MULTI_S2_S1_CHANGELIST, ModIndex, 1.0)
			IntListSet(None, RS_MULTI_S2_S1_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S1_S0")
			FloatListSet(None, RS_MULTI_S1_S0_CHANGELIST, ModIndex, 2.0)
			IntListSet(None, RS_MULTI_S1_S0_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S0_S-1")
			FloatListSet(None, RS_MULTI_S0_SM1_CHANGELIST, ModIndex, 1.0)
			IntListSet(None, RS_MULTI_S0_SM1_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S-1_S-2")
			FloatListSet(None, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex, 0.5)
			IntListSet(None, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S-2_S-3")
			FloatListSet(None, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex, 0.25)
			IntListSet(None, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S-3_S-4")
			FloatListSet(None, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex, 0.125)
			IntListSet(None, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S-4_S-5")
			FloatListSet(None, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex, 0.0625)
			IntListSet(None, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S-5_S-4")
			FloatListSet(None, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex, 0.125)
			IntListSet(None, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S-4_S-3")
			FloatListSet(None, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex, 0.25)
			IntListSet(None, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S-3_S-2")
			FloatListSet(None, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex, 0.5)
			IntListSet(None, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S-2_S-1")
			FloatListSet(None, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex, 1.0)
			IntListSet(None, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S-1_S0")
			FloatListSet(None, RS_MULTI_SM1_S0_CHANGELIST, ModIndex, 2.0)
			IntListSet(None, RS_MULTI_SM1_S0_CHANGELIST, ModIndex, 0)
		EndIf
		
		Return True
	EndIf
EndFunction

Bool Function RemoveAllGlobalRelationshipMulti(Quest akToken)
	If(_GetModIndexFromForm(akToken, REGISTERED_RS) == -1)
		Warn(FW_LOG, "A mod tried to remove its changes to the global relationship multipliers. It passed a wrong token, however. FormID of the token is " + akToken.GetFormID() + ".")
		Return False
	ElseIf(_GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST) == -1)
		Notify(FW_LOG, "A mod tried to remove its changes to the global relationship multipliers. But there were no changes made by this mod. FormID of the token is " + akToken.GetFormID() + ".")
		Return False
	EndIf
	
	Int ModIndex = _GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST)
	
	;if this is not the only mod in the multipliers changelist
	If (FormListCount(None, RS_MULTI_CHANGELIST) > 1)
		;if the mod had highest priority, then set the multiplier values to those specified by the next mod
		If (ModIndex == FormListCount(None, RS_MULTI_CHANGELIST) - 1)
			SetFloatValue(None, RS_MULTI_S0_S1, FloatListGet(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex - 1))
			SetFloatValue(None, RS_MULTI_S1_S2, FloatListGet(None, RS_MULTI_S1_S2_CHANGELIST, ModIndex - 1))
			SetFloatValue(None, RS_MULTI_S2_S3, FloatListGet(None, RS_MULTI_S2_S3_CHANGELIST, ModIndex - 1))
			SetFloatValue(None, RS_MULTI_S3_S4, FloatListGet(None, RS_MULTI_S3_S4_CHANGELIST, ModIndex - 1))
			SetFloatValue(None, RS_MULTI_S4_S5, FloatListGet(None, RS_MULTI_S4_S5_CHANGELIST, ModIndex - 1))
			SetFloatValue(None, RS_MULTI_S5_S4, FloatListGet(None, RS_MULTI_S5_S4_CHANGELIST, ModIndex - 1))
			SetFloatValue(None, RS_MULTI_S4_S3, FloatListGet(None, RS_MULTI_S4_S3_CHANGELIST, ModIndex - 1))
			SetFloatValue(None, RS_MULTI_S3_S2, FloatListGet(None, RS_MULTI_S3_S2_CHANGELIST, ModIndex - 1))
			SetFloatValue(None, RS_MULTI_S2_S1, FloatListGet(None, RS_MULTI_S2_S1_CHANGELIST, ModIndex - 1))
			SetFloatValue(None, RS_MULTI_S1_S0, FloatListGet(None, RS_MULTI_S1_S0_CHANGELIST, ModIndex - 1))
			SetFloatValue(None, RS_MULTI_S0_SM1, FloatListGet(None, RS_MULTI_S0_SM1_CHANGELIST, ModIndex - 1))
			SetFloatValue(None, RS_MULTI_SM1_SM2, FloatListGet(None, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex - 1))
			SetFloatValue(None, RS_MULTI_SM2_SM3, FloatListGet(None, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex - 1))
			SetFloatValue(None, RS_MULTI_SM3_SM4, FloatListGet(None, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex - 1))
			SetFloatValue(None, RS_MULTI_SM4_SM5, FloatListGet(None, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex - 1))
			SetFloatValue(None, RS_MULTI_SM5_SM4, FloatListGet(None, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex - 1))
			SetFloatValue(None, RS_MULTI_SM4_SM3, FloatListGet(None, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex - 1))
			SetFloatValue(None, RS_MULTI_SM3_SM2, FloatListGet(None, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex - 1))
			SetFloatValue(None, RS_MULTI_SM2_SM1, FloatListGet(None, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex - 1))
			SetFloatValue(None, RS_MULTI_SM1_S0, FloatListGet(None, RS_MULTI_SM1_S0_CHANGELIST, ModIndex - 1))
		EndIf
	EndIf
	
	;remove the mod from the arrays
	FloatListRemoveAt(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex)
	IntListRemoveAt(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex)
	FloatListRemoveAt(None, RS_MULTI_S1_S2_CHANGELIST, ModIndex)
	IntListRemoveAt(None, RS_MULTI_S1_S2_CHANGELIST, ModIndex)
	FloatListRemoveAt(None, RS_MULTI_S2_S3_CHANGELIST, ModIndex)
	IntListRemoveAt(None, RS_MULTI_S2_S3_CHANGELIST, ModIndex)
	FloatListRemoveAt(None, RS_MULTI_S3_S4_CHANGELIST, ModIndex)
	IntListRemoveAt(None, RS_MULTI_S3_S4_CHANGELIST, ModIndex)
	FloatListRemoveAt(None, RS_MULTI_S4_S5_CHANGELIST, ModIndex)
	IntListRemoveAt(None, RS_MULTI_S4_S5_CHANGELIST, ModIndex)
	FloatListRemoveAt(None, RS_MULTI_S5_S4_CHANGELIST, ModIndex)
	IntListRemoveAt(None, RS_MULTI_S5_S4_CHANGELIST, ModIndex)
	FloatListRemoveAt(None, RS_MULTI_S4_S3_CHANGELIST, ModIndex)
	IntListRemoveAt(None, RS_MULTI_S4_S3_CHANGELIST, ModIndex)
	FloatListRemoveAt(None, RS_MULTI_S3_S2_CHANGELIST, ModIndex)
	IntListRemoveAt(None, RS_MULTI_S3_S2_CHANGELIST, ModIndex)
	FloatListRemoveAt(None, RS_MULTI_S2_S1_CHANGELIST, ModIndex)
	IntListRemoveAt(None, RS_MULTI_S2_S1_CHANGELIST, ModIndex)
	FloatListRemoveAt(None, RS_MULTI_S1_S0_CHANGELIST, ModIndex)
	IntListRemoveAt(None, RS_MULTI_S1_S0_CHANGELIST, ModIndex)
	FloatListRemoveAt(None, RS_MULTI_S0_SM1_CHANGELIST, ModIndex)
	IntListRemoveAt(None, RS_MULTI_S0_SM1_CHANGELIST, ModIndex)
	FloatListRemoveAt(None, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex)
	IntListRemoveAt(None, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex)
	FloatListRemoveAt(None, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex)
	IntListRemoveAt(None, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex)
	FloatListRemoveAt(None, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex)
	IntListRemoveAt(None, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex)
	FloatListRemoveAt(None, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex)
	IntListRemoveAt(None, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex)
	FloatListRemoveAt(None, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex)
	IntListRemoveAt(None, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex)
	FloatListRemoveAt(None, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex)
	IntListRemoveAt(None, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex)
	FloatListRemoveAt(None, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex)
	IntListRemoveAt(None, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex)
	FloatListRemoveAt(None, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex)
	IntListRemoveAt(None, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex)
	FloatListRemoveAt(None, RS_MULTI_SM1_S0_CHANGELIST, ModIndex)
	IntListRemoveAt(None, RS_MULTI_SM1_S0_CHANGELIST, ModIndex)
	
	FormListRemoveAt(None, RS_MULTI_CHANGELIST, ModIndex)
	
	;if the arrays are now empty, clear them and unset the multipliers value
	If (FormListCount(None, RS_MULTI_CHANGELIST) == 0)
		FormListClear(None, RS_MULTI_CHANGELIST)
		
		FloatListClear(None, RS_MULTI_S0_S1_CHANGELIST)
		IntListClear(None, RS_MULTI_S0_S1_CHANGELIST)
		FloatListClear(None, RS_MULTI_S1_S2_CHANGELIST)
		IntListClear(None, RS_MULTI_S1_S2_CHANGELIST)
		FloatListClear(None, RS_MULTI_S2_S3_CHANGELIST)
		IntListClear(None, RS_MULTI_S2_S3_CHANGELIST)
		FloatListClear(None, RS_MULTI_S3_S4_CHANGELIST)
		IntListClear(None, RS_MULTI_S3_S4_CHANGELIST)
		FloatListClear(None, RS_MULTI_S4_S5_CHANGELIST)
		IntListClear(None, RS_MULTI_S4_S5_CHANGELIST)
		FloatListClear(None, RS_MULTI_S5_S4_CHANGELIST)
		IntListClear(None, RS_MULTI_S5_S4_CHANGELIST)
		FloatListClear(None, RS_MULTI_S4_S3_CHANGELIST)
		IntListClear(None, RS_MULTI_S4_S3_CHANGELIST)
		FloatListClear(None, RS_MULTI_S3_S2_CHANGELIST)
		IntListClear(None, RS_MULTI_S3_S2_CHANGELIST)
		FloatListClear(None, RS_MULTI_S2_S1_CHANGELIST)
		IntListClear(None, RS_MULTI_S2_S1_CHANGELIST)
		FloatListClear(None, RS_MULTI_S1_S0_CHANGELIST)
		IntListClear(None, RS_MULTI_S1_S0_CHANGELIST)
		FloatListClear(None, RS_MULTI_S0_SM1_CHANGELIST)
		IntListClear(None, RS_MULTI_S0_SM1_CHANGELIST)
		FloatListClear(None, RS_MULTI_SM1_SM2_CHANGELIST)
		IntListClear(None, RS_MULTI_SM1_SM2_CHANGELIST)
		FloatListClear(None, RS_MULTI_SM2_SM3_CHANGELIST)
		IntListClear(None, RS_MULTI_SM2_SM3_CHANGELIST)
		FloatListClear(None, RS_MULTI_SM3_SM4_CHANGELIST)
		IntListClear(None, RS_MULTI_SM3_SM4_CHANGELIST)
		FloatListClear(None, RS_MULTI_SM4_SM5_CHANGELIST)
		IntListClear(None, RS_MULTI_SM4_SM5_CHANGELIST)
		FloatListClear(None, RS_MULTI_SM5_SM4_CHANGELIST)
		IntListClear(None, RS_MULTI_SM5_SM4_CHANGELIST)
		FloatListClear(None, RS_MULTI_SM4_SM3_CHANGELIST)
		IntListClear(None, RS_MULTI_SM4_SM3_CHANGELIST)
		FloatListClear(None, RS_MULTI_SM3_SM2_CHANGELIST)
		IntListClear(None, RS_MULTI_SM3_SM2_CHANGELIST)
		FloatListClear(None, RS_MULTI_SM2_SM1_CHANGELIST)
		IntListClear(None, RS_MULTI_SM2_SM1_CHANGELIST)
		FloatListClear(None, RS_MULTI_SM1_S0_CHANGELIST)
		IntListClear(None, RS_MULTI_SM1_S0_CHANGELIST)
		
		UnSetFloatValue(None, RS_MULTI_S0_S1)
		UnSetFloatValue(None, RS_MULTI_S1_S2)
		UnSetFloatValue(None, RS_MULTI_S2_S3)
		UnSetFloatValue(None, RS_MULTI_S3_S4)
		UnSetFloatValue(None, RS_MULTI_S4_S5)
		UnSetFloatValue(None, RS_MULTI_S5_S4)
		UnSetFloatValue(None, RS_MULTI_S4_S3)
		UnSetFloatValue(None, RS_MULTI_S3_S2)
		UnSetFloatValue(None, RS_MULTI_S2_S1)
		UnSetFloatValue(None, RS_MULTI_S1_S0)
		UnSetFloatValue(None, RS_MULTI_S0_SM1)
		UnSetFloatValue(None, RS_MULTI_SM1_SM2)
		UnSetFloatValue(None, RS_MULTI_SM2_SM3)
		UnSetFloatValue(None, RS_MULTI_SM3_SM4)
		UnSetFloatValue(None, RS_MULTI_SM4_SM5)
		UnSetFloatValue(None, RS_MULTI_SM5_SM4)
		UnSetFloatValue(None, RS_MULTI_SM4_SM3)
		UnSetFloatValue(None, RS_MULTI_SM3_SM2)
		UnSetFloatValue(None, RS_MULTI_SM2_SM1)
		UnSetFloatValue(None, RS_MULTI_SM1_S0)
	EndIf
	
	Return True
EndFunction

Float Function GetRelationshipMulti(Actor akNPC, Int aiFromRelationshipRank, Int aiToRelationshipRank, Bool abGetGlobalIfNotFound = True)
	If(!akNPC)
		Throw(FW_LOG, "Argument akNPC for function GetRelationshipMulti() is None!", "Invalid arguments")
		Return -1.0
	EndIf
	
	If(aiFromRelationshipRank < -5 || aiFromRelationshipRank > 5)
		Throw(FW_LOG, "Argument aiFromRelationshipRank was not set correctly. The range is from -5 to 5.", "Invalid arguments")
		Return -1.0
	EndIf

	If(aiToRelationshipRank < -5 || aiToRelationshipRank > 5)
		Throw(FW_LOG, "Argument aiToRelationshipRank was not set correctly. The range is from -5 to 5.", "Invalid arguments")
		Return -1.0
	EndIf

	If(aiFromRelationshipRank == aiToRelationshipRank)
		Throw(FW_LOG, "Argument aiToRelationshipRank can not be the same value as aiFromRelationshipRank.", "Invalid arguments")
		Return -1.0
	EndIf

	If(aiFromRelationshipRank < aiToRelationshipRank && aiToRelationshipRank - aiFromRelationshipRank != 1)
		Throw(FW_LOG, "Multiplier can only be set for the next or previous rank. From Rank " + aiFromRelationshipRank + " to Rank " + aiToRelationshipRank + " is incorrect.", "Invalid arguments")
		Return -1.0
	ElseIf(aiToRelationshipRank < aiFromRelationshipRank && aiFromRelationshipRank - aiToRelationshipRank != 1)
		Throw(FW_LOG, "Multiplier can only be set for the next or previous rank. From Rank " + aiFromRelationshipRank + " to Rank " + aiToRelationshipRank + " is incorrect.", "Invalid arguments")
		Return -1.0
	EndIf

	String MultiplierString = "APPS.Framework.Relationship.RelationshipMulti.S" + aiFromRelationshipRank As String + "_" + "S" + aiToRelationshipRank As String

	If(HasFloatValue(akNPC, MultiplierString))
		Return GetFloatValue(akNPC, MultiplierString)
	Else
		If(abGetGlobalIfNotFound)
			Return GetGlobalRelationshipMulti(aiFromRelationshipRank, aiToRelationshipRank)
		Else
			Return -1.0
		EndIf
	EndIf
EndFunction

Int Function GetRelationshipMultiPriority(Quest akToken, Actor akNPC)
	If(akNPC == None)
		Throw(FW_LOG, "Argument akNPC is None!", "Invalid arguments")
		Return -1
	EndIf

	Return _GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST, akNPC) + 1
EndFunction

Bool Function SetRelationshipMulti(Quest akToken, Actor akNPC, Int aiFromRelationshipRank, Int aiToRelationshipRank, Float auiMultiplier)
	Int ModIndex = _GetModIndexFromForm(akToken, REGISTERED_RS)

	If(ModIndex == -1)
		Throw(FW_LOG, " A mod, which is not registered or sent an invalid token, tried to access SetRelationshipMulti(). The FormID of this token is " + akToken.GetFormID() + ".", "Access denied")
		Return False
	EndIf

	If(!akNPC)
		Throw(FW_LOG, "Argument akNPC for function SetRelationshipMulti() is None!", "Invalid arguments")
		Return False
	EndIf

	If(aiFromRelationshipRank < -5 || aiFromRelationshipRank > 5)
		Throw(FW_LOG, "Argument aiFromRelationshipRank was not set correctly. The range is from -5 to 5.", "Invalid arguments")
		Return False
	EndIf

	If(aiToRelationshipRank < -5 || aiToRelationshipRank > 5)
		Throw(FW_LOG, "Argument aiToRelationshipRank was not set correctly. The range is from -5 to 5.", "Invalid arguments")
		Return False
	EndIf

	If(aiFromRelationshipRank == aiToRelationshipRank)
		Throw(FW_LOG, "Argument aiToRelationshipRank can not be the same value as aiFromRelationshipRank.", "Invalid arguments")
		Return False
	EndIf

	If(aiFromRelationshipRank < aiToRelationshipRank && aiToRelationshipRank - aiFromRelationshipRank != 1)
		Throw(FW_LOG, "Multiplier can only be set for the next or previous rank. From Rank " + aiFromRelationshipRank + " to Rank " + aiToRelationshipRank + " is incorrect.", "Invalid arguments")
		Return False
	ElseIf(aiToRelationshipRank < aiFromRelationshipRank && aiFromRelationshipRank - aiToRelationshipRank != 1)
		Throw(FW_LOG, "Multiplier can only be set for the next or previous rank. From Rank " + aiFromRelationshipRank + " to Rank " + aiToRelationshipRank + " is incorrect.", "Invalid arguments")
		Return False
	EndIf

	If(auiMultiplier <= 0)
		Throw(FW_LOG, "Multiplier can not be set to 0 or lower", "Invalid arguments")
		False
	EndIf

	String ModName = GetStringValue(akToken, MOD_NAME)
	Int ModIndex2 = _GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST, akNPC) ; Get position of current mod in this list
	Int RSMultiChanges = FormListCount(akNPC, RS_MULTI_CHANGELIST) ;Get the list of mods which do change the sync mode on an actor
	String MultiplierString = "S" + aiFromRelationshipRank As String + "_S" + aiToRelationshipRank As String

	;If the mod was found, update its new value
	If(ModIndex2 >= 0)
		If(MultiplierString == "S0_S1")
			FloatListSet(akNPC, RS_MULTI_S0_S1_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(akNPC, RS_MULTI_S0_S1_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S1_S2")
			FloatListSet(akNPC, RS_MULTI_S1_S2_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(akNPC, RS_MULTI_S1_S2_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S2_S3")
			FloatListSet(akNPC, RS_MULTI_S2_S3_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(akNPC, RS_MULTI_S2_S3_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S3_S4")
			FloatListSet(akNPC, RS_MULTI_S3_S4_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(akNPC, RS_MULTI_S3_S4_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S4_S5")
			FloatListSet(akNPC, RS_MULTI_S4_S5_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(akNPC, RS_MULTI_S4_S5_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S5_S4")
			FloatListSet(akNPC, RS_MULTI_S5_S4_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(akNPC, RS_MULTI_S5_S4_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S4_S3")
			FloatListSet(akNPC, RS_MULTI_S4_S3_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(akNPC, RS_MULTI_S4_S3_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S3_S2")
			FloatListSet(akNPC, RS_MULTI_S3_S2_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(akNPC, RS_MULTI_S3_S2_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S2_S1")
			FloatListSet(akNPC, RS_MULTI_S2_S1_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(akNPC, RS_MULTI_S2_S1_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S1_S0")
			FloatListSet(akNPC, RS_MULTI_S1_S0_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(akNPC, RS_MULTI_S1_S0_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S0_S-1")
			FloatListSet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-1_S-2")
			FloatListSet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-2_S-3")
			FloatListSet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-3_S-4")
			FloatListSet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-4_S-5")
			FloatListSet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-5_S-4")
			FloatListSet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-4_S-3")
			FloatListSet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-3_S-2")
			FloatListSet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-2_S-1")
			FloatListSet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-1_S0")
			FloatListSet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, ModIndex2, auiMultiplier)
			IntListSet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, ModIndex2, 1)
		EndIf

		Notify(FW_LOG, "Global multiplier for rank " + aiFromRelationshipRank + " to " + aiToRelationshipRank + " got updated by " + ModName + ".", False)

		;If the mod is also on the last position then also update the relationship multiplier
		If(ModIndex2 == RSMultiChanges - 1)
			If(MultiplierString == "S0_S1")
				SetFloatValue(akNPC, RS_MULTI_S0_S1, auiMultiplier)
			ElseIf(MultiplierString == "S1_S2")
				SetFloatValue(akNPC, RS_MULTI_S1_S2, auiMultiplier)
			ElseIf(MultiplierString == "S2_S3")
				SetFloatValue(akNPC, RS_MULTI_S2_S3, auiMultiplier)
			ElseIf(MultiplierString == "S3_S4")
				SetFloatValue(akNPC, RS_MULTI_S3_S4, auiMultiplier)
			ElseIf(MultiplierString == "S4_S5")
				SetFloatValue(akNPC, RS_MULTI_S4_S5, auiMultiplier)
			ElseIf(MultiplierString == "S5_S4")
				SetFloatValue(akNPC, RS_MULTI_S5_S4, auiMultiplier)
			ElseIf(MultiplierString == "S4_S3")
				SetFloatValue(akNPC, RS_MULTI_S4_S3, auiMultiplier)
			ElseIf(MultiplierString == "S3_S2")
				SetFloatValue(akNPC, RS_MULTI_S3_S2, auiMultiplier)
			ElseIf(MultiplierString == "S2_S1")
				SetFloatValue(akNPC, RS_MULTI_S2_S1, auiMultiplier)
			ElseIf(MultiplierString == "S1_S0")
				SetFloatValue(akNPC, RS_MULTI_S1_S0, auiMultiplier)
			ElseIf(MultiplierString == "S0_S-1")
				SetFloatValue(akNPC, RS_MULTI_S0_SM1, auiMultiplier)
			ElseIf(MultiplierString == "S-1_S-2")
				SetFloatValue(akNPC, RS_MULTI_SM1_SM2, auiMultiplier)
			ElseIf(MultiplierString == "S-2_S-3")
				SetFloatValue(akNPC, RS_MULTI_SM2_SM3, auiMultiplier)
			ElseIf(MultiplierString == "S-3_S-4")
				SetFloatValue(akNPC, RS_MULTI_SM3_SM4, auiMultiplier)
			ElseIf(MultiplierString == "S-4_S-5")
				SetFloatValue(akNPC, RS_MULTI_SM4_SM5, auiMultiplier)
			ElseIf(MultiplierString == "S-5_S-4")
				SetFloatValue(akNPC, RS_MULTI_SM5_SM4, auiMultiplier)
			ElseIf(MultiplierString == "S-4_S-3")
				SetFloatValue(akNPC, RS_MULTI_SM4_SM3, auiMultiplier)
			ElseIf(MultiplierString == "S-3_S-2")
				SetFloatValue(akNPC, RS_MULTI_SM3_SM2, auiMultiplier)
			ElseIf(MultiplierString == "S-2_S-1")
				SetFloatValue(akNPC, RS_MULTI_SM2_SM1, auiMultiplier)
			ElseIf(MultiplierString == "S-1_S0")
				SetFloatValue(akNPC, RS_MULTI_SM1_S0, auiMultiplier)
			EndIf
		Else
			Notify(FW_LOG, "Can't change the relationship multiplier on " + akNPC.GetActorBase().GetName() + " for " + ModName + " because it is already set by a mod with higher priority. However, it will be set, if this mod has the highest priority.", False)
			Return True
		EndIf
	Else
		Int i = 0

		;Go through the list of changes to the global relationship multiplier
		While(i < RSMultiChanges)
			Form ModToCmp = FormListGet(akNPC, RS_MULTI_CHANGELIST, i) ;Get mod at index i
			Int ModToCmpIdx = FormListFind(None, REGISTERED_RS, ModToCmp) ;Get priority of this comparing mod

			;If the actual mod has a higher priority than the comparing mod then continue cycling the list
			If(ModIndex > ModToCmpIdx)
				i += 1
			Else
				FormListInsert(akNPC, RS_MULTI_CHANGELIST, i, akToken) ;Insert the actual mod into the list before the comparing mod
				FloatListInsert(akNPC, RS_MULTI_S0_S1_CHANGELIST, i, 1.0)
				IntListInsert(akNPC, RS_MULTI_S0_S1_CHANGELIST, i, 0)
				FloatListInsert(akNPC, RS_MULTI_S1_S2_CHANGELIST, i, 0.5)
				IntListInsert(akNPC, RS_MULTI_S1_S2_CHANGELIST, i, 0)
				FloatListInsert(akNPC, RS_MULTI_S2_S3_CHANGELIST, i, 0.25)
				IntListInsert(akNPC, RS_MULTI_S2_S3_CHANGELIST, i, 0)
				FloatListInsert(akNPC, RS_MULTI_S3_S4_CHANGELIST, i, 0.125)
				IntListInsert(akNPC, RS_MULTI_S3_S4_CHANGELIST, i, 0)
				FloatListInsert(akNPC, RS_MULTI_S4_S5_CHANGELIST, i, 0.0625)
				IntListInsert(akNPC, RS_MULTI_S4_S5_CHANGELIST, i, 0)
				FloatListInsert(akNPC, RS_MULTI_S5_S4_CHANGELIST, i, 0.125)
				IntListInsert(akNPC, RS_MULTI_S5_S4_CHANGELIST, i, 0)
				FloatListInsert(akNPC, RS_MULTI_S4_S3_CHANGELIST, i, 0.25)
				IntListInsert(akNPC, RS_MULTI_S4_S3_CHANGELIST, i, 0)
				FloatListInsert(akNPC, RS_MULTI_S3_S2_CHANGELIST, i, 0.5)
				IntListInsert(akNPC, RS_MULTI_S3_S2_CHANGELIST, i, 0)
				FloatListInsert(akNPC, RS_MULTI_S2_S1_CHANGELIST, i, 1.0)
				IntListInsert(akNPC, RS_MULTI_S2_S1_CHANGELIST, i, 0)
				FloatListInsert(akNPC, RS_MULTI_S1_S0_CHANGELIST, i, 2.0)
				IntListInsert(akNPC, RS_MULTI_S1_S0_CHANGELIST, i, 0)
				FloatListInsert(akNPC, RS_MULTI_S0_SM1_CHANGELIST, i, 1.0)
				IntListInsert(akNPC, RS_MULTI_S0_SM1_CHANGELIST, i, 0)
				FloatListInsert(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, i, 0.5)
				IntListInsert(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, i, 0)
				FloatListInsert(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, i, 0.25)
				IntListInsert(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, i, 0)
				FloatListInsert(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, i, 0.125)
				IntListInsert(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, i, 0)
				FloatListInsert(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, i, 0.0625)
				IntListInsert(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, i, 0)
				FloatListInsert(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, i, 0.125)
				IntListInsert(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, i, 0)
				FloatListInsert(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, i, 0.25)
				IntListInsert(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, i, 0)
				FloatListInsert(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, i, 0.5)
				IntListInsert(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, i, 0)
				FloatListInsert(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, i, 1.0)
				IntListInsert(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, i, 0)
				FloatListInsert(akNPC, RS_MULTI_SM1_S0_CHANGELIST, i, 2.0)
				IntListInsert(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, i, 0)

				If(MultiplierString == "S0_S1")
					FloatListSet(akNPC, RS_MULTI_S0_S1_CHANGELIST, i, auiMultiplier)
					IntListSet(akNPC, RS_MULTI_S0_S1_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S1_S2")
					FloatListSet(akNPC, RS_MULTI_S1_S2_CHANGELIST, i, auiMultiplier)
					IntListSet(akNPC, RS_MULTI_S1_S2_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S2_S3")
					FloatListSet(akNPC, RS_MULTI_S2_S3_CHANGELIST, i, auiMultiplier)
					IntListSet(akNPC, RS_MULTI_S2_S3_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S3_S4")
					FloatListSet(akNPC, RS_MULTI_S3_S4_CHANGELIST, i, auiMultiplier)
					IntListSet(akNPC, RS_MULTI_S3_S4_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S4_S5")
					FloatListSet(akNPC, RS_MULTI_S4_S5_CHANGELIST, i, auiMultiplier)
					IntListSet(akNPC, RS_MULTI_S4_S5_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S5_S4")
					FloatListSet(akNPC, RS_MULTI_S5_S4_CHANGELIST, i, auiMultiplier)
					IntListSet(akNPC, RS_MULTI_S5_S4_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S4_S3")
					FloatListSet(akNPC, RS_MULTI_S4_S3_CHANGELIST, i, auiMultiplier)
					IntListSet(akNPC, RS_MULTI_S4_S3_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S3_S2")
					FloatListSet(akNPC, RS_MULTI_S3_S2_CHANGELIST, i, auiMultiplier)
					IntListSet(akNPC, RS_MULTI_S3_S2_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S2_S1")
					FloatListSet(akNPC, RS_MULTI_S2_S1_CHANGELIST, i, auiMultiplier)
					IntListSet(akNPC, RS_MULTI_S2_S1_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S1_S0")
					FloatListSet(akNPC, RS_MULTI_S1_S0_CHANGELIST, i, auiMultiplier)
					IntListSet(akNPC, RS_MULTI_S1_S0_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S0_S-1")
					FloatListSet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, i, auiMultiplier)
					IntListSet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-1_S-2")
					FloatListSet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, i, auiMultiplier)
					IntListSet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-2_S-3")
					FloatListSet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, i, auiMultiplier)
					IntListSet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-3_S-4")
					FloatListSet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, i, auiMultiplier)
					IntListSet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-4_S-5")
					FloatListSet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, i, auiMultiplier)
					IntListSet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-5_S-4")
					FloatListSet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, i, auiMultiplier)
					IntListSet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-4_S-3")
					FloatListSet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, i, auiMultiplier)
					IntListSet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-3_S-2")
					FloatListSet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, i, auiMultiplier)
					IntListSet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-2_S-1")
					FloatListSet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, i, auiMultiplier)
					IntListSet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-1_S0")
					FloatListSet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, i, auiMultiplier)
					IntListSet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, i, 1)
				EndIf

				Notify(FW_LOG, "Can't change the relationship multiplier on " + akNPC.GetActorBase().GetName() + " for " + ModName + " because it is already set by a mod with higher priority. However, it will be set, if this mod has the highest priority.", False)
				Return True
			EndIf
		EndWhile
	EndIf

	;No changes made to the array, so just add the value to it and apply the changes to the framework
	FormListAdd(akNPC, RS_MULTI_CHANGELIST, akToken)
	FloatListAdd(akNPC, RS_MULTI_S0_S1_CHANGELIST, 1.0)
	IntListAdd(akNPC, RS_MULTI_S0_S1_CHANGELIST, 0)
	FloatListAdd(akNPC, RS_MULTI_S1_S2_CHANGELIST, 0.5)
	IntListAdd(akNPC, RS_MULTI_S1_S2_CHANGELIST, 0)
	FloatListAdd(akNPC, RS_MULTI_S2_S3_CHANGELIST, 0.25)
	IntListAdd(akNPC, RS_MULTI_S2_S3_CHANGELIST, 0)
	FloatListAdd(akNPC, RS_MULTI_S3_S4_CHANGELIST, 0.125)
	IntListAdd(akNPC, RS_MULTI_S4_S5_CHANGELIST, 0)
	FloatListAdd(akNPC, RS_MULTI_S5_S4_CHANGELIST, 0.125)
	IntListAdd(akNPC, RS_MULTI_S5_S4_CHANGELIST, 0)
	FloatListAdd(akNPC, RS_MULTI_S4_S3_CHANGELIST, 0.25)
	IntListAdd(akNPC, RS_MULTI_S4_S3_CHANGELIST, 0)
	FloatListAdd(akNPC, RS_MULTI_S3_S2_CHANGELIST, 0.5)
	IntListAdd(akNPC, RS_MULTI_S3_S2_CHANGELIST, 0)
	FloatListAdd(akNPC, RS_MULTI_S2_S1_CHANGELIST, 1.0)
	IntListAdd(akNPC, RS_MULTI_S2_S1_CHANGELIST, 0)
	FloatListAdd(akNPC, RS_MULTI_S1_S0_CHANGELIST, 2.0)
	IntListAdd(akNPC, RS_MULTI_S1_S0_CHANGELIST, 0)
	FloatListAdd(akNPC, RS_MULTI_S0_SM1_CHANGELIST, 1.0)
	IntListAdd(akNPC, RS_MULTI_S0_SM1_CHANGELIST, 0)
	FloatListAdd(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, 0.5)
	IntListAdd(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, 0)
	FloatListAdd(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, 0.25)
	IntListAdd(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, 0)
	FloatListAdd(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, 0.125)
	IntListAdd(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, 0)
	FloatListAdd(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, 0.0625)
	IntListAdd(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, 0)
	FloatListAdd(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, 0.125)
	IntListAdd(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, 0)
	FloatListAdd(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, 0.25)
	IntListAdd(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, 0)
	FloatListAdd(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, 0.5)
	IntListAdd(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, 0)
	FloatListAdd(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, 1.0)
	IntListAdd(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, 0)
	FloatListAdd(akNPC, RS_MULTI_SM1_S0_CHANGELIST, 2.0)
	Int i = IntListAdd(akNPC, RS_MULTI_SM1_S0_CHANGELIST, 0)

	If(MultiplierString == "S0_S1")
		SetFloatValue(akNPC, RS_MULTI_S0_S1, auiMultiplier)
		FloatListSet(akNPC, RS_MULTI_S0_S1_CHANGELIST, i, auiMultiplier)
		IntListSet(akNPC, RS_MULTI_S0_S1_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S1_S2")
		SetFloatValue(akNPC, RS_MULTI_S1_S2, auiMultiplier)
		FloatListSet(akNPC, RS_MULTI_S1_S2_CHANGELIST, i, auiMultiplier)
		IntListSet(akNPC, RS_MULTI_S1_S2_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S2_S3")
		SetFloatValue(akNPC, RS_MULTI_S2_S3, auiMultiplier)
		FloatListSet(akNPC, RS_MULTI_S2_S3_CHANGELIST, i, auiMultiplier)
		IntListSet(akNPC, RS_MULTI_S2_S3_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S3_S4")
		SetFloatValue(akNPC, RS_MULTI_S3_S4, auiMultiplier)
		FloatListSet(akNPC, RS_MULTI_S3_S4_CHANGELIST, i, auiMultiplier)
		IntListSet(akNPC, RS_MULTI_S3_S4_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S4_S5")
		SetFloatValue(akNPC, RS_MULTI_S4_S5, auiMultiplier)
		FloatListSet(akNPC, RS_MULTI_S4_S5_CHANGELIST, i, auiMultiplier)
		IntListSet(akNPC, RS_MULTI_S4_S5_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S5_S4")
		SetFloatValue(akNPC, RS_MULTI_S5_S4, auiMultiplier)
		FloatListSet(akNPC, RS_MULTI_S5_S4_CHANGELIST, i, auiMultiplier)
		IntListSet(akNPC, RS_MULTI_S5_S4_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S4_S3")
		SetFloatValue(akNPC, RS_MULTI_S4_S3, auiMultiplier)
		FloatListSet(akNPC, RS_MULTI_S4_S3_CHANGELIST, i, auiMultiplier)
		IntListSet(akNPC, RS_MULTI_S4_S3_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S3_S2")
		SetFloatValue(akNPC, RS_MULTI_S3_S2, auiMultiplier)
		FloatListSet(akNPC, RS_MULTI_S3_S2_CHANGELIST, i, auiMultiplier)
		IntListSet(akNPC, RS_MULTI_S3_S2_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S2_S1")
		SetFloatValue(akNPC, RS_MULTI_S2_S1, auiMultiplier)
		FloatListSet(akNPC, RS_MULTI_S2_S1_CHANGELIST, i, auiMultiplier)
		IntListSet(akNPC, RS_MULTI_S2_S1_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S1_S0")
		SetFloatValue(akNPC, RS_MULTI_S1_S0, auiMultiplier)
		FloatListSet(akNPC, RS_MULTI_S1_S0_CHANGELIST, i, auiMultiplier)
		IntListSet(akNPC, RS_MULTI_S1_S0_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S0_S-1")
		SetFloatValue(akNPC, RS_MULTI_S0_SM1, auiMultiplier)
		FloatListSet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, i, auiMultiplier)
		IntListSet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-1_S-2")
		SetFloatValue(akNPC, RS_MULTI_SM1_SM2, auiMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, i, auiMultiplier)
		IntListSet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-2_S-3")
		SetFloatValue(akNPC, RS_MULTI_SM2_SM3, auiMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, i, auiMultiplier)
		IntListSet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-3_S-4")
		SetFloatValue(akNPC, RS_MULTI_SM3_SM4, auiMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, i, auiMultiplier)
		IntListSet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-4_S-5")
		SetFloatValue(akNPC, RS_MULTI_SM4_SM5, auiMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, i, auiMultiplier)
		IntListSet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-5_S-4")
		SetFloatValue(akNPC, RS_MULTI_SM5_SM4, auiMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, i, auiMultiplier)
		IntListSet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-4_S-3")
		SetFloatValue(akNPC, RS_MULTI_SM4_SM3, auiMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, i, auiMultiplier)
		IntListSet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-3_S-2")
		SetFloatValue(akNPC, RS_MULTI_SM3_SM2, auiMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, i, auiMultiplier)
		IntListSet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-2_S-1")
		SetFloatValue(akNPC, RS_MULTI_SM2_SM1, auiMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, i, auiMultiplier)
		IntListSet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-1_S0")
		SetFloatValue(akNPC, RS_MULTI_SM1_S0, auiMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, i, auiMultiplier)
		IntListSet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, i, 1)
	EndIf

	FormListAdd(None, RS_MULTI_NPC_CHANGELIST, akNPC)
	Return True
EndFunction

Bool Function RemoveRelationshipMulti(Quest akToken, Actor akNPC, Int aiFromRelationshipRank, Int aiToRelationshipRank)
	If(_GetModIndexFromForm(akToken, REGISTERED_RS) == -1)
		Warn(FW_LOG, "A mod tried to remove its changes to " + akNPC.GetActorBase().GetName() + "'s relationship multipliers. It passed a wrong token, however. FormID of the token is " + akToken.GetFormID() + ".")
		Return False
	ElseIf(_GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST, akNPC) == -1)
		Notify(FW_LOG, "A mod tried to remove its changes to " + akNPC.GetActorBase().GetName() + "'s relationship multipliers. But there were no changes made by this mod. FormID of the token is " + akToken.GetFormID() + ".")
		Return False
	EndIf

	If(aiFromRelationshipRank < -5 || aiFromRelationshipRank > 5)
		Throw(FW_LOG, "Argument aiFromRelationshipRank was not set correctly. The range is from -5 to 5.", "Invalid arguments")
		Return False
	EndIf

	If(aiToRelationshipRank < -5 || aiToRelationshipRank > 5)
		Throw(FW_LOG, "Argument aiToRelationshipRank was not set correctly. The range is from -5 to 5.", "Invalid arguments")
		Return False
	EndIf

	If(aiFromRelationshipRank == aiToRelationshipRank)
		Throw(FW_LOG, "Argument aiToRelationshipRank can not be the same value as aiFromRelationshipRank.", "Invalid arguments")
		Return False
	EndIf
	
	If(aiFromRelationshipRank - aiToRelationshipRank != 1 && aiFromRelationshipRank - aiToRelationshipRank != -1)
		Throw(FW_LOG, "Multiplier can only be set for the next or previous rank. From Rank " + aiFromRelationshipRank + " to Rank " + aiToRelationshipRank + " is incorrect.", "Invalid arguments")
		Return False
	EndIf
	
	Int ModIndex = _GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST, akNPC)
	String MultiplierString = "S" + aiFromRelationshipRank As String + "_S" + aiToRelationshipRank As String
	
	;if this mod has not set a custom multiplier for this stage, return false (nothing to remove)
	If(MultiplierString == "S0_S1")
		If (IntListGet(akNPC, RS_MULTI_S0_S1_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S1_S2")
		If (IntListGet(akNPC, RS_MULTI_S1_S2_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S2_S3")
		If (IntListGet(akNPC, RS_MULTI_S2_S3_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S3_S4")
		If (IntListGet(akNPC, RS_MULTI_S3_S4_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S4_S5")
		If (IntListGet(akNPC, RS_MULTI_S4_S5_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S5_S4")
		If (IntListGet(akNPC, RS_MULTI_S5_S4_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S4_S3")
		If (IntListGet(akNPC, RS_MULTI_S4_S3_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S3_S2")
		If (IntListGet(akNPC, RS_MULTI_S3_S2_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S2_S1")
		If (IntListGet(akNPC, RS_MULTI_S2_S1_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S1_S0")
		If (IntListGet(akNPC, RS_MULTI_S1_S0_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S0_S-1")
		If (IntListGet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S-1_S-2")
		If (IntListGet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S-2_S-3")
		If (IntListGet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S-3_S-4")
		If (IntListGet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S-4_S-5")
		If (IntListGet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S-5_S-4")
		If (IntListGet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S-4_S-3")
		If (IntListGet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S-3_S-2")
		If (IntListGet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S-2_S-1")
		If (IntListGet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	ElseIf (MultiplierString == "S-1_S0")
		If (IntListGet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, ModIndex) == 0)
			Warn(FW_Log, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return False
		EndIf
	EndIf
	
	;if the mod does not affect any other multipliers, remove it from the arrays after checking in case it had highest priority
	If ((IntListGet(akNPC, RS_MULTI_S0_S1_CHANGELIST, ModIndex) + \
		IntListGet(akNPC, RS_MULTI_S1_S2_CHANGELIST, ModIndex) + \
		IntListGet(akNPC, RS_MULTI_S2_S3_CHANGELIST, ModIndex) + \
		IntListGet(akNPC, RS_MULTI_S3_S4_CHANGELIST, ModIndex) + \
		IntListGet(akNPC, RS_MULTI_S4_S5_CHANGELIST, ModIndex) + \
		IntListGet(akNPC, RS_MULTI_S5_S4_CHANGELIST, ModIndex) + \
		IntListGet(akNPC, RS_MULTI_S4_S3_CHANGELIST, ModIndex) + \
		IntListGet(akNPC, RS_MULTI_S3_S2_CHANGELIST, ModIndex) + \
		IntListGet(akNPC, RS_MULTI_S2_S1_CHANGELIST, ModIndex) + \
		IntListGet(akNPC, RS_MULTI_S1_S0_CHANGELIST, ModIndex) + \
		IntListGet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, ModIndex) + \
		IntListGet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex) + \
		IntListGet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex) + \
		IntListGet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex) + \
		IntListGet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex) + \
		IntListGet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex) + \
		IntListGet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex) + \
		IntListGet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex) + \
		IntListGet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex) + \
		IntListGet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, ModIndex)) == 1)
		
		;if this is not the only mod in the multipliers changelist
		If (FormListCount(akNPC, RS_MULTI_CHANGELIST) > 1)
			;if the mod had highest priority, then set the multiplier values to those specified by the next mod
			If (ModIndex == FormListCount(akNPC, RS_MULTI_CHANGELIST) - 1)
				SetFloatValue(akNPC, RS_MULTI_S0_S1, FloatListGet(akNPC, RS_MULTI_S0_S1_CHANGELIST, ModIndex - 1))
				SetFloatValue(akNPC, RS_MULTI_S1_S2, FloatListGet(akNPC, RS_MULTI_S1_S2_CHANGELIST, ModIndex - 1))
				SetFloatValue(akNPC, RS_MULTI_S2_S3, FloatListGet(akNPC, RS_MULTI_S2_S3_CHANGELIST, ModIndex - 1))
				SetFloatValue(akNPC, RS_MULTI_S3_S4, FloatListGet(akNPC, RS_MULTI_S3_S4_CHANGELIST, ModIndex - 1))
				SetFloatValue(akNPC, RS_MULTI_S4_S5, FloatListGet(akNPC, RS_MULTI_S4_S5_CHANGELIST, ModIndex - 1))
				SetFloatValue(akNPC, RS_MULTI_S5_S4, FloatListGet(akNPC, RS_MULTI_S5_S4_CHANGELIST, ModIndex - 1))
				SetFloatValue(akNPC, RS_MULTI_S4_S3, FloatListGet(akNPC, RS_MULTI_S4_S3_CHANGELIST, ModIndex - 1))
				SetFloatValue(akNPC, RS_MULTI_S3_S2, FloatListGet(akNPC, RS_MULTI_S3_S2_CHANGELIST, ModIndex - 1))
				SetFloatValue(akNPC, RS_MULTI_S2_S1, FloatListGet(akNPC, RS_MULTI_S2_S1_CHANGELIST, ModIndex - 1))
				SetFloatValue(akNPC, RS_MULTI_S1_S0, FloatListGet(akNPC, RS_MULTI_S1_S0_CHANGELIST, ModIndex - 1))
				SetFloatValue(akNPC, RS_MULTI_S0_SM1, FloatListGet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, ModIndex - 1))
				SetFloatValue(akNPC, RS_MULTI_SM1_SM2, FloatListGet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex - 1))
				SetFloatValue(akNPC, RS_MULTI_SM2_SM3, FloatListGet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex - 1))
				SetFloatValue(akNPC, RS_MULTI_SM3_SM4, FloatListGet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex - 1))
				SetFloatValue(akNPC, RS_MULTI_SM4_SM5, FloatListGet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex - 1))
				SetFloatValue(akNPC, RS_MULTI_SM5_SM4, FloatListGet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex - 1))
				SetFloatValue(akNPC, RS_MULTI_SM4_SM3, FloatListGet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex - 1))
				SetFloatValue(akNPC, RS_MULTI_SM3_SM2, FloatListGet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex - 1))
				SetFloatValue(akNPC, RS_MULTI_SM2_SM1, FloatListGet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex - 1))
				SetFloatValue(akNPC, RS_MULTI_SM1_S0, FloatListGet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, ModIndex - 1))
			EndIf
		EndIf
		
		;remove the mod from the arrays
		FloatListRemoveAt(akNPC, RS_MULTI_S0_S1_CHANGELIST, ModIndex)
		IntListRemoveAt(akNPC, RS_MULTI_S0_S1_CHANGELIST, ModIndex)
		FloatListRemoveAt(akNPC, RS_MULTI_S1_S2_CHANGELIST, ModIndex)
		IntListRemoveAt(akNPC, RS_MULTI_S1_S2_CHANGELIST, ModIndex)
		FloatListRemoveAt(akNPC, RS_MULTI_S2_S3_CHANGELIST, ModIndex)
		IntListRemoveAt(akNPC, RS_MULTI_S2_S3_CHANGELIST, ModIndex)
		FloatListRemoveAt(akNPC, RS_MULTI_S3_S4_CHANGELIST, ModIndex)
		IntListRemoveAt(akNPC, RS_MULTI_S3_S4_CHANGELIST, ModIndex)
		FloatListRemoveAt(akNPC, RS_MULTI_S4_S5_CHANGELIST, ModIndex)
		IntListRemoveAt(akNPC, RS_MULTI_S4_S5_CHANGELIST, ModIndex)
		FloatListRemoveAt(akNPC, RS_MULTI_S5_S4_CHANGELIST, ModIndex)
		IntListRemoveAt(akNPC, RS_MULTI_S5_S4_CHANGELIST, ModIndex)
		FloatListRemoveAt(akNPC, RS_MULTI_S4_S3_CHANGELIST, ModIndex)
		IntListRemoveAt(akNPC, RS_MULTI_S4_S3_CHANGELIST, ModIndex)
		FloatListRemoveAt(akNPC, RS_MULTI_S3_S2_CHANGELIST, ModIndex)
		IntListRemoveAt(akNPC, RS_MULTI_S3_S2_CHANGELIST, ModIndex)
		FloatListRemoveAt(akNPC, RS_MULTI_S2_S1_CHANGELIST, ModIndex)
		IntListRemoveAt(akNPC, RS_MULTI_S2_S1_CHANGELIST, ModIndex)
		FloatListRemoveAt(akNPC, RS_MULTI_S1_S0_CHANGELIST, ModIndex)
		IntListRemoveAt(akNPC, RS_MULTI_S1_S0_CHANGELIST, ModIndex)
		FloatListRemoveAt(akNPC, RS_MULTI_S0_SM1_CHANGELIST, ModIndex)
		IntListRemoveAt(akNPC, RS_MULTI_S0_SM1_CHANGELIST, ModIndex)
		FloatListRemoveAt(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex)
		IntListRemoveAt(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex)
		FloatListRemoveAt(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex)
		IntListRemoveAt(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex)
		FloatListRemoveAt(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex)
		IntListRemoveAt(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex)
		FloatListRemoveAt(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex)
		IntListRemoveAt(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex)
		FloatListRemoveAt(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex)
		IntListRemoveAt(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex)
		FloatListRemoveAt(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex)
		IntListRemoveAt(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex)
		FloatListRemoveAt(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex)
		IntListRemoveAt(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex)
		FloatListRemoveAt(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex)
		IntListRemoveAt(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex)
		FloatListRemoveAt(akNPC, RS_MULTI_SM1_S0_CHANGELIST, ModIndex)
		IntListRemoveAt(akNPC, RS_MULTI_SM1_S0_CHANGELIST, ModIndex)
		
		FormListRemoveAt(akNPC, RS_MULTI_CHANGELIST, ModIndex)
		
		;if the arrays are now empty, clear them and unset the multipliers value
		If (FormListCount(akNPC, RS_MULTI_CHANGELIST) == 0)
			FormListClear(akNPC, RS_MULTI_CHANGELIST)
			
			FormListRemove(None, SYNC_MODE_NPC_CHANGELIST, akNPC) 	;remove the NPC from the list of NPC's with local relationship changes
			
			FloatListClear(akNPC, RS_MULTI_S0_S1_CHANGELIST)
			IntListClear(akNPC, RS_MULTI_S0_S1_CHANGELIST)
			FloatListClear(akNPC, RS_MULTI_S1_S2_CHANGELIST)
			IntListClear(akNPC, RS_MULTI_S1_S2_CHANGELIST)
			FloatListClear(akNPC, RS_MULTI_S2_S3_CHANGELIST)
			IntListClear(akNPC, RS_MULTI_S2_S3_CHANGELIST)
			FloatListClear(akNPC, RS_MULTI_S3_S4_CHANGELIST)
			IntListClear(akNPC, RS_MULTI_S3_S4_CHANGELIST)
			FloatListClear(akNPC, RS_MULTI_S4_S5_CHANGELIST)
			IntListClear(akNPC, RS_MULTI_S4_S5_CHANGELIST)
			FloatListClear(akNPC, RS_MULTI_S5_S4_CHANGELIST)
			IntListClear(akNPC, RS_MULTI_S5_S4_CHANGELIST)
			FloatListClear(akNPC, RS_MULTI_S4_S3_CHANGELIST)
			IntListClear(akNPC, RS_MULTI_S4_S3_CHANGELIST)
			FloatListClear(akNPC, RS_MULTI_S3_S2_CHANGELIST)
			IntListClear(akNPC, RS_MULTI_S3_S2_CHANGELIST)
			FloatListClear(akNPC, RS_MULTI_S2_S1_CHANGELIST)
			IntListClear(akNPC, RS_MULTI_S2_S1_CHANGELIST)
			FloatListClear(akNPC, RS_MULTI_S1_S0_CHANGELIST)
			IntListClear(akNPC, RS_MULTI_S1_S0_CHANGELIST)
			FloatListClear(akNPC, RS_MULTI_S0_SM1_CHANGELIST)
			IntListClear(akNPC, RS_MULTI_S0_SM1_CHANGELIST)
			FloatListClear(akNPC, RS_MULTI_SM1_SM2_CHANGELIST)
			IntListClear(akNPC, RS_MULTI_SM1_SM2_CHANGELIST)
			FloatListClear(akNPC, RS_MULTI_SM2_SM3_CHANGELIST)
			IntListClear(akNPC, RS_MULTI_SM2_SM3_CHANGELIST)
			FloatListClear(akNPC, RS_MULTI_SM3_SM4_CHANGELIST)
			IntListClear(akNPC, RS_MULTI_SM3_SM4_CHANGELIST)
			FloatListClear(akNPC, RS_MULTI_SM4_SM5_CHANGELIST)
			IntListClear(akNPC, RS_MULTI_SM4_SM5_CHANGELIST)
			FloatListClear(akNPC, RS_MULTI_SM5_SM4_CHANGELIST)
			IntListClear(akNPC, RS_MULTI_SM5_SM4_CHANGELIST)
			FloatListClear(akNPC, RS_MULTI_SM4_SM3_CHANGELIST)
			IntListClear(akNPC, RS_MULTI_SM4_SM3_CHANGELIST)
			FloatListClear(akNPC, RS_MULTI_SM3_SM2_CHANGELIST)
			IntListClear(akNPC, RS_MULTI_SM3_SM2_CHANGELIST)
			FloatListClear(akNPC, RS_MULTI_SM2_SM1_CHANGELIST)
			IntListClear(akNPC, RS_MULTI_SM2_SM1_CHANGELIST)
			FloatListClear(akNPC, RS_MULTI_SM1_S0_CHANGELIST)
			IntListClear(akNPC, RS_MULTI_SM1_S0_CHANGELIST)
			
			UnSetFloatValue(akNPC, RS_MULTI_S0_S1)
			UnSetFloatValue(akNPC, RS_MULTI_S1_S2)
			UnSetFloatValue(akNPC, RS_MULTI_S2_S3)
			UnSetFloatValue(akNPC, RS_MULTI_S3_S4)
			UnSetFloatValue(akNPC, RS_MULTI_S4_S5)
			UnSetFloatValue(akNPC, RS_MULTI_S5_S4)
			UnSetFloatValue(akNPC, RS_MULTI_S4_S3)
			UnSetFloatValue(akNPC, RS_MULTI_S3_S2)
			UnSetFloatValue(akNPC, RS_MULTI_S2_S1)
			UnSetFloatValue(akNPC, RS_MULTI_S1_S0)
			UnSetFloatValue(akNPC, RS_MULTI_S0_SM1)
			UnSetFloatValue(akNPC, RS_MULTI_SM1_SM2)
			UnSetFloatValue(akNPC, RS_MULTI_SM2_SM3)
			UnSetFloatValue(akNPC, RS_MULTI_SM3_SM4)
			UnSetFloatValue(akNPC, RS_MULTI_SM4_SM5)
			UnSetFloatValue(akNPC, RS_MULTI_SM5_SM4)
			UnSetFloatValue(akNPC, RS_MULTI_SM4_SM3)
			UnSetFloatValue(akNPC, RS_MULTI_SM3_SM2)
			UnSetFloatValue(akNPC, RS_MULTI_SM2_SM1)
			UnSetFloatValue(akNPC, RS_MULTI_SM1_S0)
			
			;if there is no other NPC with local relationship multiplier changes, clear the corresponding array
			If (FormListCount(None, SYNC_MODE_NPC_CHANGELIST) == 0)
				FormListClear(None, SYNC_MODE_NPC_CHANGELIST)
			EndIf
		EndIf
		
		Return True
		
	Else	;if the mod does affect other multipliers i.e. it will not be removed from the arrays
		;if the mod had the highest priority, update the actual multiplier value to the default framework value
		If (ModIndex == FormListCount(akNPC, RS_MULTI_CHANGELIST) - 1)
			If(MultiplierString == "S0_S1")
				SetFloatValue(akNPC, RS_MULTI_S0_S1_CHANGELIST, 1.0)
			ElseIf(MultiplierString == "S1_S2")
				SetFloatValue(akNPC, RS_MULTI_S1_S2_CHANGELIST, 0.5)
			ElseIf(MultiplierString == "S2_S3")
				SetFloatValue(akNPC, RS_MULTI_S2_S3_CHANGELIST, 0.25)
			ElseIf(MultiplierString == "S3_S4")
				SetFloatValue(akNPC, RS_MULTI_S3_S4_CHANGELIST, 0.125)
			ElseIf(MultiplierString == "S4_S5")
				SetFloatValue(akNPC, RS_MULTI_S4_S5_CHANGELIST, 0.0625)
			ElseIf(MultiplierString == "S5_S4")
				SetFloatValue(akNPC, RS_MULTI_S5_S4_CHANGELIST, 0.125)
			ElseIf(MultiplierString == "S4_S3")
				SetFloatValue(akNPC, RS_MULTI_S4_S3_CHANGELIST, 0.25)
			ElseIf(MultiplierString == "S3_S2")
				SetFloatValue(akNPC, RS_MULTI_S3_S2_CHANGELIST, 0.5)
			ElseIf(MultiplierString == "S2_S1")
				SetFloatValue(akNPC, RS_MULTI_S2_S1_CHANGELIST, 1.0)
			ElseIf(MultiplierString == "S1_S0")
				SetFloatValue(akNPC, RS_MULTI_S1_S0_CHANGELIST, 2.0)
			ElseIf(MultiplierString == "S0_S-1")
				SetFloatValue(akNPC, RS_MULTI_S0_SM1_CHANGELIST, 1.0)
			ElseIf(MultiplierString == "S-1_S-2")
				SetFloatValue(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, 0.5)
			ElseIf(MultiplierString == "S-2_S-3")
				SetFloatValue(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, 0.25)
			ElseIf(MultiplierString == "S-3_S-4")
				SetFloatValue(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, 0.125)
			ElseIf(MultiplierString == "S-4_S-5")
				SetFloatValue(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, 0.0625)
			ElseIf(MultiplierString == "S-5_S-4")
				SetFloatValue(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, 0.125)
			ElseIf(MultiplierString == "S-4_S-3")
				SetFloatValue(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, 0.25)
			ElseIf(MultiplierString == "S-3_S-2")
				SetFloatValue(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, 0.5)
			ElseIf(MultiplierString == "S-2_S-1")
				SetFloatValue(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, 1.0)
			ElseIf(MultiplierString == "S-1_S0")
				SetFloatValue(akNPC, RS_MULTI_SM1_S0_CHANGELIST, 2.0)
			EndIf
		EndIf
		
		;update all the mod's changes
		If(MultiplierString == "S0_S1")
			FloatListSet(akNPC, RS_MULTI_S0_S1_CHANGELIST, ModIndex, 1.0)
			IntListSet(akNPC, RS_MULTI_S0_S1_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S1_S2")
			FloatListSet(akNPC, RS_MULTI_S1_S2_CHANGELIST, ModIndex, 0.5)
			IntListSet(akNPC, RS_MULTI_S1_S2_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S2_S3")
			FloatListSet(akNPC, RS_MULTI_S2_S3_CHANGELIST, ModIndex, 0.25)
			IntListSet(akNPC, RS_MULTI_S2_S3_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S3_S4")
			FloatListSet(akNPC, RS_MULTI_S3_S4_CHANGELIST, ModIndex, 0.125)
			IntListSet(akNPC, RS_MULTI_S3_S4_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S4_S5")
			FloatListSet(akNPC, RS_MULTI_S4_S5_CHANGELIST, ModIndex, 0.0625)
			IntListSet(akNPC, RS_MULTI_S4_S5_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S5_S4")
			FloatListSet(akNPC, RS_MULTI_S5_S4_CHANGELIST, ModIndex, 0.125)
			IntListSet(akNPC, RS_MULTI_S5_S4_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S4_S3")
			FloatListSet(akNPC, RS_MULTI_S4_S3_CHANGELIST, ModIndex, 0.25)
			IntListSet(akNPC, RS_MULTI_S4_S3_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S3_S2")
			FloatListSet(akNPC, RS_MULTI_S3_S2_CHANGELIST, ModIndex, 0.5)
			IntListSet(akNPC, RS_MULTI_S3_S2_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S2_S1")
			FloatListSet(akNPC, RS_MULTI_S2_S1_CHANGELIST, ModIndex, 1.0)
			IntListSet(akNPC, RS_MULTI_S2_S1_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S1_S0")
			FloatListSet(akNPC, RS_MULTI_S1_S0_CHANGELIST, ModIndex, 2.0)
			IntListSet(akNPC, RS_MULTI_S1_S0_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S0_S-1")
			FloatListSet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, ModIndex, 1.0)
			IntListSet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S-1_S-2")
			FloatListSet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex, 0.5)
			IntListSet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S-2_S-3")
			FloatListSet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex, 0.25)
			IntListSet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S-3_S-4")
			FloatListSet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex, 0.125)
			IntListSet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S-4_S-5")
			FloatListSet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex, 0.0625)
			IntListSet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S-5_S-4")
			FloatListSet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex, 0.125)
			IntListSet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S-4_S-3")
			FloatListSet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex, 0.25)
			IntListSet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S-3_S-2")
			FloatListSet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex, 0.5)
			IntListSet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S-2_S-1")
			FloatListSet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex, 1.0)
			IntListSet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex, 0)
		ElseIf(MultiplierString == "S-1_S0")
			FloatListSet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, ModIndex, 2.0)
			IntListSet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, ModIndex, 0)
		EndIf
		
		Return True
	EndIf
EndFunction

Bool Function RemoveAllRelationshipMulti(Quest akToken, Actor akNPC)
	If(_GetModIndexFromForm(akToken, REGISTERED_RS) == -1)
		Warn(FW_LOG, "A mod tried to remove its changes to " + akNPC.GetActorBase().GetName() + "'s relationship multipliers. It passed a wrong token, however. FormID of the token is " + akToken.GetFormID() + ".")
		Return False
	ElseIf(_GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST, akNPC) == -1)
		Notify(FW_LOG, "A mod tried to remove its changes to " + akNPC.GetActorBase().GetName() + "'s relationship multipliers. But there were no changes made by this mod. FormID of the token is " + akToken.GetFormID() + ".")
		Return False
	EndIf
	
	Int ModIndex = _GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST, akNPC)
	
	;if this is not the only mod in the multipliers changelist
	If (FormListCount(akNPC, RS_MULTI_CHANGELIST) > 1)
		;if the mod had highest priority, then set the multiplier values to those specified by the next mod
		If (ModIndex == FormListCount(akNPC, RS_MULTI_CHANGELIST) - 1)
			SetFloatValue(akNPC, RS_MULTI_S0_S1, FloatListGet(akNPC, RS_MULTI_S0_S1_CHANGELIST, ModIndex - 1))
			SetFloatValue(akNPC, RS_MULTI_S1_S2, FloatListGet(akNPC, RS_MULTI_S1_S2_CHANGELIST, ModIndex - 1))
			SetFloatValue(akNPC, RS_MULTI_S2_S3, FloatListGet(akNPC, RS_MULTI_S2_S3_CHANGELIST, ModIndex - 1))
			SetFloatValue(akNPC, RS_MULTI_S3_S4, FloatListGet(akNPC, RS_MULTI_S3_S4_CHANGELIST, ModIndex - 1))
			SetFloatValue(akNPC, RS_MULTI_S4_S5, FloatListGet(akNPC, RS_MULTI_S4_S5_CHANGELIST, ModIndex - 1))
			SetFloatValue(akNPC, RS_MULTI_S5_S4, FloatListGet(akNPC, RS_MULTI_S5_S4_CHANGELIST, ModIndex - 1))
			SetFloatValue(akNPC, RS_MULTI_S4_S3, FloatListGet(akNPC, RS_MULTI_S4_S3_CHANGELIST, ModIndex - 1))
			SetFloatValue(akNPC, RS_MULTI_S3_S2, FloatListGet(akNPC, RS_MULTI_S3_S2_CHANGELIST, ModIndex - 1))
			SetFloatValue(akNPC, RS_MULTI_S2_S1, FloatListGet(akNPC, RS_MULTI_S2_S1_CHANGELIST, ModIndex - 1))
			SetFloatValue(akNPC, RS_MULTI_S1_S0, FloatListGet(akNPC, RS_MULTI_S1_S0_CHANGELIST, ModIndex - 1))
			SetFloatValue(akNPC, RS_MULTI_S0_SM1, FloatListGet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, ModIndex - 1))
			SetFloatValue(akNPC, RS_MULTI_SM1_SM2, FloatListGet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex - 1))
			SetFloatValue(akNPC, RS_MULTI_SM2_SM3, FloatListGet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex - 1))
			SetFloatValue(akNPC, RS_MULTI_SM3_SM4, FloatListGet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex - 1))
			SetFloatValue(akNPC, RS_MULTI_SM4_SM5, FloatListGet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex - 1))
			SetFloatValue(akNPC, RS_MULTI_SM5_SM4, FloatListGet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex - 1))
			SetFloatValue(akNPC, RS_MULTI_SM4_SM3, FloatListGet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex - 1))
			SetFloatValue(akNPC, RS_MULTI_SM3_SM2, FloatListGet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex - 1))
			SetFloatValue(akNPC, RS_MULTI_SM2_SM1, FloatListGet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex - 1))
			SetFloatValue(akNPC, RS_MULTI_SM1_S0, FloatListGet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, ModIndex - 1))
		EndIf
	EndIf
		
	;remove the mod from the arrays
	FloatListRemoveAt(akNPC, RS_MULTI_S0_S1_CHANGELIST, ModIndex)
	IntListRemoveAt(akNPC, RS_MULTI_S0_S1_CHANGELIST, ModIndex)
	FloatListRemoveAt(akNPC, RS_MULTI_S1_S2_CHANGELIST, ModIndex)
	IntListRemoveAt(akNPC, RS_MULTI_S1_S2_CHANGELIST, ModIndex)
	FloatListRemoveAt(akNPC, RS_MULTI_S2_S3_CHANGELIST, ModIndex)
	IntListRemoveAt(akNPC, RS_MULTI_S2_S3_CHANGELIST, ModIndex)
	FloatListRemoveAt(akNPC, RS_MULTI_S3_S4_CHANGELIST, ModIndex)
	IntListRemoveAt(akNPC, RS_MULTI_S3_S4_CHANGELIST, ModIndex)
	FloatListRemoveAt(akNPC, RS_MULTI_S4_S5_CHANGELIST, ModIndex)
	IntListRemoveAt(akNPC, RS_MULTI_S4_S5_CHANGELIST, ModIndex)
	FloatListRemoveAt(akNPC, RS_MULTI_S5_S4_CHANGELIST, ModIndex)
	IntListRemoveAt(akNPC, RS_MULTI_S5_S4_CHANGELIST, ModIndex)
	FloatListRemoveAt(akNPC, RS_MULTI_S4_S3_CHANGELIST, ModIndex)
	IntListRemoveAt(akNPC, RS_MULTI_S4_S3_CHANGELIST, ModIndex)
	FloatListRemoveAt(akNPC, RS_MULTI_S3_S2_CHANGELIST, ModIndex)
	IntListRemoveAt(akNPC, RS_MULTI_S3_S2_CHANGELIST, ModIndex)
	FloatListRemoveAt(akNPC, RS_MULTI_S2_S1_CHANGELIST, ModIndex)
	IntListRemoveAt(akNPC, RS_MULTI_S2_S1_CHANGELIST, ModIndex)
	FloatListRemoveAt(akNPC, RS_MULTI_S1_S0_CHANGELIST, ModIndex)
	IntListRemoveAt(akNPC, RS_MULTI_S1_S0_CHANGELIST, ModIndex)
	FloatListRemoveAt(akNPC, RS_MULTI_S0_SM1_CHANGELIST, ModIndex)
	IntListRemoveAt(akNPC, RS_MULTI_S0_SM1_CHANGELIST, ModIndex)
	FloatListRemoveAt(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex)
	IntListRemoveAt(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex)
	FloatListRemoveAt(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex)
	IntListRemoveAt(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex)
	FloatListRemoveAt(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex)
	IntListRemoveAt(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex)
	FloatListRemoveAt(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex)
	IntListRemoveAt(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex)
	FloatListRemoveAt(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex)
	IntListRemoveAt(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex)
	FloatListRemoveAt(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex)
	IntListRemoveAt(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex)
	FloatListRemoveAt(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex)
	IntListRemoveAt(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex)
	FloatListRemoveAt(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex)
	IntListRemoveAt(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex)
	FloatListRemoveAt(akNPC, RS_MULTI_SM1_S0_CHANGELIST, ModIndex)
	IntListRemoveAt(akNPC, RS_MULTI_SM1_S0_CHANGELIST, ModIndex)
	
	FormListRemoveAt(akNPC, RS_MULTI_CHANGELIST, ModIndex)
	
	;if the arrays are now empty, clear them and unset the multipliers value
	If (FormListCount(akNPC, RS_MULTI_CHANGELIST) == 0)
		FormListClear(akNPC, RS_MULTI_CHANGELIST)
		
		FormListRemove(None, SYNC_MODE_NPC_CHANGELIST, akNPC) 	;remove the NPC from the list of NPC's with local relationship changes
		
		FloatListClear(akNPC, RS_MULTI_S0_S1_CHANGELIST)
		IntListClear(akNPC, RS_MULTI_S0_S1_CHANGELIST)
		FloatListClear(akNPC, RS_MULTI_S1_S2_CHANGELIST)
		IntListClear(akNPC, RS_MULTI_S1_S2_CHANGELIST)
		FloatListClear(akNPC, RS_MULTI_S2_S3_CHANGELIST)
		IntListClear(akNPC, RS_MULTI_S2_S3_CHANGELIST)
		FloatListClear(akNPC, RS_MULTI_S3_S4_CHANGELIST)
		IntListClear(akNPC, RS_MULTI_S3_S4_CHANGELIST)
		FloatListClear(akNPC, RS_MULTI_S4_S5_CHANGELIST)
		IntListClear(akNPC, RS_MULTI_S4_S5_CHANGELIST)
		FloatListClear(akNPC, RS_MULTI_S5_S4_CHANGELIST)
		IntListClear(akNPC, RS_MULTI_S5_S4_CHANGELIST)
		FloatListClear(akNPC, RS_MULTI_S4_S3_CHANGELIST)
		IntListClear(akNPC, RS_MULTI_S4_S3_CHANGELIST)
		FloatListClear(akNPC, RS_MULTI_S3_S2_CHANGELIST)
		IntListClear(akNPC, RS_MULTI_S3_S2_CHANGELIST)
		FloatListClear(akNPC, RS_MULTI_S2_S1_CHANGELIST)
		IntListClear(akNPC, RS_MULTI_S2_S1_CHANGELIST)
		FloatListClear(akNPC, RS_MULTI_S1_S0_CHANGELIST)
		IntListClear(akNPC, RS_MULTI_S1_S0_CHANGELIST)
		FloatListClear(akNPC, RS_MULTI_S0_SM1_CHANGELIST)
		IntListClear(akNPC, RS_MULTI_S0_SM1_CHANGELIST)
		FloatListClear(akNPC, RS_MULTI_SM1_SM2_CHANGELIST)
		IntListClear(akNPC, RS_MULTI_SM1_SM2_CHANGELIST)
		FloatListClear(akNPC, RS_MULTI_SM2_SM3_CHANGELIST)
		IntListClear(akNPC, RS_MULTI_SM2_SM3_CHANGELIST)
		FloatListClear(akNPC, RS_MULTI_SM3_SM4_CHANGELIST)
		IntListClear(akNPC, RS_MULTI_SM3_SM4_CHANGELIST)
		FloatListClear(akNPC, RS_MULTI_SM4_SM5_CHANGELIST)
		IntListClear(akNPC, RS_MULTI_SM4_SM5_CHANGELIST)
		FloatListClear(akNPC, RS_MULTI_SM5_SM4_CHANGELIST)
		IntListClear(akNPC, RS_MULTI_SM5_SM4_CHANGELIST)
		FloatListClear(akNPC, RS_MULTI_SM4_SM3_CHANGELIST)
		IntListClear(akNPC, RS_MULTI_SM4_SM3_CHANGELIST)
		FloatListClear(akNPC, RS_MULTI_SM3_SM2_CHANGELIST)
		IntListClear(akNPC, RS_MULTI_SM3_SM2_CHANGELIST)
		FloatListClear(akNPC, RS_MULTI_SM2_SM1_CHANGELIST)
		IntListClear(akNPC, RS_MULTI_SM2_SM1_CHANGELIST)
		FloatListClear(akNPC, RS_MULTI_SM1_S0_CHANGELIST)
		IntListClear(akNPC, RS_MULTI_SM1_S0_CHANGELIST)
		
		UnSetFloatValue(akNPC, RS_MULTI_S0_S1)
		UnSetFloatValue(akNPC, RS_MULTI_S1_S2)
		UnSetFloatValue(akNPC, RS_MULTI_S2_S3)
		UnSetFloatValue(akNPC, RS_MULTI_S3_S4)
		UnSetFloatValue(akNPC, RS_MULTI_S4_S5)
		UnSetFloatValue(akNPC, RS_MULTI_S5_S4)
		UnSetFloatValue(akNPC, RS_MULTI_S4_S3)
		UnSetFloatValue(akNPC, RS_MULTI_S3_S2)
		UnSetFloatValue(akNPC, RS_MULTI_S2_S1)
		UnSetFloatValue(akNPC, RS_MULTI_S1_S0)
		UnSetFloatValue(akNPC, RS_MULTI_S0_SM1)
		UnSetFloatValue(akNPC, RS_MULTI_SM1_SM2)
		UnSetFloatValue(akNPC, RS_MULTI_SM2_SM3)
		UnSetFloatValue(akNPC, RS_MULTI_SM3_SM4)
		UnSetFloatValue(akNPC, RS_MULTI_SM4_SM5)
		UnSetFloatValue(akNPC, RS_MULTI_SM5_SM4)
		UnSetFloatValue(akNPC, RS_MULTI_SM4_SM3)
		UnSetFloatValue(akNPC, RS_MULTI_SM3_SM2)
		UnSetFloatValue(akNPC, RS_MULTI_SM2_SM1)
		UnSetFloatValue(akNPC, RS_MULTI_SM1_S0)
		
		;if there is no other NPC with local relationship multiplier changes, clear the corresponding array
		If (FormListCount(None, SYNC_MODE_NPC_CHANGELIST) == 0)
			FormListClear(None, SYNC_MODE_NPC_CHANGELIST)
		EndIf
	EndIf
	
	Return True
EndFunction

Float Function GetRelationshipPoints(Actor akNPC)
	If(!akNPC)
		Throw(FW_LOG, "Argument akNPC is None!", "Invalid arguments")
		Return - 500.0
	EndIf

	If(!HasIntValue(akNPC, RSP) && akNPC.GetRelationshipRank(PlayerRef) != 0)
		If(GetSyncMode(akNPC) == 1 || GetSyncMode(akNPC) == 3)
			SetIntValue(akNPC, IGNORE_CHANGES, 1)
			SetRelationshipPoints(akNPC, akNPC.GetRelationshipRank(PlayerRef) * 100)
		EndIf
	EndIf

	Return GetFloatValue(akNPC, RSP)
EndFunction

Float Function ModRelationshipPoints(Actor akNPC, Float aiRelationshipPoints, Bool abIsSurplusCarryingOver = True)
	If(!akNPC)
		Throw(FW_LOG, "Argument akNPC is None!", "Invalid arguments")
		Return 0.0
	EndIf

	If(!akNPC.GetActorBase().IsUnique())
		Throw(FW_LOG, "Actor " + akNPC.GetActorBase().GetName() + " must be an unique actor!", "Invalid arguments")
		Return 0.0
	EndIf

	If(aiRelationshipPoints == 0)
		Warn(FW_LOG, "Argument aiRelationshipPoints was 0. Function will not be executed.")
	EndIf

	If(!HasIntValue(akNPC, RSP) && akNPC.GetRelationshipRank(PlayerRef) != 0 && GetIntValue(akNPC, SYNC_MODE) == 1 || GetIntValue(akNPC, SYNC_MODE) == 3)
		SetIntValue(akNPC, IGNORE_CHANGES, 1)
		SetRelationshipPoints(akNPC, akNPC.GetRelationshipRank(PlayerRef) * 100)
	EndIf

	If(!HasIntValue(akNPC, RSP) && akNPC.GetRelationshipRank(Alias_PC.GetActorRef()) != 0 && GetIntValue(akNPC, SYNC_MODE) == 1 || GetIntValue(akNPC, SYNC_MODE) == 3)
		SetIntValue(akNPC, IGNORE_CHANGES, 1)
		SetRelationshipPoints(akNPC, akNPC.GetRelationshipRank(Alias_PC.GetActorRef()) * 100)
	EndIf

	Float NewRP
	Float CurrentRP = GetRelationshipPoints(akNPC)
	Int CurrentRank = akNPC.GetFactionRank(RelationshipRankFaction)
	Bool Break

	If(aiRelationshipPoints > 0)
		While(!Break)
			Float CurrentMulti = GetRelationshipMulti(akNPC, CurrentRank, CurrentRank + 1)
			Float CleanedRP = aiRelationshipPoints * CurrentMulti
			Float TempRP = CurrentRP + CleanedRP
			Float RequiredRP = GetRPForNextRank(akNPC)

			If(CleanedRP <= (RequiredRP * CurrentMulti))
				NewRP = TempRP
				Break = True
			ElseIf(CleanedRP > (RequiredRP * CurrentMulti) && !abIsSurplusCarryingOver)
				NewRP = (CurrentRank + 1) * 100
				Break = True
			ElseIf(CleanedRP > (RequiredRP * CurrentMulti) && CurrentRank == 4)
				NewRP = 499
				Break = True
			ElseIf(CleanedRP > (RequiredRP * CurrentMulti) && abIsSurplusCarryingOver)
				CurrentRank += 1
				aiRelationshipPoints -= RequiredRP
				CurrentRP = CurrentRank * 100
				SetIntValue(akNPC, IGNORE_CHANGES, 1)
				SetRelationshipPoints(akNPC, CurrentRP)
			EndIf
		EndWhile
	Else
		While(!Break)
			Float CurrentMulti = GetRelationshipMulti(akNPC, CurrentRank, CurrentRank - 1)
			Float CleanedRP = aiRelationshipPoints * CurrentMulti
			Float TempRP = CurrentRP + CleanedRP
			Float RequiredRP = GetRPForPreviousRank(akNPC)

			If(CleanedRP >= (RequiredRP * CurrentMulti))
				NewRP = TempRP
				Break = True
			ElseIf(CleanedRP < (RequiredRP * CurrentMulti) && !abIsSurplusCarryingOver)
				NewRP = (CurrentRank - 1) * 100
				Break = True
			ElseIf(CleanedRP < (RequiredRP * CurrentMulti) && CurrentRank == -4)
				NewRP = -499
				Break = True
			ElseIf(CleanedRP < (RequiredRP * CurrentMulti) && abIsSurplusCarryingOver)
				CurrentRank -= 1
				aiRelationshipPoints -= RequiredRP
				CurrentRP = CurrentRank * 100
				SetIntValue(akNPC, IGNORE_CHANGES, 1)
				SetRelationshipPoints(akNPC, CurrentRP)
			EndIf
		EndWhile
	EndIf

	SetRelationshipPoints(akNPC, NewRP)
	Return NewRP
EndFunction

Bool Function SetRelationshipPoints(Actor akNPC, Float aiRelationshipPoints)
	If(!akNPC || aiRelationshipPoints < -499 || aiRelationshipPoints > 499)
		Return False
	EndIf

	SetFloatValue(akNPC, RSP, aiRelationshipPoints)

	akNPC.SetFactionRank(RelationshipPointsFaction, aiRelationshipPoints As Int % 100)
	akNPC.SetFactionRank(RelationshipRankFaction, Math.Floor(aiRelationshipPoints / 100))

	akNPC.SetFactionRank(RelationshipPointsFaction, aiRelationshipPoints As Int % 100)
	akNPC.SetFactionRank(RelationshipRankFaction, Math.Ceiling(aiRelationshipPoints / 100))

	If(GetSyncMode(akNPC) > 1 && !HasIntValue(akNPC, IGNORE_CHANGES))
		SetIntValue(akNPC, IGNORE_CHANGES, 1)
		akNPC.SetRelationshipRank(PlayerRef, Math.Ceiling(aiRelationshipPoints / 100))
	EndIf

	UnsetIntValue(akNPC, IGNORE_CHANGES)
	Return True
EndFunction

Float Function GetRPForNextRank(Actor akNPC)
	Float RP = GetRelationshipPoints(akNPC)
	Int RelationshipRank

	If(!akNPC.IsInFaction(RelationshipRankFaction))
		RelationshipRank = 0
	Else
		RelationshipRank = akNPC.GetFactionRank(RelationshipRankFaction)
	EndIf

	If(RelationshipRank == 4)
		Return (499 - RP) / GetRelationshipMulti(akNPC, RelationshipRank, RelationshipRank + 1)
	EndIf

	If(RP < 0)
		Return (RelationshipRank * 100 - RP + 1) / GetRelationshipMulti(akNPC, RelationshipRank, RelationshipRank + 1)
	Else
		Return ((RelationshipRank + 1) * 100 - RP) / GetRelationshipMulti(akNPC, RelationshipRank, RelationshipRank + 1)
	EndIf
EndFunction

Float Function GetRPForPreviousRank(Actor akNPC)
	Float RP = GetRelationshipPoints(akNPC)
	Int RelationshipRank

	If(!akNPC.IsInFaction(RelationshipRankFaction))
		RelationshipRank = 0
	Else
		RelationshipRank = akNPC.GetFactionRank(RelationshipRankFaction)
	EndIf

	If(RelationshipRank == -4)
		Return (-499 - RP) / GetRelationshipMulti(akNPC, RelationshipRank, RelationshipRank - 1)
	EndIf

	If(RP > 0)
		Return (RelationshipRank * 100 - RP - 1) / GetRelationshipMulti(akNPC, RelationshipRank, RelationshipRank - 1)
	Else
		Return ((RelationshipRank  - 1) * 100 - RP) / GetRelationshipMulti(akNPC, RelationshipRank, RelationshipRank - 1)
	EndIf
EndFunction