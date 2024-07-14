#Requires AutoHotkey v2.0
#SingleInstance Force

;
CapsLock & F4::
{
    Send("^c")
    Sleep 100

    clipboard_content := A_Clipboard

    _path := "C:\Users\Qin\AppData\Local\Programs\Microsoft VS Code\Code.exe"

    Run _path

}

#HotIf