Attribute VB_Name = "Module9"
Option Explicit

Sub refresh_diplicate_sheet()
Worksheets("���C��").EnableCalculation = False
Dim main As Worksheet
Dim Duplicate As Worksheet
Set main = Worksheets("���C��")
Set Duplicate = Worksheets("�d���`�F�b�N")

Duplicate.Cells(1, 1).Value = 19900101

Call check_res_day
End Sub
