Scriptname APPS_RelFramework_Functions Extends Quest
Int Property ErrLvl Auto Hidden
ReferenceAlias Property Alias_PC Auto
String Property ErrMsg Auto Hidden

Bool IsUninstallingAll = False
String REGISTERED_MODS = "APPS.Relationship.RegisteredMods"
String SYNC_MODE = "APPS.Relationship.SyncMode"
String SYNC_MODE_CHANGELIST = "APPS.Relationship.SyncMode.ChangeList"
String MODS = "APPS.Relationship.Mods."
String RSP = "APPS.Relationship.RelationshipPoints"


Event OnInit()
	StorageUtil.SetFloatValue(None, "APPS.RelationshipModS0_1", 1.0)
	StorageUtil.SetFloatValue(None, "APPS.RelationshipModS1_2", 0.5)
	StorageUtil.SetFloatValue(None, "APPS.RelationshipModS2_3", 0.25)
	StorageUtil.SetFloatValue(None, "APPS.RelationshipModS3_4", 0.125)
	StorageUtil.SetFloatValue(None, "APPS.RelationshipModS4_5", 0.0625)
	StorageUtil.SetFloatValue(None, "APPS.RelationshipModS0_-1", 1.0)
	StorageUtil.SetFloatValue(None, "APPS.RelationshipModS-1_-2", 0.5)
	StorageUtil.SetFloatValue(None, "APPS.RelationshipModS-2_-3", 0.25)
	StorageUtil.SetFloatValue(None, "APPS.RelationshipModS-3_-4", 0.125)
	StorageUtil.SetFloatValue(None, "APPS.RelationshipModS-4_-5", 0.0625)
	StorageUtil.SetFloatValue(None, "APPS.RelationshipModS5_4", 0.125)
	StorageUtil.SetFloatValue(None, "APPS.RelationshipModS4_3", 0.25)
	StorageUtil.SetFloatValue(None, "APPS.RelationshipModS3_2", 0.5)
	StorageUtil.SetFloatValue(None, "APPS.RelationshipModS2_1", 1.0)
	StorageUtil.SetFloatValue(None, "APPS.RelationshipModS1_0", 2)
	StorageUtil.SetFloatValue(None, "APPS.RelationshipModS-5_-4", 2)
	StorageUtil.SetFloatValue(None, "APPS.RelationshipModS-4_-3", 1.0)
	StorageUtil.SetFloatValue(None, "APPS.RelationshipModS-3_-2", 0.5)
	StorageUtil.SetFloatValue(None, "APPS.RelationshipModS-2_-1", 0.25)
	StorageUtil.SetFloatValue(None, "APPS.RelationshipModS-1_0", 0.125)
	StorageUtil.SetIntValue(None, SYNC_MODE, 3)
	Debug.Notification("Relationship Framework initialized!")
EndEvent
;/
;This function registers a mod so that it can access more advanced features, 
Bool Function RegisterMod(String asModName)
	If(_GetModIndex(asModName, REGISTERED_MODS) > -1)
		RaiseException("Mod " + asModName + " is already registered.", 1)
		Return False
	Else
		StorageUtil.SetIntValue(None, REGISTERED_MODS, StorageUtil.StringListCount(None, REGISTERED_MODS) + 1) 
		StorageUtil.StringListInsert(None, REGISTERED_MODS, 0, asModName)
		Debug.Notification("Mod " + asModName + " successfully registered.")
		Return True
	EndIf
EndFunction

Bool Function UnregisterMod(String asModName)
	If(_GetModIndex(asModName, REGISTERED_MODS) == - 1)
		RaiseException("Mod " + asModName + " couldn't be found.", 1)
		Return False
	Else
		StorageUtil.StringListRemove(None, REGISTERED_MODS, asModName)

		If(StorageUtil.HasIntValue(None, MODS + asModName + ".SyncMode"))
			StorageUtil.UnsetIntValue(None, MODS + asModName + ".SyncMode")
		EndIf

		Return True
	EndIf
EndFunction
/;

Int Function GetGlobalSyncMode()
	Return StorageUtil.GetIntValue(None, SYNC_MODE)
EndFunction

Int Function GetGlobalSyncModeChangeCount()
	Return StorageUtil.IntListCount(None, SYNC_MODE)
EndFunction

Int Function GetGlobalSyncModePos(String asModName)
	Return _GetModIndex(asModName, SYNC_MODE) + 1
EndFunction

