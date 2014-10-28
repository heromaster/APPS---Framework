Scriptname APPS_RSFW_Test1UninstallScript extends Quest  

Event OnInit()
	If(!Self.IsRunning())
		Return
	EndIf

	Exception.Warn("APPS Test 1", "Dummy uninstallation from Test 1. Waiting 5s just because I can!")
	Utility.Wait(5)
	Exception.Warn("APPS Test 1", "Done! Test1 used the 'uninstall quest is different from register quest' method and has no stages")
EndEvent