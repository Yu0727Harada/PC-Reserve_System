Attribute VB_Name = "Module7"
Option Explicit

Sub worksheet_recalculate()
If Worksheets("���C��").EnableCalculation = False Then
    Worksheets("���C��").EnableCalculation = True
End If
End Sub
Sub past_enable_switch()
    Dim inputpass As String
    inputpass = InputBox("�p�X�R�[�h����͂��Ă�������", "�p�X�R�[�h�̓���")
    If inputpass = passcord Then
        If Cells(4, 20) = "off" Then
            Cells(4, 20) = "on"
        ElseIf Cells(4, 20) = "on" Then
            Cells(4, 20) = "off"
        Else
            Cells(4, 20) = "off"
        End If
    ElseIf inputpass = "" Then
    
    Else
        MsgBox ("�p�X�R�[�h����v���܂���")
    End If
End Sub
Sub main_sheet_sort()

    Call Worksheets("���f�[�^").Range("A:F").Sort(key1:=Worksheets("���f�[�^").Range("D:D"), order1:=xlAscending, Header:=xlYes)

End Sub

Sub selction_move()

    Dim inputpass As String
    inputpass = InputBox("�p�X�R�[�h����͂��Ă�������", "�p�X�R�[�h�̓���")
    If inputpass = passcord Then
        If Cells(5, 20) = "off" Then
            Cells(5, 20) = "on"
        ElseIf Cells(5, 20) = "on" Then
            Cells(5, 20) = "off"
        Else
            Cells(5, 20) = "off"
        End If
    ElseIf inputpass = "" Then
    
    Else
        MsgBox ("�p�X�R�[�h����v���܂���")
    End If


End Sub

Sub refresh_diplicate_sheet()
Worksheets("���C��").EnableCalculation = False
Dim main As Worksheet
Dim Duplicate As Worksheet
Set main = Worksheets("���C��")
Set Duplicate = Worksheets("�d���`�F�b�N")

Duplicate.Cells(1, 1).Value = 19900101

Call check_res_day
End Sub

Sub show_profile()
Profile.Show

End Sub

