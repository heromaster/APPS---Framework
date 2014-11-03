Scriptname APPS_RelFramework_Functions Extends APPS_FW_Core
Import StorageUtil
Import Exception

Faction Property RelationshipPoints  Auto  
Faction Property RelationshipRank  Auto 
ReferenceAlias Property Alias_PC Auto

Bool IsUninstallingAll = False
String SYNC_MODE = "APPS.Relationship.SyncMode"
String SYNC_MODE_CHANGELIST = "APPS.Relationship.SyncMode.ChangeList"
String RSP = "APPS.Relationship.RelationshipPoints"
String Property FW_LOG = "APPS - Framework" AutoReadOnly Hidden

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
	String ModName = StringListGet(None, SUKEY_REGISTERED_RS, ModIndex)
	Int ModIndex2 = _GetModIndexFromForm(akToken, SYNC_MODE_CHANGELIST) ; Get position of current mod in this list
	Int SyncModeChanges = FormListCount(None, SYNC_MODE_CHANGELIST) ;Get the list of mods which do change the global sync mode

	If(!_CheckSyncModeArgs(ModIndex, aiSyncMode))
		Return False
	EndIf

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
			Int ModToCmpIdx = FormListFind(None, SUKEY_REGISTERED_RS, ModToCmp) ;Get priority of this comparing mod

			;If the actual mod has a higher priority then the comparing mod then continue cycling the list
			If(ModIndex > ModToCmpIdx)
				i += 1
			Else
				FormListInsert(None, SYNC_MODE_CHANGELIST, i, akToken) ;Insert the actual mod into the list before the comparing mod
				IntListInsert(None, SYNC_MODE_CHANGELIST, i, aiSyncMode) ;Insert the sync mode value as well
				Notify(FW_Log, "Can't change the global sync mode because it is already set by a mod with higher priority. However, the value will be set, if " + ModName + " becomes the highest priority.", False)
				Return True
			EndIf
		EndWhile

		;The mod wasn't found in the changelist
		FormListAdd(None, SYNC_MODE_CHANGELIST, akToken)
		IntListAdd(None, SYNC_MODE_CHANGELIST, aiSyncMode)
		SetIntValue(None, SYNC_MODE, aiSyncMode)
		Return True
	EndIf
EndFunction

Bool Function RemoveGlobalSyncMode(Quest akToken)
	If(_GetModIndexFromForm(akToken, SUKEY_REGISTERED_RS) == -1)
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
	ElseIf(ModIndex > 0)
		SetIntValue(None, SYNC_MODE, IntListGet(None, SYNC_MODE, ModIndex - 1))
	EndIf

	FormListRemove(None, SYNC_MODE_CHANGELIST, akToken)
	IntListRemoveAt(None, SYNC_MODE_CHANGELIST, ModIndex)
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
	String ModName = StringListGet(None, SUKEY_REGISTERED_RS, ModIndex)
	Int ModIndex2 = _GetModIndexFromForm(akToken, SYNC_MODE_CHANGELIST, akNPC) ; Get position of current mod in this list
	Int SyncModeChanges = FormListCount(akNPC, SYNC_MODE_CHANGELIST) ;Get the list of mods which do change the sync mode on an actor

	If(!_CheckSyncModeArgs(ModIndex, aiSyncMode, False, akNPC))
		Return False
	EndIf

	;If the mod was found, update its new value
	If(ModIndex2 >= 0)
		IntListSet(akNPC, SYNC_MODE_CHANGELIST, ModIndex2, aiSyncMode)
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
			String ModToCmp = StringListGet(akNPC, SYNC_MODE_CHANGELIST, i) ;Get mod at index i
			Int ModToCmpIdx = StringListFind(akNPC, SUKEY_REGISTERED_RS, ModToCmp) ;Get priority of this comparing mod

			;If the actual mod has a higher priority then the comparing mod then continue cycling the list
			If(ModIndex > ModToCmpIdx)
				i += 1
			Else
				StringListInsert(akNPC, SYNC_MODE_CHANGELIST, i, aiSyncMode) ;Insert the actual mod into the list before the comparing mod
				IntListInsert(akNPC, SYNC_MODE_CHANGELIST, i, aiSyncMode) ;Insert the sync mode value as well
				Notify(FW_LOG, "Can't change the sync mode on " + akNPC.GetName() + " for " + ModName + " because it is already set by a mod with higher priority. However, it will be set, if this mod has the highest priority.", False)
				Return True
			EndIf
		EndWhile

		;The mod wasn't found in the changelist
		FormListAdd(akNPC, SYNC_MODE_CHANGELIST, akToken)
		IntListAdd(akNPC, SYNC_MODE_CHANGELIST, aiSyncMode) 
		FormListAdd(None, SYNC_MODE_CHANGELIST, akNPC)
		SetIntValue(akNPC, SYNC_MODE, aiSyncMode)
		Return True
	EndIf
EndFunction

