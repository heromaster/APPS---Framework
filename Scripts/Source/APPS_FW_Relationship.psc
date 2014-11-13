Scriptname APPS_FW_Relationship Extends APPS_FW_Core
Import StorageUtil
Import Exception

Faction Property RelationshipPointsFaction Auto
Faction Property RelationshipRankFaction Auto
ReferenceAlias Property Alias_PC Auto

Bool IsUninstallingAll = False
String Property SYNC_MODE = "APPS.Framework.Relationship.SyncMode" AutoReadOnly Hidden
String Property SUKEY_SYNC_MODE_CHANGELIST = "APPS.Framework.Relationship.SyncMode.ChangeList" AutoReadOnly Hidden
String Property SUKEY_SYNC_MODE_NPC_CHANGELIST = "APPS.Framework.Relationship.SyncMode.NPC.ChangeList" AutoReadOnly Hidden
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
	Return FormListCount(None, SYNC_MODE)
EndFunction

Int Function GetGlobalSyncModePos(Quest akToken)
	Return _GetModIndexFromForm(akToken, SYNC_MODE) + 1
EndFunction

Bool Function SetGlobalSyncMode(Quest akToken, Int aiSyncMode)
	Int ModIndex = _GetModIndexFromForm(akToken, SUKEY_REGISTERED_RS)

	If(ModIndex == -1)
		Throw(FW_LOG, " A mod, which is not registered or sent an invalid Token, tried to access SetGlobalSyncMode(). The FormID of this token is " + akToken.GetFormID() + ".", "Access denied")
		Return False
	EndIf

	If(aiSyncMode < 0 || aiSyncMode > 3)
		Throw(FW_LOG, "Sync modus wasn't set correctly by " + ModName + ". The lower limit is 0 and the upper limit is 3", "Invalid arguments")
		Return False
	EndIf

	String ModName = StringListGet(None, SUKEY_REGISTERED_RS, ModIndex)
	Int ModIndex2 = _GetModIndexFromForm(akToken, SUKEY_SYNC_MODE_CHANGELIST) ; Get position of current mod in this list
	Int SyncModeChanges = FormListCount(None, SUKEY_SYNC_MODE_CHANGELIST) ;Get the list of mods which do change the global sync mode

	;If the mod was found, update its new value
	If(ModIndex2 >= 0)
		IntListSet(None, SUKEY_SYNC_MODE_CHANGELIST, ModIndex2, aiSyncMode)
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
			Form ModToCmp = FormListGet(None, SUKEY_SYNC_MODE_CHANGELIST, i) ;Get mod at index i
			Int ModToCmpIdx = FormListFind(None, SUKEY_REGISTERED_RS, ModToCmp) ;Get priority of this comparing mod

			;If the actual mod has a higher priority than the comparing mod then continue cycling the list
			If(ModIndex > ModToCmpIdx)
				i += 1
			Else
				FormListInsert(None, SUKEY_SYNC_MODE_CHANGELIST, i, akToken) ;Insert the actual mod into the list before the comparing mod
				IntListInsert(None, SUKEY_SYNC_MODE_CHANGELIST, i, aiSyncMode) ;Insert the sync mode value as well
				Notify(FW_Log, "Can't change the global sync mode because it is already set by a mod with higher priority. However, the value will be set, if " + ModName + " becomes the highest priority.", False)
				Return True
			EndIf
		EndWhile
	EndIf

	;No changes made to the array, so just add the value to it and apply the changes to the framework
	FormListAdd(None, SUKEY_SYNC_MODE_CHANGELIST, akToken)
	IntListAdd(None, SUKEY_SYNC_MODE_CHANGELIST, aiSyncMode)
	SetIntValue(None, SYNC_MODE, aiSyncMode)
	Return True
EndFunction

Bool Function RemoveGlobalSyncMode(Quest akToken)
	If(_GetModIndexFromForm(akToken, SUKEY_REGISTERED_RS) == -1)
		Warn(FW_LOG, "A mod tried to remove its changes to the global sync mode. It passed a wrong token, however. FormID of the token is " + akToken.GetFormID() + ".")
		Return False
	ElseIf(_GetModIndexFromForm(akToken, SUKEY_SYNC_MODE_CHANGELIST) == -1)
		Notify(FW_LOG, "A mod tried to remove its changes to the global sync mode. But there were no changes made by this mod. FormID of the token is " + akToken.GetFormID() + ".")
		Return False
	EndIf

	Int ModIndex = _GetModIndexFromForm(akToken, SUKEY_SYNC_MODE_CHANGELIST)

	;If the global sync mode changelist only contains one element, remove the sync mode completely
	If(IntListCount(None, SUKEY_SYNC_MODE_CHANGELIST) == 1)
		UnsetIntValue(None, SYNC_MODE)
	;Else if the mod had the highest priority, do set the global sync mode to the value of the next mod
	ElseIf (ModIndex == IntListCount(None, SUKEY_SYNC_MODE_CHANGELIST) - 1)
		SetIntValue(None, SYNC_MODE, IntListGet(None, SYNC_MODE, ModIndex - 1))
	EndIf

	FormListRemove(None, SUKEY_SYNC_MODE_CHANGELIST, akToken)
	IntListRemoveAt(None, SUKEY_SYNC_MODE_CHANGELIST, ModIndex)
	
	;;if the changelists are now empty (e.g. the framework has been removed), clear them
	If (FormListCount(None, SUKEY_SYNC_MODE_CHANGELIST) == 0)
		FormListClear(None, SUKEY_SYNC_MODE_CHANGELIST)
		IntListClear(None, SUKEY_SYNC_MODE_CHANGELIST)
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
			Notify(FW_LOG, "Sync mode on " + akNPC.GetName() + " was not set, returning global sync mode.", False)
			Return GetGlobalSyncMode()
		Else
			Notify(FW_LOG, "No mod changed the sync mode on " + akNPC.GetName() + ".", False)
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

	Return FormListCount(akNPC, SYNC_MODE)
EndFunction

Int Function GetSyncModePos(Quest akToken, Actor akNPC)
	If(akNPC == None)
		Throw(FW_LOG, "Argument akNPC is None!", "Invalid arguments")
		Return -1
	EndIf

	Return _GetModIndexFromForm(akToken, SYNC_MODE, akNPC) + 1
EndFunction

