Attribute VB_Name = "Module1"
Public �\��� As Long
Public resreve_day As Long
Public ���ԑ� As Integer
Public �Ȕԍ� As Integer
Public �A���\�� As String
Public frag As Integer
Public number_valid As Integer
Public tm As Double
Public on_time As Integer
Public Const passcord As String = 1907
Public time_sheet As Range
Public res_table_start_row As Integer
Public res_table_start_colomn As Integer
Public res_table_width_row As Integer
Public res_table_width_colomn As Integer
Public shift_table_number_start_row As Integer
Public shift_table_number_start_colomn As Integer
Public shift_table_time_start_row As Integer
Public shift_table_time_start_colomn As Integer
Public shift_table_date_start_row As Integer

Enum shift_table
'�ǂݍ��񂾃V�t�g�\�̗�̈ʒu���ォ�珸���ŐU�蕪��
�Ζ����ԑъJ�n = 1
�Ζ����ԑяI��
�Ζ�No
End Enum

Public Sub setting_time()

Dim now_time As Date

'�Ⴄ�u�b�N���Ђ炢�č�Ƃ��Ă���ꍇ�̓��C���V�[�g��������Ȃ����߃G���[�ɂȂ�̂ŁA�G���[���
On Error GoTo sheet_cal_error
now_time = time_sheet.Value
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
Public Sub sheet_color_check()
'On Error GoTo error
'now_time = time_sheet.Value
'On Error GoTo 0

Dim �F�Z����Row As Integer
Dim �F�Z����column As Integer

�F�Z����Row = res_table_start_row
�F�Z����column = res_table_start_colomn

Call setting_time

With Sheets("���C��")
Do While �F�Z����column < res_table_start_colomn + res_table_width_colomn
    Do While �F�Z����Row < res_table_start_row + res_table_width_row
        If on_time >= �F�Z����column And .Range("K2") = Date Then
            If .Cells(�F�Z����Row, �F�Z����column).Text = "�\���" Then
                .Cells(�F�Z����Row, �F�Z����column).Interior.Color = RGB(104, 109, 37) '���F�i�e�j
            ElseIf InStr(.Cells(�F�Z����Row, �F�Z����column).Text, "�ݏo��") > 0 Then
                .Cells(�F�Z����Row, �F�Z����column).Interior.Color = RGB(104, 73, 37) '�I�����W�i�e�j
            ElseIf .Cells(�F�Z����Row, �F�Z����column).Text = "" Then
                .Cells(�F�Z����Row, �F�Z����column).Interior.Color = RGB(104, 115, 123) '�e
            Else
        '        If Cells(�F�Z����Row, �F�Z����column).Text <> "" And Cells(�F�Z����Row, �F�Z����column).Text <> "�\���" And Cells(�F�Z����Row, �F�Z����column).Text <> "�\���(�ݏo��)" Then
                .Cells(�F�Z����Row, �F�Z����column).Interior.Color = RGB(73, 106, 121) '���F�i�e�j
    '           �ǂ�ɂ����Ă͂܂�Ȃ��ꍇ�̐F�ݒ�
            End If
        Else
            If .Cells(�F�Z����Row, �F�Z����column).Text = "�\���" Then
                .Cells(�F�Z����Row, �F�Z����column).Interior.Color = RGB(255, 240, 76) '���F
            ElseIf InStr(.Cells(�F�Z����Row, �F�Z����column).Text, "�ݏo��") > 0 Then
                .Cells(�F�Z����Row, �F�Z����column).Interior.Color = RGB(255, 160, 76) '�I�����W
            ElseIf .Cells(�F�Z����Row, �F�Z����column).Text = "" Then
                .Cells(�F�Z����Row, �F�Z����column).Interior.Color = xlNone '����
            Else
        '        If Cells(�F�Z����Row, �F�Z����column).Text <> "" And Cells(�F�Z����Row, �F�Z����column).Text <> "�\���" And Cells(�F�Z����Row, �F�Z����column).Text <> "�\���(�ݏo��)" Then
                .Cells(�F�Z����Row, �F�Z����column).Interior.Color = RGB(180, 235, 250) '���F
    '           �ǂ�ɂ����Ă͂܂�Ȃ��ꍇ�̐F�ݒ�
            End If
        End If
        
        �F�Z����Row = �F�Z����Row + 1
    
'    �Ȕԍ��P�`�T�܂ł̒��g���݂Čv�Z
    
    Loop

�F�Z����Row = res_table_start_row
�F�Z����column = �F�Z����column + 1
'�Ȕԍ��͂S��ڂɖ߂��Ď��̎��ԑт̌v�Z�Ɉڂ�

Loop

End With

Exit Sub

'error:
'
'Exit Sub

End Sub

Public Sub shift_check()
On Error GoTo sheet_cal_error
Worksheets("���C��").EnableCalculation = False
Dim now_time As Date
now_time = Time 'Time�͂o�b��̎���
On Error GoTo 0

