Attribute VB_Name = "Module7"
Option Explicit

Sub worksheet_recalculate()
'���[�N�V�[�g�Čv�Z���s���v���V�[�W��

If Worksheets("���C��").EnableCalculation = False Then
    Worksheets("���C��").EnableCalculation = True
End If
Application.Calculate
End Sub
Sub past_enable_switch()
'�}�X�^�[���̓��[�h�̃I���I�t�v���V�[�W��

    Dim inputpass As String
    inputpass = InputBox("�p�X�R�[�h����͂��Ă�������", "�p�X�R�[�h�̓���")
    If inputpass = passcord Then
        If Range(master_on_off).Value = "off" Then
            Range(master_on_off).Value = "on"
        ElseIf Range(master_on_off).Value = "on" Then
            Range(master_on_off).Value = "off"
        Else
            Range(master_on_off).Value = "off"
        End If
    ElseIf inputpass = "" Then
    
    Else
        MsgBox ("�p�X�R�[�h����v���܂���")
    End If
End Sub
Sub main_sheet_sort()
'���f�[�^���\�[�g����v���V�[�W��
Call Worksheets("���f�[�^").Range("A:AA").Sort(key1:=Worksheets("���f�[�^").Cells(1, data_sheet.reserve_code).EntireColumn, order1:=xlAscending, Header:=xlYes)

End Sub

Sub selction_move()
'�J�[�\�������J�[�\���ړ��̃I���I�t��؂�ւ���v���V�[�W��

    Dim inputpass As String
    inputpass = InputBox("�p�X�R�[�h����͂��Ă�������", "�p�X�R�[�h�̓���")
    If inputpass = passcord Then
        If Range(cell_corsor_move).Value = "off" Then
            Range(cell_corsor_move).Value = "on"
        ElseIf Range(cell_corsor_move).Value = "on" Then
            Range(cell_corsor_move).Value = "off"
        Else
            Range(cell_corsor_move).Value = "off"
        End If
    ElseIf inputpass = "" Then
    
    Else
        MsgBox ("�p�X�R�[�h����v���܂���")
    End If


End Sub

Sub refresh_diplicate_sheet()
'�d���`�F�b�N�V�[�g����x�폜���Ă�����x����Ȃ����v���V�[�W��

'Worksheets("���C��").EnableCalculation = False
Dim main As Worksheet
Dim duplicate As Worksheet
Set main = Worksheets("���C��")
Set duplicate = Worksheets("�d���`�F�b�N")

duplicate.Cells(1, 1).Value = 19900101

Call check_res_day
End Sub

Sub show_profile()
Profile.Show

End Sub

Sub limit_res_on_off_pass()

    Dim inputpass As String
    inputpass = InputBox("�p�X�R�[�h����͂��Ă�������", "�p�X�R�[�h�̓���")
    If inputpass = passcord Then
        If Range(limit_res_on_off).Value = "off" Then
            Range(limit_res_on_off).Value = "on"
        ElseIf Range(limit_res_on_off).Value = "on" Then
            Range(limit_res_on_off).Value = "off"
        Else
            Range(limit_res_on_off).Value = "off"
        End If
    ElseIf inputpass = "" Then
    
    Else
        MsgBox ("�p�X�R�[�h����v���܂���")
    End If
    
End Sub

