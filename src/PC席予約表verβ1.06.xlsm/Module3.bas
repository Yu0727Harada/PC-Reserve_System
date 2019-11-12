Attribute VB_Name = "Module3"
Option Explicit

Enum data_sheet
day_code = 1
time_zone
seat_num
reserve_code
cable_frag
student_num_start

End Enum

Function translate_number(ByVal raw_number As String, option_number As Integer)
'�e�L�X�g�{�b�N�X�ɓ��͂��ꂽ�ԍ���ϊ�����v���V�[�W��
'student_number�̃f�[�^�^��valiant����Ȃ��ƃ_���B�������������̂ŁB
'when raw_number is a invalid number,this procedure return -1
'option_number 0�̎��͖����Ȋw�Дԍ������͂���Ă��G���[���b�Z�[�W��\�����Ȃ��B�P�̎��̓G���[���b�Z�[�W��\������

Dim enter_year As Integer
Dim subject As Integer
'number_valid�ϐ��͂��̃v���V�[�W����exitsub�����Ă����̃v���V�[�W���𔲂��邱�Ƃ͂ł��Ȃ��̂ŁA�P�ȏ�̒l�Ȃ�G���[���o�����Ƃ����t���O�Ƃ��Ďg���Ă��܂��B
'�����œ�d�̃v���V�[�W���𔲂�����@������̂�������Ȃ����A��������ƁA�����̃e�L�X�g�{�b�N�X�ɓ��͂Ɍ�肪�������ۂɁA�ŏ��ɃG���[�����������_�Ŕ����Ă��܂��ƁA���̃e�L�X�g�{�b�N�X�����󔒂ɂł��Ȃ��̂Ō��󂱂̂悤�ɂ��Ă��܂��B

'If raw_number <= 0 Then
''    MsgBox ("�L���Ȋw�Дԍ�����͂��Ă�������")
'    stunum_error.Show
'    number_valid = number_valid + 1
'    translate_number = -1
'    ''0�ȉ������͂��ꂽ�ꍇ��-1
'    Exit Function
'End If

If Len(raw_number) = 7 Then
'�w�Дԍ��͂V���Ȃ̂ŁA�V�����͂��ꂽ�ꍇ�͉��̏������s���ĕϊ�����
'    enter_year�̏���
    If IsNumeric(Mid(raw_number, 3, 2)) = True Then
        enter_year = Mid(raw_number, 3, 2)
    Else
        If option_number = 1 Then
            stunum_error.Show
        End If
        number_valid = number_valid + 1
        translate_number = -1
        Exit Function
    End If
    
        '5�����ڂ�M�������ꍇ�̓}�X�^�[�̏���
    If Mid(raw_number, 5, 1) = "M" Or Mid(raw_number, 5, 1) = "m" Then
        If Mid(raw_number, 1, 2) <= 10 Then
            subject = Mid(raw_number, 1, 2) + 2000
        ElseIf Mid(raw_number, 1, 2) = "61" Then
            subject = 2201
        ElseIf Mid(raw_number, 1, 2) = "62" Then
            subject = 2202
        ElseIf Mid(raw_number, 1, 2) = "51" Then
            subject = 2101
        ElseIf IsNumeric(Mid(raw_number, 1, 2)) = False Then
            If option_number = 1 Then
                stunum_error.Show
            End If
            number_valid = number_valid + 1
            translate_number = -1
            Exit Function
        Else
            subject = 2099        '2099�͗\�z���Ȃ��w�Дԍ������ꍇ�̃��C���h�J�[�h
        End If
        If IsNumeric(Mid(raw_number, 6, 2)) = False Then
            If option_number = 1 Then
                stunum_error.Show
            End If
            number_valid = number_valid + 1
            translate_number = -1
            Exit Function
        End If
        translate_number = enter_year & subject & "0" & Mid(raw_number, 6, 2)
