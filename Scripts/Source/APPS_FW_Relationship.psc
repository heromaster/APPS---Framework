Scriptname APPS_FW_Relationship Extends APPS_FW_Core
Import StorageUtil
Import Exception

Actor Property PlayerRef Auto
Faction Property RelationshipPointsFaction Auto
Faction Property RelationshipRankFaction Auto

Bool IsUninstallingAll = False

Int Property AVERAGE = 3 AutoReadOnly Hidden
Int Property HIGHEST = 1 AutoReadOnly Hidden
Int Property LOWEST = 2 AutoReadOnly Hidden
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
String Property RS_MULTI_PREFIX = "APPS.Framework.Relationship.RelationshipMulti." AutoReadOnly Hidden
String Property RS_MULTI_CHANGELIST_SUFFIX = ".ChangeList" AutoReadOnly Hidden
String Property RSP = "APPS.Framework.Relationship.RelationshipPoints" AutoReadOnly Hidden
String Property IGNORE_CHANGES = "APPS.Framework.Relationship.IgnoreRankChange" AutoReadOnly Hidden
String Property GROUPS = "APPS.Framework.Relationship.Groups" AutoReadOnly Hidden
String Property GROUPS_LINK = "APPS.Framework.Relationship.Groups.Global" AutoReadOnly Hidden

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
				Notify(FW_LOG, "Can't change the global sync mode because it is already set by a mod with higher priority. However, the value will be set, if " + ModName + " becomes the highest priority.", False)
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

Int Function RemoveGlobalSyncMode(Quest akToken, Bool abVerbose = True)
	If(_GetModIndexFromForm(akToken, REGISTERED_RS) == -1)
		Warn(FW_LOG, "A mod tried to remove its changes to the global sync mode. It passed a wrong token, however. FormID of the token is " + akToken.GetFormID() + ".")
		Return -2
	ElseIf(_GetModIndexFromForm(akToken, SYNC_MODE_CHANGELIST) == -1)
		If (abVerbose)
			Notify(FW_LOG, "A mod tried to remove its changes to the global sync mode. But there were no changes made by this mod. FormID of the token is " + akToken.GetFormID() + ".")
		EndIf
		Return -1
	EndIf

	Int ModIndex = _GetModIndexFromForm(akToken, SYNC_MODE_CHANGELIST)
	Int myGlobalSyncMode = IntlistGet(None, SYNC_MODE_CHANGELIST, ModIndex)	;fetching akToken's syncmode change and stores it in order to return it in the end

	;If the global sync mode changelist only contains one element, remove the sync mode completely
	If(IntListCount(None, SYNC_MODE_CHANGELIST) == 1)
		UnsetIntValue(None, SYNC_MODE)
	;Else if the mod had the highest priority, do set the global sync mode to the value of the next mod
	ElseIf (ModIndex == IntListCount(None, SYNC_MODE_CHANGELIST) - 1)
		SetIntValue(None, SYNC_MODE, IntListGet(None, SYNC_MODE, ModIndex - 1))
	EndIf

	FormListRemove(None, SYNC_MODE_CHANGELIST, akToken)
	IntListRemoveAt(None, SYNC_MODE_CHANGELIST, ModIndex)

	;if the changelists are now empty (e.g. the framework has been removed), clear them
	If (FormListCount(None, SYNC_MODE_CHANGELIST) == 0)
		FormListClear(None, SYNC_MODE_CHANGELIST)
		IntListClear(None, SYNC_MODE_CHANGELIST)
	EndIf

	Return myGlobalSyncMode
EndFunction

Int Function GetSyncMode(Actor akNPC, Bool abGetGlobalIfNotFound = True, Bool abNotifyIfGetGlobal = True)
	If(akNPC == None)
		Throw(FW_LOG, "Argument akNPC is None!", "Invalid arguments")
		Return -1
	EndIf

	If(!HasIntValue(akNPC, SYNC_MODE))
		If(abGetGlobalIfNotFound)
			If (abNotifyIfGetGlobal)
				Notify(FW_LOG, "Sync mode on " + akNPC.GetLeveledActorBase().GetName() + " was not set, returning global sync mode.", False)
			EndIf
			Return GetGlobalSyncMode()
		Else
			Notify(FW_LOG, "No mod changed the sync mode on " + akNPC.GetLeveledActorBase().GetName() + ".", False)
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

	If(!akNPC.GetLeveledActorBase().IsUnique())
		Throw(FW_LOG, "Actor " + akNPC.GetLeveledActorBase().GetName() + " must be an unique actor!", "Invalid arguments")
		Return False
	EndIf

	String ModName = GetStringValue(akToken, MOD_NAME)

	If(aiSyncMode < 0 || aiSyncMode > 3)
		Throw(FW_LOG, "Sync mode for " + akNPC.GetLeveledActorBase().GetName() + " was not correctly set by " + ModName + ". The lower limit is 0 and the upper limit is 3.", "Invalid arguments")
		Return False
	EndIf


	Int ModIndex2 = _GetModIndexFromForm(akToken, SYNC_MODE_CHANGELIST, akNPC) ; Get position of current mod in this list
	Int SyncModeChanges = FormListCount(akNPC, SYNC_MODE_CHANGELIST) ;Get the list of mods which do change the sync mode on the actor

	;If the mod was found, update its new value
	If(ModIndex2 >= 0)
		IntListSet(akNPC, SYNC_MODE_CHANGELIST, ModIndex2, aiSyncMode)

		Notify(FW_LOG, "Sync mode on " + akNPC.GetLeveledActorBase().GetName() + " got updated by " + ModName + ".", False)

		;If the mod is also on the last position then also update the global sync mode
		If(ModIndex2 == SyncModeChanges - 1)
			SetIntValue(akNPC, SYNC_MODE, aiSyncMode)
			Return True
		Else
			Notify(FW_LOG, "Can't change the sync mode on " + akNPC.GetLeveledActorBase().GetName() + " for " + ModName + " because it is already set by a mod with higher priority. However, it will be set, if this mod has the highest priority.", False)
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
				Notify(FW_LOG, "Can't change the sync mode on " + akNPC.GetLeveledActorBase().GetName() + " for " + ModName + " because it is already set by a mod with higher priority. However, it will be set, if this mod has the highest priority.", False)
				Return True
			EndIf
		EndWhile
	EndIf

	;No changes made to the array, so just add the value to it and apply the changes to the framework
	FormListAdd(akNPC, SYNC_MODE_CHANGELIST, akToken)
	IntListAdd(akNPC, SYNC_MODE_CHANGELIST, aiSyncMode)
	FormListAdd(None, SYNC_MODE_NPC_CHANGELIST, akNPC, False)
	SetIntValue(akNPC, SYNC_MODE, aiSyncMode)
	Return True
EndFunction

Int Function RemoveSyncMode(Quest akToken, Actor akNPC)
	If(!akNPC)
		Throw(FW_LOG, "Argument akNPC for function RemoveSyncMode() is None!", "Invalid arguments")
		Return -2
	EndIf

	If(_GetModIndexFromForm(akToken, REGISTERED_RS) == -1)
		Warn(FW_LOG, "A mod tried to remove its changes to the actor " + akNPC.GetLeveledActorBase().GetName() + ". It passed a wrong token, however. FormID of the token is " + akToken.GetFormID() + ".")
		Return -2
	EndIf

	If(!FormListHas(None, SYNC_MODE_NPC_CHANGELIST, akNPC))
		Notify(FW_LOG, "A mod tried to remove its changes to the actor" + akNPC.GetLeveledActorBase().GetName() + ", but there had been no changes made specifically to this actor by any mod. FormID of the token is " + akToken.GetFormID() + ".")
		Return -1
	ElseIf(_GetModIndexFromForm(akToken, SYNC_MODE_CHANGELIST, akNPC) == -1)
		Notify(FW_LOG, "A mod tried to remove its changes to the actor" + akNPC.GetLeveledActorBase().GetName() + ", but there had been no changes made to this actor by this mod. FormID of the token is " + akToken.GetFormID() + ".")

		Return -1
	EndIf

	Int ModIndex = _GetModIndexFromForm(akToken, SYNC_MODE_CHANGELIST, akNPC)
	Int SyncMode = IntListGet(akNPC, SYNC_MODE_CHANGELIST, ModIndex)

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

	Return SyncMode
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

