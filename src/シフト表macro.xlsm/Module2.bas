Attribute VB_Name = "Module2"
Option Explicit

Sub Shift_reset()

Dim OkCancel As VbMsgBoxResult
OkCancel = MsgBox("�V�t�g�\�����Z�b�g���Ă�낵���ł����H", vbOKCancel)
If OkCancel = vbOK Then
    
    Dim i As Integer
    
    i = 1
    
    Do While Cells(i + 3, 1) <> ""
    i = i + 1
    Loop
    
    With Range("C4:Q4").Resize(i - 1, 15)
        .Clear
        .NumberFormatLocal = "@"
    End With
End If

End Sub
