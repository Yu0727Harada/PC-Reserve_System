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
Dim inputpass As Integer
    
Do While True
    inputpass = passcord_inputform
    If inputpass = 0 Then
        If Range(master_on_off).Value = "off" Then
            Range(master_on_off).Value = "on"
        ElseIf Range(master_on_off).Value = "on" Then
            Range(master_on_off).Value = "off"
        Else
            Range(master_on_off).Value = "off"
        End If
        Exit Sub
    ElseIf inputpass = 2 Then
    ElseIf inputpass = 3 Then
        Exit Sub
    ElseIf inputpass = 1 Then
        Exit Sub
    End If
Loop
End Sub
Sub main_sheet_sort()
'���f�[�^���\�[�g����v���V�[�W��
Call Worksheets("���f�[�^").Range("A:AA").Sort(key1:=Worksheets("���f�[�^").Cells(1, data_sheet.reserve_code).EntireColumn, order1:=xlAscending, Header:=xlYes)

End Sub

Sub shift_sheet_sort()
'���f�[�^���\�[�g����v���V�[�W��
Call Worksheets("�V�t�g�\").Range("A:C").Sort(key1:=Worksheets("�V�t�g�\").Cells(1, shift_table.�Ζ����ԑяI��).EntireColumn, order1:=xlAscending, Header:=xlYes)

End Sub

Sub selction_move()
'�J�[�\�������J�[�\���ړ��̃I���I�t��؂�ւ���v���V�[�W��
Dim inputpass As String

Do While True
    inputpass = passcord_inputform
    If inputpass = 0 Then
        If Range(cell_corsor_move).Value = "off" Then
            Range(cell_corsor_move).Value = "on"
        ElseIf Range(cell_corsor_move).Value = "on" Then
            Range(cell_corsor_move).Value = "off"
        Else
            Range(cell_corsor_move).Value = "off"
        End If
        Exit Sub
    ElseIf inputpass = 2 Then
    ElseIf inputpass = 3 Then
        Exit Sub
    ElseIf inputpass = 1 Then
        Exit Sub
    End If
Loop

End Sub
Sub if_save()

If Range(save_on_off).Value = "off" Then
    Range(save_on_off).Value = "on"
ElseIf Range(save_on_off).Value = "on" Then
    Range(save_on_off).Value = "off"
Else
    Range(save_on_off).Value = "off"
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
Do While True
    inputpass = passcord_inputform
    If inputpass = 0 Then
        If Range(limit_res_on_off).Value = "off" Then
            Range(limit_res_on_off).Value = "on"
        ElseIf Range(limit_res_on_off).Value = "on" Then
            Range(limit_res_on_off).Value = "off"
        Else
            Range(limit_res_on_off).Value = "off"
        End If
        Exit Sub
    ElseIf inputpass = 2 Then
    ElseIf inputpass = 3 Then
        Exit Sub
    ElseIf inputpass = 1 Then
        Exit Sub
    End If
Loop

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

Dim inputpass As Integer
Do While True
    inputpass = passcord_inputform
    If inputpass = 0 Then
        If Application.DisplayScrollBars = True Then
            Application.DisplayScrollBars = False
        Else
            Application.DisplayScrollBars = True
        End If
        Exit Sub
    ElseIf inputpass = 2 Then
    Else
        Exit Sub
    End If
Loop
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

Do While True
    pass_yesno = passcord_inputform
    If pass_yesno = 2 Then
        pass_yesno = -1
    ElseIf pass_yesno = 3 Then
        Exit Sub
    ElseIf pass_yesno = 1 Then
        Exit Sub
    ElseIf pass_yesno = 0 Then
        Exit Do
    End If
Loop

Dim input_new_pass As String
input_new_pass = InputBox("�p�X�R�[�h�Ƃ��Ēǉ�����w�Дԍ�����͂��邩�A�w���؂̃o�[�R�[�h���X�L�������Ă��������B���łɓo�^����Ă���ԍ�����͂��邱�Ƃō폜���邱�Ƃ��ł��܂��B")
Dim trans_input_new_pass As Variant
trans_input_new_pass = translate_number(input_new_pass, 1)
If trans_input_new_pass = "" Then
    Exit Sub
ElseIf Int(trans_input_new_pass) = -1 Then
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


Exit Sub
match_error:
search = 0
Sheets("passcord").Rows(search + 1).Insert
Sheets("passcord").Cells(search + 1, 1).Value = trans_input_new_pass
End Sub

Public Sub add_new_shift()

add_new_shift_form.Show


End Sub

Public Sub edit_shift()

edit_shift_form.Show

End Sub

Public Sub update_excel()

If tm <> 0 Then
    Application.OnTime EarliestTime:=tm, Procedure:="recal", Schedule:=False
    tm = 0
End If

'���݂̃��[�N�u�b�N��ݒ�
Dim last_wb As Workbook
Set last_wb = Workbooks(Application.ThisWorkbook.name)

'�A�b�v�f�[�g���ݒ�
Dim open_filepath As String
open_filepath = Application.GetOpenFilename(filefilter:="microsoft excelbook,*.xlsm", Title:="�A�b�v�f�[�g��̃G�N�Z���t�@�C����I��ł�������")
If open_filepath = "False" Then
    Exit Sub
End If
Workbooks.Open open_filepath
Dim new_wb_name As String
new_wb_name = Dir(open_filepath)

If new_wb_name = Application.ThisWorkbook.name Then
    MsgBox ("�A�b�v�f�[�g��̃G�N�Z���t�@�C���ƁA���̃G�N�Z���t�@�C���̃t�@�C�����������ł��B�قȂ�t�@�C�����ɕύX���Ă�������")
    Exit Sub
End If

Dim new_wb As Workbook
Set new_wb = Workbooks(new_wb_name)

'�V�����A�b�v�f�[�g��ɂ��łɓ��͂���Ă���f�[�^���폜
Call delete_sheet_data(2, 1, new_wb.Sheets("���f�[�^"))
Call delete_sheet_data(2, 7, new_wb.Sheets("����"))
Call delete_sheet_data(1, 7, new_wb.Sheets("�o��"))
'Call shapes_delete(range(Cells(1, 1), Cells(lastrow, 1)), new_wb.Sheets("�o��"))
Dim shp As Shape
For Each shp In new_wb.Sheets("�o��").shapes
    shp.Delete
Next shp
Call delete_sheet_data(2, 7, new_wb.Sheets("�V�t�g�\"))
Call delete_sheet_data(1, 1, new_wb.Sheets("passcord"))
With new_wb.VBProject.VBComponents("Module1").CodeModule
    Dim declaration_lines As Integer
    declaration_lines = .CountOfDeclarationLines
    .DeleteLines 1, declaration_lines
End With



'�f�[�^���R�s�[
Call copy_sheet_data(2, 2, last_wb.Sheets("���f�[�^"), new_wb.Sheets("���f�[�^"))
Call copy_sheet_data(2, 7, last_wb.Sheets("����"), new_wb.Sheets("����"))
Call copy_sheet_data(2, 7, last_wb.Sheets("�V�t�g�\"), new_wb.Sheets("�V�t�g�\"))
Call copy_sheet_data(1, 2, last_wb.Sheets("�o��"), new_wb.Sheets("�o��"))
Call copy_sheet_shape(last_wb.Sheets("�o��"), new_wb.Sheets("�o��"))
Call copy_sheet_data(1, 1, last_wb.Sheets("passcord"), new_wb.Sheets("passcord"))
With last_wb.VBProject.VBComponents("Module1").CodeModule
    Dim last_declaration_lines As Integer
    last_declaration_lines = .CountOfDeclarationLines
    Dim declaration_code As String
    declaration_code = .Lines(1, last_declaration_lines)
End With
With new_wb.VBProject.VBComponents("Module1").CodeModule
    .AddFromString declaration_code
End With

'new_wb.Save
last_wb.Sheets("���f�[�^").Activate
'new_wb.Close

MsgBox ("�f�[�^�̈ڍs���������܂����B�ڍs��̃f�[�^��ۑ����Ă��������B���ۑ��シ�ׂẴG�N�Z���t�@�C������邱�Ƃ𐄏����܂��i�}�j���A���Q�Ɓj")

End Sub

Public Sub delete_sheet_data(ByVal start_row As Integer, end_column As Integer, book_sheet As Object)

Dim lastrow As Long
Dim temp_row As Long
Dim i As Integer

lastrow = start_row
For i = 1 To end_column
    temp_row = book_sheet.Cells(Rows.count, i).End(xlUp).Row
    If lastrow < temp_row Then
        lastrow = temp_row
    End If
Next i
book_sheet.Activate
book_sheet.Range(Cells(start_row, 1), Cells(lastrow, 1)).EntireRow.Delete
'book_sheet.Range(Cells(start_row, 1), Cells(lastrow, 1)).EntireRow.RowHeight = 180

End Sub

Public Sub copy_sheet_data(ByVal start_row As Integer, end_column As Integer, from_book_sheet As Object, to_book_sheet As Object)

Dim lastrow As Long
Dim temp_row As Long
Dim i As Integer

lastrow = 0
For i = 1 To end_column
    temp_row = from_book_sheet.Cells(Rows.count, i).End(xlUp).Row
    If lastrow < temp_row Then
        lastrow = temp_row
    End If
Next i
from_book_sheet.Activate
from_book_sheet.Range(Cells(start_row, 1), Cells(lastrow, 1)).EntireRow.Copy
to_book_sheet.Activate
to_book_sheet.Range(Cells(start_row, 1), Cells(lastrow, 1)).EntireRow.PasteSpecial Paste:=xlPasteValues

End Sub

Public Sub copy_sheet_shape(ByVal from_book_sheet As Object, to_book_sheet As Object)

Dim shp As Shape
Dim L As Double
Dim T As Double
Dim H As Double
Dim W As Double
Dim i As Integer
i = 0

For Each shp In from_book_sheet.shapes
    
    L = shp.Left
    T = shp.Top
    H = shp.Height
    W = shp.Width
    
    shp.name = ("Fig" + CStr(i))
    shp.Copy
    to_book_sheet.Paste
    With to_book_sheet.shapes("Fig" + CStr(i))
        .Left = L
        .Top = T
        .Height = H
        .Width = W
    End With
    i = i + 1
Next shp

End Sub