Bool Function SetSyncMode(Quest akToken, Actor akNPC, Int aiSyncMode = 1)
	Int ModIndex = _GetModIndexFromForm(akToken, SUKEY_REGISTERED_RS)

	If(ModIndex == -1)
		Throw(FW_LOG, " A mod, which is not registered or sent an invalid token, tried to access SetSyncMode(). The FormID of this token is " + akToken.GetFormID() + ".", "Access denied")
		Return False
	EndIf

	If(!akNPC)
		Throw(FW_LOG, "Argument akNPC for function SetSyncMode() is None!", "Invalid arguments")
		Return False
	EndIf

	If(!akNPC.GetActorBase().IsUnique())
		Throw(FW_LOG, "Actor " + akNPC.GetName() + " must be an unique actor!", "Invalid arguments")
		Return False
	EndIf

	String ModName = StringListGet(None, SUKEY_REGISTERED_RS, ModIndex)

	If(aiSyncMode < 0 || aiSyncMode > 3)
		Throw(FW_LOG, "Sync mode for " + akNPC.GetName() + " was not correctly set by " + ModName + ". The lower limit is 0 and the upper limit is 3.", "Invalid arguments")
		Return False
	EndIf

	
	Int ModIndex2 = _GetModIndexFromForm(akToken, SUKEY_SYNC_MODE_CHANGELIST, akNPC) ; Get position of current mod in this list
	Int SyncModeChanges = FormListCount(akNPC, SUKEY_SYNC_MODE_CHANGELIST) ;Get the list of mods which do change the sync mode on an actor

	;If the mod was found, update its new value
	If(ModIndex2 >= 0)
		IntListSet(akNPC, SUKEY_SYNC_MODE_CHANGELIST, ModIndex2, aiSyncMode)
		
		Notify(FW_LOG, "Sync mode on " + akNPC.GetName() + " got updated by " + ModName + ".", False)

		;If the mod is also on the last position then also update the global sync mode
		If(ModIndex2 == SyncModeChanges - 1)
			SetIntValue(akNPC, SYNC_MODE, aiSyncMode)
			Return True
		Else
			Notify(FW_LOG, "Can't change the sync mode on " + akNPC.GetName() + " for " + ModName + " because it is already set by a mod with higher priority. However, it will be set, if this mod has the highest priority.", False)
			Return True
		EndIf
	Else
		Int i = 0

		;Go through the list of changes to the global sync mode
		While(i < SyncModeChanges)
			Form ModToCmp = FormListGet(akNPC, SUKEY_SYNC_MODE_CHANGELIST, i) ;Get mod at index i
			Int ModToCmpIdx = FormListFind(None, SUKEY_REGISTERED_RS, ModToCmp) ;Get priority of this comparing mod

			;If the actual mod has a higher priority than the comparing mod then continue cycling the list
			If(ModIndex > ModToCmpIdx)
				i += 1
			Else
				FormListInsert(akNPC, SUKEY_SYNC_MODE_CHANGELIST, i, akToken) ;Insert the actual mod into the list before the comparing mod
				IntListInsert(akNPC, SUKEY_SYNC_MODE_CHANGELIST, i, aiSyncMode) ;Insert the sync mode value as well
				Notify(FW_LOG, "Can't change the sync mode on " + akNPC.GetName() + " for " + ModName + " because it is already set by a mod with higher priority. However, it will be set, if this mod has the highest priority.", False)
				Return True
			EndIf
		EndWhile
	EndIf
	
	;No changes made to the array, so just add the value to it and apply the changes to the framework
	FormListAdd(akNPC, SUKEY_SYNC_MODE_CHANGELIST, akToken)
	IntListAdd(akNPC, SUKEY_SYNC_MODE_CHANGELIST, aiSyncMode) 
	FormListAdd(None, SUKEY_SYNC_MODE_NPC_CHANGELIST, akNPC)
	SetIntValue(akNPC, SYNC_MODE, aiSyncMode)
	Return True
EndFunction


Bool Function RemoveSyncMode(Quest akToken, Actor akNPC)
	If(_GetModIndexFromForm(akToken, SUKEY_REGISTERED_RS) == -1)
		Warn(FW_LOG, "A mod tried to remove its changes to the actor " + akNPC.GetName() + ". It passed a wrong token, however. FormID of the token is " + akToken.GetFormID() + ".")
		Return False
	EndIf
	
	If (FormListFind(None, SUKEY_SYNC_MODE_NPC_CHANGELIST, akNPC) == -1)
		Notify(FW_LOG, "A mod tried to remove its changes to the actor" + akNPC.GetName() + ", but there had been no changes made specifically to this actor by any mod. FormID of the token is " + akToken.GetFormID() + ".")
		Return False
	ElseIf (_GetModIndexFromForm(akToken, SUKEY_SYNC_MODE_CHANGELIST, akNPC) == -1)
		Notify(FW_LOG, "A mod tried to remove its changes to the actor" + akNPC.GetName() + ", but there had been no changes made to this actor by this mod. FormID of the token is " + akToken.GetFormID() + ".")
		Return False
	EndIf
	
	Int ModIndex = _GetModIndexFromForm(akToken, SUKEY_SYNC_MODE_CHANGELIST, akNPC)

	;If the npc sync mode changelist only contains one element, remove the sync mode completely from that npc and remove him from the list of npc's with local changelists
	If(IntListCount(akNPC, SUKEY_SYNC_MODE_CHANGELIST) == 1)
		UnsetIntValue(akNPC, SYNC_MODE)
		FormListRemove(None, SUKEY_SYNC_MODE_NPC_CHANGELIST, akNPC)
	;Else if the mod had the highest priority on the npc, do set the global sync mode to the value of the next mod on that npc
	ElseIf (ModIndex == IntListCount(akNPC, SUKEY_SYNC_MODE_CHANGELIST) - 1)
		SetIntValue(akNPC, SYNC_MODE, IntListGet(akNPC, SYNC_MODE, ModIndex - 1))
	EndIf

	FormListRemove(akNPC, SUKEY_SYNC_MODE_CHANGELIST, akToken)
	IntListRemoveAt(akNPC, SUKEY_SYNC_MODE_CHANGELIST, ModIndex)
	
	;if no NPC with local changes remains, clear the arrays
	If (FormListCount(None, SUKEY_SYNC_MODE_NPC_CHANGELIST) == 0)
		FormListClear(None, SUKEY_SYNC_MODE_NPC_CHANGELIST)
	EndIf
	
	;if the changelists are now empty (e.g. the framework has been removed), clear them
	If (FormListCount(akNPC, SUKEY_SYNC_MODE_CHANGELIST) == 0)
		FormListClear(akNPC, SUKEY_SYNC_MODE_CHANGELIST)
		IntListClear(akNPC, SUKEY_SYNC_MODE_CHANGELIST)
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

	String MultiplierString = "APPS.Relationship.RelationshipMulti.S" + aiFromRelationshipRank As String + "_" + "S" + aiToRelationshipRank As String
	Return GetFloatValue(None, MultiplierString)
