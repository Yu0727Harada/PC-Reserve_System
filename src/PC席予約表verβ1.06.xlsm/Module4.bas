Attribute VB_Name = "Module4"
Option Explicit

Sub import_Shift()

Application.Calculation = xlCalculationManual

Dim wb As Workbook
Set wb = ThisWorkbook

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

Dim i As Integer
Dim j As Integer
i = 3

Dim Shift_data_aray() As Variant
Dim Shift_data_num As Integer
Shift_data_num = 0

With Shift_BookName.Worksheets(1)
    Do While .Cells(2, i) <> ""
    j = 4
        Do While .Cells(j, 1) <> ""
    
            If .Cells(j, i) <> "" Then
                ReDim Preserve Shift_data_aray(2, Shift_data_num)
                Dim year As Integer
                Dim month As Integer
                Dim dates As Integer
                year = .Cells(1, 3).Value
                month = .Cells(1, 6).Value
                dates = .Cells(2, i).Value
                Dim yyyymmdd As Date
                yyyymmdd = Replace(Str(year) & "/" & Str(month) & "/" & Str(dates), " ", "")
'                Shift_data_aray(0, Shift_data_num) = yyyymmdd
'                なぜかreplace関数で空白スペースを置換しないと空白が入るので置換
                Dim tmp As Variant
                tmp = Split(.Cells(j, i), "-")
                Shift_data_aray(0, Shift_data_num) = yyyymmdd & " " & tmp(0) & ":00"
                Shift_data_aray(1, Shift_data_num) = yyyymmdd & " " & tmp(1) & ":00"
                Shift_data_aray(2, Shift_data_num) = .Cells(j, 1)
                
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

With wb.Worksheets("シフト表").Range("A2")
.Resize(Shift_data_num, 3).NumberFormatLocal = "G/標準"
.Resize(Shift_data_num, 3) = Shift_data_aray_trans
End With


Application.Calculation = xlCalculationAutomatic


End Sub

Sub check_shift()

End Sub