Bool Function SetGlobalSyncMode(Int aiSyncMode, String asModName)
	If(!_PreCheckSyncMode(aiSyncMode, asModName))
		Return False
	EndIf

    Int ModIndex = _GetModIndex(asModName, REGISTERED_MODS) ;Get position(priority) of the mod
	Int ModIndex2 = _GetModIndex(asModName, SYNC_MODE_CHANGELIST) ; Get position of current mod in this list
	Int SyncModeChanges = StorageUtil.StringListCount(None, SYNC_MODE_CHANGELIST) ;Get the list of mods which do change the global sync mode
	
	;If the mod was found, update its new value
	If(ModIndex2 >= 0)
		StorageUtil.IntListSet(None, SYNC_MODE_CHANGELIST, ModIndex2, aiSyncMode)
		RaiseException("Sync mode was successfully updated.", 0)

		;If the mod is also on the last position then also update the global sync mode
		If(ModIndex2 == SyncModeChanges - 1)
			StorageUtil.SetIntValue(None, MODS + asModName + ".SyncMode", aiSyncMode)
			StorageUtil.SetIntValue(None, SYNC_MODE, aiSyncMode)
			Return True
		Else
			RaiseException("Can't change the global sync mode because it is already set by a mod with higher priority. However, the value got stored and will be set, if " + asModName + " have the highest priority.", 2, True)
			Return False
		EndIf
	Else
		Int i = 0

		;Go through the list of changes to the global sync mode
		While(i < SyncModeChanges)
			String ModToCmp = StorageUtil.StringListGet(None, SYNC_MODE_CHANGELIST, i) ;Get mod at index i
			Int ModToCmpIdx = StorageUtil.StringListFind(None, REGISTERED_MODS, ModToCmp) ;Get priority of this comparing mod

			;If the actual mod has a higher priority then the comparing mod then continue cycling the list
			If(ModIndex > ModToCmpIdx)
				i += 1
			Else
				StorageUtil.StringListInsert(None, SYNC_MODE_CHANGELIST, i, aiSyncMode) ;Insert the actual mod into the list before the comparing mod
				StorageUtil.IntListInsert(None, SYNC_MODE_CHANGELIST, i, aiSyncMode) ;Insert the sync mode value as well
				RaiseException("Can't change the global sync mode because it is already set by a mod with higher priority. However, the value got stored and will be set, if " + asModName + " have the highest priority.", 2, True)
				Return False
			EndIf
		EndWhile

		;The mod wasn't found in the changelist
		StorageUtil.StringListAdd(None, SYNC_MODE_CHANGELIST, asModName)
		StorageUtil.IntListAdd(None, SYNC_MODE_CHANGELIST, aiSyncMode)          
		StorageUtil.SetIntValue(None, MODS + asModName + ".SyncMode", aiSyncMode)
		StorageUtil.SetIntValue(None, SYNC_MODE, aiSyncMode)
		Return True
	EndIf
EndFunction

Bool Function RemoveGlobalSyncMode(String asModName)
	If(_GetModIndex(asModName, REGISTERED_MODS) == -1)
		RaiseException("Mod " + asModName + " was not registered. Nothing was changed.", 1)
		Return False
	ElseIf(_GetModIndex(asModName, SYNC_MODE_CHANGELIST) == -1)
		RaiseException("No changes to the global sync mode were made by " + asModName + ". Returning.", 1)
		Return False
	EndIf

	Int ModIndex = _GetModIndex(asModName, SYNC_MODE_CHANGELIST)

	If(ModIndex == StorageUtil.IntListCount(None, SYNC_MODE_CHANGELIST) - 1 && ModIndex > 0)
		StorageUtil.SetIntValue(None, SYNC_MODE, StorageUtil.IntListGet(None, SYNC_MODE, ModIndex - 1))
	ElseIf(StorageUtil.IntListCount(None, SYNC_MODE_CHANGELIST) == 1)
		StorageUtil.UnsetIntValue(None, SYNC_MODE)
	EndIf

	StorageUtil.StringListRemoveAt(None, SYNC_MODE_CHANGELIST, ModIndex)
	StorageUtil.IntListRemoveAt(None, SYNC_MODE_CHANGELIST, ModIndex)
	StorageUtil.UnsetIntValue(None, MODS + asModName + ".SyncMode")

	Return True
EndFunction

Int Function GetSyncMode(Actor akNPC, Bool abGetGlobalIfNotFound = True)
	If(akNPC == None)
		RaiseException("Parameter akNPC was not set!", 2)
		Return -1
	EndIf

	If(!StorageUtil.HasIntValue(akNPC, SYNC_MODE))
		If(abGetGlobalIfNotFound)
			RaiseException("Sync mode on " + akNPC.GetName() + " was not set, returning global sync mode.", 0)
			Return GetGlobalSyncMode()
		Else
			RaiseException("Sync mode on " + akNPC.GetName() + " was not set.", 1)
			Return -1
		EndIf
	EndIf

	Return StorageUtil.GetIntValue(akNPC, SYNC_MODE)
EndFunction

