Attribute VB_Name = "Module9"
Option Explicit

Sub input_res_num(ByRef student_num_list() As Variant, ByVal stu_data_num As Integer)
'�d���`�F�b�N�V�[�g��student_num_list�̊w�Дԍ������邩�ǂ����`�F�b�N���A��������B��ɂP�𑫂��A�Ȃ������珸���ňʒu����ꏊ�ɔԍ���}������
Set Duplicate = Worksheets("�d���`�F�b�N")
Dim search_stu_row
Dim i As Integer

    For i = 0 To stu_data_num
        search_stu_row = WorksheetFunction.Match(Int(student_num_list(i)), Duplicate.Range("A:A"), 1)
        If Int(student_num_list(i)) <> WorksheetFunction.Index(Duplicate.Range("A:A"), search_stu_row) Then
            Duplicate.Rows(search_stu_row + 1).Insert
            Duplicate.Cells(search_stu_row + 1, 1) = student_num_list(i)
            Duplicate.Cells(search_stu_row + 1, 2) = Duplicate.Cells(search_stu_row + 1, 2) + 1
        Else
            Duplicate.Cells(search_stu_row, 2) = Duplicate.Cells(search_stu_row, 2) + 1
        End If
    Next i

End Sub

Sub delete_res_num(ByRef student_num_list() As Variant, ByVal stu_data_num As Integer)
'�\�񂪍폜���ꂽ�Ƃ��ɏd���`�F�b�N�V�[�g�̊w�Дԍ���B�񂩂�P�������A�O�ɂȂ����ꍇ�͍s���폜����
Set Duplicate = Worksheets("�d���`�F�b�N")
Dim search_stu_row
Dim i As Integer

    For i = 0 To stu_data_num
       On Error GoTo invalid_number_change

        search_stu_row = WorksheetFunction.Match(Int(student_num_list(i)), Duplicate.Range("A:A"), 1)
        On Error GoTo 0
        If Int(student_num_list(i)) <> WorksheetFunction.Index(Duplicate.Range("A:A"), search_stu_row) Then
        MsgBox ("�Y���̊w�Дԍ����d���`�F�b�N�V�[�g�Ō�����܂���ł���")
        Else
            Duplicate.Cells(search_stu_row, 2) = Duplicate.Cells(search_stu_row, 2) - 1
            If Duplicate.Cells(search_stu_row, 2) <= 0 Then
                Call Duplicate.Cells(search_stu_row, 1).EntireRow.Delete(xlShiftUp)
            End If
        End If
    Next i
Exit Sub
invalid_number_change:
MsgBox ("LA�ɂ�鐶�f�[�^�̊w�Дԍ��̕ύX���������ƍl�����܂��B���̂܂ܐ��f�[�^��̂��̘g�̍폜���s���܂����A�ŏ��ɓ��͂����ԍ��̏d���`�F�b�N�V�[�g�ł̗\�񐔂��������Ă��܂���B�d���`�F�b�N�V�[�g�̓��t��ύX���A�d���`�F�b�N�V�[�g�����t���b�V�����邱�ƂŐ��������̂ɂȂ�܂�")

End Sub

Sub check_res_num(ByRef student_num_list() As Variant, ByVal stu_data_num As Integer, ByRef CNT() As Integer)
'�d���`�F�b�N�V�[�g�Ɋw�Дԍ����o�^����Ă��邩�`�F�b�N����
Set Duplicate = Worksheets("�d���`�F�b�N")
Dim search_stu_row
Dim i As Integer

    For i = 0 To stu_data_num
        search_stu_row = WorksheetFunction.Match(Int(student_num_list(i)), Duplicate.Range("A:A"), 1)
        If Int(student_num_list(i)) <> WorksheetFunction.Index(Duplicate.Range("A:A"), search_stu_row) Then
            CNT(i) = 0
        Else
            CNT(i) = Duplicate.Cells(search_stu_row, 2)
        End If
    Next i

End Sub

Sub check_res_day()
'���t���ς�����Ƃ��ɕύX���ꂽ���̏d���`�F�b�N�V�[�g�ɍX�V����

Worksheets("���C��").EnableCalculation = False
Set main = Worksheets("���C��")
Set Duplicate = Worksheets("�d���`�F�b�N")
Set Data = Worksheets("���f�[�^")

Duplicate.Cells(1, 2).Value = Format(main.Cells(2, 11), "yyyymmdd")
If Duplicate.Cells(1, 1) = Duplicate.Cells(1, 2) Then
    Exit Sub
End If
Duplicate.Cells.Clear
Duplicate.Cells(1, 1) = Format(main.Cells(2, 11), "yyyymmdd")

Call Data.Range("A:F").Sort(key1:=Data.Range("D:D"), order1:=xlAscending, Header:=xlYes)

Dim search_up As Integer

On Error GoTo error_process
search_up = WorksheetFunction.Match(Duplicate.Cells(1, 1).Value, Data.Range("A:A"), 1)
On Error GoTo 0

If Duplicate.Cells(1, 1).Value <> WorksheetFunction.Index(Data.Range("A:A"), search_up) Then
    Exit Sub
End If

Dim search_target_Row As Integer
Dim i As Integer
Dim j As Integer

i = 0
    While Data.Cells(search_up - i, 1) = Duplicate.Cells(1, 1).Value
        j = 0
        While Data.Cells(search_up - i, 6 + j).Value <> ""
            On Error GoTo error_process_2
            search_target_Row = WorksheetFunction.Match(Data.Cells(search_up - i, 6 + j), Duplicate.Range("A:A"), 1)
            On Error GoTo 0
                If Data.Cells(search_up - i, 6 + j) = Duplicate.Cells(search_target_Row, 1) Then
                    Duplicate.Cells(search_target_Row, 2) = Duplicate.Cells(search_target_Row, 2) + 1
                Else
                    Duplicate.Rows(search_target_Row + 1).Insert
                    Duplicate.Cells(search_target_Row + 1, 1) = Data.Cells(search_up - i, 6 + j)
                    Duplicate.Cells(search_target_Row + 1, 2) = Duplicate.Cells(search_target_Row + 1, 2) + 1
                End If
            j = j + 1
        Wend
        
        i = i + 1
        
    Wend

Exit Sub

error_process:
search_up = 1
Resume Next

error_process_2:
search_target_Row = 1
Resume Next
End Sub

