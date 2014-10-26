;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname APPS_Test1_TIF_SetSyncMode Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If(RS.SetGlobalSyncMode(0, "Test1"))
	Debug.Notification("Sync mode was set to 0")
Else
	Debug.Notification("Sync mode couldn't be set")
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
APPS_RelFramework_Functions Property RS Auto
