Attribute VB_Name = "Module4"
Option Explicit

Sub import_Shift()
'�V�t�g��ǂݍ��ރv���V�[�W��

Dim shift_year As Range
Dim shift_month As Range

Application.Calculation = xlCalculationManual

Dim wb As Workbook
Set wb = Workbooks(Application.ThisWorkbook.name)

Dim Open_Filepath As String
Open_Filepath = Application.GetOpenFilename
If Open_Filepath = "False" Then
    Exit Sub
End If
Workbooks.Open Open_Filepath

Dim Shift_Filename As String
Shift_Filename = Dir(Open_Filepath)

Dim Shift_BookName As Workbook

Set Shift_BookName = Workbooks(Shift_Filename)

'With Shift_BookName.Worksheets(1)
Set shift_year = Shift_BookName.Worksheets(1).Range("C1") '�ǂݍ��ރV�t�g�\�̔N�x�����͂���Ă���Z����ݒ�
Set shift_month = Shift_BookName.Worksheets(1).Range("F1") '�������͂���Ă���Z����ݒ�
'End With

Dim i As Integer
Dim j As Integer
i = shift_table_time_start_colomn

Dim Shift_data_aray() As Variant
Dim Shift_data_num As Integer
Shift_data_num = 0

With Shift_BookName.Worksheets(1)
    Do While .Cells(shift_table_date_start_row, i) <> ""
    j = shift_table_number_start_row
        Do While .Cells(j, shift_table_number_start_colomn) <> ""
    
            If .Cells(j, i) <> "" Then
                ReDim Preserve Shift_data_aray(2, Shift_data_num)
                Dim year As Integer
                Dim month As Integer
                Dim dates As Integer
                year = shift_year.Value
                month = shift_month.Value
                dates = .Cells(shift_table_date_start_row, i).Value
                Dim yyyymmdd As Date
                yyyymmdd = Replace(Str(year) & "/" & Str(month) & "/" & Str(dates), " ", "")
'                Shift_data_aray(0, Shift_data_num) = yyyymmdd
'                �Ȃ���replace�֐��ŋ󔒃X�y�[�X��u�����Ȃ��Ƌ󔒂�����̂Œu��
                Dim tmp As Variant
                tmp = Split(.Cells(j, i), "-")
                Shift_data_aray(0, Shift_data_num) = yyyymmdd & " " & tmp(0) & ":00"
                Shift_data_aray(1, Shift_data_num) = yyyymmdd & " " & tmp(1) & ":00"
                Shift_data_aray(2, Shift_data_num) = .Cells(j, shift_table_number_start_colomn)
                
                Shift_data_num = Shift_data_num + 1
            End If
        j = j + 1
        Loop
    i = i + 1
    Loop
End With

Dim Shift_data_aray_trans() As Variant
ReDim Shift_data_aray_trans(UBound(Shift_data_aray, 2), 2)

Dim k As Integer
Dim date_temp As Date

For k = 0 To UBound(Shift_data_aray, 2)
    date_temp = CDate(Shift_data_aray(0, k))
    Shift_data_aray_trans(k, 0) = date_temp
    date_temp = CDate(Shift_data_aray(1, k))
    Shift_data_aray_trans(k, 1) = date_temp
    Shift_data_aray_trans(k, 2) = Shift_data_aray(2, k)
Next k

Call Quick_sort(Shift_data_aray_trans(), 1, 0, UBound(Shift_data_aray_trans, 1))

Dim shift_time_end As Range
Set shift_time_end = wb.Worksheets("�V�t�g�\").Columns(�Ζ����ԑяI��)
Dim search_up As Integer
Dim search_down As Integer
On Error GoTo data_nothing_up
    search_up = WorksheetFunction.Match(CDbl(Shift_data_aray_trans(0, 1)) - 1, shift_time_end, 1) + 1 '   CDbl�Ō^��ϊ����Ȃ��Ƃ��܂�match�����ł��Ȃ��
On Error GoTo 0
On Error GoTo data_notihng_down
    search_down = WorksheetFunction.Match(CDbl(Shift_data_aray_trans(UBound(Shift_data_aray_trans, 1) - 1, 1)), shift_time_end, 1) + 1
On Error GoTo 0

Do While Int(Shift_data_aray_trans(UBound(Shift_data_aray_trans, 1) - 1, 1)) = Int(WorksheetFunction.Index(shift_time_end, search_down))
    search_down = search_down + 1
Loop

Dim Okcancel As Integer
'If Int(WorksheetFunction.Index(shift_time_end, search_up)) <> Int(WorksheetFunction.Index(shift_time_end, search_down)) Then
 If search_up <> search_down Then
    Okcancel = MsgBox("���łɓǂݍ��܂�Ă�����Ԃ̃V�t�g�ł��B�ȑO�̃f�[�^���㏑�����܂����A��낵���ł����H", vbOKCancel)
    If Okcancel = 2 Then
        MsgBox ("�������I�����܂�")
        Exit Sub
    Else
        wb.Worksheets("�V�t�g�\").Activate
        wb.Worksheets("�V�t�g�\").Range(Cells(search_up, 1), Cells(search_down - 1, 1)).EntireRow.Delete (xlShiftUp)
    End If
End If
With wb.Worksheets("�V�t�g�\")
    .Activate
    .Range(Cells(search_up, 1), Cells(search_up + UBound(Shift_data_aray_trans, 1) - 1, 1)).EntireRow.Insert
    '.Resize(UBound(Shift_data_aray_trans, 1), 3).NumberFormatLocal = "G/�W��"
    .Range("A1").Offset(search_up - 1, 0).Resize(UBound(Shift_data_aray_trans, 1), 3) = Shift_data_aray_trans
End With

Application.Calculation = xlCalculationAutomatic

Exit Sub
data_nothing_up:
search_up = 2
Resume Next
data_notihng_down:
search_down = 2
Resume Next
End Sub