Float Function GetGlobalRelationshipMulti(Int auiFromRelationshipRank, Int auiToRelationshipRank)
	If(auiFromRelationshipRank < -4 || auiFromRelationshipRank > 4)
		Throw(FW_LOG, "Argument auiFromRelationshipRank was not set correctly. The range is from -4 to 4.", "Invalid arguments")
		Return -1.0
	ElseIf(auiToRelationshipRank < -5 || auiToRelationshipRank > 5)
		Throw(FW_LOG, "Argument auiToRelationshipRank was not set correctly. The range is from -5 to 5.", "Invalid arguments")
		Return -1.0
	ElseIf(auiFromRelationshipRank == auiToRelationshipRank)
		Throw(FW_LOG, "Argument auiToRelationshipRank can not be the same value as auiFromRelationshipRank.", "Invalid arguments")
		Return -1.0
	EndIf

	If(auiFromRelationshipRank < auiToRelationshipRank && auiToRelationshipRank - auiFromRelationshipRank != 1)
		Throw(FW_LOG, "Multiplier can only be set for the next or previous rank, ie from Rank " + auiFromRelationshipRank + " to Rank " + (auiFromRelationshipRank + 1) \
		+ " is correct, but from Rank " + auiFromRelationshipRank + " to Rank " + auiToRelationshipRank + " is incorrect.", "Invalid arguments")
		Return -1.0
	ElseIf(auiToRelationshipRank < auiFromRelationshipRank && auiFromRelationshipRank - auiToRelationshipRank != 1)
		Throw(FW_LOG, "Multiplier can only be set for the next or previous rank, ie from Rank 2 to Rank 3 is correct, from Rank 2 to Rank 4 is incorrect.", "Invalid arguments")
		Return -1.0
	EndIf

	String MultiplierString = "APPS.RelationshipModS" + (auiFromRelationshipRank As String) + "_" + ((auiToRelationshipRank) As String)
	Return GetFloatValue(None, MultiplierString)
EndFunction

Bool Function SetGlobalRelationshipMulti(Quest akToken, Int auiFromRelationshipRank, Int auiToRelationshipRank)
	If(auiFromRelationshipRank < -4 || auiFromRelationshipRank > 4)
		RaiseException("Parameter auiFromRelationshipRank was not set correctly. The range is from -4 to 4.", 2)
		Return False
	EndIf
	
	If(auiToRelationshipRank < -5 || auiToRelationshipRank > 5)
		RaiseException("Parameter auiToRelationshipRank was not set correctly. The range is from -5 to 5.", 2)
		Return False
	EndIf
EndFunction

Float Function GetRelationshipMulti(Actor akNPC, Int auiFromRelationshipRank, Int auiToRelationshipRank, Bool abIsGetGlobalIfNotFound = True)
	String MultiplierString = "APPS.RelationshipModS" + (auiFromRelationshipRank As String) + "_" + ((auiToRelationshipRank) As String)

	If(akNPC == None)
		Return -1.0
	EndIf
	
	If(HasFloatValue(akNPC, MultiplierString))
		Return GetFloatValue(akNPC, MultiplierString)
	Else
		If(abIsGetGlobalIfNotFound)
			Return GetGlobalRelationshipMulti(auiFromRelationshipRank, auiToRelationshipRank)
		Else
			Return -1.0
		EndIf
	EndIf
EndFunction

Function SetRelationshipMulti(Actor akNPC, Int auiFromRelationshipRank, Int auiToRelationshipRank, String asModName)

EndFunction

Float Function GetRelationshipPoints(Actor akNPC)
	If(akNPC == None)
		RaiseException("Parameter akNPC was not set!", 2)
		Return - 500.0
	EndIf

	Return GetFloatValue(akNPC, RSP)
EndFunction

