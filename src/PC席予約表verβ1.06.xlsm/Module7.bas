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

Sub formulabar_display()

If Application.DisplayFormulaBar = True Then
    Application.DisplayFormulaBar = False
Else
    Application.DisplayFormulaBar = True
End If

End Sub

Sub headings_display()

If ActiveWindow.DisplayHeadings = True Then
    ActiveWindow.DisplayHeadings = False
Else
    ActiveWindow.DisplayHeadings = True
End If

End Sub

Sub statusbar_display()
If Application.DisplayStatusBar = True Then
    Application.DisplayStatusBar = False
Else
    Application.DisplayStatusBar = True
End If

End Sub

Sub scrollbar_display()
Dim inputpass As String
    inputpass = InputBox("�p�X�R�[�h����͂��Ă�������", "�p�X�R�[�h�̓���")
    If inputpass = passcord Then
        If Application.DisplayScrollBars = True Then
            Application.DisplayScrollBars = False
        Else
            Application.DisplayScrollBars = True
        End If
   ElseIf inputpass = "" Then
    
    Else
        MsgBox ("�p�X�R�[�h����v���܂���")
    End If
    
End Sub

Sub tabs_display()

If ActiveWindow.DisplayWorkbookTabs = True Then
    ActiveWindow.DisplayWorkbookTabs = False
Else
    ActiveWindow.DisplayWorkbookTabs = True
End If

End Sub

Sub un_protect()
Call Sheets("���C��").Unprotect
End Sub

Sub protect()
Call Sheets("���C��").protect(UserInterfaceOnly:=True)
End Sub

Sub ribbon_display()

Application.ExecuteExcel4Macro "SHOW.TOOLBAR(""Ribbon"",True)"

End Sub

Sub ribbon_undisplay()

Application.ExecuteExcel4Macro "SHOW.TOOLBAR(""Ribbon"",False)"

End Sub

Sub vbe_open()
Application.VBE.Windows(1).SetFocus
End Sub
Public Sub input_new_passcord()

Dim pass_yesno As Integer

pass_yesno = passcord_inputform
If pass_yesno = 2 Then
    Exit Sub
ElseIf pass_yesno = 1 Then
    Exit Sub
Else

    Dim input_new_pass As String
    input_new_pass = InputBox("�p�X�R�[�h�Ƃ��Ēǉ�����w�Дԍ�����͂��邩�A�w���؂̃o�[�R�[�h���X�L�������Ă��������B���łɓo�^����Ă���ԍ�����͂��邱�Ƃō폜���邱�Ƃ��ł��܂��B")
    Dim trans_input_new_pass As Variant
    trans_input_new_pass = translate_number(input_new_pass)
    If trans_input_new_pass = "" Then
        Exit Sub
    ElseIf Int(trans_input_new_pass) = -1 Then
        MsgBox ("�L���Ȋw�Дԍ��ł͂���܂���")
        Exit Sub
    Else
        Dim search As Integer
        On Error GoTo match_error
        search = WorksheetFunction.Match(Int(trans_input_new_pass), Sheets("passcord").Range("A:A"), 1)
        On Error GoTo 0
        If Int(trans_input_new_pass) = WorksheetFunction.Index(Sheets("passcord").Range("A:A"), search) Then
            Dim delete_yesno As String
            delete_yesno = MsgBox("���̔ԍ��͂��łɓo�^����Ă��܂��B���̔ԍ����폜���܂����H", vbYesNo + vbQuestion, "�ԍ��̍폜�̊m�F")
            If delete_yesno = vbNo Then
                Exit Sub
            Else
                Call Sheets("passcord").Cells(search, 1).EntireRow.Delete(xlShiftUp)
                Exit Sub
            End If
        Else
            Sheets("passcord").Rows(search + 1).Insert
            Sheets("passcord").Cells(search + 1, 1).Value = trans_input_new_pass
        End If
    End If

End If

Exit Sub
match_error:
search = 0
Sheets("passcord").Rows(search + 1).Insert
Sheets("passcord").Cells(search + 1, 1).Value = trans_input_new_pass
End Sub