'�h�N�^�[�̏���
    ElseIf Mid(raw_number, 5, 1) = "D" Or Mid(raw_number, 5, 1) = "d" Then
        If Mid(raw_number, 1, 2) = 1 Then
            subject = Mid(raw_number, 1, 2) + 2010
        ElseIf Mid(raw_number, 1, 2) >= 2 Then
            subject = Mid(raw_number, 1, 2) + 2011
        ElseIf Mid(raw_number, 1, 2) = "61" Then
            subject = 2211
        ElseIf Mid(raw_number, 1, 2) = "62" Then
            subject = 2212
        ElseIf Mid(raw_number, 1, 2) = "51" Then
            subject = 2111
        ElseIf IsNumeric(Mid(raw_number, 1, 2)) = False Then
            If option_number = 1 Then
                stunum_error.Show
            End If
            number_valid = number_valid + 1
            translate_number = -1
            Exit Function
        Else
            subject = 2199  '���C���h�J�[�h
        End If
        If IsNumeric(Mid(raw_number, 6, 2)) = False Then
            If option_number = 1 Then
                stunum_error.Show
            End If
            number_valid = number_valid + 1
            translate_number = -1
            Exit Function
        End If
            translate_number = enter_year & subject & "0" & Mid(raw_number, 6, 2)
    ElseIf Mid(raw_number, 5, 1) = "s" Or Mid(raw_number, 5, 1) = "S" Then
        If Mid(raw_number, 1, 2) <= 10 Then
            subject = Mid(raw_number, 1, 2) + 2500
        ElseIf Mid(raw_number, 1, 2) >= 51 And Mid(raw_number, 1, 2) <= 57 Then
            subject = Mid(raw_number, 1, 2) - 40 + 2500
        ElseIf Mid(raw_number, 1, 2) = 11 Then
            subject = 2521
        ElseIf IsNumeric(Mid(raw_number, 1, 2)) = False Then
            If option_number = 1 Then
                stunum_error.Show
            End If
            number_valid = number_valid + 1
            translate_number = -1
            Exit Function
        Else
            subject = 2599 '���C���h�J�[�h
        End If
            
        If IsNumeric(Mid(raw_number, 6, 2)) = False Then
            If option_number = 1 Then
                stunum_error.Show
            End If
            number_valid = number_valid + 1
            translate_number = -1
            Exit Function
        End If
            '�T�����ڂ�S�̌������w���ɑΉ��B�߂�ǂ������̂Ŋw�Ȕԍ��̂��Ƃ������X�ɂ��邱�Ƃŉ����B�����قƂ�Ǘ��Ȃ��ł��傤
            translate_number = enter_year & subject & "9" & Mid(raw_number, 6, 2)
        ' M�ł�D�ł�S�ł��Ȃ��ꍇ�̏���
    Else
        If Mid(raw_number, 1, 2) <= 10 Then
            subject = Mid(raw_number, 1, 2) + 2500
        ElseIf Mid(raw_number, 1, 2) >= 51 And Mid(raw_number, 1, 2) <= 57 Then
            subject = Mid(raw_number, 1, 2) - 40 + 2500
        ElseIf Mid(raw_number, 1, 2) = 11 Then
            subject = 2521
        ElseIf IsNumeric(Mid(raw_number, 1, 2)) = False Then
            If option_number = 1 Then
                stunum_error.Show
            End If
            number_valid = number_valid + 1
            translate_number = -1
            Exit Function
        Else
            subject = 2599 '���C���h�J�[�h
        End If
            If IsNumeric(Mid(raw_number, 6, 2)) = False Then
                If option_number = 1 Then
                    stunum_error.Show
                End If
                number_valid = number_valid + 1
                translate_number = -1
                Exit Function
            End If
        translate_number = enter_year & subject & Mid(raw_number, 5, 3)
        
    '   �Љ���w�Ȃ����䒠�ԍ�����Ȃ̂ōŌ�ɓ���I�ɏ�����������
    End If

ElseIf Len(raw_number) = 16 Then
    
        enter_year = Mid(raw_number, 3, 2)
        subject = Mid(raw_number, 8, 4)
        translate_number = enter_year & subject & Mid(raw_number, 13, 3)
 Else
 
    If raw_number <> "" Then
    translate_number = raw_number
    
    '�e�L�X�g�{�b�N�X�ɉ������͂���Ă��ĂV���̕�����łȂ��ꍇ�͂��̂܂ܑ������
    End If

End If

