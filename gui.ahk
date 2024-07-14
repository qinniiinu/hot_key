
#Requires AutoHotkey v2.0
#SingleInstance Force
; 開一個Gui模板

; 初始化傳入的陣列
myArray := ["Item 1", "Item 2", "Item 3", "Item 4"]

; 設置 GUI 寬度
guiWidth := 200

; 計算 GUI 高度（假設每個項目佔用 30 px 的高度）
itemHeight := 30
guiHeight := itemHeight * myArray.Length

; 獲取螢幕尺寸
MonitorWidth := A_ScreenWidth
MonitorHeight := A_ScreenHeight

; 計算 GUI 位置 (右上角向下偏移 200px)
guiX := MonitorWidth - guiWidth - 100
guiY := 200

; 建立 GUI
myGui := Gui()
myGui.SetFont("s10", "Verdana")
; MyGui.BackColor := "0f1421"
; 設置 GUI 只顯示關閉按鈕
myGui.Opt("+Theme -MaximizeBox -MaxSize") ; 隱藏最大化按鈕
; 添加每個陣列項目到 GUI 中
for index, item in myArray {
    myGui.Add("Text", "x10 y" . (index - 1) * itemHeight . " w" . (guiWidth - 20), item)
}
; 設置 GUI 至頂
WinSetAlwaysOnTop -1, myGui

; 設置 GUI 大小並顯示在指定位置
myGui.Show("x" . guiX . " y" . guiY . " w" . guiWidth . " h" . guiHeight)

Return

; 退出程序
GuiEscape:
GuiClose:
    ExitApp