EndFunction

Bool Function SetGlobalRelationshipMulti(Quest akToken, Int aiFromRelationshipRank, Int aiToRelationshipRank, Float aiMultiplier)
	Int ModIndex = _GetModIndexFromForm(akToken, SUKEY_REGISTERED_RS)

	If(ModIndex == -1)
		Throw(FW_LOG, " A mod, which is not registered or sent an invalid token, tried to access SetGlobalRelationshipMulti(). The FormID of this token is " + akToken.GetFormID() + ".", "Access denied")
		Return False
	EndIf

	If(aiFromRelationshipRank < -5 || aiFromRelationshipRank > 5)
		Throw(FW_LOG, "Argument aiFromRelationshipRank was not set correctly. The range is from -5 to 5.", "Invalid arguments")
		Return -1.0
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

	If(aiMultiplier <= 0)
		Throw(FW_LOG, "Multiplier can not be set to 0 or lower", "Invalid arguments")
		Return False
	EndIf

	String ModName = StringListGet(None, SUKEY_REGISTERED_RS, ModIndex)
	Int ModIndex2 = _GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST) ; Get position of current mod in this list
	Int RSMultiChanges = FormListCount(None, RS_MULTI_CHANGELIST) ;Get the list of mods which do change the sync mode on an actor
	String MultiplierString = "S" + aiFromRelationshipRank As String + "_S" + aiToRelationshipRank As String

	;If the mod was found, update its new value
	If(ModIndex2 >= 0)
		If(MultiplierString == "S0_S1")
			FloatListSet(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S1_S2")
			FloatListSet(None, RS_MULTI_S1_S2_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S2_S3")
			FloatListSet(None, RS_MULTI_S2_S3_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S3_S4")
			FloatListSet(None, RS_MULTI_S3_S4_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S4_S5")
			FloatListSet(None, RS_MULTI_S4_S5_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S5_S4")
			FloatListSet(None, RS_MULTI_S5_S4_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S4_S3")
			FloatListSet(None, RS_MULTI_S4_S3_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S3_S2")
			FloatListSet(None, RS_MULTI_S3_S2_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S2_S1")
			FloatListSet(None, RS_MULTI_S2_S1_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S1_S0")
			FloatListSet(None, RS_MULTI_S1_S0_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S0_S-1")
			FloatListSet(None, RS_MULTI_S0_SM1_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S-1_S-2")
			FloatListSet(None, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S-2_S-3")
			FloatListSet(None, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S-3_S-4")
			FloatListSet(None, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S-4_S-5")
			FloatListSet(None, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S-5_S-4")
			FloatListSet(None, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S-4_S-3")
			FloatListSet(None, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S-3_S-2")
			FloatListSet(None, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S-2_S-1")
			FloatListSet(None, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S-1_S0")
			FloatListSet(None, RS_MULTI_SM1_S0_CHANGELIST, ModIndex2, aiMultiplier)
		EndIf

		Notify(FW_LOG, "Global multiplier for rank " + aiFromRelationshipRank + " to " + aiToRelationshipRank + " got updated by " + ModName + ".", False)

		;If the mod is also on the last position then also update the global relationship multiplier
		If(ModIndex2 == RSMultiChanges - 1)
			If(MultiplierString == "S0_S1")
				SetFloatValue(None, RS_MULTI_S0_S1, aiMultiplier)
			ElseIf(MultiplierString == "S1_S2")
				SetFloatValue(None, RS_MULTI_S1_S2, aiMultiplier)
			ElseIf(MultiplierString == "S2_S3")
				SetFloatValue(None, RS_MULTI_S2_S3, aiMultiplier)
			ElseIf(MultiplierString == "S3_S4")
				SetFloatValue(None, RS_MULTI_S3_S4, aiMultiplier)
			ElseIf(MultiplierString == "S4_S5")
				SetFloatValue(None, RS_MULTI_S4_S5, aiMultiplier)
			ElseIf(MultiplierString == "S5_S4")
				SetFloatValue(None, RS_MULTI_S5_S4, aiMultiplier)
			ElseIf(MultiplierString == "S4_S3")
				SetFloatValue(None, RS_MULTI_S4_S3, aiMultiplier)
			ElseIf(MultiplierString == "S3_S2")
				SetFloatValue(None, RS_MULTI_S3_S2, aiMultiplier)
			ElseIf(MultiplierString == "S2_S1")
				SetFloatValue(None, RS_MULTI_S2_S1, aiMultiplier)
			ElseIf(MultiplierString == "S1_S0")
				SetFloatValue(None, RS_MULTI_S1_S0, aiMultiplier)
			ElseIf(MultiplierString == "S0_S-1")
				SetFloatValue(None, RS_MULTI_S0_SM1, aiMultiplier)
			ElseIf(MultiplierString == "S-1_S-2")
				SetFloatValue(None, RS_MULTI_SM1_SM2, aiMultiplier)
			ElseIf(MultiplierString == "S-2_S-3")
				SetFloatValue(None, RS_MULTI_SM2_SM3, aiMultiplier)
			ElseIf(MultiplierString == "S-3_S-4")
				SetFloatValue(None, RS_MULTI_SM3_SM4, aiMultiplier)
			ElseIf(MultiplierString == "S-4_S-5")
				SetFloatValue(None, RS_MULTI_SM4_SM5, aiMultiplier)
			ElseIf(MultiplierString == "S-5_S-4")
				SetFloatValue(None, RS_MULTI_SM5_SM4, aiMultiplier)
			ElseIf(MultiplierString == "S-4_S-3")
				SetFloatValue(None, RS_MULTI_SM4_SM3, aiMultiplier)
			ElseIf(MultiplierString == "S-3_S-2")
				SetFloatValue(None, RS_MULTI_SM3_SM2, aiMultiplier)
			ElseIf(MultiplierString == "S-2_S-1")
				SetFloatValue(None, RS_MULTI_SM2_SM1, aiMultiplier)
			ElseIf(MultiplierString == "S-1_S0")
				SetFloatValue(None, RS_MULTI_SM1_S0, aiMultiplier)
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
			Int ModToCmpIdx = FormListFind(None, SUKEY_REGISTERED_RS, ModToCmp) ;Get priority of this comparing mod

			;If the actual mod has a higher priority than the comparing mod then continue cycling the list
			If(ModIndex > ModToCmpIdx)
				i += 1
			Else
				FormListInsert(None, RS_MULTI_CHANGELIST, i, akToken) ;Insert the actual mod into the list before the comparing mod
				IntListInsert(None, RS_MULTI_CHANGELIST, i, 1) ;Insert the the marker for global relationship multiplier as well
				FloatListInsert(None, RS_MULTI_S0_S1_CHANGELIST, i, 1.0)
				FloatListInsert(None, RS_MULTI_S1_S2_CHANGELIST, i, 0.5)
				FloatListInsert(None, RS_MULTI_S2_S3_CHANGELIST, i, 0.25)
				FloatListInsert(None, RS_MULTI_S3_S4_CHANGELIST, i, 0.125)
				FloatListInsert(None, RS_MULTI_S4_S5_CHANGELIST, i, 0.0625)
				FloatListInsert(None, RS_MULTI_S5_S4_CHANGELIST, i, 0.125)
				FloatListInsert(None, RS_MULTI_S4_S3_CHANGELIST, i, 0.25)
				FloatListInsert(None, RS_MULTI_S3_S2_CHANGELIST, i, 0.5)
				FloatListInsert(None, RS_MULTI_S2_S1_CHANGELIST, i, 1.0)
				FloatListInsert(None, RS_MULTI_S1_S0_CHANGELIST, i, 2.0)
				FloatListInsert(None, RS_MULTI_S0_SM1_CHANGELIST, i, 1.0)
				FloatListInsert(None, RS_MULTI_SM1_SM2_CHANGELIST, i, 0.5)
				FloatListInsert(None, RS_MULTI_SM2_SM3_CHANGELIST, i, 0.25)
				FloatListInsert(None, RS_MULTI_SM3_SM4_CHANGELIST, i, 0.125)
				FloatListInsert(None, RS_MULTI_SM4_SM5_CHANGELIST, i, 0.0625)
				FloatListInsert(None, RS_MULTI_SM5_SM4_CHANGELIST, i, 0.125)
				FloatListInsert(None, RS_MULTI_SM4_SM3_CHANGELIST, i, 0.25)
				FloatListInsert(None, RS_MULTI_SM3_SM2_CHANGELIST, i, 0.5)
				FloatListInsert(None, RS_MULTI_SM2_SM1_CHANGELIST, i, 1.0)
				FloatListInsert(None, RS_MULTI_SM1_S0_CHANGELIST, i, 2.0)

				If(MultiplierString == "S0_S1")
					FloatListSet(None, RS_MULTI_S0_S1_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S1_S2")
					FloatListSet(None, RS_MULTI_S1_S2_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S2_S3")
					FloatListSet(None, RS_MULTI_S2_S3_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S3_S4")
					FloatListSet(None, RS_MULTI_S3_S4_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S4_S5")
					FloatListSet(None, RS_MULTI_S4_S5_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S5_S4")
					FloatListSet(None, RS_MULTI_S5_S4_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S4_S3")
					FloatListSet(None, RS_MULTI_S4_S3_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S3_S2")
					FloatListSet(None, RS_MULTI_S3_S2_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S2_S1")
					FloatListSet(None, RS_MULTI_S2_S1_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S1_S0")
					FloatListSet(None, RS_MULTI_S1_S0_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S0_S-1")
					FloatListSet(None, RS_MULTI_S0_SM1_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S-1_S-2")
					FloatListSet(None, RS_MULTI_SM1_SM2_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S-2_S-3")
					FloatListSet(None, RS_MULTI_SM2_SM3_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S-3_S-4")
					FloatListSet(None, RS_MULTI_SM3_SM4_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S-4_S-5")
					FloatListSet(None, RS_MULTI_SM4_SM5_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S-5_S-4")
					FloatListSet(None, RS_MULTI_SM5_SM4_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S-4_S-3")
					FloatListSet(None, RS_MULTI_SM4_SM3_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S-3_S-2")
					FloatListSet(None, RS_MULTI_SM3_SM2_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S-2_S-1")
					FloatListSet(None, RS_MULTI_SM2_SM1_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S-1_S0")
					FloatListSet(None, RS_MULTI_SM1_S0_CHANGELIST, i, aiMultiplier)
				EndIf
	
				Notify(FW_LOG, "Can't change the global relationship multiplier for " + ModName + " because it is already set by a mod with higher priority. However, it will be set, if this mod has the highest priority.", False)
				Return True
			EndIf
		EndWhile
	EndIf

	;No changes made to the array, so just add the value to it and apply the changes to the framework
	FormListAdd(None, RS_MULTI_CHANGELIST, akToken)
	IntListAdd(None, RS_MULTI_CHANGELIST, 1)
	FloatListAdd(None, RS_MULTI_S0_S1_CHANGELIST, 1.0)
	FloatListAdd(None, RS_MULTI_S1_S2_CHANGELIST, 0.5)
	FloatListAdd(None, RS_MULTI_S2_S3_CHANGELIST, 0.25)
	FloatListAdd(None, RS_MULTI_S3_S4_CHANGELIST, 0.125)
	FloatListAdd(None, RS_MULTI_S4_S5_CHANGELIST, 0.0625)
	FloatListAdd(None, RS_MULTI_S5_S4_CHANGELIST, 0.125)
	FloatListAdd(None, RS_MULTI_S4_S3_CHANGELIST, 0.25)
	FloatListAdd(None, RS_MULTI_S3_S2_CHANGELIST, 0.5)
	FloatListAdd(None, RS_MULTI_S2_S1_CHANGELIST, 1.0)
	FloatListAdd(None, RS_MULTI_S1_S0_CHANGELIST, 2.0)
	FloatListAdd(None, RS_MULTI_S0_SM1_CHANGELIST, 1.0)
	FloatListAdd(None, RS_MULTI_SM1_SM2_CHANGELIST, 0.5)
	FloatListAdd(None, RS_MULTI_SM2_SM3_CHANGELIST, 0.25)
	FloatListAdd(None, RS_MULTI_SM3_SM4_CHANGELIST, 0.125)
	FloatListAdd(None, RS_MULTI_SM4_SM5_CHANGELIST, 0.0625)
	FloatListAdd(None, RS_MULTI_SM5_SM4_CHANGELIST, 0.125)
	FloatListAdd(None, RS_MULTI_SM4_SM3_CHANGELIST, 0.25)
	FloatListAdd(None, RS_MULTI_SM3_SM2_CHANGELIST, 0.5)
	FloatListAdd(None, RS_MULTI_SM2_SM1_CHANGELIST, 1.0)
	Int i = FloatListAdd(None, RS_MULTI_SM1_S0_CHANGELIST, 2.0)

	If(MultiplierString == "S0_S1")
		SetFloatValue(None, RS_MULTI_S0_S1, aiMultiplier)
		FloatListSet(None, RS_MULTI_S0_S1_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S1_S2")
		SetFloatValue(None, RS_MULTI_S1_S2, aiMultiplier)
		FloatListSet(None, RS_MULTI_S1_S2_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S2_S3")
		SetFloatValue(None, RS_MULTI_S2_S3, aiMultiplier)
		FloatListSet(None, RS_MULTI_S2_S3_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S3_S4")
		SetFloatValue(None, RS_MULTI_S3_S4, aiMultiplier)
		FloatListSet(None, RS_MULTI_S3_S4_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S4_S5")
		SetFloatValue(None, RS_MULTI_S4_S5, aiMultiplier)
		FloatListSet(None, RS_MULTI_S4_S5_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S5_S4")
		SetFloatValue(None, RS_MULTI_S5_S4, aiMultiplier)
		FloatListSet(None, RS_MULTI_S5_S4_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S4_S3")
		SetFloatValue(None, RS_MULTI_S4_S3, aiMultiplier)
		FloatListSet(None, RS_MULTI_S4_S3_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S3_S2")
		SetFloatValue(None, RS_MULTI_S3_S2, aiMultiplier)
		FloatListSet(None, RS_MULTI_S3_S2_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S2_S1")
		SetFloatValue(None, RS_MULTI_S2_S1, aiMultiplier)
		FloatListSet(None, RS_MULTI_S2_S1_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S1_S0")
		SetFloatValue(None, RS_MULTI_S1_S0, aiMultiplier)
		FloatListSet(None, RS_MULTI_S1_S0_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S0_S-1")
		SetFloatValue(None, RS_MULTI_S0_SM1, aiMultiplier)
		FloatListSet(None, RS_MULTI_S0_SM1_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S-1_S-2")
		SetFloatValue(None, RS_MULTI_SM1_SM2, aiMultiplier)
		FloatListSet(None, RS_MULTI_SM1_SM2_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S-2_S-3")
		SetFloatValue(None, RS_MULTI_SM2_SM3, aiMultiplier)
		FloatListSet(None, RS_MULTI_SM2_SM3_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S-3_S-4")
		SetFloatValue(None, RS_MULTI_SM3_SM4, aiMultiplier)
		FloatListSet(None, RS_MULTI_SM3_SM4_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S-4_S-5")
		SetFloatValue(None, RS_MULTI_SM4_SM5, aiMultiplier)
		FloatListSet(None, RS_MULTI_SM4_SM5_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S-5_S-4")
		SetFloatValue(None, RS_MULTI_SM5_SM4, aiMultiplier)
		FloatListSet(None, RS_MULTI_SM5_SM4_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S-4_S-3")
		SetFloatValue(None, RS_MULTI_SM4_SM3, aiMultiplier)
		FloatListSet(None, RS_MULTI_SM4_SM3_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S-3_S-2")
		SetFloatValue(None, RS_MULTI_SM3_SM2, aiMultiplier)
		FloatListSet(None, RS_MULTI_SM3_SM2_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S-2_S-1")
		SetFloatValue(None, RS_MULTI_SM2_SM1, aiMultiplier)
		FloatListSet(None, RS_MULTI_SM2_SM1_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S-1_S0")
		SetFloatValue(None, RS_MULTI_SM1_S0, aiMultiplier)
		FloatListSet(None, RS_MULTI_SM1_S0_CHANGELIST, i, aiMultiplier)
	EndIf

	Return True
EndFunction

Bool Function RemoveGlobalRelationshipMulti(Quest akToken, Int aiFromRelationshipRank, Int aiToRelationshipRank)
;ANTONO resume work here
;ANTONO TODO: Various GetModPosition, RemoveAllGlobalRelationshipMulti
	If(_GetModIndexFromForm(akToken, SUKEY_REGISTERED_RS) == -1)
		Warn(FW_LOG, "A mod tried to remove its changes to the global relationship multipliers. It passed a wrong token, however. FormID of the token is " + akToken.GetFormID() + ".")
		Return False
	ElseIf(_GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST) == -1)
		Notify(FW_LOG, "A mod tried to remove its changes to the global relationship multipliers. But there were no changes made by this mod. FormID of the token is " + akToken.GetFormID() + ".")
		Return False
	EndIf

	If(aiFromRelationshipRank < -5 || aiFromRelationshipRank > 5)
		Throw(FW_LOG, "Argument aiFromRelationshipRank was not set correctly. The range is from -5 to 5.", "Invalid arguments")
		Return -1.0
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
	
EndFunction

Float Function GetRelationshipMulti(Actor akNPC, Int aiFromRelationshipRank, Int aiToRelationshipRank, Bool abIsGetGlobalIfNotFound = True)
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

	String MultiplierString = "APPS.Relationship.RelationshipMulti.S" + aiFromRelationshipRank As String + "_" + "S" + aiToRelationshipRank As String

	If(HasFloatValue(akNPC, MultiplierString))
		Return GetFloatValue(akNPC, MultiplierString)
	Else
		If(abIsGetGlobalIfNotFound)
			Return GetGlobalRelationshipMulti(aiFromRelationshipRank, aiToRelationshipRank)
		Else
			Return -1.0
		EndIf
	EndIf
EndFunction

Bool Function SetRelationshipMulti(Quest akToken, Actor akNPC, Int aiFromRelationshipRank, Int aiToRelationshipRank, Float aiMultiplier)
	Int ModIndex = _GetModIndexFromForm(akToken, SUKEY_REGISTERED_RS)

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
		Return -1.0
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

	If(aiMultiplier <= 0)
		Throw(FW_LOG, "Multiplier can not be set to 0 or lower", "Invalid arguments")
		False
	EndIf

	String ModName = StringListGet(None, SUKEY_REGISTERED_RS, ModIndex)
	Int ModIndex2 = _GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST, akNPC) ; Get position of current mod in this list
	Int RSMultiChanges = FormListCount(akNPC, RS_MULTI_CHANGELIST) ;Get the list of mods which do change the sync mode on an actor
	String MultiplierString = "S" + aiFromRelationshipRank As String + "_S" + aiToRelationshipRank As String

	;If the mod was found, update its new value
	If(ModIndex2 >= 0)
		If(MultiplierString == "S0_S1")
			FloatListSet(akNPC, RS_MULTI_S0_S1_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S1_S2")
			FloatListSet(akNPC, RS_MULTI_S1_S2_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S2_S3")
			FloatListSet(akNPC, RS_MULTI_S2_S3_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S3_S4")
			FloatListSet(akNPC, RS_MULTI_S3_S4_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S4_S5")
			FloatListSet(akNPC, RS_MULTI_S4_S5_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S5_S4")
			FloatListSet(akNPC, RS_MULTI_S5_S4_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S4_S3")
			FloatListSet(akNPC, RS_MULTI_S4_S3_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S3_S2")
			FloatListSet(akNPC, RS_MULTI_S3_S2_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S2_S1")
			FloatListSet(akNPC, RS_MULTI_S2_S1_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S1_S0")
			FloatListSet(akNPC, RS_MULTI_S1_S0_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S0_S-1")
			FloatListSet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S-1_S-2")
			FloatListSet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S-2_S-3")
			FloatListSet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S-3_S-4")
			FloatListSet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S-4_S-5")
			FloatListSet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S-5_S-4")
			FloatListSet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S-4_S-3")
			FloatListSet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S-3_S-2")
			FloatListSet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S-2_S-1")
			FloatListSet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex2, aiMultiplier)
		ElseIf(MultiplierString == "S-1_S0")
			FloatListSet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, ModIndex2, aiMultiplier)
		EndIf

		Notify(FW_LOG, "Global multiplier for rank " + aiFromRelationshipRank + " to " + aiToRelationshipRank + " got updated by " + ModName + ".", False)

		;If the mod is also on the last position then also update the relationship multiplier
		If(ModIndex2 == RSMultiChanges - 1)
			If(MultiplierString == "S0_S1")
				SetFloatValue(akNPC, RS_MULTI_S0_S1, aiMultiplier)
			ElseIf(MultiplierString == "S1_S2")
				SetFloatValue(akNPC, RS_MULTI_S1_S2, aiMultiplier)
			ElseIf(MultiplierString == "S2_S3")
				SetFloatValue(akNPC, RS_MULTI_S2_S3, aiMultiplier)
			ElseIf(MultiplierString == "S3_S4")
				SetFloatValue(akNPC, RS_MULTI_S3_S4, aiMultiplier)
			ElseIf(MultiplierString == "S4_S5")
				SetFloatValue(akNPC, RS_MULTI_S4_S5, aiMultiplier)
			ElseIf(MultiplierString == "S5_S4")
				SetFloatValue(akNPC, RS_MULTI_S5_S4, aiMultiplier)
			ElseIf(MultiplierString == "S4_S3")
				SetFloatValue(akNPC, RS_MULTI_S4_S3, aiMultiplier)
			ElseIf(MultiplierString == "S3_S2")
				SetFloatValue(akNPC, RS_MULTI_S3_S2, aiMultiplier)
			ElseIf(MultiplierString == "S2_S1")
				SetFloatValue(akNPC, RS_MULTI_S2_S1, aiMultiplier)
			ElseIf(MultiplierString == "S1_S0")
				SetFloatValue(akNPC, RS_MULTI_S1_S0, aiMultiplier)
			ElseIf(MultiplierString == "S0_S-1")
				SetFloatValue(akNPC, RS_MULTI_S0_SM1, aiMultiplier)
			ElseIf(MultiplierString == "S-1_S-2")
				SetFloatValue(akNPC, RS_MULTI_SM1_SM2, aiMultiplier)
			ElseIf(MultiplierString == "S-2_S-3")
				SetFloatValue(akNPC, RS_MULTI_SM2_SM3, aiMultiplier)
			ElseIf(MultiplierString == "S-3_S-4")
				SetFloatValue(akNPC, RS_MULTI_SM3_SM4, aiMultiplier)
			ElseIf(MultiplierString == "S-4_S-5")
				SetFloatValue(akNPC, RS_MULTI_SM4_SM5, aiMultiplier)
			ElseIf(MultiplierString == "S-5_S-4")
				SetFloatValue(akNPC, RS_MULTI_SM5_SM4, aiMultiplier)
			ElseIf(MultiplierString == "S-4_S-3")
				SetFloatValue(akNPC, RS_MULTI_SM4_SM3, aiMultiplier)
			ElseIf(MultiplierString == "S-3_S-2")
				SetFloatValue(akNPC, RS_MULTI_SM3_SM2, aiMultiplier)
			ElseIf(MultiplierString == "S-2_S-1")
				SetFloatValue(akNPC, RS_MULTI_SM2_SM1, aiMultiplier)
			ElseIf(MultiplierString == "S-1_S0")
				SetFloatValue(akNPC, RS_MULTI_SM1_S0, aiMultiplier)
			EndIf
		Else
			Notify(FW_LOG, "Can't change the relationship multiplier on " + akNPC.GetName() + " for " + ModName + " because it is already set by a mod with higher priority. However, it will be set, if this mod has the highest priority.", False)
			Return True
		EndIf
	Else
		Int i = 0

		;Go through the list of changes to the global relationship multiplier
		While(i < RSMultiChanges)
			Form ModToCmp = FormListGet(akNPC, RS_MULTI_CHANGELIST, i) ;Get mod at index i
			Int ModToCmpIdx = FormListFind(None, SUKEY_REGISTERED_RS, ModToCmp) ;Get priority of this comparing mod

			;If the actual mod has a higher priority than the comparing mod then continue cycling the list
			If(ModIndex > ModToCmpIdx)
				i += 1
			Else
				FormListInsert(akNPC, RS_MULTI_CHANGELIST, i, akToken) ;Insert the actual mod into the list before the comparing mod
				IntListInsert(akNPC, RS_MULTI_CHANGELIST, i, 1) ;Insert the the marker for relationship multiplier as well
				FloatListInsert(akNPC, RS_MULTI_S0_S1_CHANGELIST, i, 1.0)
				FloatListInsert(akNPC, RS_MULTI_S1_S2_CHANGELIST, i, 0.5)
				FloatListInsert(akNPC, RS_MULTI_S2_S3_CHANGELIST, i, 0.25)
				FloatListInsert(akNPC, RS_MULTI_S3_S4_CHANGELIST, i, 0.125)
				FloatListInsert(akNPC, RS_MULTI_S4_S5_CHANGELIST, i, 0.0625)
				FloatListInsert(akNPC, RS_MULTI_S5_S4_CHANGELIST, i, 0.125)
				FloatListInsert(akNPC, RS_MULTI_S4_S3_CHANGELIST, i, 0.25)
				FloatListInsert(akNPC, RS_MULTI_S3_S2_CHANGELIST, i, 0.5)
				FloatListInsert(akNPC, RS_MULTI_S2_S1_CHANGELIST, i, 1.0)
				FloatListInsert(akNPC, RS_MULTI_S1_S0_CHANGELIST, i, 2.0)
				FloatListInsert(akNPC, RS_MULTI_S0_SM1_CHANGELIST, i, 1.0)
				FloatListInsert(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, i, 0.5)
				FloatListInsert(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, i, 0.25)
				FloatListInsert(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, i, 0.125)
				FloatListInsert(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, i, 0.0625)
				FloatListInsert(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, i, 0.125)
				FloatListInsert(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, i, 0.25)
				FloatListInsert(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, i, 0.5)
				FloatListInsert(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, i, 1.0)
				FloatListInsert(akNPC, RS_MULTI_SM1_S0_CHANGELIST, i, 2.0)

				If(MultiplierString == "S0_S1")

					FloatListSet(akNPC, RS_MULTI_S0_S1_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S1_S2")
					FloatListSet(akNPC, RS_MULTI_S1_S2_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S2_S3")
					FloatListSet(akNPC, RS_MULTI_S2_S3_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S3_S4")
					FloatListSet(akNPC, RS_MULTI_S3_S4_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S4_S5")
					FloatListSet(akNPC, RS_MULTI_S4_S5_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S5_S4")
					FloatListSet(akNPC, RS_MULTI_S5_S4_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S4_S3")
					FloatListSet(akNPC, RS_MULTI_S4_S3_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S3_S2")
					FloatListSet(akNPC, RS_MULTI_S3_S2_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S2_S1")
					FloatListSet(akNPC, RS_MULTI_S2_S1_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S1_S0")
					FloatListSet(akNPC, RS_MULTI_S1_S0_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S0_S-1")
					FloatListSet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S-1_S-2")
					FloatListSet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S-2_S-3")
					FloatListSet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S-3_S-4")
					FloatListSet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S-4_S-5")
					FloatListSet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S-5_S-4")
					FloatListSet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S-4_S-3")
					FloatListSet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S-3_S-2")
					FloatListSet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S-2_S-1")
					FloatListSet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, i, aiMultiplier)
				ElseIf(MultiplierString == "S-1_S0")
					FloatListSet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, i, aiMultiplier)
				EndIf

				Notify(FW_LOG, "Can't change the relationship multiplier on " + akNPC.GetName() + " for " + ModName + " because it is already set by a mod with higher priority. However, it will be set, if this mod has the highest priority.", False)
				Return True
			EndIf
		EndWhile
	EndIf

	;No changes made to the array, so just add the value to it and apply the changes to the framework
	FormListAdd(akNPC, RS_MULTI_CHANGELIST, akToken)
	IntListAdd(akNPC, RS_MULTI_CHANGELIST, 1)
	FloatListAdd(akNPC, RS_MULTI_S0_S1_CHANGELIST, 1.0)
	FloatListAdd(akNPC, RS_MULTI_S1_S2_CHANGELIST, 0.5)
	FloatListAdd(akNPC, RS_MULTI_S2_S3_CHANGELIST, 0.25)
	FloatListAdd(akNPC, RS_MULTI_S3_S4_CHANGELIST, 0.125)
	FloatListAdd(akNPC, RS_MULTI_S4_S5_CHANGELIST, 0.0625)
	FloatListAdd(akNPC, RS_MULTI_S5_S4_CHANGELIST, 0.125)
	FloatListAdd(akNPC, RS_MULTI_S4_S3_CHANGELIST, 0.25)
	FloatListAdd(akNPC, RS_MULTI_S3_S2_CHANGELIST, 0.5)
	FloatListAdd(akNPC, RS_MULTI_S2_S1_CHANGELIST, 1.0)
	FloatListAdd(akNPC, RS_MULTI_S1_S0_CHANGELIST, 2.0)
	FloatListAdd(akNPC, RS_MULTI_S0_SM1_CHANGELIST, 1.0)
	FloatListAdd(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, 0.5)
	FloatListAdd(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, 0.25)
	FloatListAdd(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, 0.125)
	FloatListAdd(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, 0.0625)
	FloatListAdd(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, 0.125)
	FloatListAdd(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, 0.25)
	FloatListAdd(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, 0.5)
	FloatListAdd(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, 1.0)
	Int i = FloatListAdd(akNPC, RS_MULTI_SM1_S0_CHANGELIST, 2.0)

	If(MultiplierString == "S0_S1")
		SetFloatValue(akNPC, RS_MULTI_S0_S1, aiMultiplier)
		FloatListSet(akNPC, RS_MULTI_S0_S1_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S1_S2")
		SetFloatValue(akNPC, RS_MULTI_S1_S2, aiMultiplier)
		FloatListSet(akNPC, RS_MULTI_S1_S2_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S2_S3")
		SetFloatValue(akNPC, RS_MULTI_S2_S3, aiMultiplier)
		FloatListSet(akNPC, RS_MULTI_S2_S3_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S3_S4")
		SetFloatValue(akNPC, RS_MULTI_S3_S4, aiMultiplier)
		FloatListSet(akNPC, RS_MULTI_S3_S4_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S4_S5")
		SetFloatValue(akNPC, RS_MULTI_S4_S5, aiMultiplier)
		FloatListSet(akNPC, RS_MULTI_S4_S5_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S5_S4")
		SetFloatValue(akNPC, RS_MULTI_S5_S4, aiMultiplier)
		FloatListSet(akNPC, RS_MULTI_S5_S4_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S4_S3")
		SetFloatValue(akNPC, RS_MULTI_S4_S3, aiMultiplier)
		FloatListSet(akNPC, RS_MULTI_S4_S3_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S3_S2")
		SetFloatValue(akNPC, RS_MULTI_S3_S2, aiMultiplier)
		FloatListSet(akNPC, RS_MULTI_S3_S2_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S2_S1")
		SetFloatValue(akNPC, RS_MULTI_S2_S1, aiMultiplier)
		FloatListSet(akNPC, RS_MULTI_S2_S1_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S1_S0")
		SetFloatValue(akNPC, RS_MULTI_S1_S0, aiMultiplier)
		FloatListSet(akNPC, RS_MULTI_S1_S0_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S0_S-1")
		SetFloatValue(akNPC, RS_MULTI_S0_SM1, aiMultiplier)
		FloatListSet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S-1_S-2")
		SetFloatValue(akNPC, RS_MULTI_SM1_SM2, aiMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S-2_S-3")
		SetFloatValue(akNPC, RS_MULTI_SM2_SM3, aiMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S-3_S-4")
		SetFloatValue(akNPC, RS_MULTI_SM3_SM4, aiMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S-4_S-5")
		SetFloatValue(akNPC, RS_MULTI_SM4_SM5, aiMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S-5_S-4")
		SetFloatValue(akNPC, RS_MULTI_SM5_SM4, aiMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S-4_S-3")
		SetFloatValue(akNPC, RS_MULTI_SM4_SM3, aiMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S-3_S-2")
		SetFloatValue(akNPC, RS_MULTI_SM3_SM2, aiMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S-2_S-1")
		SetFloatValue(akNPC, RS_MULTI_SM2_SM1, aiMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, i, aiMultiplier)
	ElseIf(MultiplierString == "S-1_S0")
		SetFloatValue(akNPC, RS_MULTI_SM1_S0, aiMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, i, aiMultiplier)
	EndIf

	FormListAdd(None, RS_MULTI_NPC_CHANGELIST, akNPC)
	Return True
EndFunction

Float Function GetRelationshipPoints(Actor akNPC)
	If(akNPC == None)
		Throw(FW_LOG, "Argument akNPC is None!", "Invalid arguments")
		Return - 500.0
	EndIf

	Return GetFloatValue(akNPC, RSP)
EndFunction

Float Function ModRelationshipPoints(Actor akNPC, Float auiRelationshipPoints, Bool abIsSurplusCarryingOver = True)
	If(!akNPC)
		Throw(FW_LOG, "Argument akNPC is None!", "Invalid arguments")
		Return 0.0
	EndIf

	If(!akNPC.GetActorBase().IsUnique())
		Throw(FW_LOG, "Actor " + akNPC.GetName() + " must be an unique actor!", "Invalid arguments")
		Return 0.0
	EndIf

	If(auiRelationshipPoints == 0)
		Warn(FW_LOG, "Argument auiRelationshipPoints was 0. Function will not be executed.")
	EndIf

	Float NewRP
	Float CurrentRP = GetRelationshipPoints(akNPC)
	Int CurrentRank = akNPC.GetFactionRank(RelationshipRankFaction)
	Bool Break

	If(auiRelationshipPoints > 0)
		While(!Break)
			Float CurrentMulti = GetRelationshipMulti(akNPC, CurrentRank, CurrentRank + 1)
			Float CleanedRP = auiRelationshipPoints * CurrentMulti
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
				auiRelationshipPoints -= RequiredRP
				CurrentRP = CurrentRank * 100
				akNPC.ModFactionRank(RelationshipRankFaction, 1)
				SetIntValue(akNPC, IGNORE_CHANGES, 1)
				SetRelationshipPoints(akNPC, CurrentRP)
			EndIf
		EndWhile
	Else
		While(!Break)
			Float CurrentMulti = GetRelationshipMulti(akNPC, CurrentRank, CurrentRank - 1)
			Float CleanedRP = auiRelationshipPoints * CurrentMulti
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
				auiRelationshipPoints -= RequiredRP
				CurrentRP = CurrentRank * 100
				akNPC.ModFactionRank(RelationshipRankFaction, -1)
				SetIntValue(akNPC, IGNORE_CHANGES, 1)
				SetRelationshipPoints(akNPC, CurrentRP)
			EndIf
		EndWhile
	EndIf

	SetRelationshipPoints(akNPC, NewRP)
	Return NewRP
EndFunction

Bool Function SetRelationshipPoints(Actor akNPC, Float auiRelationshipPoints)
	If(akNPC == None || auiRelationshipPoints < -499 || auiRelationshipPoints > 499)
		Return False
	EndIf

	SetFloatValue(akNPC, RSP, auiRelationshipPoints)

	If(GetSyncMode(akNPC) > 1 && !HasIntValue(akNPC, IGNORE_CHANGES))
		SetIntValue(akNPC, IGNORE_CHANGES, 1)
		akNPC.SetRelationshipRank(Alias_PC.GetActorRef(), Math.Ceiling(auiRelationshipPoints / 100))
	EndIf

	UnsetIntValue(akNPC, IGNORE_CHANGES)
	Return True
EndFunction

Float Function GetRPForNextRank(Actor akNPC)
	Float RP = GetRelationshipPoints(akNPC)
	Int RelationshipRank = akNPC.GetFactionRank(RelationshipRankFaction)

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
	Int RelationshipRank = akNPC.GetFactionRank(RelationshipRankFaction)

	If(RelationshipRank == -4)
		Return (-499 - RP) / GetRelationshipMulti(akNPC, RelationshipRank, RelationshipRank - 1)
	EndIf

	If(RP > 0)
		Return (RelationshipRank * 100 - RP - 1) / GetRelationshipMulti(akNPC, RelationshipRank, RelationshipRank - 1)
	Else
		Return ((RelationshipRank  - 1) * 100 - RP) / GetRelationshipMulti(akNPC, RelationshipRank, RelationshipRank - 1)
	EndIf
EndFunction