Bool Function SetGlobalRelationshipMulti(Quest akToken, Int aiFromRelationshipRank, Int aiToRelationshipRank, Float afMultiplier)
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

	If(afMultiplier <= 0.0)
		Throw(FW_LOG, "Multiplier can not be set to 0 or lower", "Invalid arguments")
		Return False
	EndIf

	String ModName = GetStringValue(akToken, MOD_NAME)
	Int ModIndex2 = _GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST) ; Get position of current mod in this list
	Int RSMultiChanges = FormListCount(None, RS_MULTI_CHANGELIST) ;Get the list of mods which do change the global relationship multipliers
	String MultiplierString = "S" + aiFromRelationshipRank As String + "_S" + aiToRelationshipRank As String

	;If the mod was found, update its new value
	If(ModIndex2 >= 0)
		If(MultiplierString == "S0_S1")
			FloatListSet(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex2, 1)	; 0: default framework values, 1: custom mod values
		ElseIf(MultiplierString == "S1_S2")
			FloatListSet(None, RS_MULTI_S1_S2_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(None, RS_MULTI_S1_S2_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S2_S3")
			FloatListSet(None, RS_MULTI_S2_S3_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(None, RS_MULTI_S2_S3_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S3_S4")
			FloatListSet(None, RS_MULTI_S3_S4_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(None, RS_MULTI_S3_S4_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S4_S5")
			FloatListSet(None, RS_MULTI_S4_S5_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(None, RS_MULTI_S4_S5_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S5_S4")
			FloatListSet(None, RS_MULTI_S5_S4_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(None, RS_MULTI_S5_S4_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S4_S3")
			FloatListSet(None, RS_MULTI_S4_S3_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(None, RS_MULTI_S4_S3_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S3_S2")
			FloatListSet(None, RS_MULTI_S3_S2_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(None, RS_MULTI_S3_S2_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S2_S1")
			FloatListSet(None, RS_MULTI_S2_S1_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(None, RS_MULTI_S2_S1_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S1_S0")
			FloatListSet(None, RS_MULTI_S1_S0_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(None, RS_MULTI_S1_S0_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S0_S-1")
			FloatListSet(None, RS_MULTI_S0_SM1_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(None, RS_MULTI_S0_SM1_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-1_S-2")
			FloatListSet(None, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(None, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-2_S-3")
			FloatListSet(None, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(None, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-3_S-4")
			FloatListSet(None, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(None, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-4_S-5")
			FloatListSet(None, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(None, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-5_S-4")
			FloatListSet(None, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(None, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-4_S-3")
			FloatListSet(None, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(None, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-3_S-2")
			FloatListSet(None, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(None, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-2_S-1")
			FloatListSet(None, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(None, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-1_S0")
			FloatListSet(None, RS_MULTI_SM1_S0_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(None, RS_MULTI_SM1_S0_CHANGELIST, ModIndex2, 1)
		EndIf

		Notify(FW_LOG, "Global multiplier for rank " + aiFromRelationshipRank + " to " + aiToRelationshipRank + " got updated by " + ModName + ".", False)

		;If the mod is also on the last position then also update the global relationship multiplier
		If(ModIndex2 == RSMultiChanges - 1)
			If(MultiplierString == "S0_S1")
				SetFloatValue(None, RS_MULTI_S0_S1, afMultiplier)
			ElseIf(MultiplierString == "S1_S2")
				SetFloatValue(None, RS_MULTI_S1_S2, afMultiplier)
			ElseIf(MultiplierString == "S2_S3")
				SetFloatValue(None, RS_MULTI_S2_S3, afMultiplier)
			ElseIf(MultiplierString == "S3_S4")
				SetFloatValue(None, RS_MULTI_S3_S4, afMultiplier)
			ElseIf(MultiplierString == "S4_S5")
				SetFloatValue(None, RS_MULTI_S4_S5, afMultiplier)
			ElseIf(MultiplierString == "S5_S4")
				SetFloatValue(None, RS_MULTI_S5_S4, afMultiplier)
			ElseIf(MultiplierString == "S4_S3")
				SetFloatValue(None, RS_MULTI_S4_S3, afMultiplier)
			ElseIf(MultiplierString == "S3_S2")
				SetFloatValue(None, RS_MULTI_S3_S2, afMultiplier)
			ElseIf(MultiplierString == "S2_S1")
				SetFloatValue(None, RS_MULTI_S2_S1, afMultiplier)
			ElseIf(MultiplierString == "S1_S0")
				SetFloatValue(None, RS_MULTI_S1_S0, afMultiplier)
			ElseIf(MultiplierString == "S0_S-1")
				SetFloatValue(None, RS_MULTI_S0_SM1, afMultiplier)
			ElseIf(MultiplierString == "S-1_S-2")
				SetFloatValue(None, RS_MULTI_SM1_SM2, afMultiplier)
			ElseIf(MultiplierString == "S-2_S-3")
				SetFloatValue(None, RS_MULTI_SM2_SM3, afMultiplier)
			ElseIf(MultiplierString == "S-3_S-4")
				SetFloatValue(None, RS_MULTI_SM3_SM4, afMultiplier)
			ElseIf(MultiplierString == "S-4_S-5")
				SetFloatValue(None, RS_MULTI_SM4_SM5, afMultiplier)
			ElseIf(MultiplierString == "S-5_S-4")
				SetFloatValue(None, RS_MULTI_SM5_SM4, afMultiplier)
			ElseIf(MultiplierString == "S-4_S-3")
				SetFloatValue(None, RS_MULTI_SM4_SM3, afMultiplier)
			ElseIf(MultiplierString == "S-3_S-2")
				SetFloatValue(None, RS_MULTI_SM3_SM2, afMultiplier)
			ElseIf(MultiplierString == "S-2_S-1")
				SetFloatValue(None, RS_MULTI_SM2_SM1, afMultiplier)
			ElseIf(MultiplierString == "S-1_S0")
				SetFloatValue(None, RS_MULTI_SM1_S0, afMultiplier)
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
					FloatListSet(None, RS_MULTI_S0_S1_CHANGELIST, i, afMultiplier)
					IntListSet(None, RS_MULTI_S0_S1_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S1_S2")
					FloatListSet(None, RS_MULTI_S1_S2_CHANGELIST, i, afMultiplier)
					IntListSet(None, RS_MULTI_S1_S2_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S2_S3")
					FloatListSet(None, RS_MULTI_S2_S3_CHANGELIST, i, afMultiplier)
					IntListSet(None, RS_MULTI_S2_S3_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S3_S4")
					FloatListSet(None, RS_MULTI_S3_S4_CHANGELIST, i, afMultiplier)
					IntListSet(None, RS_MULTI_S3_S4_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S4_S5")
					FloatListSet(None, RS_MULTI_S4_S5_CHANGELIST, i, afMultiplier)
					IntListSet(None, RS_MULTI_S4_S5_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S5_S4")
					FloatListSet(None, RS_MULTI_S5_S4_CHANGELIST, i, afMultiplier)
					IntListSet(None, RS_MULTI_S5_S4_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S4_S3")
					FloatListSet(None, RS_MULTI_S4_S3_CHANGELIST, i, afMultiplier)
					IntListSet(None, RS_MULTI_S4_S3_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S3_S2")
					FloatListSet(None, RS_MULTI_S3_S2_CHANGELIST, i, afMultiplier)
					IntListSet(None, RS_MULTI_S3_S2_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S2_S1")
					FloatListSet(None, RS_MULTI_S2_S1_CHANGELIST, i, afMultiplier)
					IntListSet(None, RS_MULTI_S2_S1_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S1_S0")
					FloatListSet(None, RS_MULTI_S1_S0_CHANGELIST, i, afMultiplier)
					IntListSet(None, RS_MULTI_S1_S0_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S0_S-1")
					FloatListSet(None, RS_MULTI_S0_SM1_CHANGELIST, i, afMultiplier)
					IntListSet(None, RS_MULTI_S0_SM1_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-1_S-2")
					FloatListSet(None, RS_MULTI_SM1_SM2_CHANGELIST, i, afMultiplier)
					IntListSet(None, RS_MULTI_SM1_SM2_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-2_S-3")
					FloatListSet(None, RS_MULTI_SM2_SM3_CHANGELIST, i, afMultiplier)
					IntListSet(None, RS_MULTI_SM2_SM3_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-3_S-4")
					FloatListSet(None, RS_MULTI_SM3_SM4_CHANGELIST, i, afMultiplier)
					IntListSet(None, RS_MULTI_SM3_SM4_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-4_S-5")
					FloatListSet(None, RS_MULTI_SM4_SM5_CHANGELIST, i, afMultiplier)
					IntListSet(None, RS_MULTI_SM4_SM5_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-5_S-4")
					FloatListSet(None, RS_MULTI_SM5_SM4_CHANGELIST, i, afMultiplier)
					IntListSet(None, RS_MULTI_SM5_SM4_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-4_S-3")
					FloatListSet(None, RS_MULTI_SM4_SM3_CHANGELIST, i, afMultiplier)
					IntListSet(None, RS_MULTI_SM4_SM3_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-3_S-2")
					FloatListSet(None, RS_MULTI_SM3_SM2_CHANGELIST, i, afMultiplier)
					IntListSet(None, RS_MULTI_SM3_SM2_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-2_S-1")
					FloatListSet(None, RS_MULTI_SM2_SM1_CHANGELIST, i, afMultiplier)
					IntListSet(None, RS_MULTI_SM2_SM1_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-1_S0")
					FloatListSet(None, RS_MULTI_SM1_S0_CHANGELIST, i, afMultiplier)
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
		SetFloatValue(None, RS_MULTI_S0_S1, afMultiplier)
		FloatListSet(None, RS_MULTI_S0_S1_CHANGELIST, i, afMultiplier)
		IntListSet(None, RS_MULTI_S0_S1_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S1_S2")
		SetFloatValue(None, RS_MULTI_S1_S2, afMultiplier)
		FloatListSet(None, RS_MULTI_S1_S2_CHANGELIST, i, afMultiplier)
		IntListSet(None, RS_MULTI_S1_S2_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S2_S3")
		SetFloatValue(None, RS_MULTI_S2_S3, afMultiplier)
		FloatListSet(None, RS_MULTI_S2_S3_CHANGELIST, i, afMultiplier)
		IntListSet(None, RS_MULTI_S2_S3_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S3_S4")
		SetFloatValue(None, RS_MULTI_S3_S4, afMultiplier)
		FloatListSet(None, RS_MULTI_S3_S4_CHANGELIST, i, afMultiplier)
		IntListSet(None, RS_MULTI_S3_S4_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S4_S5")
		SetFloatValue(None, RS_MULTI_S4_S5, afMultiplier)
		FloatListSet(None, RS_MULTI_S4_S5_CHANGELIST, i, afMultiplier)
		IntListSet(None, RS_MULTI_S4_S5_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S5_S4")
		SetFloatValue(None, RS_MULTI_S5_S4, afMultiplier)
		FloatListSet(None, RS_MULTI_S5_S4_CHANGELIST, i, afMultiplier)
		IntListSet(None, RS_MULTI_S5_S4_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S4_S3")
		SetFloatValue(None, RS_MULTI_S4_S3, afMultiplier)
		FloatListSet(None, RS_MULTI_S4_S3_CHANGELIST, i, afMultiplier)
		IntListSet(None, RS_MULTI_S4_S3_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S3_S2")
		SetFloatValue(None, RS_MULTI_S3_S2, afMultiplier)
		FloatListSet(None, RS_MULTI_S3_S2_CHANGELIST, i, afMultiplier)
		IntListSet(None, RS_MULTI_S3_S2_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S2_S1")
		SetFloatValue(None, RS_MULTI_S2_S1, afMultiplier)
		FloatListSet(None, RS_MULTI_S2_S1_CHANGELIST, i, afMultiplier)
		IntListSet(None, RS_MULTI_S2_S1_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S1_S0")
		SetFloatValue(None, RS_MULTI_S1_S0, afMultiplier)
		FloatListSet(None, RS_MULTI_S1_S0_CHANGELIST, i, afMultiplier)
		IntListSet(None, RS_MULTI_S1_S0_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S0_S-1")
		SetFloatValue(None, RS_MULTI_S0_SM1, afMultiplier)
		FloatListSet(None, RS_MULTI_S0_SM1_CHANGELIST, i, afMultiplier)
		IntListSet(None, RS_MULTI_S0_SM1_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-1_S-2")
		SetFloatValue(None, RS_MULTI_SM1_SM2, afMultiplier)
		FloatListSet(None, RS_MULTI_SM1_SM2_CHANGELIST, i, afMultiplier)
		IntListSet(None, RS_MULTI_SM1_SM2_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-2_S-3")
		SetFloatValue(None, RS_MULTI_SM2_SM3, afMultiplier)
		FloatListSet(None, RS_MULTI_SM2_SM3_CHANGELIST, i, afMultiplier)
		IntListSet(None, RS_MULTI_SM2_SM3_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-3_S-4")
		SetFloatValue(None, RS_MULTI_SM3_SM4, afMultiplier)
		FloatListSet(None, RS_MULTI_SM3_SM4_CHANGELIST, i, afMultiplier)
		IntListSet(None, RS_MULTI_SM3_SM4_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-4_S-5")
		SetFloatValue(None, RS_MULTI_SM4_SM5, afMultiplier)
		FloatListSet(None, RS_MULTI_SM4_SM5_CHANGELIST, i, afMultiplier)
		IntListSet(None, RS_MULTI_SM4_SM5_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-5_S-4")
		SetFloatValue(None, RS_MULTI_SM5_SM4, afMultiplier)
		FloatListSet(None, RS_MULTI_SM5_SM4_CHANGELIST, i, afMultiplier)
		IntListSet(None, RS_MULTI_SM5_SM4_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-4_S-3")
		SetFloatValue(None, RS_MULTI_SM4_SM3, afMultiplier)
		FloatListSet(None, RS_MULTI_SM4_SM3_CHANGELIST, i, afMultiplier)
		IntListSet(None, RS_MULTI_SM4_SM3_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-3_S-2")
		SetFloatValue(None, RS_MULTI_SM3_SM2, afMultiplier)
		FloatListSet(None, RS_MULTI_SM3_SM2_CHANGELIST, i, afMultiplier)
		IntListSet(None, RS_MULTI_SM3_SM2_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-2_S-1")
		SetFloatValue(None, RS_MULTI_SM2_SM1, afMultiplier)
		FloatListSet(None, RS_MULTI_SM2_SM1_CHANGELIST, i, afMultiplier)
		IntListSet(None, RS_MULTI_SM2_SM1_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-1_S0")
		SetFloatValue(None, RS_MULTI_SM1_S0, afMultiplier)
		FloatListSet(None, RS_MULTI_SM1_S0_CHANGELIST, i, afMultiplier)
		IntListSet(None, RS_MULTI_SM1_S0_CHANGELIST, i, 1)
	EndIf

	Return True
EndFunction

Bool Function SetGlobalRelationshipMultis(Quest akToken, Float[] afMultipliers)
	Int ModIndex = _GetModIndexFromForm(akToken, REGISTERED_RS)

	;/ beginValidation /;
	If(ModIndex == -1)
		Throw(FW_LOG, "A mod, which is not registered or sent an invalid token, tried to access SetGlobalRelationshipMultis(). The FormID of this token is " + akToken.GetFormID() + ".", "Access denied")
		Return False
	ElseIf (afMultipliers.Length < 20)
		Throw(FW_LOG, "Argument afMultipliers was not set correctly. The array has to be 20-items long.", "Invalid arguments")
		Return False
	ElseIf (afMultipliers[0] < 0.0 || \
			afMultipliers[1] < 0.0 || \
			afMultipliers[2] < 0.0 || \
			afMultipliers[3] < 0.0 || \
			afMultipliers[4] < 0.0 || \
			afMultipliers[5] < 0.0 || \
			afMultipliers[6] < 0.0 || \
			afMultipliers[7] < 0.0 || \
			afMultipliers[8] < 0.0 || \
			afMultipliers[9] < 0.0 || \
			afMultipliers[10] < 0.0 || \
			afMultipliers[11] < 0.0 || \
			afMultipliers[12] < 0.0 || \
			afMultipliers[13] < 0.0 || \
			afMultipliers[14] < 0.0 || \
			afMultipliers[15] < 0.0 || \
			afMultipliers[16] < 0.0 || \
			afMultipliers[17] < 0.0 || \
			afMultipliers[18] < 0.0 || \
			afMultipliers[19] < 0.0)
		Throw(FW_LOG, "Argument afMultipliers was not set correctly. Every item in the array has to be either a positive float or zero.", "Invalid arguments")
		Return False
	EndIf
	;/ endValidation /;

	String ModName = GetStringValue(akToken, MOD_NAME)
	Int ModIndex2 = _GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST) ; Get position of current mod in this list
	Int RSMultiChanges = FormListCount(None, RS_MULTI_CHANGELIST) ;Get the list of mods which do change the global relationship multipliers

	;If the mod was found, update its new value
	If(ModIndex2 >= 0)
		;/ openFold Repeat 20 times /;
		If (afMultipliers[0] > 0.0)
			FloatListSet(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex2, afMultipliers[0])
			IntListSet(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex2, 1)	; 0: default framework values, 1: custom mod values
			Notify(FW_LOG, "Global multiplier for rank " + 0 + " to " + 1 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[1] > 0.0)
			FloatListSet(None, RS_MULTI_S1_S2_CHANGELIST, ModIndex2, afMultipliers[1])
			IntListSet(None, RS_MULTI_S1_S2_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Global multiplier for rank " + 1 + " to " + 2 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[2] > 0.0)
			FloatListSet(None, RS_MULTI_S2_S3_CHANGELIST, ModIndex2, afMultipliers[2])
			IntListSet(None, RS_MULTI_S2_S3_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Global multiplier for rank " + 2 + " to " + 3 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[3] > 0.0)
			FloatListSet(None, RS_MULTI_S3_S4_CHANGELIST, ModIndex2, afMultipliers[3])
			IntListSet(None, RS_MULTI_S3_S4_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Global multiplier for rank " + 3 + " to " + 4 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[4] > 0.0)
			FloatListSet(None, RS_MULTI_S4_S5_CHANGELIST, ModIndex2, afMultipliers[4])
			IntListSet(None, RS_MULTI_S4_S5_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Global multiplier for rank " + 4 + " to " + 5 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[5] > 0.0)
			FloatListSet(None, RS_MULTI_S5_S4_CHANGELIST, ModIndex2, afMultipliers[5])
			IntListSet(None, RS_MULTI_S5_S4_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Global multiplier for rank " + 5 + " to " + 4 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[6] > 0.0)
			FloatListSet(None, RS_MULTI_S4_S3_CHANGELIST, ModIndex2, afMultipliers[6])
			IntListSet(None, RS_MULTI_S4_S3_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Global multiplier for rank " + 4 + " to " + 3 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[7] > 0.0)
			FloatListSet(None, RS_MULTI_S3_S2_CHANGELIST, ModIndex2, afMultipliers[7])
			IntListSet(None, RS_MULTI_S3_S2_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Global multiplier for rank " + 3 + " to " + 2 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[8] > 0.0)
			FloatListSet(None, RS_MULTI_S2_S1_CHANGELIST, ModIndex2, afMultipliers[8])
			IntListSet(None, RS_MULTI_S2_S1_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Global multiplier for rank " + 2 + " to " + 1 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[9] > 0.0)
			FloatListSet(None, RS_MULTI_S1_S0_CHANGELIST, ModIndex2, afMultipliers[9])
			IntListSet(None, RS_MULTI_S1_S0_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Global multiplier for rank " + 1 + " to " + 0 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[10] > 0.0)
			FloatListSet(None, RS_MULTI_S0_SM1_CHANGELIST, ModIndex2, afMultipliers[10])
			IntListSet(None, RS_MULTI_S0_SM1_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Global multiplier for rank " + 0 + " to " + -1 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[11] > 0.0)
			FloatListSet(None, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex2, afMultipliers[11])
			IntListSet(None, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Global multiplier for rank " + -1 + " to " + -2 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[12] > 0.0)
			FloatListSet(None, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex2, afMultipliers[12])
			IntListSet(None, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Global multiplier for rank " + -2 + " to " + -3 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[13] > 0.0)
			FloatListSet(None, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex2, afMultipliers[13])
			IntListSet(None, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Global multiplier for rank " + -3 + " to " + -4 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[14] > 0.0)
			FloatListSet(None, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex2, afMultipliers[14])
			IntListSet(None, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Global multiplier for rank " + -4 + " to " + -5 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[15] > 0.0)
			FloatListSet(None, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex2, afMultipliers[15])
			IntListSet(None, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Global multiplier for rank " + -5 + " to " + -4 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[16] > 0.0)
			FloatListSet(None, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex2, afMultipliers[16])
			IntListSet(None, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Global multiplier for rank " + -4 + " to " + -3 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[17] > 0.0)
			FloatListSet(None, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex2, afMultipliers[17])
			IntListSet(None, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Global multiplier for rank " + -3 + " to " + -2 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[18] > 0.0)
			FloatListSet(None, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex2, afMultipliers[18])
			IntListSet(None, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Global multiplier for rank " + -2 + " to " + -1 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[19] > 0.0)
			FloatListSet(None, RS_MULTI_SM1_S0_CHANGELIST, ModIndex2, afMultipliers[19])
			IntListSet(None, RS_MULTI_SM1_S0_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Global multiplier for rank " + -1 + " to " + 0 + " got updated by " + ModName + ".", False)
		EndIf
		;/ closeFold /;

		;If the mod is also on the last position then also update the global relationship multipliers
		If(ModIndex2 == RSMultiChanges - 1)
			SetFloatValue(None, RS_MULTI_S0_S1_CHANGELIST, afMultipliers[0])
			SetFloatValue(None, RS_MULTI_S1_S2_CHANGELIST, afMultipliers[1])
			SetFloatValue(None, RS_MULTI_S2_S3_CHANGELIST, afMultipliers[2])
			SetFloatValue(None, RS_MULTI_S3_S4_CHANGELIST, afMultipliers[3])
			SetFloatValue(None, RS_MULTI_S4_S5_CHANGELIST, afMultipliers[4])
			SetFloatValue(None, RS_MULTI_S5_S4_CHANGELIST, afMultipliers[5])
			SetFloatValue(None, RS_MULTI_S4_S3_CHANGELIST, afMultipliers[6])
			SetFloatValue(None, RS_MULTI_S3_S2_CHANGELIST, afMultipliers[7])
			SetFloatValue(None, RS_MULTI_S2_S1_CHANGELIST, afMultipliers[8])
			SetFloatValue(None, RS_MULTI_S1_S0_CHANGELIST, afMultipliers[9])
			SetFloatValue(None, RS_MULTI_S0_SM1_CHANGELIST, afMultipliers[10])
			SetFloatValue(None, RS_MULTI_SM1_SM2_CHANGELIST, afMultipliers[11])
			SetFloatValue(None, RS_MULTI_SM2_SM3_CHANGELIST, afMultipliers[12])
			SetFloatValue(None, RS_MULTI_SM3_SM4_CHANGELIST, afMultipliers[13])
			SetFloatValue(None, RS_MULTI_SM4_SM5_CHANGELIST, afMultipliers[14])
			SetFloatValue(None, RS_MULTI_SM5_SM4_CHANGELIST, afMultipliers[15])
			SetFloatValue(None, RS_MULTI_SM4_SM3_CHANGELIST, afMultipliers[16])
			SetFloatValue(None, RS_MULTI_SM3_SM2_CHANGELIST, afMultipliers[17])
			SetFloatValue(None, RS_MULTI_SM2_SM1_CHANGELIST, afMultipliers[18])
			SetFloatValue(None, RS_MULTI_SM1_S0_CHANGELIST, afMultipliers[19])
		Else
			Notify(FW_LOG, "Can't change the global relationship multipliers for " + ModName + " because they are already set by a mod with higher priority. However, it will be set, if this mod has the highest priority.", False)
			Return True
		EndIf
	Else
		Int i = 0

		;Go through the list of changes to the global relationship multipliers
		While(i < RSMultiChanges)
			Form ModToCmp = FormListGet(None, RS_MULTI_CHANGELIST, i) ;Get mod at index i
			Int ModToCmpIdx = FormListFind(None, REGISTERED_RS, ModToCmp) ;Get priority of this comparing mod

			;If the actual mod has a higher priority than the comparing mod then continue cycling the list
			If(ModIndex > ModToCmpIdx)
				i += 1
			Else
				FormListInsert(None, RS_MULTI_CHANGELIST, i, akToken) ;Insert the actual mod into the list before the comparing mod
				FloatListInsert(None, RS_MULTI_S0_S1_CHANGELIST, i, 1.0)	;insert the default values. We will change them to what was requested later
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

				If (afMultipliers[0])
					FloatListSet(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex2, afMultipliers[0])
					IntListSet(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex2, 1)	; 0: default framework values, 1: custom mod values
				ElseIf (afMultipliers[1])
					FloatListSet(None, RS_MULTI_S1_S2_CHANGELIST, ModIndex2, afMultipliers[1])
					IntListSet(None, RS_MULTI_S1_S2_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[2])
					FloatListSet(None, RS_MULTI_S2_S3_CHANGELIST, ModIndex2, afMultipliers[2])
					IntListSet(None, RS_MULTI_S2_S3_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[3])
					FloatListSet(None, RS_MULTI_S3_S4_CHANGELIST, ModIndex2, afMultipliers[3])
					IntListSet(None, RS_MULTI_S3_S4_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[4])
					FloatListSet(None, RS_MULTI_S4_S5_CHANGELIST, ModIndex2, afMultipliers[4])
					IntListSet(None, RS_MULTI_S4_S5_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[5])
					FloatListSet(None, RS_MULTI_S5_S4_CHANGELIST, ModIndex2, afMultipliers[5])
					IntListSet(None, RS_MULTI_S5_S4_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[6])
					FloatListSet(None, RS_MULTI_S4_S3_CHANGELIST, ModIndex2, afMultipliers[6])
					IntListSet(None, RS_MULTI_S4_S3_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[7])
					FloatListSet(None, RS_MULTI_S3_S2_CHANGELIST, ModIndex2, afMultipliers[7])
					IntListSet(None, RS_MULTI_S3_S2_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[8])
					FloatListSet(None, RS_MULTI_S2_S1_CHANGELIST, ModIndex2, afMultipliers[8])
					IntListSet(None, RS_MULTI_S2_S1_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[9])
					FloatListSet(None, RS_MULTI_S1_S0_CHANGELIST, ModIndex2, afMultipliers[9])
					IntListSet(None, RS_MULTI_S1_S0_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[10])
					FloatListSet(None, RS_MULTI_S0_SM1_CHANGELIST, ModIndex2, afMultipliers[10])
					IntListSet(None, RS_MULTI_S0_SM1_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[11])
					FloatListSet(None, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex2, afMultipliers[11])
					IntListSet(None, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[12])
					FloatListSet(None, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex2, afMultipliers[12])
					IntListSet(None, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[13])
					FloatListSet(None, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex2, afMultipliers[13])
					IntListSet(None, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[14])
					FloatListSet(None, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex2, afMultipliers[14])
					IntListSet(None, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[15])
					FloatListSet(None, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex2, afMultipliers[15])
					IntListSet(None, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[16])
					FloatListSet(None, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex2, afMultipliers[16])
					IntListSet(None, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[17])
					FloatListSet(None, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex2, afMultipliers[17])
					IntListSet(None, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[18])
					FloatListSet(None, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex2, afMultipliers[18])
					IntListSet(None, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[19])
					FloatListSet(None, RS_MULTI_SM1_S0_CHANGELIST, ModIndex2, afMultipliers[19])
					IntListSet(None, RS_MULTI_SM1_S0_CHANGELIST, ModIndex2, 1)
				EndIf

				Notify(FW_LOG, "Can't change the global relationship multipliers for " + ModName + " because they are already set by a mod with higher priority. However, they will be set, if this mod has the highest priority.", False)
				Return True
			EndIf
		EndWhile
	EndIf

	;No changes made to the array, so just add the value to it and apply the changes to the framework
	FloatListAdd(None, RS_MULTI_S0_S1_CHANGELIST, i, 1.0)	;Add the default values. We will change them to what was requested later
	IntListAdd(None, RS_MULTI_S0_S1_CHANGELIST, i, 0)	; 0: default framework values, 1: custom mod values
	FloatListAdd(None, RS_MULTI_S1_S2_CHANGELIST, i, 0.5)
	IntListAdd(None, RS_MULTI_S1_S2_CHANGELIST, i, 0)
	FloatListAdd(None, RS_MULTI_S2_S3_CHANGELIST, i, 0.25)
	IntListAdd(None, RS_MULTI_S2_S3_CHANGELIST, i, 0)
	FloatListAdd(None, RS_MULTI_S3_S4_CHANGELIST, i, 0.125)
	IntListAdd(None, RS_MULTI_S3_S4_CHANGELIST, i, 0)
	FloatListAdd(None, RS_MULTI_S4_S5_CHANGELIST, i, 0.0625)
	IntListAdd(None, RS_MULTI_S4_S5_CHANGELIST, i, 0)
	FloatListAdd(None, RS_MULTI_S5_S4_CHANGELIST, i, 0.125)
	IntListAdd(None, RS_MULTI_S5_S4_CHANGELIST, i, 0)
	FloatListAdd(None, RS_MULTI_S4_S3_CHANGELIST, i, 0.25)
	IntListAdd(None, RS_MULTI_S4_S3_CHANGELIST, i, 0)
	FloatListAdd(None, RS_MULTI_S3_S2_CHANGELIST, i, 0.5)
	IntListAdd(None, RS_MULTI_S3_S2_CHANGELIST, i, 0)
	FloatListAdd(None, RS_MULTI_S2_S1_CHANGELIST, i, 1.0)
	IntListAdd(None, RS_MULTI_S2_S1_CHANGELIST, i, 0)
	FloatListAdd(None, RS_MULTI_S1_S0_CHANGELIST, i, 2.0)
	IntListAdd(None, RS_MULTI_S1_S0_CHANGELIST, i, 0)
	FloatListAdd(None, RS_MULTI_S0_SM1_CHANGELIST, i, 1.0)
	IntListAdd(None, RS_MULTI_S0_SM1_CHANGELIST, i, 0)
	FloatListAdd(None, RS_MULTI_SM1_SM2_CHANGELIST, i, 0.5)
	IntListAdd(None, RS_MULTI_SM1_SM2_CHANGELIST, i, 0)
	FloatListAdd(None, RS_MULTI_SM2_SM3_CHANGELIST, i, 0.25)
	IntListAdd(None, RS_MULTI_SM2_SM3_CHANGELIST, i, 0)
	FloatListAdd(None, RS_MULTI_SM3_SM4_CHANGELIST, i, 0.125)
	IntListAdd(None, RS_MULTI_SM3_SM4_CHANGELIST, i, 0)
	FloatListAdd(None, RS_MULTI_SM4_SM5_CHANGELIST, i, 0.0625)
	IntListAdd(None, RS_MULTI_SM4_SM5_CHANGELIST, i, 0)
	FloatListAdd(None, RS_MULTI_SM5_SM4_CHANGELIST, i, 0.125)
	IntListAdd(None, RS_MULTI_SM5_SM4_CHANGELIST, i, 0)
	FloatListAdd(None, RS_MULTI_SM4_SM3_CHANGELIST, i, 0.25)
	IntListAdd(None, RS_MULTI_SM4_SM3_CHANGELIST, i, 0)
	FloatListAdd(None, RS_MULTI_SM3_SM2_CHANGELIST, i, 0.5)
	IntListAdd(None, RS_MULTI_SM3_SM2_CHANGELIST, i, 0)
	FloatListAdd(None, RS_MULTI_SM2_SM1_CHANGELIST, i, 1.0)
	IntListAdd(None, RS_MULTI_SM2_SM1_CHANGELIST, i, 0)
	FloatListAdd(None, RS_MULTI_SM1_S0_CHANGELIST, i, 2.0)
	Int i = IntListAdd(None, RS_MULTI_SM1_S0_CHANGELIST, i, 0)

	If (afMultipliers[0])
		FloatListSet(None, RS_MULTI_S0_S1_CHANGELIST, i, afMultipliers[0])
		IntListSet(None, RS_MULTI_S0_S1_CHANGELIST, i, 1)	; 0: default framework values, 1: custom mod values
	ElseIf (afMultipliers[1])
		FloatListSet(None, RS_MULTI_S1_S2_CHANGELIST, i, afMultipliers[1])
		IntListSet(None, RS_MULTI_S1_S2_CHANGELIST, i, 1)
	ElseIf (afMultipliers[2])
		FloatListSet(None, RS_MULTI_S2_S3_CHANGELIST, i, afMultipliers[2])
		IntListSet(None, RS_MULTI_S2_S3_CHANGELIST, i, 1)
	ElseIf (afMultipliers[3])
		FloatListSet(None, RS_MULTI_S3_S4_CHANGELIST, i, afMultipliers[3])
		IntListSet(None, RS_MULTI_S3_S4_CHANGELIST, i, 1)
	ElseIf (afMultipliers[4])
		FloatListSet(None, RS_MULTI_S4_S5_CHANGELIST, i, afMultipliers[4])
		IntListSet(None, RS_MULTI_S4_S5_CHANGELIST, i, 1)
	ElseIf (afMultipliers[5])
		FloatListSet(None, RS_MULTI_S5_S4_CHANGELIST, i, afMultipliers[5])
		IntListSet(None, RS_MULTI_S5_S4_CHANGELIST, i, 1)
	ElseIf (afMultipliers[6])
		FloatListSet(None, RS_MULTI_S4_S3_CHANGELIST, i, afMultipliers[6])
		IntListSet(None, RS_MULTI_S4_S3_CHANGELIST, i, 1)
	ElseIf (afMultipliers[7])
		FloatListSet(None, RS_MULTI_S3_S2_CHANGELIST, i, afMultipliers[7])
		IntListSet(None, RS_MULTI_S3_S2_CHANGELIST, i, 1)
	ElseIf (afMultipliers[8])
		FloatListSet(None, RS_MULTI_S2_S1_CHANGELIST, i, afMultipliers[8])
		IntListSet(None, RS_MULTI_S2_S1_CHANGELIST, i, 1)
	ElseIf (afMultipliers[9])
		FloatListSet(None, RS_MULTI_S1_S0_CHANGELIST, i, afMultipliers[9])
		IntListSet(None, RS_MULTI_S1_S0_CHANGELIST, i, 1)
	ElseIf (afMultipliers[10])
		FloatListSet(None, RS_MULTI_S0_SM1_CHANGELIST, i, afMultipliers[10])
		IntListSet(None, RS_MULTI_S0_SM1_CHANGELIST, i, 1)
	ElseIf (afMultipliers[11])
		FloatListSet(None, RS_MULTI_SM1_SM2_CHANGELIST, i, afMultipliers[11])
		IntListSet(None, RS_MULTI_SM1_SM2_CHANGELIST, i, 1)
	ElseIf (afMultipliers[12])
		FloatListSet(None, RS_MULTI_SM2_SM3_CHANGELIST, i, afMultipliers[12])
		IntListSet(None, RS_MULTI_SM2_SM3_CHANGELIST, i, 1)
	ElseIf (afMultipliers[13])
		FloatListSet(None, RS_MULTI_SM3_SM4_CHANGELIST, i, afMultipliers[13])
		IntListSet(None, RS_MULTI_SM3_SM4_CHANGELIST, i, 1)
	ElseIf (afMultipliers[14])
		FloatListSet(None, RS_MULTI_SM4_SM5_CHANGELIST, i, afMultipliers[14])
		IntListSet(None, RS_MULTI_SM4_SM5_CHANGELIST, i, 1)
	ElseIf (afMultipliers[15])
		FloatListSet(None, RS_MULTI_SM5_SM4_CHANGELIST, i, afMultipliers[15])
		IntListSet(None, RS_MULTI_SM5_SM4_CHANGELIST, i, 1)
	ElseIf (afMultipliers[16])
		FloatListSet(None, RS_MULTI_SM4_SM3_CHANGELIST, i, afMultipliers[16])
		IntListSet(None, RS_MULTI_SM4_SM3_CHANGELIST, i, 1)
	ElseIf (afMultipliers[17])
		FloatListSet(None, RS_MULTI_SM3_SM2_CHANGELIST, i, afMultipliers[17])
		IntListSet(None, RS_MULTI_SM3_SM2_CHANGELIST, i, 1)
	ElseIf (afMultipliers[18])
		FloatListSet(None, RS_MULTI_SM2_SM1_CHANGELIST, i, afMultipliers[18])
		IntListSet(None, RS_MULTI_SM2_SM1_CHANGELIST, i, 1)
	ElseIf (afMultipliers[19])
		FloatListSet(None, RS_MULTI_SM1_S0_CHANGELIST, i, afMultipliers[19])
		IntListSet(None, RS_MULTI_SM1_S0_CHANGELIST, i, 1)
	EndIf

	Return True
EndFunction

Float Function RemoveGlobalRelationshipMulti(Quest akToken, Int aiFromRelationshipRank, Int aiToRelationshipRank, Bool abVerbose = True)
	If(_GetModIndexFromForm(akToken, REGISTERED_RS) == -1)
		Warn(FW_LOG, "A mod tried to remove its changes to the global relationship multipliers. It passed a wrong token, however. FormID of the token is " + akToken.GetFormID() + ".")
		Return -2.0
	ElseIf(_GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST) == -1)
		Notify(FW_LOG, "A mod tried to remove its changes to the global relationship multipliers. But there were no changes made by this mod. FormID of the token is " + akToken.GetFormID() + ".")
		Return -2.0
	EndIf

	If(aiFromRelationshipRank < -5 || aiFromRelationshipRank > 5)
		Throw(FW_LOG, "Argument aiFromRelationshipRank was not set correctly. The range is from -5 to 5.", "Invalid arguments")
		Return -2.0
	EndIf

	If(aiToRelationshipRank < -5 || aiToRelationshipRank > 5)
		Throw(FW_LOG, "Argument aiToRelationshipRank was not set correctly. The range is from -5 to 5.", "Invalid arguments")
		Return -2.0
	EndIf

	If(aiFromRelationshipRank == aiToRelationshipRank)
		Throw(FW_LOG, "Argument aiToRelationshipRank can not be the same value as aiFromRelationshipRank.", "Invalid arguments")
		Return -2.0
	EndIf

	If(aiFromRelationshipRank - aiToRelationshipRank != 1 && aiFromRelationshipRank - aiToRelationshipRank != -1)
		Throw(FW_LOG, "Multiplier can only be set for the next or previous rank. From Rank " + aiFromRelationshipRank + " to Rank " + aiToRelationshipRank + " is incorrect.", "Invalid arguments")
		Return -2.0
	EndIf

	Int ModIndex = _GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST)
	String MultiplierString = "S" + aiFromRelationshipRank As String + "_S" + aiToRelationshipRank As String

	;if this mod has not set a custom multiplier for this stage, return false (nothing to remove)
	If(MultiplierString == "S0_S1")
		If (IntListGet(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex) == 0)
			If (abVerbose)
				Warn(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			EndIf
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S1_S2")
		If (IntListGet(None, RS_MULTI_S1_S2_CHANGELIST, ModIndex) == 0)
			If (abVerbose)
				Warn(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			EndIf
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S2_S3")
		If (IntListGet(None, RS_MULTI_S2_S3_CHANGELIST, ModIndex) == 0)
			If (abVerbose)
				Warn(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			EndIf
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S3_S4")
		If (IntListGet(None, RS_MULTI_S3_S4_CHANGELIST, ModIndex) == 0)
			If (abVerbose)
				Warn(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			EndIf
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S4_S5")
		If (IntListGet(None, RS_MULTI_S4_S5_CHANGELIST, ModIndex) == 0)
			If (abVerbose)
				Warn(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			EndIf
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S5_S4")
		If (IntListGet(None, RS_MULTI_S5_S4_CHANGELIST, ModIndex) == 0)
			If (abVerbose)
				Warn(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			EndIf
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S4_S3")
		If (IntListGet(None, RS_MULTI_S4_S3_CHANGELIST, ModIndex) == 0)
			If (abVerbose)
				Warn(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			EndIf
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S3_S2")
		If (IntListGet(None, RS_MULTI_S3_S2_CHANGELIST, ModIndex) == 0)
			If (abVerbose)
				Warn(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			EndIf
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S2_S1")
		If (IntListGet(None, RS_MULTI_S2_S1_CHANGELIST, ModIndex) == 0)
			If (abVerbose)
				Warn(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			EndIf
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S1_S0")
		If (IntListGet(None, RS_MULTI_S1_S0_CHANGELIST, ModIndex) == 0)
			If (abVerbose)
				Warn(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			EndIf
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S0_S-1")
		If (IntListGet(None, RS_MULTI_S0_SM1_CHANGELIST, ModIndex) == 0)
			If (abVerbose)
				Warn(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			EndIf
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S-1_S-2")
		If (IntListGet(None, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex) == 0)
			If (abVerbose)
				Warn(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			EndIf
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S-2_S-3")
		If (IntListGet(None, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex) == 0)
			If (abVerbose)
				Warn(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			EndIf
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S-3_S-4")
		If (IntListGet(None, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex) == 0)
			If (abVerbose)
				Warn(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			EndIf
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S-4_S-5")
		If (IntListGet(None, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex) == 0)
			If (abVerbose)
				Warn(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			EndIf
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S-5_S-4")
		If (IntListGet(None, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex) == 0)
			If (abVerbose)
				Warn(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			EndIf
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S-4_S-3")
		If (IntListGet(None, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex) == 0)
			If (abVerbose)
				Warn(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			EndIf
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S-3_S-2")
		If (IntListGet(None, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex) == 0)
			If (abVerbose)
				Warn(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			EndIf
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S-2_S-1")
		If (IntListGet(None, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex) == 0)
			If (abVerbose)
				Warn(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			EndIf
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S-1_S0")
		If (IntListGet(None, RS_MULTI_SM1_S0_CHANGELIST, ModIndex) == 0)
			If (abVerbose)
				Warn(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			EndIf
			Return -1.0
		EndIf
	EndIf

	Float myGlobalRelationshipMulti

	If(MultiplierString == "S0_S1")
		myGlobalRelationshipMulti = GetFloatValue(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex)
	ElseIf(MultiplierString == "S1_S2")
		myGlobalRelationshipMulti = GetFloatValue(None, RS_MULTI_S1_S2_CHANGELIST, ModIndex)
	ElseIf(MultiplierString == "S2_S3")
		myGlobalRelationshipMulti = GetFloatValue(None, RS_MULTI_S2_S3_CHANGELIST, ModIndex)
	ElseIf(MultiplierString == "S3_S4")
		myGlobalRelationshipMulti = GetFloatValue(None, RS_MULTI_S3_S4_CHANGELIST, ModIndex)
	ElseIf(MultiplierString == "S4_S5")
		myGlobalRelationshipMulti = GetFloatValue(None, RS_MULTI_S4_S5_CHANGELIST, ModIndex)
	ElseIf(MultiplierString == "S5_S4")
		myGlobalRelationshipMulti = GetFloatValue(None, RS_MULTI_S5_S4_CHANGELIST, ModIndex)
	ElseIf(MultiplierString == "S4_S3")
		myGlobalRelationshipMulti = GetFloatValue(None, RS_MULTI_S4_S3_CHANGELIST, ModIndex)
	ElseIf(MultiplierString == "S3_S2")
		myGlobalRelationshipMulti = GetFloatValue(None, RS_MULTI_S3_S2_CHANGELIST, ModIndex)
	ElseIf(MultiplierString == "S2_S1")
		myGlobalRelationshipMulti = GetFloatValue(None, RS_MULTI_S2_S1_CHANGELIST, ModIndex)
	ElseIf(MultiplierString == "S1_S0")
		myGlobalRelationshipMulti = GetFloatValue(None, RS_MULTI_S1_S0_CHANGELIST, ModIndex)
	ElseIf(MultiplierString == "S0_S-1")
		myGlobalRelationshipMulti = GetFloatValue(None, RS_MULTI_S0_SM1_CHANGELIST, ModIndex)
	ElseIf(MultiplierString == "S-1_S-2")
		myGlobalRelationshipMulti = GetFloatValue(None, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex)
	ElseIf(MultiplierString == "S-2_S-3")
		myGlobalRelationshipMulti = GetFloatValue(None, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex)
	ElseIf(MultiplierString == "S-3_S-4")
		myGlobalRelationshipMulti = GetFloatValue(None, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex)
	ElseIf(MultiplierString == "S-4_S-5")
		myGlobalRelationshipMulti = GetFloatValue(None, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex)
	ElseIf(MultiplierString == "S-5_S-4")
		myGlobalRelationshipMulti = GetFloatValue(None, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex)
	ElseIf(MultiplierString == "S-4_S-3")
		myGlobalRelationshipMulti = GetFloatValue(None, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex)
	ElseIf(MultiplierString == "S-3_S-2")
		myGlobalRelationshipMulti = GetFloatValue(None, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex)
	ElseIf(MultiplierString == "S-2_S-1")
		myGlobalRelationshipMulti = GetFloatValue(None, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex)
	ElseIf(MultiplierString == "S-1_S0")
		myGlobalRelationshipMulti = GetFloatValue(None, RS_MULTI_SM1_S0_CHANGELIST, ModIndex)
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

		Return myGlobalRelationshipMulti

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

		Return myGlobalRelationshipMulti
	EndIf
EndFunction

Float[] Function RemoveGlobalRelationshipMultis(Quest akToken)
	Float[] myGlobalRelationshipMulti

	If(_GetModIndexFromForm(akToken, REGISTERED_RS) == -1)
		Warn(FW_LOG, "A mod tried to remove its changes to the global relationship multipliers. It passed a wrong token, however. FormID of the token is " + akToken.GetFormID() + ".")
		Return myGlobalRelationshipMulti
	ElseIf(_GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST) == -1)
		Notify(FW_LOG, "A mod tried to remove its changes to the global relationship multipliers. But there were no changes made by this mod. FormID of the token is " + akToken.GetFormID() + ".")
		Return myGlobalRelationshipMulti
	EndIf

	Int ModIndex = _GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST)
	myGlobalRelationshipMulti = new Float[20]

	;/ openFold Initializing myGlobalRelationshipMulti[] with the multipliers that akToken had changed. 0 if akToken had not changed a specific multiplier /;
	If (IntListGet(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex))
		myGlobalRelationshipMulti[0] = FloatListGet(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex))
		myGlobalRelationshipMulti[1] = FloatListGet(None, RS_MULTI_S1_S2_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_S1_S2_CHANGELIST, ModIndex))
		myGlobalRelationshipMulti[2] = FloatListGet(None, RS_MULTI_S2_S3_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_S2_S3_CHANGELIST, ModIndex))
		myGlobalRelationshipMulti[3] = FloatListGet(None, RS_MULTI_S3_S4_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_S3_S4_CHANGELIST, ModIndex))
		myGlobalRelationshipMulti[4] = FloatListGet(None, RS_MULTI_S4_S5_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_S4_S5_CHANGELIST, ModIndex))
		myGlobalRelationshipMulti[5] = FloatListGet(None, RS_MULTI_S5_S4_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_S5_S4_CHANGELIST, ModIndex))
		myGlobalRelationshipMulti[6] = FloatListGet(None, RS_MULTI_S4_S3_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_S4_S3_CHANGELIST, ModIndex))
		myGlobalRelationshipMulti[7] = FloatListGet(None, RS_MULTI_S3_S2_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_S3_S2_CHANGELIST, ModIndex))
		myGlobalRelationshipMulti[8] = FloatListGet(None, RS_MULTI_S2_S1_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_S2_S1_CHANGELIST, ModIndex))
		myGlobalRelationshipMulti[9] = FloatListGet(None, RS_MULTI_S1_S0_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_S1_S0_CHANGELIST, ModIndex))
		myGlobalRelationshipMulti[10] = FloatListGet(None, RS_MULTI_S0_SM1_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_S0_SM1_CHANGELIST, ModIndex))
		myGlobalRelationshipMulti[11] = FloatListGet(None, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex))
		myGlobalRelationshipMulti[12] = FloatListGet(None, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex))
		myGlobalRelationshipMulti[13] = FloatListGet(None, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex))
		myGlobalRelationshipMulti[14] = FloatListGet(None, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex))
		myGlobalRelationshipMulti[15] = FloatListGet(None, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex))
		myGlobalRelationshipMulti[16] = FloatListGet(None, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex))
		myGlobalRelationshipMulti[17] = FloatListGet(None, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex))
		myGlobalRelationshipMulti[18] = FloatListGet(None, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex))
		myGlobalRelationshipMulti[19] = FloatListGet(None, RS_MULTI_SM1_S0_CHANGELIST, ModIndex)
	EndIf
	;/ closeFold /;

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

	Return myGlobalRelationshipMulti
EndFunction

Float Function GetRelationshipMulti(Actor akNPC, Int aiFromRelationshipRank, Int aiToRelationshipRank, Bool abGetGlobalIfNotFound = True, Bool abNotifyIfGetGlobal = True)
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
			If (abNotifyIfGetGlobal)
				Notify(FW_LOG, "Relationship multiplier on " + akNPC.GetLeveledActorBase().GetName() + " was not set for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", returning global relationship multiplier.", False)
			EndIf
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

Bool Function SetRelationshipMulti(Quest akToken, Actor akNPC, Int aiFromRelationshipRank, Int aiToRelationshipRank, Float afMultiplier)
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

	If(afMultiplier <= 0)
		Throw(FW_LOG, "Multiplier can not be set to 0 or lower", "Invalid arguments")
		False
	EndIf

	String ModName = GetStringValue(akToken, MOD_NAME)
	Int ModIndex2 = _GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST, akNPC) ; Get position of current mod in this list
	Int RSMultiChanges = FormListCount(akNPC, RS_MULTI_CHANGELIST) ;Get the list of mods which do change the relationship multipliers on this actor
	String MultiplierString = "S" + aiFromRelationshipRank As String + "_S" + aiToRelationshipRank As String

	;If the mod was found, update its new value
	If(ModIndex2 >= 0)
		If(MultiplierString == "S0_S1")
			FloatListSet(akNPC, RS_MULTI_S0_S1_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(akNPC, RS_MULTI_S0_S1_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S1_S2")
			FloatListSet(akNPC, RS_MULTI_S1_S2_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(akNPC, RS_MULTI_S1_S2_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S2_S3")
			FloatListSet(akNPC, RS_MULTI_S2_S3_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(akNPC, RS_MULTI_S2_S3_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S3_S4")
			FloatListSet(akNPC, RS_MULTI_S3_S4_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(akNPC, RS_MULTI_S3_S4_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S4_S5")
			FloatListSet(akNPC, RS_MULTI_S4_S5_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(akNPC, RS_MULTI_S4_S5_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S5_S4")
			FloatListSet(akNPC, RS_MULTI_S5_S4_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(akNPC, RS_MULTI_S5_S4_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S4_S3")
			FloatListSet(akNPC, RS_MULTI_S4_S3_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(akNPC, RS_MULTI_S4_S3_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S3_S2")
			FloatListSet(akNPC, RS_MULTI_S3_S2_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(akNPC, RS_MULTI_S3_S2_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S2_S1")
			FloatListSet(akNPC, RS_MULTI_S2_S1_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(akNPC, RS_MULTI_S2_S1_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S1_S0")
			FloatListSet(akNPC, RS_MULTI_S1_S0_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(akNPC, RS_MULTI_S1_S0_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S0_S-1")
			FloatListSet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-1_S-2")
			FloatListSet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-2_S-3")
			FloatListSet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-3_S-4")
			FloatListSet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-4_S-5")
			FloatListSet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-5_S-4")
			FloatListSet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-4_S-3")
			FloatListSet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-3_S-2")
			FloatListSet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-2_S-1")
			FloatListSet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex2, 1)
		ElseIf(MultiplierString == "S-1_S0")
			FloatListSet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, ModIndex2, afMultiplier)
			IntListSet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, ModIndex2, 1)
		EndIf

		Notify(FW_LOG, "Global multiplier for rank " + aiFromRelationshipRank + " to " + aiToRelationshipRank + " got updated by " + ModName + ".", False)

		;If the mod is also on the last position then also update the relationship multiplier
		If(ModIndex2 == RSMultiChanges - 1)
			If(MultiplierString == "S0_S1")
				SetFloatValue(akNPC, RS_MULTI_S0_S1, afMultiplier)
			ElseIf(MultiplierString == "S1_S2")
				SetFloatValue(akNPC, RS_MULTI_S1_S2, afMultiplier)
			ElseIf(MultiplierString == "S2_S3")
				SetFloatValue(akNPC, RS_MULTI_S2_S3, afMultiplier)
			ElseIf(MultiplierString == "S3_S4")
				SetFloatValue(akNPC, RS_MULTI_S3_S4, afMultiplier)
			ElseIf(MultiplierString == "S4_S5")
				SetFloatValue(akNPC, RS_MULTI_S4_S5, afMultiplier)
			ElseIf(MultiplierString == "S5_S4")
				SetFloatValue(akNPC, RS_MULTI_S5_S4, afMultiplier)
			ElseIf(MultiplierString == "S4_S3")
				SetFloatValue(akNPC, RS_MULTI_S4_S3, afMultiplier)
			ElseIf(MultiplierString == "S3_S2")
				SetFloatValue(akNPC, RS_MULTI_S3_S2, afMultiplier)
			ElseIf(MultiplierString == "S2_S1")
				SetFloatValue(akNPC, RS_MULTI_S2_S1, afMultiplier)
			ElseIf(MultiplierString == "S1_S0")
				SetFloatValue(akNPC, RS_MULTI_S1_S0, afMultiplier)
			ElseIf(MultiplierString == "S0_S-1")
				SetFloatValue(akNPC, RS_MULTI_S0_SM1, afMultiplier)
			ElseIf(MultiplierString == "S-1_S-2")
				SetFloatValue(akNPC, RS_MULTI_SM1_SM2, afMultiplier)
			ElseIf(MultiplierString == "S-2_S-3")
				SetFloatValue(akNPC, RS_MULTI_SM2_SM3, afMultiplier)
			ElseIf(MultiplierString == "S-3_S-4")
				SetFloatValue(akNPC, RS_MULTI_SM3_SM4, afMultiplier)
			ElseIf(MultiplierString == "S-4_S-5")
				SetFloatValue(akNPC, RS_MULTI_SM4_SM5, afMultiplier)
			ElseIf(MultiplierString == "S-5_S-4")
				SetFloatValue(akNPC, RS_MULTI_SM5_SM4, afMultiplier)
			ElseIf(MultiplierString == "S-4_S-3")
				SetFloatValue(akNPC, RS_MULTI_SM4_SM3, afMultiplier)
			ElseIf(MultiplierString == "S-3_S-2")
				SetFloatValue(akNPC, RS_MULTI_SM3_SM2, afMultiplier)
			ElseIf(MultiplierString == "S-2_S-1")
				SetFloatValue(akNPC, RS_MULTI_SM2_SM1, afMultiplier)
			ElseIf(MultiplierString == "S-1_S0")
				SetFloatValue(akNPC, RS_MULTI_SM1_S0, afMultiplier)
			EndIf
		Else
			Notify(FW_LOG, "Can't change the relationship multiplier on " + akNPC.GetLeveledActorBase().GetName() + " for " + ModName + " because it is already set by a mod with higher priority. However, it will be set, if this mod has the highest priority.", False)
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
					FloatListSet(akNPC, RS_MULTI_S0_S1_CHANGELIST, i, afMultiplier)
					IntListSet(akNPC, RS_MULTI_S0_S1_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S1_S2")
					FloatListSet(akNPC, RS_MULTI_S1_S2_CHANGELIST, i, afMultiplier)
					IntListSet(akNPC, RS_MULTI_S1_S2_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S2_S3")
					FloatListSet(akNPC, RS_MULTI_S2_S3_CHANGELIST, i, afMultiplier)
					IntListSet(akNPC, RS_MULTI_S2_S3_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S3_S4")
					FloatListSet(akNPC, RS_MULTI_S3_S4_CHANGELIST, i, afMultiplier)
					IntListSet(akNPC, RS_MULTI_S3_S4_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S4_S5")
					FloatListSet(akNPC, RS_MULTI_S4_S5_CHANGELIST, i, afMultiplier)
					IntListSet(akNPC, RS_MULTI_S4_S5_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S5_S4")
					FloatListSet(akNPC, RS_MULTI_S5_S4_CHANGELIST, i, afMultiplier)
					IntListSet(akNPC, RS_MULTI_S5_S4_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S4_S3")
					FloatListSet(akNPC, RS_MULTI_S4_S3_CHANGELIST, i, afMultiplier)
					IntListSet(akNPC, RS_MULTI_S4_S3_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S3_S2")
					FloatListSet(akNPC, RS_MULTI_S3_S2_CHANGELIST, i, afMultiplier)
					IntListSet(akNPC, RS_MULTI_S3_S2_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S2_S1")
					FloatListSet(akNPC, RS_MULTI_S2_S1_CHANGELIST, i, afMultiplier)
					IntListSet(akNPC, RS_MULTI_S2_S1_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S1_S0")
					FloatListSet(akNPC, RS_MULTI_S1_S0_CHANGELIST, i, afMultiplier)
					IntListSet(akNPC, RS_MULTI_S1_S0_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S0_S-1")
					FloatListSet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, i, afMultiplier)
					IntListSet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-1_S-2")
					FloatListSet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, i, afMultiplier)
					IntListSet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-2_S-3")
					FloatListSet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, i, afMultiplier)
					IntListSet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-3_S-4")
					FloatListSet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, i, afMultiplier)
					IntListSet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-4_S-5")
					FloatListSet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, i, afMultiplier)
					IntListSet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-5_S-4")
					FloatListSet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, i, afMultiplier)
					IntListSet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-4_S-3")
					FloatListSet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, i, afMultiplier)
					IntListSet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-3_S-2")
					FloatListSet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, i, afMultiplier)
					IntListSet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-2_S-1")
					FloatListSet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, i, afMultiplier)
					IntListSet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, i, 1)
				ElseIf(MultiplierString == "S-1_S0")
					FloatListSet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, i, afMultiplier)
					IntListSet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, i, 1)
				EndIf

				Notify(FW_LOG, "Can't change the relationship multiplier on " + akNPC.GetLeveledActorBase().GetName() + " for " + ModName + " because it is already set by a mod with higher priority. However, it will be set, if this mod has the highest priority.", False)
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
		SetFloatValue(akNPC, RS_MULTI_S0_S1, afMultiplier)
		FloatListSet(akNPC, RS_MULTI_S0_S1_CHANGELIST, i, afMultiplier)
		IntListSet(akNPC, RS_MULTI_S0_S1_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S1_S2")
		SetFloatValue(akNPC, RS_MULTI_S1_S2, afMultiplier)
		FloatListSet(akNPC, RS_MULTI_S1_S2_CHANGELIST, i, afMultiplier)
		IntListSet(akNPC, RS_MULTI_S1_S2_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S2_S3")
		SetFloatValue(akNPC, RS_MULTI_S2_S3, afMultiplier)
		FloatListSet(akNPC, RS_MULTI_S2_S3_CHANGELIST, i, afMultiplier)
		IntListSet(akNPC, RS_MULTI_S2_S3_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S3_S4")
		SetFloatValue(akNPC, RS_MULTI_S3_S4, afMultiplier)
		FloatListSet(akNPC, RS_MULTI_S3_S4_CHANGELIST, i, afMultiplier)
		IntListSet(akNPC, RS_MULTI_S3_S4_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S4_S5")
		SetFloatValue(akNPC, RS_MULTI_S4_S5, afMultiplier)
		FloatListSet(akNPC, RS_MULTI_S4_S5_CHANGELIST, i, afMultiplier)
		IntListSet(akNPC, RS_MULTI_S4_S5_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S5_S4")
		SetFloatValue(akNPC, RS_MULTI_S5_S4, afMultiplier)
		FloatListSet(akNPC, RS_MULTI_S5_S4_CHANGELIST, i, afMultiplier)
		IntListSet(akNPC, RS_MULTI_S5_S4_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S4_S3")
		SetFloatValue(akNPC, RS_MULTI_S4_S3, afMultiplier)
		FloatListSet(akNPC, RS_MULTI_S4_S3_CHANGELIST, i, afMultiplier)
		IntListSet(akNPC, RS_MULTI_S4_S3_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S3_S2")
		SetFloatValue(akNPC, RS_MULTI_S3_S2, afMultiplier)
		FloatListSet(akNPC, RS_MULTI_S3_S2_CHANGELIST, i, afMultiplier)
		IntListSet(akNPC, RS_MULTI_S3_S2_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S2_S1")
		SetFloatValue(akNPC, RS_MULTI_S2_S1, afMultiplier)
		FloatListSet(akNPC, RS_MULTI_S2_S1_CHANGELIST, i, afMultiplier)
		IntListSet(akNPC, RS_MULTI_S2_S1_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S1_S0")
		SetFloatValue(akNPC, RS_MULTI_S1_S0, afMultiplier)
		FloatListSet(akNPC, RS_MULTI_S1_S0_CHANGELIST, i, afMultiplier)
		IntListSet(akNPC, RS_MULTI_S1_S0_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S0_S-1")
		SetFloatValue(akNPC, RS_MULTI_S0_SM1, afMultiplier)
		FloatListSet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, i, afMultiplier)
		IntListSet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-1_S-2")
		SetFloatValue(akNPC, RS_MULTI_SM1_SM2, afMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, i, afMultiplier)
		IntListSet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-2_S-3")
		SetFloatValue(akNPC, RS_MULTI_SM2_SM3, afMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, i, afMultiplier)
		IntListSet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-3_S-4")
		SetFloatValue(akNPC, RS_MULTI_SM3_SM4, afMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, i, afMultiplier)
		IntListSet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-4_S-5")
		SetFloatValue(akNPC, RS_MULTI_SM4_SM5, afMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, i, afMultiplier)
		IntListSet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-5_S-4")
		SetFloatValue(akNPC, RS_MULTI_SM5_SM4, afMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, i, afMultiplier)
		IntListSet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-4_S-3")
		SetFloatValue(akNPC, RS_MULTI_SM4_SM3, afMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, i, afMultiplier)
		IntListSet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-3_S-2")
		SetFloatValue(akNPC, RS_MULTI_SM3_SM2, afMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, i, afMultiplier)
		IntListSet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-2_S-1")
		SetFloatValue(akNPC, RS_MULTI_SM2_SM1, afMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, i, afMultiplier)
		IntListSet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, i, 1)
	ElseIf(MultiplierString == "S-1_S0")
		SetFloatValue(akNPC, RS_MULTI_SM1_S0, afMultiplier)
		FloatListSet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, i, afMultiplier)
		IntListSet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, i, 1)
	EndIf

	FormListAdd(None, RS_MULTI_NPC_CHANGELIST, akNPC, False)
	Return True
EndFunction

Bool Function SetRelationshipMultis(Quest akToken, Actor akNPC, Float[] afMultipliers)
	Int ModIndex = _GetModIndexFromForm(akToken, REGISTERED_RS)

	;/ beginValidation /;
	If(ModIndex == -1)
		Throw(FW_LOG, " A mod, which is not registered or sent an invalid token, tried to access SetRelationshipMultis(). The FormID of this token is " + akToken.GetFormID() + ".", "Access denied")
		Return False
	ElseIf(!akNPC)
		Throw(FW_LOG, "Argument akNPC for function SetRelationshipMultis() is None!", "Invalid arguments")
		Return False
	ElseIf (afMultipliers.Length != 20)
		Throw(FW_LOG, "Argument afMultipliers was not set correctly. The array has to be 20-items long.", "Invalid arguments")
		Return False
	ElseIf (afMultipliers[0] < 0.0 || \
			afMultipliers[1] < 0.0 || \
			afMultipliers[2] < 0.0 || \
			afMultipliers[3] < 0.0 || \
			afMultipliers[4] < 0.0 || \
			afMultipliers[5] < 0.0 || \
			afMultipliers[6] < 0.0 || \
			afMultipliers[7] < 0.0 || \
			afMultipliers[8] < 0.0 || \
			afMultipliers[9] < 0.0 || \
			afMultipliers[10] < 0.0 || \
			afMultipliers[11] < 0.0 || \
			afMultipliers[12] < 0.0 || \
			afMultipliers[13] < 0.0 || \
			afMultipliers[14] < 0.0 || \
			afMultipliers[15] < 0.0 || \
			afMultipliers[16] < 0.0 || \
			afMultipliers[17] < 0.0 || \
			afMultipliers[18] < 0.0 || \
			afMultipliers[19] < 0.0)
		Throw(FW_LOG, "Argument afMultipliers was not set correctly. Every item in the array has to be either a positive float or zero.", "Invalid arguments")
		Return False
	EndIf
	;/ endValidation /;

	Int ModIndex2 = _GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST, akNPC) ; Get position of current mod in this list
	Int RSMultiChanges = FormListCount(akNPC, RS_MULTI_CHANGELIST) ;Get the list of mods which change this actor's relationship multipliers
	String ModName = GetStringValue(akToken, MOD_NAME)

	;If the mod was found, update its new value
	If(ModIndex2 >= 0)
		;/ openFold Repeat 20 times /;
		If (afMultipliers[0])
			FloatListSet(akNPC, RS_MULTI_S0_S1_CHANGELIST, ModIndex2, afMultipliers[0])
			IntListSet(akNPC, RS_MULTI_S0_S1_CHANGELIST, ModIndex2, 1)	; 0: default framework values, 1: custom mod values
			Notify(FW_LOG, "Relationship multiplier of actor " + akNPC.GetLeveledActorBase().GetName() + " for rank " + 0 + " to " + 1 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[1])
			FloatListSet(akNPC, RS_MULTI_S1_S2_CHANGELIST, ModIndex2, afMultipliers[1])
			IntListSet(akNPC, RS_MULTI_S1_S2_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Relationship multiplier of actor " + akNPC.GetLeveledActorBase().GetName() + " for rank " + 1 + " to " + 2 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[2])
			FloatListSet(akNPC, RS_MULTI_S2_S3_CHANGELIST, ModIndex2, afMultipliers[2])
			IntListSet(akNPC, RS_MULTI_S2_S3_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Relationship multiplier of actor " + akNPC.GetLeveledActorBase().GetName() + " for rank " + 2 + " to " + 3 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[3])
			FloatListSet(akNPC, RS_MULTI_S3_S4_CHANGELIST, ModIndex2, afMultipliers[3])
			IntListSet(akNPC, RS_MULTI_S3_S4_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Relationship multiplier of actor " + akNPC.GetLeveledActorBase().GetName() + " for rank " + 3 + " to " + 4 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[4])
			FloatListSet(akNPC, RS_MULTI_S4_S5_CHANGELIST, ModIndex2, afMultipliers[4])
			IntListSet(akNPC, RS_MULTI_S4_S5_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Relationship multiplier of actor " + akNPC.GetLeveledActorBase().GetName() + " for rank " + 4 + " to " + 5 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[5])
			FloatListSet(akNPC, RS_MULTI_S5_S4_CHANGELIST, ModIndex2, afMultipliers[5])
			IntListSet(akNPC, RS_MULTI_S5_S4_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Relationship multiplier of actor " + akNPC.GetLeveledActorBase().GetName() + " for rank " + 5 + " to " + 4 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[6])
			FloatListSet(akNPC, RS_MULTI_S4_S3_CHANGELIST, ModIndex2, afMultipliers[6])
			IntListSet(akNPC, RS_MULTI_S4_S3_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Relationship multiplier of actor " + akNPC.GetLeveledActorBase().GetName() + " for rank " + 4 + " to " + 3 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[7])
			FloatListSet(akNPC, RS_MULTI_S3_S2_CHANGELIST, ModIndex2, afMultipliers[7])
			IntListSet(akNPC, RS_MULTI_S3_S2_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Relationship multiplier of actor " + akNPC.GetLeveledActorBase().GetName() + " for rank " + 3 + " to " + 2 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[8])
			FloatListSet(akNPC, RS_MULTI_S2_S1_CHANGELIST, ModIndex2, afMultipliers[8])
			IntListSet(akNPC, RS_MULTI_S2_S1_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Relationship multiplier of actor " + akNPC.GetLeveledActorBase().GetName() + " for rank " + 2 + " to " + 1 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[9])
			FloatListSet(akNPC, RS_MULTI_S1_S0_CHANGELIST, ModIndex2, afMultipliers[9])
			IntListSet(akNPC, RS_MULTI_S1_S0_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Relationship multiplier of actor " + akNPC.GetLeveledActorBase().GetName() + " for rank " + 1 + " to " + 0 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[10])
			FloatListSet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, ModIndex2, afMultipliers[10])
			IntListSet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Relationship multiplier of actor " + akNPC.GetLeveledActorBase().GetName() + " for rank " + 0 + " to " + -1 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[11])
			FloatListSet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex2, afMultipliers[11])
			IntListSet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Relationship multiplier of actor " + akNPC.GetLeveledActorBase().GetName() + " for rank " + -1 + " to " + -2 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[12])
			FloatListSet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex2, afMultipliers[12])
			IntListSet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Relationship multiplier of actor " + akNPC.GetLeveledActorBase().GetName() + " for rank " + -2 + " to " + -3 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[13])
			FloatListSet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex2, afMultipliers[13])
			IntListSet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Relationship multiplier of actor " + akNPC.GetLeveledActorBase().GetName() + " for rank " + -3 + " to " + -4 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[14])
			FloatListSet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex2, afMultipliers[14])
			IntListSet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Relationship multiplier of actor " + akNPC.GetLeveledActorBase().GetName() + " for rank " + -4 + " to " + -5 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[15])
			FloatListSet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex2, afMultipliers[15])
			IntListSet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Relationship multiplier of actor " + akNPC.GetLeveledActorBase().GetName() + " for rank " + -5 + " to " + -4 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[16])
			FloatListSet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex2, afMultipliers[16])
			IntListSet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Relationship multiplier of actor " + akNPC.GetLeveledActorBase().GetName() + " for rank " + -4 + " to " + -3 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[17])
			FloatListSet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex2, afMultipliers[17])
			IntListSet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Relationship multiplier of actor " + akNPC.GetLeveledActorBase().GetName() + " for rank " + -3 + " to " + -2 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[18])
			FloatListSet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex2, afMultipliers[18])
			IntListSet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Relationship multiplier of actor " + akNPC.GetLeveledActorBase().GetName() + " for rank " + -2 + " to " + -1 + " got updated by " + ModName + ".", False)
		ElseIf (afMultipliers[19])
			FloatListSet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, ModIndex2, afMultipliers[19])
			IntListSet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, ModIndex2, 1)
			Notify(FW_LOG, "Relationship multiplier of actor " + akNPC.GetLeveledActorBase().GetName() + " for rank " + -1 + " to " + 0 + " got updated by " + ModName + ".", False)
		EndIf
		;/ closeFold /;

		;If the mod is also on the last position then also update the actor's relationship multipliers
		If(ModIndex2 == RSMultiChanges - 1)
			SetFloatValue(akNPC, RS_MULTI_S0_S1_CHANGELIST, afMultipliers[0])
			SetFloatValue(akNPC, RS_MULTI_S1_S2_CHANGELIST, afMultipliers[1])
			SetFloatValue(akNPC, RS_MULTI_S2_S3_CHANGELIST, afMultipliers[2])
			SetFloatValue(akNPC, RS_MULTI_S3_S4_CHANGELIST, afMultipliers[3])
			SetFloatValue(akNPC, RS_MULTI_S4_S5_CHANGELIST, afMultipliers[4])
			SetFloatValue(akNPC, RS_MULTI_S5_S4_CHANGELIST, afMultipliers[5])
			SetFloatValue(akNPC, RS_MULTI_S4_S3_CHANGELIST, afMultipliers[6])
			SetFloatValue(akNPC, RS_MULTI_S3_S2_CHANGELIST, afMultipliers[7])
			SetFloatValue(akNPC, RS_MULTI_S2_S1_CHANGELIST, afMultipliers[8])
			SetFloatValue(akNPC, RS_MULTI_S1_S0_CHANGELIST, afMultipliers[9])
			SetFloatValue(akNPC, RS_MULTI_S0_SM1_CHANGELIST, afMultipliers[10])
			SetFloatValue(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, afMultipliers[11])
			SetFloatValue(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, afMultipliers[12])
			SetFloatValue(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, afMultipliers[13])
			SetFloatValue(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, afMultipliers[14])
			SetFloatValue(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, afMultipliers[15])
			SetFloatValue(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, afMultipliers[16])
			SetFloatValue(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, afMultipliers[17])
			SetFloatValue(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, afMultipliers[18])
			SetFloatValue(akNPC, RS_MULTI_SM1_S0_CHANGELIST, afMultipliers[19])
		Else
			Notify(FW_LOG, "Can't change the relationship multipliers of " + akNPC.GetLeveledActorBase().GetName() + " for " + ModName + " because they are already set by a mod with higher priority. However, it will be set, if this mod has the highest priority.", False)
			Return True
		EndIf
	Else
		Int i = 0

		;Go through the list of changes to the actor's relationship multipliers
		While(i < RSMultiChanges)
			Form ModToCmp = FormListGet(akNPC, RS_MULTI_CHANGELIST, i) ;Get mod at index i
			Int ModToCmpIdx = FormListFind(None, REGISTERED_RS, ModToCmp) ;Get priority of this comparing mod

			;If the actual mod has a higher priority than the comparing mod then continue cycling the list
			If(ModIndex > ModToCmpIdx)
				i += 1
			Else
				FormListInsert(akNPC, RS_MULTI_CHANGELIST, i, akToken) ;Insert the actual mod into the list before the comparing mod
				FloatListInsert(akNPC, RS_MULTI_S0_S1_CHANGELIST, i, 1.0)	;insert the default values. We will change them to what was requested later
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
				IntListInsert(akNPC, RS_MULTI_SM1_S0_CHANGELIST, i, 0)

				If (afMultipliers[0])
					FloatListSet(akNPC, RS_MULTI_S0_S1_CHANGELIST, ModIndex2, afMultipliers[0])
					IntListSet(akNPC, RS_MULTI_S0_S1_CHANGELIST, ModIndex2, 1)	; 0: default framework values, 1: custom mod values
				ElseIf (afMultipliers[1])
					FloatListSet(akNPC, RS_MULTI_S1_S2_CHANGELIST, ModIndex2, afMultipliers[1])
					IntListSet(akNPC, RS_MULTI_S1_S2_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[2])
					FloatListSet(akNPC, RS_MULTI_S2_S3_CHANGELIST, ModIndex2, afMultipliers[2])
					IntListSet(akNPC, RS_MULTI_S2_S3_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[3])
					FloatListSet(akNPC, RS_MULTI_S3_S4_CHANGELIST, ModIndex2, afMultipliers[3])
					IntListSet(akNPC, RS_MULTI_S3_S4_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[4])
					FloatListSet(akNPC, RS_MULTI_S4_S5_CHANGELIST, ModIndex2, afMultipliers[4])
					IntListSet(akNPC, RS_MULTI_S4_S5_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[5])
					FloatListSet(akNPC, RS_MULTI_S5_S4_CHANGELIST, ModIndex2, afMultipliers[5])
					IntListSet(akNPC, RS_MULTI_S5_S4_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[6])
					FloatListSet(akNPC, RS_MULTI_S4_S3_CHANGELIST, ModIndex2, afMultipliers[6])
					IntListSet(akNPC, RS_MULTI_S4_S3_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[7])
					FloatListSet(akNPC, RS_MULTI_S3_S2_CHANGELIST, ModIndex2, afMultipliers[7])
					IntListSet(akNPC, RS_MULTI_S3_S2_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[8])
					FloatListSet(akNPC, RS_MULTI_S2_S1_CHANGELIST, ModIndex2, afMultipliers[8])
					IntListSet(akNPC, RS_MULTI_S2_S1_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[9])
					FloatListSet(akNPC, RS_MULTI_S1_S0_CHANGELIST, ModIndex2, afMultipliers[9])
					IntListSet(akNPC, RS_MULTI_S1_S0_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[10])
					FloatListSet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, ModIndex2, afMultipliers[10])
					IntListSet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[11])
					FloatListSet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex2, afMultipliers[11])
					IntListSet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[12])
					FloatListSet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex2, afMultipliers[12])
					IntListSet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[13])
					FloatListSet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex2, afMultipliers[13])
					IntListSet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[14])
					FloatListSet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex2, afMultipliers[14])
					IntListSet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[15])
					FloatListSet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex2, afMultipliers[15])
					IntListSet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[16])
					FloatListSet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex2, afMultipliers[16])
					IntListSet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[17])
					FloatListSet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex2, afMultipliers[17])
					IntListSet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[18])
					FloatListSet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex2, afMultipliers[18])
					IntListSet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex2, 1)
				ElseIf (afMultipliers[19])
					FloatListSet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, ModIndex2, afMultipliers[19])
					IntListSet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, ModIndex2, 1)
				EndIf

				Notify(FW_LOG, "Can't change the global relationship multipliers of " + akNPC.GetLeveledActorBase().GetName() + " for " + ModName + " because they are already set by a mod with higher priority. However, they will be set, if this mod has the highest priority.", False)
				Return True
			EndIf
		EndWhile
	EndIf

	;No changes made to the array, so just add the value to it and apply the changes to the framework
	FloatListAdd(akNPC, RS_MULTI_S0_S1_CHANGELIST, i, 1.0)	;Add the default values. We will change them to what was requested later
	IntListAdd(akNPC, RS_MULTI_S0_S1_CHANGELIST, i, 0)	; 0: default framework values, 1: custom mod values
	FloatListAdd(akNPC, RS_MULTI_S1_S2_CHANGELIST, i, 0.5)
	IntListAdd(akNPC, RS_MULTI_S1_S2_CHANGELIST, i, 0)
	FloatListAdd(akNPC, RS_MULTI_S2_S3_CHANGELIST, i, 0.25)
	IntListAdd(akNPC, RS_MULTI_S2_S3_CHANGELIST, i, 0)
	FloatListAdd(akNPC, RS_MULTI_S3_S4_CHANGELIST, i, 0.125)
	IntListAdd(akNPC, RS_MULTI_S3_S4_CHANGELIST, i, 0)
	FloatListAdd(akNPC, RS_MULTI_S4_S5_CHANGELIST, i, 0.0625)
	IntListAdd(akNPC, RS_MULTI_S4_S5_CHANGELIST, i, 0)
	FloatListAdd(akNPC, RS_MULTI_S5_S4_CHANGELIST, i, 0.125)
	IntListAdd(akNPC, RS_MULTI_S5_S4_CHANGELIST, i, 0)
	FloatListAdd(akNPC, RS_MULTI_S4_S3_CHANGELIST, i, 0.25)
	IntListAdd(akNPC, RS_MULTI_S4_S3_CHANGELIST, i, 0)
	FloatListAdd(akNPC, RS_MULTI_S3_S2_CHANGELIST, i, 0.5)
	IntListAdd(akNPC, RS_MULTI_S3_S2_CHANGELIST, i, 0)
	FloatListAdd(akNPC, RS_MULTI_S2_S1_CHANGELIST, i, 1.0)
	IntListAdd(akNPC, RS_MULTI_S2_S1_CHANGELIST, i, 0)
	FloatListAdd(akNPC, RS_MULTI_S1_S0_CHANGELIST, i, 2.0)
	IntListAdd(akNPC, RS_MULTI_S1_S0_CHANGELIST, i, 0)
	FloatListAdd(akNPC, RS_MULTI_S0_SM1_CHANGELIST, i, 1.0)
	IntListAdd(akNPC, RS_MULTI_S0_SM1_CHANGELIST, i, 0)
	FloatListAdd(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, i, 0.5)
	IntListAdd(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, i, 0)
	FloatListAdd(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, i, 0.25)
	IntListAdd(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, i, 0)
	FloatListAdd(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, i, 0.125)
	IntListAdd(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, i, 0)
	FloatListAdd(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, i, 0.0625)
	IntListAdd(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, i, 0)
	FloatListAdd(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, i, 0.125)
	IntListAdd(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, i, 0)
	FloatListAdd(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, i, 0.25)
	IntListAdd(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, i, 0)
	FloatListAdd(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, i, 0.5)
	IntListAdd(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, i, 0)
	FloatListAdd(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, i, 1.0)
	IntListAdd(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, i, 0)
	FloatListAdd(akNPC, RS_MULTI_SM1_S0_CHANGELIST, i, 2.0)
	Int i = IntListAdd(akNPC, RS_MULTI_SM1_S0_CHANGELIST, i, 0)

	If (afMultipliers[0])
		FloatListSet(akNPC, RS_MULTI_S0_S1_CHANGELIST, i, afMultipliers[0])
		IntListSet(akNPC, RS_MULTI_S0_S1_CHANGELIST, i, 1)	; 0: default framework values, 1: custom mod values
	ElseIf (afMultipliers[1])
		FloatListSet(akNPC, RS_MULTI_S1_S2_CHANGELIST, i, afMultipliers[1])
		IntListSet(akNPC, RS_MULTI_S1_S2_CHANGELIST, i, 1)
	ElseIf (afMultipliers[2])
		FloatListSet(akNPC, RS_MULTI_S2_S3_CHANGELIST, i, afMultipliers[2])
		IntListSet(akNPC, RS_MULTI_S2_S3_CHANGELIST, i, 1)
	ElseIf (afMultipliers[3])
		FloatListSet(akNPC, RS_MULTI_S3_S4_CHANGELIST, i, afMultipliers[3])
		IntListSet(akNPC, RS_MULTI_S3_S4_CHANGELIST, i, 1)
	ElseIf (afMultipliers[4])
		FloatListSet(akNPC, RS_MULTI_S4_S5_CHANGELIST, i, afMultipliers[4])
		IntListSet(akNPC, RS_MULTI_S4_S5_CHANGELIST, i, 1)
	ElseIf (afMultipliers[5])
		FloatListSet(akNPC, RS_MULTI_S5_S4_CHANGELIST, i, afMultipliers[5])
		IntListSet(akNPC, RS_MULTI_S5_S4_CHANGELIST, i, 1)
	ElseIf (afMultipliers[6])
		FloatListSet(akNPC, RS_MULTI_S4_S3_CHANGELIST, i, afMultipliers[6])
		IntListSet(akNPC, RS_MULTI_S4_S3_CHANGELIST, i, 1)
	ElseIf (afMultipliers[7])
		FloatListSet(akNPC, RS_MULTI_S3_S2_CHANGELIST, i, afMultipliers[7])
		IntListSet(akNPC, RS_MULTI_S3_S2_CHANGELIST, i, 1)
	ElseIf (afMultipliers[8])
		FloatListSet(akNPC, RS_MULTI_S2_S1_CHANGELIST, i, afMultipliers[8])
		IntListSet(akNPC, RS_MULTI_S2_S1_CHANGELIST, i, 1)
	ElseIf (afMultipliers[9])
		FloatListSet(akNPC, RS_MULTI_S1_S0_CHANGELIST, i, afMultipliers[9])
		IntListSet(akNPC, RS_MULTI_S1_S0_CHANGELIST, i, 1)
	ElseIf (afMultipliers[10])
		FloatListSet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, i, afMultipliers[10])
		IntListSet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, i, 1)
	ElseIf (afMultipliers[11])
		FloatListSet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, i, afMultipliers[11])
		IntListSet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, i, 1)
	ElseIf (afMultipliers[12])
		FloatListSet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, i, afMultipliers[12])
		IntListSet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, i, 1)
	ElseIf (afMultipliers[13])
		FloatListSet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, i, afMultipliers[13])
		IntListSet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, i, 1)
	ElseIf (afMultipliers[14])
		FloatListSet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, i, afMultipliers[14])
		IntListSet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, i, 1)
	ElseIf (afMultipliers[15])
		FloatListSet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, i, afMultipliers[15])
		IntListSet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, i, 1)
	ElseIf (afMultipliers[16])
		FloatListSet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, i, afMultipliers[16])
		IntListSet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, i, 1)
	ElseIf (afMultipliers[17])
		FloatListSet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, i, afMultipliers[17])
		IntListSet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, i, 1)
	ElseIf (afMultipliers[18])
		FloatListSet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, i, afMultipliers[18])
		IntListSet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, i, 1)
	ElseIf (afMultipliers[19])
		FloatListSet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, i, afMultipliers[19])
		IntListSet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, i, 1)
	EndIf

	FormListAdd(None, RS_MULTI_NPC_CHANGELIST, akNPC, False)

	Return True
EndFunction

Float Function RemoveRelationshipMulti(Quest akToken, Actor akNPC, Int aiFromRelationshipRank, Int aiToRelationshipRank, Bool abVerbose = True)
	If(!akNPC)
		Throw(FW_LOG, "Argument akNPC for function RemoveRelationshipMulti() is None!", "Invalid arguments")
		Return -2.0
	EndIf

	If(_GetModIndexFromForm(akToken, REGISTERED_RS) == -1)
		Warn(FW_LOG, "A mod tried to remove its changes to " + akNPC.GetLeveledActorBase().GetName() + "'s relationship multipliers. It passed a wrong token, however. FormID of the token is " + akToken.GetFormID() + ".")
		Return -2.0
	ElseIf(_GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST, akNPC) == -1)
		If (abVerbose)
			Notify(FW_LOG, "A mod tried to remove its changes to " + akNPC.GetLeveledActorBase().GetName() + "'s relationship multipliers. But there were no changes made by this mod. FormID of the token is " + akToken.GetFormID() + ".")
			Return -1.0
		EndIf
	EndIf

	If(aiFromRelationshipRank < -5 || aiFromRelationshipRank > 5)
		Throw(FW_LOG, "Argument aiFromRelationshipRank was not set correctly. The range is from -5 to 5.", "Invalid arguments")
		Return -2.0
	EndIf

	If(aiToRelationshipRank < -5 || aiToRelationshipRank > 5)
		Throw(FW_LOG, "Argument aiToRelationshipRank was not set correctly. The range is from -5 to 5.", "Invalid arguments")
		Return -2.0
	EndIf

	If(aiFromRelationshipRank == aiToRelationshipRank)
		Throw(FW_LOG, "Argument aiToRelationshipRank can not be the same value as aiFromRelationshipRank.", "Invalid arguments")
		Return -2.0
	EndIf

	If(aiFromRelationshipRank - aiToRelationshipRank != 1 && aiFromRelationshipRank - aiToRelationshipRank != -1)
		Throw(FW_LOG, "Multiplier can only be set for the next or previous rank. From Rank " + aiFromRelationshipRank + " to Rank " + aiToRelationshipRank + " is incorrect.", "Invalid arguments")
		Return -2.0
	EndIf

	Int ModIndex = _GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST, akNPC)
	String MultiplierString = "S" + aiFromRelationshipRank As String + "_S" + aiToRelationshipRank As String

	;if this mod has not set a custom multiplier for this stage, return false (nothing to remove)
	If(MultiplierString == "S0_S1")
		If (IntListGet(akNPC, RS_MULTI_S0_S1_CHANGELIST, ModIndex) == 0)
			Notify(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S1_S2")
		If (IntListGet(akNPC, RS_MULTI_S1_S2_CHANGELIST, ModIndex) == 0)
			Notify(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S2_S3")
		If (IntListGet(akNPC, RS_MULTI_S2_S3_CHANGELIST, ModIndex) == 0)
			Notify(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S3_S4")
		If (IntListGet(akNPC, RS_MULTI_S3_S4_CHANGELIST, ModIndex) == 0)
			Notify(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S4_S5")
		If (IntListGet(akNPC, RS_MULTI_S4_S5_CHANGELIST, ModIndex) == 0)
			Notify(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S5_S4")
		If (IntListGet(akNPC, RS_MULTI_S5_S4_CHANGELIST, ModIndex) == 0)
			Notify(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S4_S3")
		If (IntListGet(akNPC, RS_MULTI_S4_S3_CHANGELIST, ModIndex) == 0)
			Notify(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S3_S2")
		If (IntListGet(akNPC, RS_MULTI_S3_S2_CHANGELIST, ModIndex) == 0)
			Notify(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S2_S1")
		If (IntListGet(akNPC, RS_MULTI_S2_S1_CHANGELIST, ModIndex) == 0)
			Notify(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S1_S0")
		If (IntListGet(akNPC, RS_MULTI_S1_S0_CHANGELIST, ModIndex) == 0)
			Notify(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S0_S-1")
		If (IntListGet(akNPC, RS_MULTI_S0_SM1_CHANGELIST, ModIndex) == 0)
			Notify(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S-1_S-2")
		If (IntListGet(akNPC, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex) == 0)
			Notify(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S-2_S-3")
		If (IntListGet(akNPC, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex) == 0)
			Notify(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S-3_S-4")
		If (IntListGet(akNPC, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex) == 0)
			Notify(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S-4_S-5")
		If (IntListGet(akNPC, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex) == 0)
			Notify(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S-5_S-4")
		If (IntListGet(akNPC, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex) == 0)
			Notify(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S-4_S-3")
		If (IntListGet(akNPC, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex) == 0)
			Notify(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S-3_S-2")
		If (IntListGet(akNPC, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex) == 0)
			Notify(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S-2_S-1")
		If (IntListGet(akNPC, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex) == 0)
			Notify(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return -1.0
		EndIf
	ElseIf (MultiplierString == "S-1_S0")
		If (IntListGet(akNPC, RS_MULTI_SM1_S0_CHANGELIST, ModIndex) == 0)
			Notify(FW_LOG, "A mod tried to remove its changes to the global relationship multiplier for " + aiFromRelationshipRank + " to " + aiToRelationshipRank + ", but there were no changes made by this mod to this multiplier. FormID of the token is " + akToken.GetFormID() + ".")
			Return -1.0
		EndIf
	EndIf

	Float myRelationshipMulti = FloatListGet(akNPC, RS_MULTI_PREFIX + MultiplierString + RS_MULTI_CHANGELIST_SUFFIX, ModIndex)

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

			FormListRemove(None, RS_MULTI_NPC_CHANGELIST, akNPC) 	;remove the NPC from the list of NPC's with local relationship changes

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
			If (FormListCount(None, RS_MULTI_NPC_CHANGELIST) == 0)
				FormListClear(None, RS_MULTI_NPC_CHANGELIST)
			EndIf
		EndIf

		Return myRelationshipMulti
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

		Return myRelationshipMulti
	EndIf
EndFunction

Float[] Function RemoveRelationshipMultis(Quest akToken, Actor akNPC)
	Float[] myRelationshipMulti

	If(!akNPC)
		Throw(FW_LOG, "Argument akNPC for function RemoveRelationshipMultis() is None!", "Invalid arguments")
		Return myRelationshipMulti
	EndIf

	If(_GetModIndexFromForm(akToken, REGISTERED_RS) == -1)
		Warn(FW_LOG, "A mod tried to remove its changes to " + akNPC.GetLeveledActorBase().GetName() + "'s relationship multipliers. It passed a wrong token, however. FormID of the token is " + akToken.GetFormID() + ".")
		Return myRelationshipMulti
	ElseIf(_GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST, akNPC) == -1)
		Notify(FW_LOG, "A mod tried to remove its changes to " + akNPC.GetLeveledActorBase().GetName() + "'s relationship multipliers. But there were no changes made by this mod. FormID of the token is " + akToken.GetFormID() + ".")
		Return myRelationshipMulti
	EndIf

	Int ModIndex = _GetModIndexFromForm(akToken, RS_MULTI_CHANGELIST, akNPC)
	myRelationshipMulti = new Float[20]

	;/ openFold Initializing myRelationshipMulti[] with the multipliers that akToken had changed. 0 if akToken had not changed a specific multiplier /;
	If (IntListGet(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex))
		myRelationshipMulti[0] = FloatListGet(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_S0_S1_CHANGELIST, ModIndex))
		myRelationshipMulti[1] = FloatListGet(None, RS_MULTI_S1_S2_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_S1_S2_CHANGELIST, ModIndex))
		myRelationshipMulti[2] = FloatListGet(None, RS_MULTI_S2_S3_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_S2_S3_CHANGELIST, ModIndex))
		myRelationshipMulti[3] = FloatListGet(None, RS_MULTI_S3_S4_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_S3_S4_CHANGELIST, ModIndex))
		myRelationshipMulti[4] = FloatListGet(None, RS_MULTI_S4_S5_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_S4_S5_CHANGELIST, ModIndex))
		myRelationshipMulti[5] = FloatListGet(None, RS_MULTI_S5_S4_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_S5_S4_CHANGELIST, ModIndex))
		myRelationshipMulti[6] = FloatListGet(None, RS_MULTI_S4_S3_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_S4_S3_CHANGELIST, ModIndex))
		myRelationshipMulti[7] = FloatListGet(None, RS_MULTI_S3_S2_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_S3_S2_CHANGELIST, ModIndex))
		myRelationshipMulti[8] = FloatListGet(None, RS_MULTI_S2_S1_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_S2_S1_CHANGELIST, ModIndex))
		myRelationshipMulti[9] = FloatListGet(None, RS_MULTI_S1_S0_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_S1_S0_CHANGELIST, ModIndex))
		myRelationshipMulti[10] = FloatListGet(None, RS_MULTI_S0_SM1_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_S0_SM1_CHANGELIST, ModIndex))
		myRelationshipMulti[11] = FloatListGet(None, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_SM1_SM2_CHANGELIST, ModIndex))
		myRelationshipMulti[12] = FloatListGet(None, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_SM2_SM3_CHANGELIST, ModIndex))
		myRelationshipMulti[13] = FloatListGet(None, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_SM3_SM4_CHANGELIST, ModIndex))
		myRelationshipMulti[14] = FloatListGet(None, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_SM4_SM5_CHANGELIST, ModIndex))
		myRelationshipMulti[15] = FloatListGet(None, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_SM5_SM4_CHANGELIST, ModIndex))
		myRelationshipMulti[16] = FloatListGet(None, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_SM4_SM3_CHANGELIST, ModIndex))
		myRelationshipMulti[17] = FloatListGet(None, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_SM3_SM2_CHANGELIST, ModIndex))
		myRelationshipMulti[18] = FloatListGet(None, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex)
	EndIf

	If (IntListGet(None, RS_MULTI_SM2_SM1_CHANGELIST, ModIndex))
		myRelationshipMulti[19] = FloatListGet(None, RS_MULTI_SM1_S0_CHANGELIST, ModIndex)
	EndIf
	;/ closeFold /;

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

		FormListRemove(None, RS_MULTI_NPC_CHANGELIST, akNPC) 	;remove the NPC from the list of NPC's with local relationship changes

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
		If (FormListCount(None, RS_MULTI_NPC_CHANGELIST) == 0)
			FormListClear(None, RS_MULTI_NPC_CHANGELIST)
		EndIf
	EndIf

	Return myRelationshipMulti
EndFunction

Bool Function CreatePrivateGroup(Quest akToken, String asGroupName)
	Int ModIndex = _GetModIndexFromForm(akToken, REGISTERED_RS)

	If(ModIndex == -1)
		Throw(FW_LOG, "A mod, which is not registered or sent an invalid token, tried to access CreatePrivateGroup(). The FormID of this token is " + akToken.GetFormID() + ".", "Access denied")
		Return False
	EndIf

	If(!asGroupName)
		Throw(FW_LOG, "Argument asGroupName has no group name", "Invalid arguments")
		Return False
	EndIf

	If(StringListAdd(akToken, GROUPS, asGroupName, False) == -1)
		Throw(FW_LOG, asGroupName + " already exists for token " + akToken.GetFormID() + "! Nothing changed.", "Invalid arguments")
		Return False
	EndIf

	Return True
EndFunction

Bool Function CreatePublicGroup(String asGroupName)
	If(!asGroupName)
		Throw(FW_LOG, "Argument asGroupName has no group name", "Invalid arguments")
		Return False
	EndIf

	If(StringListAdd(None, GROUPS, asGroupName, False) == -1)
		Throw(FW_LOG, asGroupName + " already exists as a public group! Nothing changed.", "Invalid arguments")
		Return False
	EndIf

	Return True
EndFunction

Bool Function DeletePrivateGroup(Quest akToken, String asGroupName)
	Int ModIndex = _GetModIndexFromForm(akToken, REGISTERED_RS)

	If(ModIndex == -1)
		Throw(FW_LOG, "A mod, which is not registered or sent an invalid token, tried to access DeletePrivateGroup(). The FormID of this token is " + akToken.GetFormID() + ".", "Access denied")
		Return False
	EndIf

	If(!asGroupName)
		Throw(FW_LOG, "Argument asGroupName has no group name", "Invalid arguments")
		Return False
	EndIf

	StringListRemove(akToken, GROUPS, asGroupName)
	FormListClear(akToken, "APPS.Framework.Relationship.Groups." + asGroupName)
	UnsetFormValue(akToken, GROUPS_LINK + asGroupName)
	UnsetIntValue(akToken, GROUPS_LINK + asGroupName)

	Return True
EndFunction

Bool Function DeletePublicGroup(String asGroupName)
	If(!asGroupName)
		Throw(FW_LOG, "Argument asGroupName has no group name", "Invalid arguments")
		Return False
	EndIf

	StringListRemove(None, GROUPS, asGroupName)
	FormListClear(None, "APPS.Framework.Relationship.Groups." + asGroupName)
	FormListClear(None, GROUPS_LINK + asGroupName)
	UnsetIntValue(None, GROUPS_LINK + asGroupName)

	Return True
EndFunction

Bool Function IsPublicGroupCreated(String asGroupName)
	Return StringListHas(None, GROUPS, asGroupName)
EndFunction

Bool Function AddToPrivateGroup(Quest akToken, String asGroupName, Actor akNPC)
	Int ModIndex = _GetModIndexFromForm(akToken, REGISTERED_RS)

	If(ModIndex == -1)
		Throw(FW_LOG, "A mod, which is not registered or sent an invalid token, tried to access AddToPrivateGroup(). The FormID of this token is " + akToken.GetFormID() + ".", "Access denied")
		Return False
	EndIf

	If(!asGroupName)
		Throw(FW_LOG, "Argument asGroupName has no group name", "Invalid arguments")
		Return False
	EndIf

	If(!akNPC)
		Throw(FW_LOG, "Argument akNPC for function AddToPrivateGroup() is None!", "Invalid arguments")
		Return False
	EndIf

	If(!akNPC.GetLeveledActorBase().IsUnique())
		Throw(FW_LOG, "Actor " + akNPC.GetLeveledActorBase().GetName() + " must be an unique actor!", "Invalid arguments")
		Return False
	EndIf

	If(FormListAdd(akToken, "APPS.Framework.Relationship.Groups." + asGroupName, akNPC, False) == -1)
		Throw(FW_LOG, "Actor "+ akNPC.GetLeveledActorBase().GetName() + " is already added to the group " + asGroupName + "!", "Invalid arguments")
		Return False
	EndIf

	Return True
EndFunction

Bool Function AddToPublicGroup(String asGroupName, Actor akNPC)
	If(!asGroupName)
		Throw(FW_LOG, "Argument asGroupName has no group name", "Invalid arguments")
		Return False
	EndIf

	If(!akNPC)
		Throw(FW_LOG, "Argument akNPC for function AddToPublicGroup() is None!", "Invalid arguments")
		Return False
	EndIf

	If(!akNPC.GetLeveledActorBase().IsUnique())
		Throw(FW_LOG, "Actor " + akNPC.GetLeveledActorBase().GetName() + " must be an unique actor!", "Invalid arguments")
		Return False
	EndIf

	If(FormListAdd(None, "APPS.Framework.Relationship.Groups." + asGroupName, akNPC, False) == -1)
		Throw(FW_LOG, "Actor "+ akNPC.GetLeveledActorBase().GetName() + " is already added to the group " + asGroupName + "!", "Invalid arguments")
		Return False
	EndIf

	Return True
EndFunction

Bool Function RemoveFromPrivateGroup(Quest akToken, String asGroupName, Actor akNPC)
	Int ModIndex = _GetModIndexFromForm(akToken, REGISTERED_RS)

	If(ModIndex == -1)
		Throw(FW_LOG, "A mod, which is not registered or sent an invalid token, tried to access RemoveFromPrivateGroup(). The FormID of this token is " + akToken.GetFormID() + ".", "Access denied")
		Return False
	EndIf

	If(!asGroupName)
		Throw(FW_LOG, "Argument asGroupName has no group name", "Invalid arguments")
		Return False
	EndIf

	If(!akNPC)
		Throw(FW_LOG, "Argument akNPC for function RemoveFromPrivateGroup() is None!", "Invalid arguments")
		Return False
	EndIf

	If(!akNPC.GetLeveledActorBase().IsUnique())
		Throw(FW_LOG, "Actor " + akNPC.GetLeveledActorBase().GetName() + " must be an unique actor!", "Invalid arguments")
		Return False
	EndIf

	FormListRemove(akToken, "APPS.Framework.Relationship.Groups." + asGroupName, akNPC)
	Return True
EndFunction

Bool Function RemoveFromPublicGroup(String asGroupName, Actor akNPC)
	If(!asGroupName)
		Throw(FW_LOG, "Argument asGroupName has no group name", "Invalid arguments")
		Return False
	EndIf

	If(!akNPC)
		Throw(FW_LOG, "Argument akNPC for function RemoveFromPublicGroup() is None!", "Invalid arguments")
		Return False
	EndIf

	If(!akNPC.GetLeveledActorBase().IsUnique())
		Throw(FW_LOG, "Actor " + akNPC.GetLeveledActorBase().GetName() + " must be an unique actor!", "Invalid arguments")
		Return False
	EndIf

	FormListRemove(None, "APPS.Framework.Relationship.Groups." + asGroupName, akNPC)
	Return True
EndFunction

;/ Actor[] Function GetPrivateGroupMembers(Quest akToken, String asGroupName)

EndFunction

Actor[] Function GetPublicGroupMembers(String asGroupName)

EndFunction /;

Bool Function ModPrivateGroupRP(Quest akToken, String asGroupName, Float afRelationshipPoints, Bool abIsSurplusCarryingOver = True)
	Float HighestValue
	Float LowestValue
	Float TotalValue
	Int ModIndex = _GetModIndexFromForm(akToken, REGISTERED_RS)
	Int i

	If(ModIndex == -1)
		Throw(FW_LOG, "A mod, which is not registered or sent an invalid token, tried to access ModPrivateGroupRS(). The FormID of this token is " + akToken.GetFormID() + ".", "Access denied")
		Return False
	EndIf

	If(!asGroupName)
		Throw(FW_LOG, "Argument asGroupName has no group name", "Invalid arguments")
		Return False
	EndIf

	If(afRelationshipPoints == 0.0)
		Warn(FW_LOG, "Argument afRelationshipPoints was 0. Function will not be executed.")
		Return False
	EndIf

	While(i < FormListCount(akToken, "APPS.Framework.Relationship.Groups." + asGroupName))
		Float ReturnValue = ModRelationshipPoints(FormListGet(akToken, "APPS.Framework.Relationship.Groups." + asGroupName, i) As Actor, afRelationshipPoints, abIsSurplusCarryingOver)

		If(HasFormValue(akToken, GROUPS_LINK + asGroupName))
			If(i == 0)
				HighestValue = ReturnValue
				LowestValue = ReturnValue
			EndIf

			If(ReturnValue > HighestValue)
				HighestValue = ReturnValue
			EndIf

			If(ReturnValue < LowestValue)
				LowestValue = ReturnValue
			EndIf

			TotalValue += ReturnValue
		EndIf

		i += 1
	EndWhile

	If(HasFormValue(akToken, GROUPS_LINK + asGroupName))
		If(GetIntValue(akToken, GROUPS_LINK + asGroupName) == 1)
			(GetFormValue(akToken, GROUPS_LINK + asGroupName) As GlobalVariable).SetValue(HighestValue)
		ElseIf(GetIntValue(akToken, GROUPS_LINK + asGroupName) == 2)
			(GetFormValue(akToken, GROUPS_LINK + asGroupName) As GlobalVariable).SetValue(LowestValue)
		Else
			(GetFormValue(akToken, GROUPS_LINK + asGroupName) As GlobalVariable).SetValue(TotalValue / i)
		EndIf
	EndIf

	Return True
EndFunction

Bool Function ModPublicGroupRP(String asGroupName, Float afRelationshipPoints, Bool abIsSurplusCarryingOver = True)
	Float HighestValue
	Float LowestValue
	Float TotalValue
	Int i
	Int j

	If(!asGroupName)
		Throw(FW_LOG, "Argument asGroupName has no group name", "Invalid arguments")
		Return False
	EndIf

	If(afRelationshipPoints == 0.0)
		Warn(FW_LOG, "Argument afRelationshipPoints was 0. Function will not be executed.")
		Return False
	EndIf

	While(i < FormListCount(None, "APPS.Framework.Relationship.Groups." + asGroupName))
		Float ReturnValue = ModRelationshipPoints(FormListGet(None, "APPS.Framework.Relationship.Groups." + asGroupName, i) As Actor, afRelationshipPoints, abIsSurplusCarryingOver)

		If(FormListCount(None, GROUPS_LINK + asGroupName) > 0)
			If(i == 0)
				HighestValue = ReturnValue
				LowestValue = ReturnValue
			EndIf
			
			If(ReturnValue > HighestValue)
				HighestValue = ReturnValue
			EndIf

			If(ReturnValue < LowestValue)
				LowestValue = ReturnValue
			EndIf

			TotalValue += ReturnValue
		EndIf

		i += 1
	EndWhile

	While(j < FormListCount(None, GROUPS_LINK + asGroupName))
		If(IntListGet(None, GROUPS_LINK + asGroupName, j) == 1)
			(FormListGet(None, GROUPS_LINK + asGroupName, j) As GlobalVariable).SetValue(HighestValue)
		ElseIf(IntListGet(None, GROUPS_LINK + asGroupName, j) == 2)
			(FormListGet(None, GROUPS_LINK + asGroupName, j) As GlobalVariable).SetValue(LowestValue)
		Else
			(FormListGet(None, GROUPS_LINK + asGroupName, j) As GlobalVariable).SetValue(TotalValue / i)
		EndIf

		j += 1
	EndWhile

	Return True
EndFunction

Bool Function LinkPrivateGroupWithGV(Quest akToken, String asGroupName, GlobalVariable akGlobalVar, Int auiReturnType = 1)
;1 Highest
;2 Lowest
;3 Average
	Int ModIndex = _GetModIndexFromForm(akToken, REGISTERED_RS)

	If(ModIndex == -1)
		Throw(FW_LOG, "A mod, which is not registered or sent an invalid token, tried to access LinkPrivateGroupWithGV(). The FormID of this token is " + akToken.GetFormID() + ".", "Access denied")
		Return False
	EndIf

	If(!asGroupName)
		Throw(FW_LOG, "Argument asGroupName has no group name", "Invalid arguments")
		Return False
	EndIf

	If(!akGlobalVar)
		Throw(FW_LOG, "Argument akGlobalVar is None!", "Invalid arguments")
		Return False
	EndIf

	If(auiReturnType < 1 || auiReturnType > 3)
		Throw(FW_LOG, "Return type wasn't set correctly. The lower limit is 1 and the upper limit is 3", "Invalid arguments")
		Return False
	EndIf

	If(HasFormValue(akToken, GROUPS_LINK + asGroupName))
		Throw(FW_LOG, "This group has already a global var linked!", "Invalid arguments")
		Return False
	EndIf

	SetFormValue(akToken, GROUPS_LINK + asGroupName, akGlobalVar)
	SetIntValue(akToken, GROUPS_LINK + asGroupName, auiReturnType)

	Return True
EndFunction

Bool Function LinkPublicGroupWithGV(String asGroupName, GlobalVariable akGlobalVar, Int auiReturnType = 1)
	If(!asGroupName)
		Throw(FW_LOG, "Argument asGroupName has no group name", "Invalid arguments")
		Return False
	EndIf

	If(!akGlobalVar)
		Throw(FW_LOG, "Argument akGlobalVar is None!", "Invalid arguments")
		Return False
	EndIf

	If(auiReturnType < 1 || auiReturnType > 3)
		Throw(FW_LOG, "Return type wasn't set correctly. The lower limit is 1 and the upper limit is 3", "Invalid arguments")
		Return False
	EndIf

	If(FormListAdd(None, GROUPS_LINK + asGroupName, akGlobalVar, False) == -1)
		Throw(FW_LOG, "Global variable " + akGlobalVar + " is already added to the group " + asGroupName + "!", "Invalid arguments")
		Return False
	EndIf

	IntListAdd(None, GROUPS_LINK + asGroupName, auiReturnType)

	Return True
EndFunction

Float Function GetRelationshipPoints(Actor akNPC)
	If(!akNPC)
		Throw(FW_LOG, "Argument akNPC is None!", "Invalid arguments")
		Return - 500.0
	EndIf

	If(!HasFloatValue(akNPC, RSP) && akNPC.GetRelationshipRank(PlayerRef) != 0)
		If(GetSyncMode(akNPC) == 1 || GetSyncMode(akNPC) == 3)
			SetIntValue(akNPC, IGNORE_CHANGES, 1)
			SetRelationshipPoints(akNPC, akNPC.GetRelationshipRank(PlayerRef) * 100)
		Else
			SetRelationshipPoints(akNPC, 0)
		EndIf
	ElseIf(!HasFloatValue(akNPC, RSP) && akNPC.GetRelationshipRank(PlayerRef) == 0)
		SetRelationshipPoints(akNPC, 0)
	EndIf

	Return GetFloatValue(akNPC, RSP)
EndFunction

Float Function WouldGiveRP(Actor akNPC, Float afRelationshipPoints, Bool abIsSurplusCarryingOver = True)
	If(!akNPC)
		Throw(FW_LOG, "Argument akNPC is None!", "Invalid arguments")
		Return 0.0
	EndIf

	If(!akNPC.GetLeveledActorBase().IsUnique())
		Throw(FW_LOG, "Actor " + akNPC.GetLeveledActorBase().GetName() + " must be an unique actor!", "Invalid arguments")
		Return 0.0
	EndIf

	If(afRelationshipPoints == 0.0)
		Warn(FW_LOG, "Argument afRelationshipPoints was 0. Function will not be executed.")
	EndIf

	Float PreviousRP = GetRelationshipPoints(akNPC)

	Return (_CalculateRP(akNPC, afRelationshipPoints, abIsSurplusCarryingOver) - PreviousRP)
EndFunction

Float Function ModRelationshipPoints(Actor akNPC, Float afRelationshipPoints, Bool abIsSurplusCarryingOver = True)
	If(!akNPC)
		Throw(FW_LOG, "Argument akNPC is None!", "Invalid arguments")
		Return 0.0
	EndIf

	If(!akNPC.GetLeveledActorBase().IsUnique())
		Throw(FW_LOG, "Actor " + akNPC.GetLeveledActorBase().GetName() + " must be an unique actor!", "Invalid arguments")
		Return 0.0
	EndIf

	If(afRelationshipPoints == 0.0)
		Warn(FW_LOG, "Argument afRelationshipPoints was 0. Function will not be executed.")
	EndIf

	SetRelationshipPoints(akNPC, _CalculateRP(akNPC, afRelationshipPoints, abIsSurplusCarryingOver))

	Return _CalculateRP(akNPC, afRelationshipPoints, abIsSurplusCarryingOver)
EndFunction

Bool Function SetRelationshipPoints(Actor akNPC, Float afRelationshipPoints)
	If(!akNPC || afRelationshipPoints < -499 || afRelationshipPoints > 499)
		Return False
	EndIf

	SetFloatValue(akNPC, RSP, afRelationshipPoints)

	If(!akNPC.IsInFaction(RelationshipPointsFaction))
		akNPC.AddToFaction(RelationshipPointsFaction)
		akNPC.AddToFaction(RelationshipRankFaction)
	EndIf

	akNPC.SetFactionRank(RelationshipPointsFaction, afRelationshipPoints As Int % 100)

	If(afRelationshipPoints >= 0.0)
		akNPC.SetFactionRank(RelationshipRankFaction, Math.Floor(afRelationshipPoints / 100) * 10)
	Else
		akNPC.SetFactionRank(RelationshipRankFaction, Math.Ceiling(afRelationshipPoints / 100) * 10)
	EndIf

	If(GetSyncMode(akNPC) > 1 && !HasIntValue(akNPC, IGNORE_CHANGES))
		SetIntValue(akNPC, IGNORE_CHANGES, 2)

		If(afRelationshipPoints >= 0.0)
			akNPC.SetRelationshipRank(PlayerRef, Math.Floor(afRelationshipPoints / 100))
		Else
			akNPC.SetRelationshipRank(PlayerRef, Math.Ceiling(afRelationshipPoints / 100))
		EndIf
	EndIf

	If(GetIntValue(akNPC, IGNORE_CHANGES) == 1)
		UnsetIntValue(akNPC, IGNORE_CHANGES)
	EndIf

	Return True

EndFunction

Float Function GetRPForNextRank(Actor akNPC)
	If(!akNPC)
		Throw(FW_LOG, "Argument akNPC for function GetRPForNextRank() is None!", "Invalid arguments")
		Return 0.0
	EndIf

	Float RP = GetRelationshipPoints(akNPC)
	Int RelationshipRank = akNPC.GetFactionRank(RelationshipRankFaction) / 10

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
	If(!akNPC)
		Throw(FW_LOG, "Argument akNPC for function GetRPForPreviousRank() is None!", "Invalid arguments")
		Return 0.0
	EndIf

	Float RP = GetRelationshipPoints(akNPC)
	Int RelationshipRank = akNPC.GetFactionRank(RelationshipRankFaction) / 10

	If(RelationshipRank == -4)
		Return (-499 - RP) / GetRelationshipMulti(akNPC, RelationshipRank, RelationshipRank - 1)
	EndIf

	If(RP > 0)
		Return (RelationshipRank * 100 - RP - 1) / GetRelationshipMulti(akNPC, RelationshipRank, RelationshipRank - 1)
	Else
		Return ((RelationshipRank  - 1) * 100 - RP) / GetRelationshipMulti(akNPC, RelationshipRank, RelationshipRank - 1)
	EndIf
EndFunction

Float Function _CalculateRP(Actor akNPC, Float afRelationshipPoints, Bool abIsSurplusCarryingOver = True)
	Bool Break
	Float NewRP
	Float CurrentRP = GetRelationshipPoints(akNPC)
	Float PreviousRP = CurrentRP
	Int CurrentRank = akNPC.GetFactionRank(RelationshipRankFaction) / 10

	If(afRelationshipPoints > 0.0)
		While(!Break)
			Float CurrentMulti = GetRelationshipMulti(akNPC, CurrentRank, CurrentRank + 1)
			Float CleanedRP = afRelationshipPoints * CurrentMulti
			Float TempRP = CurrentRP + CleanedRP
			Float RequiredRP = GetRPForNextRank(akNPC)

			If(CleanedRP <= (RequiredRP * CurrentMulti))
				NewRP = TempRP
				Break = True
			ElseIf(CleanedRP > (RequiredRP * CurrentMulti) && CurrentRank == 4)
				NewRP = 499
				Break = True
			ElseIf(CleanedRP > (RequiredRP * CurrentMulti))
				If(abIsSurplusCarryingOver)
					CurrentRank += 1
					afRelationshipPoints -= RequiredRP
					CurrentRP = CurrentRank * 100
					SetIntValue(akNPC, IGNORE_CHANGES, 1)
					SetRelationshipPoints(akNPC, CurrentRP)
				Else
					NewRP = (CurrentRank + 1) * 100
					Break = True
				EndIf
			EndIf
		EndWhile
	Else
		While(!Break)
			Float CurrentMulti = GetRelationshipMulti(akNPC, CurrentRank, CurrentRank - 1)
			Float CleanedRP = afRelationshipPoints * CurrentMulti
			Float TempRP = CurrentRP + CleanedRP
			Float RequiredRP = GetRPForPreviousRank(akNPC)

			If(CleanedRP >= (RequiredRP * CurrentMulti))
				NewRP = TempRP
				Break = True
			ElseIf(CleanedRP < (RequiredRP * CurrentMulti) && CurrentRank == -4)
				NewRP = -499
				Break = True
			ElseIf(CleanedRP < (RequiredRP * CurrentMulti))
				If(abIsSurplusCarryingOver)
					afRelationshipPoints -= RequiredRP
					CurrentRP = CurrentRank * 100 - 1
					CurrentRank -= 1
					SetIntValue(akNPC, IGNORE_CHANGES, 1)
					SetRelationshipPoints(akNPC, CurrentRP)
				Else
					NewRP = (CurrentRank - 1) * 100
					Break = True
				EndIf
			EndIf
		EndWhile
	EndIf

	SetIntValue(akNPC, IGNORE_CHANGES, 1)
	SetRelationshipPoints(akNPC, PreviousRP)

	Return NewRP
EndFunction
