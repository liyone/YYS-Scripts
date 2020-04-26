#SingleInstance force
CoordMode, Click, Screen
CoordMode, Pixel, Screen

global WinXSize := 1920, WinYSize := 1080, WinTitle := "[#] 阴阳师-网易游戏 [#]", WinTitle2 := "[#] [Box2] 阴阳师-网易游戏 [#]"

toggle = 0
ImgSearchCount = 0
#MaxThreadsPerHotkey 2
; 1822, 328
; 859, 328

F2::
    Toggle := !Toggle
     While Toggle{
        WinActivate, %WinTitle%
        Sleep 150
        WinActivate, %WinTitle%
        WinActivate, %WinTitle%
        WinActivate, %WinTitle%
        Sleep 150
        ClickChat("\img\StartBattle.png", 5)
        sleep 300
        click 859, 328
        Sleep 150
        click 1822, 328
        sleep 150
        click 859, 328
        Sleep 150
        
        
    }
return

F3::
    Toggle := !Toggle
     While Toggle{
        WinActivate, %WinTitle%
        click 799, 429
        Sleep 150
    }
return

ClickChat(img, tol = 0)
{
    ImgSearchCount += 1
	ImageSearch, foundX, foundY, 0, 0, %WinXSize%, %WinYSize%, *%tol% %A_ScriptDir%%img%
	if (ErrorLevel = 2)
        MsgBox Could not conduct the search.
    else if (ErrorLevel = 1){
        Tooltip, waiting for image %img% to not be visible `, checked %ImgSearchCount% Times, 0, 0
    } else {
        Sleep, 100
        click, %foundX%, %foundY%
        Sleep, 100
    }
}

Escape::
ExitApp
Return