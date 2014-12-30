;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname APPS_RSFW_Test2InitScript Extends APPS_FW_Registrar Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
RegisterMod()
RegisterInitQuest(InitQuest, 0)
RegisterForExceptionModule("APPS_Test2")
RegisterForRelationshipModule()
SetInfoHandling(True, True)
SetErrorHandling(True, False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Quest Property InitQuest Auto
