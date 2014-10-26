Scriptname Date Extends Quest
Bool IsMonthInit
Int[] MonthLengths

Event OnInit()
MonthLengths = New Int[12]
MonthLengths[0] = 31
MonthLengths[1] = 28
MonthLengths[2] = 31
MonthLengths[3] = 30
MonthLengths[4] = 31
MonthLengths[5] = 30
MonthLengths[6] = 31
MonthLengths[7] = 31
MonthLengths[8] = 30
MonthLengths[9] = 31
MonthLengths[10] = 30
MonthLengths[11] = 31
EndEvent

;Returns the last day of the given month
Int Function LastDayOfMonth(Int aiMonth) Global
	If(aiMonth < 1 || aiMonth > 12)
		Return 0
	EndIf

	Return MonthLengths[aiMonth - 1]
EndFunction

;Returns the week of a specific date
;Tamriel calendar does not have leap years, so there is no need to submit a specific year
;This function does not follow the ISO standard which says that the first week of a year/month has to contain Thursday (or Wednesday for leap years)
Int Function WeekOfYear(Int aiDayOfMonth, Int aiMonth) Global
	Int TotalDaysPassed
	Int i

	If(!IsValidDate(aiDayOfMonth, aiMonth))
		Return 0
	EndIf

	While(i < aiMonth)
		TotalDaysPassed += MonthLengths[i]
		i += 1
	EndWhile

	TotalDaysPassed += aiDayOfMonth

	Return Math.Floor(TotalDaysPassed / 7)
EndFunction

;Checks the given date if it is valid
Bool Function IsValidDate(Int aiDayofMonth, Int aiMonth) Global
	If(aiMonth < 1 || aiMonth > 12 || aiDayOfMonth < 1)
		Return False
	EndIf

	If(aiDayOfMonth > MonthLengths[aiMonth - 1])
		Return False
	EndIf

	Return True
EndFunction

Float Function RandomGameTime(Int GameHourGV, Int aiStart, Int aiEnd, Float aiHourSplit = 1, Int aiInDays = 0) Global
	If(aiInDays < 0)
		aiInDays = 0
	EndIf

	aiInDays = aiInDays * 24

	If(aiHourSplit <= 0)
		aiHourSplit = 1
	EndIf

	Int NormalizedStart = NormalizeTime(GameHour.GetValueInt(), aiStart + aiInDays) * aiHourSplit
	Int NormalizedEnd = (NormalizeTime(aiStart, aiEnd) + aiInDays) * aiHourSplit
	Return Utility.RandomInt(NormalizedStart, NormalizedStart + NormalizedEnd) / aiHourSplit
EndFunction

Int Function NormalizeTime(Int aiEventStart, Int aiEventEnd)
	If(aiEventStart < aiEventEnd)
		Return (aiEventEnd - aiEventStart)
	ElseIf(aiEventStart >= aiEventEnd)
		Return (24 - aiEventStart + aiEventEnd)
	EndIf
EndFunction