Bool Function SetSyncMode(Actor akNPC, Int aiSyncMode = 1, String asModName)
	Int ModIndex = _GetModIndex(asModName, REGISTERED_MODS)

	If(akNPC == None)
		RaiseException("Parameter akNPC was not set!", 2)
		Return False
	ElseIf(!akNPC.GetActorBase().IsUnique())
		RaiseException("Actor " + akNPC.GetName() + " must be an unique actor!", 2)
		Return False
	ElseIf(aiSyncMode < 0 || aiSyncMode > 3)
		RaiseException("Sync mode for " + akNPC.GetName() + " was not correctly set. The lower limit is 0 and the upper limit is 3.", 2)
		Return False
	ElseIf(ModIndex == -1)
		RaiseException("Mod " + asModName + " couldn't be found in the registration list. Register your mod first.", 2)
		Return False
	EndIf
	
	Int SyncModeChanges = StorageUtil.StringListCount(akNPC, SYNC_MODE_CHANGELIST) ;Get the list of mods which do change the sync mode on an actor
	Int ModIndex2 = _GetModIndex(asModName, SYNC_MODE_CHANGELIST, 1, akNPC) ; Get position of current mod in this list

	;If the mod was found, update its new value
	If(ModIndex2 >= 0)
		StorageUtil.IntListSet(akNPC, SYNC_MODE_CHANGELIST, ModIndex2, aiSyncMode)
		RaiseException("Sync mode was successfully updated.", 0)

		;If the mod is also on the last position then also update the global sync mode
		If(ModIndex2 == SyncModeChanges - 1)
			StorageUtil.SetIntValue(akNPC, MODS + asModName + ".SyncMode", aiSyncMode)
			StorageUtil.SetIntValue(akNPC, SYNC_MODE, aiSyncMode)
			Return True
		Else
			RaiseException("Can't change the global sync mode because it is already set by a mod with higher priority. However, the value got stored and will be set, if " + asModName + " have the highest priority.", 2, True)
			Return False
		EndIf
	Else
		Int i = 0

		;Go through the list of changes to the global sync mode
		While(i < SyncModeChanges)
			String ModToCmp = StorageUtil.StringListGet(akNPC, SYNC_MODE_CHANGELIST, i) ;Get mod at index i
			Int ModToCmpIdx = StorageUtil.StringListFind(akNPC, REGISTERED_MODS, ModToCmp) ;Get priority of this comparing mod

			;If the actual mod has a higher priority then the comparing mod then continue cycling the list
			If(ModIndex > ModToCmpIdx)
				i += 1
			Else
				StorageUtil.StringListInsert(akNPC, SYNC_MODE_CHANGELIST, i, aiSyncMode) ;Insert the actual mod into the list before the comparing mod
				StorageUtil.IntListInsert(akNPC, SYNC_MODE_CHANGELIST, i, aiSyncMode) ;Insert the sync mode value as well
				RaiseException("Can't change the global sync mode because it is already set by a mod with higher priority. However, the value got stored and will be set, if " + asModName + " have the highest priority.", 2, True)
				Return False
			EndIf
		EndWhile

		;The mod wasn't found in the changelist
		StorageUtil.StringListAdd(akNPC, SYNC_MODE_CHANGELIST, asModName)
		StorageUtil.IntListAdd(akNPC, SYNC_MODE_CHANGELIST, aiSyncMode) 
		StorageUtil.FormListAdd(None, SYNC_MODE_CHANGELIST, akNPC)
		StorageUtil.SetIntValue(akNPC, MODS + asModName + ".SyncMode", aiSyncMode)
		StorageUtil.SetIntValue(akNPC, SYNC_MODE, aiSyncMode)
		Return True
	EndIf
	
	;ElseIf(StorageUtil.HasIntValue(akNPC, SYNC_MODE) && StorageUtil.FileStringListCount(REGISTERED_MODS) > ModIndex + 1)
	;	RaiseException("Sync mode could not be set for " + akNPC.GetName() + ", because another mod with higher priority has already set the value.", 1)
	;	Return False
	;EndIf

	;StorageUtil.SetIntValue(akNPC, SYNC_MODE, aiSyncMode)
	;Return True
EndFunction

