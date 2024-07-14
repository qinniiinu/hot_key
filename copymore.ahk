#Requires AutoHotkey v2.0
#SingleInstance Force

global copiedText := []
global debounceTimer := 0


CapsLock & F5:: {
    global debounceTimer

    ; 獲取當前剪貼板內容
    Send ("^c")
    Sleep 100
    currentText := A_Clipboard
    if (currentText) {
        copiedText.Push(currentText)
    }
    
    ; 實現 debounce
    if (debounceTimer) {
        SetTimer(debounceTimer, 0)  ; 取消之前的計時器
    }
    debounceTimer := SetTimer(ClearCopiedText, -12000)  ; 設置新的 2 秒計時器，只運行一次

    return
}

CapsLock & F6:: {
    if (copiedText.Length > 0) {
        copyAllValue := ""
        Loop copiedText.Length
            copyAllValue := copyAllValue . copiedText[A_Index] . "`n"
        
        A_Clipboard := copyAllValue
        Send ("^v")
        ; ClearCopiedText()  ; 直接調用清理函數
    }
    return
}

ClearCopiedText() {
    global copiedText, debounceTimer

    copiedText := []
    debounceTimer := 0

    return
}


