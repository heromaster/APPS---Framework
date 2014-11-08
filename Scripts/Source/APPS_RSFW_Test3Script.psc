;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname APPS_RSFW_Test3Script Extends APPS_FW_Registrar Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
RegisterMod()
RegisterInitQuest(Self, 10, "This quest is the same quest as the install quest.")
RegisterUninstallQuest(Self, 20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Exception.Warn("APPS Test 3", "Test 3 is waiting now for 4s")
Utility.Wait(4)
Exception.Warn("APPS Test 3", "Test 3 waiting time is done")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
