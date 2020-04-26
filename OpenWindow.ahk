#SingleInstance force
CoordMode, Pixel, Screen
global WinXSize := 960, WinYSize := 560, WinTitle := "[#] 阴阳师-网易游戏 [#]", WinTitle2 := "[#] [Box2] 阴阳师-网易游戏 [#]"

F3::

WinActivate, %WinTitle%
WinMove, %WinTitle%, , 0, 0 , %WinXSize%, %WinYSize%
Sleep, 1000

WinActivate, %WinTitle2%
WinMove, %WinTitle2%, , %WinXSize%, 0 , %WinXSize%, %WinYSize%
return

F2::
;ClaimEnergy()
FreeSummon()


return

F4::
RUN %A_ScriptDir%\img\GuildIcon.png
return
;Im pretty sure we need to fix the window thing for the ClickChat and ClickChat 2 to include the location to search
FreeSummon(){
WinActivate, %WinTitle%
ClickChat("\img\SummonIcon.png", 30)
Sleep, 3000
ClickChat("\img\FreeSummon.png", 10)
Sleep, 3000

ClickChat2("\img\TopLeftSummon.png", 10, foundx, foundy)
foundxEnd = foundx + 80
foundyEnd = foundy + 80
MouseClickDrag, left, %foundx%, %foundy%, %foundxEnd%, %foundyEnd%
}

ClaimEnergy()
{
WinActivate, %WinTitle2%
ClickChat("\img\Guild2.png", 5)
Sleep, 5000
ClickChat("\img\BaseIcon.png", 5)

WinActivate, %WinTitle%
ClickChat("\img\Guild2.png", 5)
Sleep, 5000
ClickChat("\img\BaseIcon.png", 5)
}

ClickChat(img, tol = 0)
{
    ImgSearchCount = 0
	Sleep, 10
	Loop
	{
        ImgSearchCount += 1
		ImageSearch, foundX, foundY, 0, 0, %WinXSize%, %WinYSize%, *%tol% %A_ScriptDir%%img%
		if (ErrorLevel = 2)
            MsgBox Could not conduct the search.
        else if (ErrorLevel = 1){
            Tooltip, waiting for image %img% to not be visible `, checked %ImgSearchCount% Times, 0, 0
        }
        else if (ErrorLevel = 0)
            break
	}
    Sleep, 2000
	Mousemove, foundx, foundy
	sleep, 100
	click
	Sleep, 100
}

ClickChat2(img, tol, byref foundx, byref foundy)
{
    ImgSearchCount = 0
	Sleep, 10
	Loop
	{
        ImgSearchCount += 1
		ImageSearch, foundX, foundY, 0, 0, 1920, 1080, *%tol% %A_ScriptDir%%img%
		if (ErrorLevel = 2)
            MsgBox Could not conduct the search.
        else if (ErrorLevel = 1){
            Tooltip, waiting for image %img% to not be visible `, checked %ImgSearchCount% Times, 0, 0
        }
        else if (ErrorLevel = 0)
            break
	}
    Sleep, 2000
    MsgBox %foundx% %foundy% ??

}

