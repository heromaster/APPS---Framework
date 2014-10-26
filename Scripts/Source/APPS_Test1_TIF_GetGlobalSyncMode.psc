;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname APPS_Test1_TIF_GetGlobalSyncMode Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Int SyncTest = RS.GetGlobalSyncMode()

If(SyncTest == 0)
	Debug.Notification("Sync mode is: Off. 0 was returned.")
ElseIf(SyncTest == 1)
	Debug.Notification("Sync mode is: On for NPC-->PC syncs. 1 was returned.")
ElseIf(SyncTest == 2)
	Debug.Notification("Sync mode is: On for PC-->NPC syncy. 2 was returned.")
Else
	Debug.Notification("Sync mode is: On for both directions. 3 was returned.")
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
APPS_RelFramework_Functions Property RS Auto