Float Function GetGlobalRelationshipMulti(Int auiFromRelationshipRank, Int auiToRelationshipRank)
	;If(auiFromRelationshipRank < -5 || auiFromRelationshipRank > 5 || auiToRelationshipRank < -5 || auiToRelationshipRank > 5 || auiFromRelationshipRank == auiToRelationshipRank)
	If(auiFromRelationshipRank < -4 || auiFromRelationshipRank > 4)
		RaiseException("Parameter auiFromRelationshipRank was not set correctly. The range is from -4 to 4.", 2)
		Return -1.0
	ElseIf(auiToRelationshipRank < -4 || auiToRelationshipRank > 4)
		RaiseException("Parameter auiToRelationshipRank was not set correctly. The range is from -4 to 4.", 2)
		Return -1.0
	ElseIf(auiFromRelationshipRank == auiToRelationshipRank)
		RaiseException("Parameter auiToRelationshipRank can not be the same value as auiFromRelationshipRank.", 2)
		Return -1.0
	EndIf

	If(auiFromRelationshipRank < auiToRelationshipRank && auiToRelationshipRank - auiFromRelationshipRank != 1)
		RaiseException("Multiplier can only be set for the next or previous rank, ie from Rank " + auiFromRelationshipRank + " to Rank " + (auiFromRelationshipRank + 1) \
		+ " is correct, but from Rank " + auiFromRelationshipRank + " to Rank " + auiToRelationshipRank + " is incorrect.", 2)
		Return -1.0
	ElseIf(auiToRelationshipRank < auiFromRelationshipRank && auiFromRelationshipRank - auiToRelationshipRank != 1)
		RaiseException("Multiplier can only be set for the next or previous rank, ie from Rank 2 to Rank 3 is correct, from Rank 2 to Rank 4 is incorrect.", 2)
		Return -1.0
	EndIf

	String MultiplierString = "APPS.RelationshipModS" + (auiFromRelationshipRank As String) + "_" + ((auiToRelationshipRank) As String)
	Return StorageUtil.GetFloatValue(None, MultiplierString)
EndFunction

Bool Function SetGlobalRelationshipMulti(Int auiFromRelationshipRank, Int auiToRelationshipRank, String asModName)
	If(auiFromRelationshipRank < -4 || auiFromRelationshipRank > 4)
		RaiseException("Parameter auiFromRelationshipRank was not set correctly. The range is from -4 to 4.", 2)
		Return False
	EndIf
	
	If(auiToRelationshipRank < -4 || auiToRelationshipRank > 4)
		RaiseException("Parameter auiToRelationshipRank was not set correctly. The range is from -4 to 4.", 2)
		Return False
	EndIf
EndFunction

Float Function GetRelationshipMulti(Actor akNPC, Int auiFromRelationshipRank, Int auiToRelationshipRank, Bool abIsGetGlobalIfNotFound = True)
	String MultiplierString = "APPS.RelationshipModS" + (auiFromRelationshipRank As String) + "_" + ((auiToRelationshipRank) As String)

	If(akNPC == None)
		Return -1.0
	EndIf
	
	If(StorageUtil.HasFloatValue(akNPC, MultiplierString))
		Return StorageUtil.GetFloatValue(akNPC, MultiplierString)
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

Function ModRelationshipMulti()

EndFunction

Float Function GetRelationshipPoints(Actor akNPC)
	If(akNPC == None)
		RaiseException("Parameter akNPC was not set!", 2)
		Return - 500.0
	EndIf

	Return StorageUtil.GetFloatValue(akNPC, RSP)
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
		StorageUtil.SetFloatValue(akNPC, RSP, auiRelationshipPoints)

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

;/
;SDK - Debug Functions
Function RaiseException(String asMessage, Int aiErrorLevel, Bool abShowMessage = True)
	Debug.OpenUserLog("APPS_Framework_SDK")
	Debug.TraceUser(asMessage, aiErrorLevel)
 
	If(abShowMessage)
		Debug.MessageBox(asMessage)
		RaiseException("Can't change the global sync mode because it is already set by a mod with higher priority. However, the value got stored and will be set, if your mod gets the highest priority.", 2, True)
	EndIf
EndFunction
/;

;Internal Function calls - do not use them under any circumstances
Bool Function _PreCheckSyncMode(Int aiSyncMode, String asModName)
	If(aiSyncMode < 0 || aiSyncMode > 3)
		RaiseException("Sync modus wasn't set correctly. The lower limit is 0 and the upper limit is 3", 2)
		Return False
	EndIf

	Return _PreCheckMod(asModName)
EndFunction

Bool Function _PreCheckMod(String asModName)
	Int ModIndex = _GetModIndex(asModName, REGISTERED_MODS)
	
	If(ModIndex == -1)
		RaiseException("Mod " + asModName + " couldn't be found in the registration list. SetGlobalSyncMode() will not be executed.", 2)
		Return False
    EndIf
	
	Return True
EndFunction

Int Function _GetModIndex(String asModName, String asKey, Int aiListType = 1, Actor akNPC = None)
	If(akNPC == None)
		If(aiListType == 1)
			Return StorageUtil.StringListFind(None, asKey, asModName)
		EndIf
	Else
		If(aiListType == 1)
			Return StorageUtil.StringListFind(akNPC, asKey, asModName)
		EndIf
	EndIf
EndFunction