If raw_number <> "" Then
'�e�L�X�g�{�b�N�X�ɉ������͂���Ă��Ȃ��ꍇ�͏������s��Ȃ�
    
    If translate_number <= 0 Then
        If option_number = 1 Then
            stunum_error.Show
        End If
        number_valid = number_valid + 1
        translate_number = -1
        ''0�ȉ������͂��ꂽ�ꍇ�̓e�L�X�g�{�b�N�X����ɂ������̓t�H�[���ɖ߂�
    Exit Function
    ElseIf IsNumeric(translate_number) = False And translate_number <> "" Then
        If option_number = 1 Then
            stunum_error.Show
        End If
        number_valid = number_valid + 1
        translate_number = -1
        Exit Function
    ElseIf Len(translate_number) <> 9 Then
        If option_number = 1 Then
            stunum_error.Show
        End If
        number_valid = number_valid + 1
        translate_number = -1
        Exit Function
    End If
End If

End Function
Public Sub keypressrestrict(ByVal KeyAscii As MSForms.ReturnInteger)
'�L�[���͂�M�AD�AS�Ɛ����ȊO�����͂ł��Ȃ��悤�ɂ��Ă�
If Chr(KeyAscii) < "0" Or Chr(KeyAscii) > "9" And Chr(KeyAscii) <> "M" And Chr(KeyAscii) <> "D" And Chr(KeyAscii) <> "m" And Chr(KeyAscii) <> "d" And Chr(KeyAscii) <> "s" And Chr(KeyAscii) <> "S" Then
    KeyAscii = 0
End If
End Sub
Public Sub cable()
'�P�[�u���݂��o��������v���V�[�W��

    Dim search_target_code As Long
    Dim result_row  As Long
    search_target_code = resreve_day * 100 + ���ԑ� * 10 + �Ȕԍ�
    result_row = WorksheetFunction.Match(search_target_code, Sheets("���f�[�^").Cells(1, data_sheet.reserve_code).EntireColumn, 1)
    If Sheets("���f�[�^").Cells(result_row, data_sheet.cable_frag).Value = 0 Then
        Sheets("���f�[�^").Cells(result_row, data_sheet.cable_frag).Value = 1
    Else
        Sheets("���f�[�^").Cells(result_row, data_sheet.cable_frag).Value = 0
    End If

End Sub
Public Sub cable_new(ByVal check As Boolean, ByVal Row As Variant)

'�V�K�\�񂵂��Ƃ��ɃP�[�u���݂��o������Ƃ��̃v���V�[�W��
If check = True Then
    Sheets("���f�[�^").Cells(Row, data_sheet.cable_frag).Value = 1
Else
    Sheets("���f�[�^").Cells(Row, data_sheet.cable_frag).Value = 0
End If

End Sub

Function res_duplicate_check(ByVal data_number As Integer, situation As Integer, count() As Integer)
'����̗\�񐔂𒴂��Ă��Ȃ����`�F�b�N����v���V�[�W��
Dim i As Integer
Dim bl_res As String
Dim limit_res_day As Integer

If IsNumeric(Range(limit_reserve_count).Value) = False Then
    limit_res_day = 36
Else
    limit_res_day = Range(limit_reserve_count).Value
End If

For i = 0 To data_number
    If count(i) >= limit_res_day - situation Then
            bl_res = MsgBox("�P���ɗ\��ł���R�}��������I�[�o�[���Ă��܂��܂��B�\��𑱂��܂����H", vbYesNo + vbQuestion, "�\��̊m�F")
                If bl_res = vbNo Then
                    res_duplicate_check = False
                    Exit Function
                Else
'                    Dim inputpass As String
'                    inputpass = InputBox("�\��𑱂���ꍇ��LA���ĂсA�p�X�R�[�h�̓��͂��˗����Ă�������", "�p�X�R�[�h�̓���")
'                    If inputpass = passcord Then
                    Dim get_pass As Integer
                    get_pass = passcord_inputform
                    If get_pass = 0 Then
                        Exit For
                    ElseIf get_pass = 1 Then
                        'MsgBox ("�p�X�R�[�h����v���܂���B�\���ʂɈړ����܂��B")
                        res_duplicate_check = False
                        Exit Function
                    ElseIf get_pass = 2 Or get_pass = 3 Then
                        res_duplicate_check = False
                        Exit Function
                    End If
                End If
    End If
Next i

res_duplicate_check = True

End Function

Function res_input_rawsheet(ByVal resrve_day_for_input As Long, ByVal time_cord As Integer, ByVal seat_number As Integer, cable As Boolean, stu_list() As Variant, data_number As Integer)
'���f�[�^�V�[�g�Ƀf�[�^����͂���v���V�[�W��
Dim resrve_code_number As Long
resrve_code_number = resrve_day_for_input * 100 + time_cord * 10 + seat_number
        
Dim search As Integer
On Error GoTo error_process
    search = WorksheetFunction.Match(resrve_code_number, Sheets("���f�[�^").Cells(1, data_sheet.reserve_code).EntireColumn, 1)
On Error GoTo 0
If resrve_code_number = WorksheetFunction.Index(Sheets("���f�[�^").Cells(1, data_sheet.reserve_code).EntireColumn, search) Then
    MsgBox ("���łɂ��̘g�̗\�񂪂��邽�ߗ\�񂪂ł��܂���BLA�Ɋm�F���˗����Ă�������(�G���[�ԍ�:�P01)")
    res_input_rawsheet = False
    Exit Function
End If
    
Sheets("���f�[�^").Rows(search + 1).Insert

Sheets("���f�[�^").Cells(search + 1, data_sheet.day_code).Value = resreve_day
Sheets("���f�[�^").Cells(search + 1, data_sheet.time_zone).Value = time_cord
Sheets("���f�[�^").Cells(search + 1, data_sheet.seat_num).Value = seat_number
Sheets("���f�[�^").Cells(search + 1, data_sheet.reserve_code).Value = resrve_code_number

Call cable_new(cable, search + 1)
Call stu_num_list_input_rawsheet(search + 1, stu_list(), data_number)

res_input_rawsheet = True
Exit Function

error_process:
search = 1
Resume Next
End Function

Function stu_num_list_input_rawsheet(ByVal Row As Integer, stu_list() As Variant, data_number)
'���f�[�^�V�[�g�Ɋw�Дԍ�����͂���v���V�[�W��

Dim Lastcolumn As Long
Dim i As Integer
Lastcolumn = Sheets("���f�[�^").Cells(Row, Columns.count).End(xlToLeft).Column + 1
For i = 0 To data_number
    Sheets("���f�[�^").Cells(Row, Lastcolumn + i).Value = stu_list(i)
Next i

Call input_res_num(stu_list(), data_number)

End Function

