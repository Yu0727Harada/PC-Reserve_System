Attribute VB_Name = "Module3"
Option Explicit
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
    �\��R�[�h = resreve_day * 100 + ���ԑ� * 10 + �Ȕԍ�
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
Public Sub cable_new(ByVal check As Boolean, ByVal Row As Variant)

'�V�K�\�񂵂��Ƃ��ɃP�[�u���݂��o������Ƃ��̃v���V�[�W��
If check = True Then
    Sheets("���f�[�^").Cells(Row, 5).Value = 1
Else
    Sheets("���f�[�^").Cells(Row, 5).Value = 0
End If

End Sub

Function res_duplicate_check(ByVal data_number As Integer, situation As Integer, count() As Integer)

Dim i As Integer
Dim bl_res As String
For i = 0 To data_number
    If count(i) >= 2 - situation Then
            bl_res = MsgBox("�P���ɗ\��ł���R�}��������I�[�o�[���Ă��܂��܂��B�\��𑱂��܂����H", vbYesNo + vbQuestion, "�\��̊m�F")
                If bl_res = vbNo Then
                    res_duplicate_check = False
                    Exit Function
                Else
                    Dim inputpass As String
                    inputpass = InputBox("�\��𑱂���ꍇ��LA���ĂсA�p�X�R�[�h�̓��͂��˗����Ă�������", "�p�X�R�[�h�̓���")
                    If inputpass = passcord Then
                        Exit For
                    ElseIf inputpass = "" Then
                        MsgBox ("�\���ʂɈړ����܂��B")
                        res_duplicate_check = False
                        Exit Function
                    Else
                        MsgBox ("�p�X�R�[�h����v���܂���B�\���ʂɈړ����܂��B")
                        res_duplicate_check = False
                        Exit Function
                    End If
                End If
    End If
Next i

res_duplicate_check = True

End Function

Function res_input_rawsheet(ByVal resrve_day_for_input As Long, ByVal time_cord As Integer, ByVal seat_number As Integer, cable As Boolean, stu_list() As Variant, data_number As Integer)

Dim resrve_code_number As Long
resrve_code_number = resrve_day_for_input * 100 + time_cord * 10 + seat_number
        
Dim search As Integer
On Error GoTo error_process
    search = WorksheetFunction.Match(resrve_code_number, Sheets("���f�[�^").Range("D:D"), 1)
On Error GoTo 0
If resrve_code_number = WorksheetFunction.Index(Sheets("���f�[�^").Range("D:D"), search) Then
    MsgBox ("���łɂ��̘g�̗\�񂪂��邽�ߗ\�񂪂ł��܂���BLA�Ɋm�F���˗����Ă�������(error code:001)")
    res_input_rawsheet = False
    Exit Function
End If
    
Sheets("���f�[�^").Rows(search + 1).Insert

Sheets("���f�[�^").Cells(search + 1, 1).Value = resreve_day
Sheets("���f�[�^").Cells(search + 1, 2).Value = time_cord
Sheets("���f�[�^").Cells(search + 1, 3).Value = seat_number
Sheets("���f�[�^").Cells(search + 1, 4).Value = resrve_code_number

Call cable_new(cable, search + 1)
Call stu_num_list_input_rawsheet(search + 1, stu_list(), data_number)

res_input_rawsheet = True
Exit Function

error_process:
search = 1
Resume Next
End Function

Function stu_num_list_input_rawsheet(ByVal Row As Integer, stu_list() As Variant, data_number)

Dim Lastcolumn As Long
Dim i As Integer
Lastcolumn = Sheets("���f�[�^").Cells(Row, Columns.count).End(xlToLeft).Column + 1
For i = 0 To data_number
    Sheets("���f�[�^").Cells(Row, Lastcolumn + i).Value = stu_list(i)
Next i
    
Call input_res_num(stu_list(), data_number)

End Function