Float Function ModRelationshipPoints(Actor akNPC, Float auiRelationshipPoints, Bool abIsSurplusCarryingOver = True) ;RP = 40
	;If(akNPC == None || !akNPC.GetActorBase().IsUnique() || auiRelationshipPoints == 0)
	If(akNPC == None)
		RaiseException("Parameter akNPC was not set!", 2)
		Return 0.0
	ElseIf(!akNPC.GetActorBase().IsUnique())
		RaiseException("Actor " + akNPC.GetName() + " must be an unique actor!", 2)
		Return 0.0
	ElseIf(auiRelationshipPoints == 0)
		RaiseException("Parameter auiRelationshipPoints was 0. Function will not be executed." , 1)
	EndIf

	Float NewRP
	Float CurrentRP = GetRelationshipPoints(akNPC)
	Int CurrentRank = Math.Ceiling(CurrentRP / 100)
	Int BreakPoint = 0

	If(auiRelationshipPoints > 0)
		While(BreakPoint == 0)
			Float CleanedRP = auiRelationshipPoints * GetRelationshipMulti(akNPC, CurrentRank, CurrentRank + 1); CleanedRP = 10 ; EndResult = 30
			Float RPLeft = CurrentRP + CleanedRP
			Float RequiredRP

			If(CurrentRP < 400)
				RequiredRP = GetRPForNextRank(akNPC)
			Else
				RequiredRP = 499 - CurrentRP
				abIsSurplusCarryingOver = False
			EndIf

			NewRP = CurrentRP + RPLeft

			If(RPLeft < RequiredRP || RPLeft == RequiredRP)
				BreakPoint = 1
			ElseIf(RPLeft > RequiredRP && !abIsSurplusCarryingOver)
				BreakPoint = 1
			ElseIf(RPLeft > RequiredRP && abIsSurplusCarryingOver)
				CurrentRank += 1
				CurrentRP = NewRP
				auiRelationshipPoints = CleanedRP - RequiredRP
			EndIf
		EndWhile
	Else
		While(BreakPoint == 0)
			Float CleanedRP = auiRelationshipPoints * GetRelationshipMulti(akNPC, CurrentRank, CurrentRank - 1)
			Float RPLeft = CurrentRP - CleanedRP
			Float RequiredRP

			If(CurrentRP > -400)
				RequiredRP = GetRPForPreviousRank(akNPC)
			Else
				RequiredRP = -499 - CurrentRP
				abIsSurplusCarryingOver = False
			EndIf

			If(RPLeft > RequiredRP || RPLeft == RequiredRP)
				BreakPoint = 1
			ElseIf(RPLeft < RequiredRP && !abIsSurplusCarryingOver)
				BreakPoint = 1
			ElseIf(RPLeft < RequiredRP && abIsSurplusCarryingOver)
				CurrentRank -= 1
				CurrentRP -= RequiredRP
				auiRelationshipPoints = CleanedRP + RequiredRP
			EndIf
		EndWhile
	EndIf

	SetRelationshipPoints(akNPC, NewRP)
	Return NewRP
EndFunction

Bool Function SetRelationshipPoints(Actor akNPC, Float auiRelationshipPoints)
	If(akNPC == None || auiRelationshipPoints < -499 || auiRelationshipPoints > 499)
		Return False
	Else
		SetFloatValue(akNPC, RSP, auiRelationshipPoints)

		If(GetSyncMode(akNPC) > 1)
			akNPC.SetRelationshipRank(Alias_PC.GetActorRef(), Math.Ceiling(auiRelationshipPoints / 100))
		EndIf

		Return True
	EndIf
EndFunction

Float Function GetRPForNextRank(Actor akNPC)
	Float RP = GetRelationshipPoints(akNPC)
	Int RelationshipRank = Math.Ceiling(RP / 100)
	Float ThisRankRP = RP - RelationshipRank * 100
	Float ThisRankMultiplier = GetRelationshipMulti(akNPC, RelationshipRank, RelationshipRank + 1) 

	If(RP > 0)
		Return (100 - ThisRankRP) / ThisRankMultiplier
	Else
		Return (ThisRankRP * -2) / ThisRankMultiplier
	EndIf
EndFunction

Float Function GetRPForPreviousRank(Actor akNPC)
	Float RP = GetRelationshipPoints(akNPC)
	Int RelationshipRank = Math.Ceiling(RP / 100)
	Float ThisRankRP = RP - RelationshipRank * 100
	Float ThisRankMultiplier = GetRelationshipMulti(akNPC, RelationshipRank, RelationshipRank - 1)

	If(RP > 0)
		Return ThisRankRP / ThisRankMultiplier
	Else
		Return (-100 - ThisRankRP) / ThisRankMultiplier
	EndIf
EndFunction

Bool Function _CheckSyncModeArgs(Int auiModIndex, Int aiSyncMode, Bool CheckGlobal = True, Actor akNPC = None)
	If(ModIndex == -1)
		If(CheckGlobal)
			Throw(FW_LOG, " A mod, which is not registered or sent an invalid Token, tried to access SetGlobalSyncMod(). The FormID of this token is " + akToken.GetFormID() + ".", "Access denied")
		Else
			Throw(FW_LOG, " A mod, which is not registered or sent an invalid token, tried to access SetSyncMode(). The FormID of this token is " + akToken.GetFormID() + ".", "Access denied")
			Return False
		EndIf
	EndIf

	If(CheckGlobal && !akNPC)
		Throw(FW_LOG, "Argument akNPC for function SetSyncMode() is None!", "Invalid arguments")
		Return False
	EndIf

	If(akNPC && !akNPC.GetActorBase().IsUnique())
		Throw(FW_LOG, "Actor " + akNPC.GetName() + " must be an unique actor!", "Invalid arguments")
		Return False
	EndIf

	If(aiSyncMode < 0 || aiSyncMode > 3)
		If(CheckGlobal)
			Throw(FW_LOG, "Sync modus wasn't set correctly by " + ModName + ". The lower limit is 0 and the upper limit is 3", "Invalid arguments")
		Else
			Throw(FW_LOG, "Sync mode for " + akNPC.GetName() + " was not correctly set by " + ModName + ". The lower limit is 0 and the upper limit is 3.", "Invalid arguments")
		EndIf

		Return False
	EndIf

	Return True
EndFunction
