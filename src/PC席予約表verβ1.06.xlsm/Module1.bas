Attribute VB_Name = "Module1"
Public �\��� As Long
Public ���ԑ� As Integer
Public �Ȕԍ� As Integer
Public �A���\�� As String
Public frag As Integer
Public number_valid As Integer
Public tm As Double
Public on_time As Integer
Public Const passcord As String = 1907

Public Sub setting_time()

Dim now_time As Date

On Error GoTo sheet_cal_error
now_time = Sheets("���C��").Cells(2, 12).Value
On Error GoTo 0

If now_time > 0.4375 And now_time <= 0.50694444 Then
    on_time = 3
ElseIf now_time > 0.5069444 And now_time <= 0.5416 Then
    on_time = 4
ElseIf now_time > 0.5416 And now_time <= 0.60416 Then
    on_time = 5
ElseIf now_time > 0.60416 And now_time <= 0.6736 Then
    on_time = 6
ElseIf now_time > 0.6736 And now_time <= 0.74305 Then
    on_time = 7
ElseIf now_time > 0.74305 And now_time <= 0.79166 Then
    on_time = 8
ElseIf now_time > 0.79166 Then
    on_time = 9
Else
    on_time = 2
End If



'���݂̎������擾���Đ��������B�����͎��ԑтɑΉ��������

'If Time > 0.4375 And Time <= 0.50694444 Then
'    on_time = 3
'ElseIf Time > 0.5069444 And Time <= 0.5416 Then
'    on_time = 4
'ElseIf Time > 0.5416 And Time <= 0.60416 Then
'    on_time = 5
'ElseIf Time > 0.60416 And Time <= 0.6736 Then
'    on_time = 6
'ElseIf Time > 0.6736 And Time <= 0.74305 Then
'    on_time = 7
'ElseIf Time > 0.74305 And Time <= 0.79166 Then
'    on_time = 8
'ElseIf Time > 0.79166 Then
'    on_time = 9
''ElseIf Time < 0.44 Then
'    on_time = 5
'Else
'    on_time = 2
'
'Time��p����΃R���s���[�^�[���v�����ɤ
'�ϐ�now_time���g���΃Z���ł�����܂�

'End If

Exit Sub


sheet_cal_error:
Exit Sub
End Sub
Public Sub shift_check()

Worksheets("���C��").EnableCalculation = False
Dim now_time As Date

On Error GoTo sheet_cal_error
'now_time = Sheets("���C��").Cells(2, 12).Value
now_time = Time
On Error GoTo 0

Dim i As Integer


For i = 0 To 48
If now_time > i * 1 / 48 And now_time < i * 1 / 48 + 1 / 24 / 60 Then
Call shift_output_mainsheet(now_time)
Exit For
'    now_date = Sheets("���C��").Cells(2, 11).Value
'    search = WorksheetFunction.Match(CDbl(now_date), Sheets("�V�t�g�\").Range("B:B"), 1) + 1
'    If Int(now_date) <> Int(WorksheetFunction.Index(Sheets("�V�t�g�\").Range("B:B"), search)) Then
'    Exit For
'    Else
'        Do While now_date = Int(WorksheetFunction.Index(Sheets("�V�t�g�\").Range("B:B"), search))
'
'            end_time = WorksheetFunction.Index(Sheets("�V�t�g�\").Range("B:B"), search) - now_date
'            start_time = WorksheetFunction.Index(Sheets("�V�t�g�\").Range("A:A"), search) - now_date
'            If now_time < end_time And now_time > start_time Then
'                shift(j) = WorksheetFunction.Index(Sheets("�V�t�g�\").Range("C:C"), search)
'                j = j + 1
'            End If
'            search = search + 1
'        Loop
'            Dim k As Integer
'            k = 0
'            For k = 0 To j
'                Cells(1, 15 + k).Value = shift(k)
'            Next k
'
'    End If
End If
Next i

'i = shift(0)
'Sheets("���C��").Shapes.Range(Array("Picture 4")).Formula = "=�o��!inditrct(address(," + Str(i) + ",2)"
'=mid(indirect(address(" + Str(���݂̈ʒu) + "," + Str(i) + ")),1,8)
Worksheets("���C��").EnableCalculation = True
sheet_cal_error:
Exit Sub
End Sub