Dim i As Integer

'���̎��Ԃ��R�O����؂�̋ߕӂ����f����if���Bnow time�ϐ��ɂ̓V���A�����������Ă���B�V���A�����͈�����P�Ȃ̂ŁA�R�O���͂P�^�S�W�B
'i��0����48�܂ő�����Ă��ׂĂ̎����ɂ����ĂO�O�������邢�͂R�O�����炻�̌��1/24/60�i���̏ꍇ�P���j�̊Ԃɍ��̎����������Ă��Ȃ������ׂ�B
'�����V�t�g���`�F�b�N����Əd������C�������̂�30����؂�ɂ�������s���Ă��債�ď����̏d���͕ς��Ȃ��C������B
'�����ƌ���������������C�����邪doble�^�Ŗ񐔂��ǂ����̔��f����̂��|�������̂ŋ𒼂Ɏ��������B
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

Worksheets("���C��").EnableCalculation = True
sheet_cal_error:
Exit Sub
End Sub

Public Sub shift_output_mainsheet(ByVal now_time As Date)
Worksheets("���C��").EnableCalculation = False
Dim j As Integer
Dim now_date As Date
Dim search As Integer
Dim end_time As Date
Dim start_time As Date
Dim Shift(4) As Integer
Dim shp As Shape
Dim rng As Range
Dim k As Integer
j = 0
Dim shift_time_end As Range
Set shift_time_end = Sheets("�V�t�g�\").Columns(�Ζ����ԑяI��)

   now_date = Date 'Date�̓R���s���[�^�[��̓��t
   On Error GoTo sheet_cal_error
    search = WorksheetFunction.Match(CDbl(now_date), shift_time_end, 1) + 1 '   CDbl�Ō^��ϊ����Ȃ��Ƃ��܂�match�����ł��Ȃ��
    On Error GoTo 0
    If Int(now_date) <> Int(WorksheetFunction.Index(shift_time_end, search)) Then 'doble�^���Ǝ����܂Ŋ܁AInt�^�Ȃ���t�݂̂ɂȂ�
        
            k = 0
            For k = 0 To 1
                If Cells(1, 15 + k).Value <> Shift(k) Then
                    Cells(1, 15 + k).Value = Shift(k)
                    
                    For Each shp In Sheets("���C��").Shapes
                        Set rng = Range(shp.TopLeftCell, shp.BottomRightCell)
                        If Not (Intersect(rng, Sheets("���C��").Range(Cells(4 + k * 3, 11), Cells(4 + k * 3, 11))) Is Nothing) Then
                            shp.Delete
                        End If
                    Next
                End If
            Next k
    Exit Sub
    Else
        Do While now_date = Int(WorksheetFunction.Index(Sheets("�V�t�g�\").Range("B:B"), search))
            end_time = WorksheetFunction.Index(Sheets("�V�t�g�\").Range("B:B"), search) - now_date
            start_time = WorksheetFunction.Index(Sheets("�V�t�g�\").Range("A:A"), search) - now_date
            If now_time < end_time And now_time > start_time Then
                Shift(j) = WorksheetFunction.Index(Sheets("�V�t�g�\").Range("C:C"), search)
                j = j + 1
            End If
            search = search + 1
        Loop
            Dim L As Integer
            L = 0
            For L = 0 To 2
                If Cells(1, 15 + L).Value <> Shift(k) Then
                    Cells(1, 15 + L).Value = Shift(k)
                    
                    For Each shp In Sheets("���C��").Shapes
                        Set rng = Range(shp.TopLeftCell, shp.BottomRightCell)
                        If Not (Intersect(rng, Sheets("���C��").Range(Cells(4 + L * 3, 11), Cells(4 + L * 3, 11))) Is Nothing) Then
                            shp.Delete
                        End If
                    Next
                    Sheets("�o��").Cells(Shift(L) + 1, 2).CopyPicture
                    Sheets("���C��").Paste Cells(4 + L * 3, 11)
                End If
            Next L

    End If
Exit Sub
sheet_cal_error:
search = 2
Resume Next

'        Dim m As Integer
'            m = 0
'            For m = 0 To 1
'                If Cells(1, 15 + m).Value <> shift(m) Then
'                    Cells(1, 15 + m).Value = shift(m)
'
'                    For Each shp In Sheets("���C��").Shapes
'                        Set rng = Range(shp.TopLeftCell, shp.BottomRightCell)
'                        If Not (Intersect(rng, Sheets("���C��").Range(Cells(4 + m * 3, 11), Cells(4 + m * 3, 11))) Is Nothing) Then
'                            shp.Delete
'                        End If
'                    Next
'                    End If
'            Next m
                
End Sub

Public Sub recal()

Application.Calculate
'�V�[�g�̍Čv�Z���s��
Call shift_check
tm = now() + TimeValue("00:01:00")
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
