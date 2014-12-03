Scriptname APPS_RSFW_Test2Script Extends APPS_FW_Registrar
Quest Property InitQuest Auto

Event OnInit()
	RegisterMod()
	RegisterInitQuest(InitQuest, 0)
	RegisterForExceptionModule("APPS_Test2")
	RegisterForRelationshipModule()
	SetInfoHandling(True, True)
	SetErrorHandling(True, False)
EndEvent