Public Sub shift_output_mainsheet(ByVal now_time As Date)

Dim j As Integer
Dim now_date As Date
Dim search As Integer
Dim end_time As Date
Dim start_time As Date
Dim shift(4) As Integer
j = 0

   now_date = Sheets("���C��").Cells(2, 11).Value
    search = WorksheetFunction.Match(CDbl(now_date), Sheets("�V�t�g�\").Range("B:B"), 1) + 1
    If Int(now_date) <> Int(WorksheetFunction.Index(Sheets("�V�t�g�\").Range("B:B"), search)) Then
    Exit Sub
    Else
        Do While now_date = Int(WorksheetFunction.Index(Sheets("�V�t�g�\").Range("B:B"), search))
                   
            end_time = WorksheetFunction.Index(Sheets("�V�t�g�\").Range("B:B"), search) - now_date
            start_time = WorksheetFunction.Index(Sheets("�V�t�g�\").Range("A:A"), search) - now_date
            If now_time < end_time And now_time > start_time Then
                shift(j) = WorksheetFunction.Index(Sheets("�V�t�g�\").Range("C:C"), search)
                j = j + 1
            End If
            search = search + 1
        Loop
            Dim k As Integer
            k = 0
            For k = 0 To j - 1
                Cells(1, 15 + k).Value = shift(k)
            Next k

    End If

End Sub

Public Sub recal()

Application.Calculate
'�V�[�g�̍Čv�Z���s��
Call shift_check
tm = Now() + TimeValue("00:01:00")
Application.OnTime EarliestTime:=tm, Procedure:="recal", Schedule:=True
'tm�ϐ��Ɉꕪ����Z�b�g
'ontime�֐��ňꕪ��ɂ܂�recal�v���V�[�W�������s
'�Ȃ����V�[�g���W���[����recal�v���V�[�W���������Ƃ��܂������Ȃ�

End Sub


Public Sub textbox_restrict(ByVal textbox_name As Object, student_number As Variant)

Dim ���w�N�x As Integer
Dim �w�� As Integer
'number_valid�ϐ��͂��̃v���V�[�W����exitsub�����Ă����̃v���V�[�W���𔲂��邱�Ƃ͂ł��Ȃ��̂ŁA�P�ȏ�̒l�Ȃ�G���[���o�����Ƃ����t���O�Ƃ��Ďg���Ă��܂��B
'�����œ�d�̃v���V�[�W���𔲂�����@������̂�������Ȃ����A��������ƁA�����̃e�L�X�g�{�b�N�X�ɓ��͂Ɍ�肪�������ۂɁA�ŏ��ɃG���[�����������_�Ŕ����Ă��܂��ƁA���̃e�L�X�g�{�b�N�X�����󔒂ɂł��Ȃ��̂Ō��󂱂̂悤�ɂ��Ă��܂��B

If textbox_name <= 0 Then
'    MsgBox ("�L���Ȋw�Дԍ�����͂��Ă�������")
    stunum_error.Show
    number_valid = number_valid + 1
    textbox_name = ""
    ''0�ȉ������͂��ꂽ�ꍇ�̓e�L�X�g�{�b�N�X����ɂ������̓t�H�[���ɖ߂�
    Exit Sub
End If

If Len(textbox_name) = 7 Then
'�w�Дԍ��͂V���Ȃ̂ŁA�V�����͂��ꂽ�ꍇ�͉��̏������s���ĕϊ�����
'    ���w�N�x�̏���
    If IsNumeric(Mid(textbox_name, 3, 2)) = True Then
        ���w�N�x = Mid(textbox_name, 3, 2)
    Else
'        MsgBox ("�L���Ȋw�Дԍ�����͂��Ă�������")
        stunum_error.Show
        number_valid = number_valid + 1
        textbox_name = ""
        Exit Sub
    End If
    
        '5�����ڂ�M�������ꍇ�̓}�X�^�[�̏���
    If Mid(textbox_name, 5, 1) = "M" Or Mid(textbox_name, 5, 1) = "m" Then
        If Mid(textbox_name, 1, 2) <= 10 Then
            �w�� = Mid(textbox_name, 1, 2) + 2000
        ElseIf Mid(textbox_name, 1, 2) = "61" Then
            �w�� = 2201
        ElseIf Mid(textbox_name, 1, 2) = "62" Then
            �w�� = 2202
        ElseIf Mid(textbox_name, 1, 2) = "51" Then
            �w�� = 2101
        ElseIf IsNumeric(Mid(textbox_name, 1, 2)) = False Then
            stunum_error.Show
'            MsgBox ("�L���Ȋw�Дԍ�����͂��Ă�������")
            number_valid = number_valid + 1
            textbox_name = ""
            Exit Sub
        Else
            �w�� = 2099        '2099�͗\�z���Ȃ��w�Дԍ������ꍇ�̃��C���h�J�[�h
        End If
        If IsNumeric(Mid(textbox_name, 6, 2)) = False Then
'            MsgBox ("�L���Ȋw�Дԍ�����͂��Ă�������")
            stunum_error.Show
            number_valid = number_valid + 1
            textbox_name = ""
            Exit Sub
        End If
        student_number = ���w�N�x & �w�� & "0" & Mid(textbox_name, 6, 2)
'�h�N�^�[�̏���
    ElseIf Mid(textbox_name, 5, 1) = "D" Or Mid(textbox_name, 5, 1) = "d" Then
        If Mid(textbox_name, 1, 2) = 1 Then
            �w�� = Mid(textbox_name, 1, 2) + 2010
        ElseIf Mid(textbox_name, 1, 2) >= 2 Then
            �w�� = Mid(textbox_name, 1, 2) + 2011
        ElseIf Mid(textbox_name, 1, 2) = "61" Then
            �w�� = 2211
        ElseIf Mid(textbox_name, 1, 2) = "62" Then
            �w�� = 2212
        ElseIf Mid(textbox_name, 1, 2) = "51" Then
            �w�� = 2111
        ElseIf IsNumeric(Mid(textbox_name, 1, 2)) = False Then
'            MsgBox ("�L���Ȋw�Дԍ�����͂��Ă�������")
            stunum_error.Show
            number_valid = number_valid + 1
            textbox_name = ""
            Exit Sub
        Else
            �w�� = 2199  '���C���h�J�[�h
        End If
        If IsNumeric(Mid(textbox_name, 6, 2)) = False Then
'                MsgBox ("�L���Ȋw�Дԍ�����͂��Ă�������")
            stunum_error.Show
            number_valid = number_valid + 1
            textbox_name = ""
            Exit Sub
        End If
            student_number = ���w�N�x & �w�� & "0" & Mid(textbox_name, 6, 2)
    ElseIf Mid(textbox_name, 5, 1) = "s" Or Mid(textbox_name, 5, 1) = "S" Then
        If Mid(textbox_name, 1, 2) <= 10 Then
            �w�� = Mid(textbox_name, 1, 2) + 2500
        ElseIf Mid(textbox_name, 1, 2) >= 51 And Mid(textbox_name, 1, 2) <= 57 Then
            �w�� = Mid(textbox_name, 1, 2) - 40 + 2500
        ElseIf Mid(textbox_name, 1, 2) = 11 Then
            �w�� = 2521
        ElseIf IsNumeric(Mid(textbox_name, 1, 2)) = False Then
'                MsgBox ("�L���Ȋw�Дԍ�����͂��Ă�������")
            stunum_error.Show
            number_valid = number_valid + 1
            textbox_name = ""
            Exit Sub
        Else
            �w�� = 2599 '���C���h�J�[�h
        End If
            
        If IsNumeric(Mid(textbox_name, 6, 2)) = False Then
'               MsgBox ("�L���Ȋw�Дԍ�����͂��Ă�������")
            stunum_error.Show
            number_valid = number_valid + 1
            textbox_name = ""
            Exit Sub
        End If
            '�T�����ڂ�S�̌������w���ɑΉ��B�߂�ǂ������̂Ŋw�Ȕԍ��̂��Ƃ������X�ɂ��邱�Ƃŉ����B�����قƂ�Ǘ��Ȃ��ł��傤
            student_number = ���w�N�x & �w�� & "9" & Mid(textbox_name, 6, 2)
        ' M�ł�D�ł�S�ł��Ȃ��ꍇ�̏���
    Else
        If Mid(textbox_name, 1, 2) <= 10 Then
            �w�� = Mid(textbox_name, 1, 2) + 2500
        ElseIf Mid(textbox_name, 1, 2) >= 51 And Mid(textbox_name, 1, 2) <= 57 Then
            �w�� = Mid(textbox_name, 1, 2) - 40 + 2500
        ElseIf Mid(textbox_name, 1, 2) = 11 Then
            �w�� = 2521
        ElseIf IsNumeric(Mid(textbox_name, 1, 2)) = False Then
'                MsgBox ("�L���Ȋw�Дԍ�����͂��Ă�������")
            stunum_error.Show
            number_valid = number_valid + 1
            textbox_name = ""
            Exit Sub
        Else
            �w�� = 2599 '���C���h�J�[�h
        End If
            If IsNumeric(Mid(textbox_name, 6, 2)) = False Then
'                    MsgBox ("�L���Ȋw�Дԍ�����͂��Ă�������")
                stunum_error.Show
                number_valid = number_valid + 1
                textbox_name = ""
                Exit Sub
            End If
        student_number = ���w�N�x & �w�� & Mid(textbox_name, 5, 3)
        
    '   �Љ���w�Ȃ����䒠�ԍ�����Ȃ̂ōŌ�ɓ���I�ɏ�����������
    End If

ElseIf Len(textbox_name) = 16 Then
    
        ���w�N�x = Mid(textbox_name, 3, 2)
        �w�� = Mid(textbox_name, 8, 4)
        student_number = ���w�N�x & �w�� & Mid(textbox_name, 13, 3)
 Else
 
    If textbox_name <> "" Then
    student_number = textbox_name
    
    '�e�L�X�g�{�b�N�X�ɉ������͂���Ă��ĂV���̕�����łȂ��ꍇ�͂��̂܂ܑ������
    End If

End If

If textbox_name <> "" Then
'�e�L�X�g�{�b�N�X�ɉ������͂���Ă��Ȃ��ꍇ�͏������s��Ȃ�
    
    If student_number <= 0 Then
'        MsgBox ("�L���Ȋw�Дԍ�����͂��Ă�������")
        stunum_error.Show
        number_valid = number_valid + 1
        textbox_name = ""
        ''0�ȉ������͂��ꂽ�ꍇ�̓e�L�X�g�{�b�N�X����ɂ������̓t�H�[���ɖ߂�
    Exit Sub
    ElseIf IsNumeric(student_number) = False And student_number <> "" Then
'        MsgBox ("�L���Ȋw�Дԍ�����͂��Ă�������")
        stunum_error.Show
        number_valid = number_valid + 1
        textbox_name = ""
        Exit Sub
    ElseIf Len(student_number) <> 9 Then
'        MsgBox ("�L���Ȋw�Дԍ�����͂��Ă�������")
        stunum_error.Show
        number_valid = number_valid + 1
        textbox_name = ""
        Exit Sub
    End If
End If



End Sub

Public Sub keypressrestrict(ByVal KeyAscii As MSForms.ReturnInteger)
'�L�[���͂�M�AD�AS�Ɛ����ȊO�����͂ł��Ȃ��悤�ɂ��Ă�
If Chr(KeyAscii) < "0" Or Chr(KeyAscii) > "9" And Chr(KeyAscii) <> "M" And Chr(KeyAscii) <> "D" And Chr(KeyAscii) <> "m" And Chr(KeyAscii) <> "d" And Chr(KeyAscii) <> "s" And Chr(KeyAscii) <> "S" Then
'    If Chr(KeyAscii) = "M" Or Chr(KeyAscii) = "D" Or Chr(KeyAscii) = "m" Or Chr(KeyAscii) = "d" Or Chr(KeyAscii) = "s" Or Chr(KeyAscii) = "S" Then
'        Exit Sub
        
'    End If
    KeyAscii = 0
End If
End Sub

Public Sub cable()

    Dim �\��R�[�h As Long
    Dim ���݂̈ʒu As Long
    �\��R�[�h = �\��� * 100 + ���ԑ� * 10 + �Ȕԍ�
    ���݂̈ʒu = WorksheetFunction.Match(�\��R�[�h, Sheets("���f�[�^").Range("D:D"), 1)
    If Sheets("���f�[�^").Cells(���݂̈ʒu, 5).Value = 0 Then
'        Dim �ݏo�m�F As Integer
'        �ݏo�m�F = MsgBox("HDMI�P�[�u������݂��o���܂�", vbYesNo + vbwuestion, "�ݏo�̊m�F")
'            If �ݏo�m�F = vbNo Then
'                Unload �\��ύX�t�H�[��
'                Exit Sub
'            Else
                Sheets("���f�[�^").Cells(���݂̈ʒu, 5).Value = 1
'            End If
    Else
'        Dim �ԋp�m�F As Integer
'        �ԋp�m�F = MsgBox("HDMI�P�[�u�����̕ԋp���󂯕t���܂���", vbYesNo + vbwuestion, "�ԋp�̊m�F")
'            If �ԋp�m�F = vbNo Then
'                Unload �\��ύX�t�H�[��
'                Exit Sub
'            Else
                Sheets("���f�[�^").Cells(���݂̈ʒu, 5).Value = 0
'            End If
    End If

End Sub

Public Sub cable_new(ByVal check As Object, ByVal Row As Variant)

'�V�K�\�񂵂��Ƃ��ɃP�[�u���݂��o������Ƃ��̃v���V�[�W��
If check.Value = True Then
    Sheets("���f�[�^").Cells(Row, 5).Value = 1
Else
    Sheets("���f�[�^").Cells(Row, 5).Value = 0
End If

End Sub

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
        search_stu_row = WorksheetFunction.Match(Int(student_num_list(i)), Duplicate.Range("A:A"), 1)
        If Int(student_num_list(i)) <> WorksheetFunction.Index(Duplicate.Range("A:A"), search_stu_row) Then
        MsgBox ("�Y���̊w�Дԍ����d���`�F�b�N�V�[�g�Ō�����܂���ł���")
        Else
            Duplicate.Cells(search_stu_row, 2) = Duplicate.Cells(search_stu_row, 2) - 1
            If Duplicate.Cells(search_stu_row, 2) <= 0 Then
                Call Duplicate.Cells(search_stu_row, 1).EntireRow.Delete(xlShiftUp)
            End If
        End If
    Next i

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
Set data = Worksheets("���f�[�^")

Duplicate.Cells(1, 2).Value = Format(main.Cells(2, 11), "yyyymmdd")
If Duplicate.Cells(1, 1) = Duplicate.Cells(1, 2) Then
    Exit Sub
End If
Duplicate.Cells.Clear
Duplicate.Cells(1, 1) = Format(main.Cells(2, 11), "yyyymmdd")

Call data.Range("A:F").Sort(key1:=data.Range("D:D"), order1:=xlAscending, Header:=xlYes)

Dim search_up As Integer

On Error GoTo error_process
search_up = WorksheetFunction.Match(Duplicate.Cells(1, 1).Value, data.Range("A:A"), 1)
On Error GoTo 0

If Duplicate.Cells(1, 1).Value <> WorksheetFunction.Index(data.Range("A:A"), search_up) Then
    Exit Sub
End If

Dim search_target_Row As Integer
Dim i As Integer
Dim j As Integer

i = 0
    While data.Cells(search_up - i, 1) = Duplicate.Cells(1, 1).Value
        j = 0
        While data.Cells(search_up - i, 6 + j).Value <> ""
            On Error GoTo error_process_2
            search_target_Row = WorksheetFunction.Match(data.Cells(search_up - i, 6 + j), Duplicate.Range("A:A"), 1)
            On Error GoTo 0
                If data.Cells(search_up - i, 6 + j) = Duplicate.Cells(search_target_Row, 1) Then
                    Duplicate.Cells(search_target_Row, 2) = Duplicate.Cells(search_target_Row, 2) + 1
                Else
                    Duplicate.Rows(search_target_Row + 1).Insert
                    Duplicate.Cells(search_target_Row + 1, 1) = data.Cells(search_up - i, 6 + j)
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
