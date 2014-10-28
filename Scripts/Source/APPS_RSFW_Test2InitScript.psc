;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname APPS_RSFW_Test2InitScript Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Exception.Warn("APPS Test 2", "Dummy init script for APPS Test 2, waiting for 7s now!")
Utility.Wait(7)
Exception.Warn("APPS Test 2", "Finished waiting.")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
