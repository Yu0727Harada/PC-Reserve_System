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
Public passcord_input As Variant

Public Const passcord As String = 1907

Public Const time_sheet As String = "L2" '�����Z���̈ʒu
Public Const date_sheet As String = "K2" '���t�Z���̈ʒu
Public Const master_on_off As String = "T4" '�}�X�^�[���̓��[�h�̃I���I�t���L�q���Ă�Z���̈ʒu
Public Const cell_corsor_move As String = "T5" '�����J�[�\���ړ��I���I�t���L�q���Ă�Z���̈ʒu
Public Const corsor_move_target As String = "B12" '�����J�[�\���ړ��̈ړ���
Public Const limit_reserve_count As String = "T14" '����̗\����������͂��Ă���Z���̈ʒu
Public Const limit_res_on_off As String = "T16" '�\�񐧌����[�h�̃I���I�t
Public Const res_table_start_row As Integer = 4 '�\��\�̊J�n�ʒu�i����Z���j
Public Const res_table_start_colomn As Integer = 3 '�\��\�̊J�n�ʒu
Public Const res_table_width_row As Integer = 5 '�\��\�̒������Ȕԍ��̐�
Public Const res_table_width_colomn As Integer = 7 '�\��\�̂Ȃ��������p���Ԃ̋�Ԑ�
Public Const now_shift_number_row As Integer = 7 'LA�R���g���[�������̌��݂̃V�t�gNo��\������Z���̍s�̈ʒu
Public Const now_shift_number_column As Integer = 20 '��̗�̈ʒu�B����͂��̍��ɏ��ɕ\������܂�
Public Const on_time_output As String = "AA3"

Public Const now_shift_menber_profile_output_row As Integer = 5 '�v���t�B�[����\������Z���̍s
Public Const now_shift_menber_profile_output_column As Integer = 11 '��̗�
Public Const now_shift_menber_profile_output_row_move As Integer = 3 '��l�ڂ�\������Ƃ��ɂ����ړ������s�ɕ\�����邩
Public Const now_shift_menber_profile_output_column_move As Integer = 0 '��̗�o�[�W����

Public Const shift_table_number_start_row As Integer = 4 '�Ζ��i���o�[�̊J�n�ʒu�B�����͋󔒂̃Z�����o��܂ŏ�������̂Őݒ肵�Ȃ��Ă��悢�B��No�ɒ����Z���ɂɉ����u���Ƃ����܂ŏ������܂�
Public Const shift_table_number_start_colomn As Integer = 1
Public Const shift_table_time_start_row As Integer = 4 '�P�R�|�P�S�Ȃǂ̃V�t�g����͂���Z���̊J�n�ʒu�B������No��̒����܂ŏ�������
Public Const shift_table_time_start_colomn As Integer = 3
Public Const shift_table_date_start_row As Integer = 2 '���t����͂��Ă���ʒu�B���ꂪ�󔒂ɂȂ�܂ŃV�t�g�̓ǂݍ��݂𑱂���


Enum shift_table
'�ǂݍ��񂾃V�t�g�\�̗�̈ʒu���ォ�珸���ŐU�蕪��
�Ζ����ԑъJ�n = 1
�Ζ����ԑяI��
�Ζ�No
End Enum

Public Sub setting_sheet()
'�V�[�g���Ђ炢���Ƃ��Ɏ����Ŏ��s�����v���V�[�W��

'�V�[�g�̕ی�
Call Sheets("���C��").Protect(UserInterfaceOnly:=True)
Call sheet_color_check

End Sub

Public Sub setting_time()
'���݂̎������R�}���Ƃɂ����ꍇ�����ɂȂ邩���͂���v���V�[�W��

Dim now_time As Date

'�Ⴄ�u�b�N���Ђ炢�č�Ƃ��Ă���ꍇ�̓��C���V�[�g��������Ȃ����߃G���[�ɂȂ�̂ŁA�G���[���
On Error GoTo sheet_cal_error
now_time = Sheets("���C��").Range(time_sheet).Value
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

'Time��p����΃R���s���[�^�[���v�����ɤ
'�ϐ�now_time���g���΃Z���ł�����܂�

Sheets("���C��").Range(on_time_output).Value = on_time

Exit Sub


sheet_cal_error:
Exit Sub
End Sub
Public Sub sheet_color_check()
'�\�ɓ��͂���Ă���e�L�X�g�ɏ]���ăZ���̔w�i�F��ݒ肷��v���V�[�W��

'On Error GoTo error
'now_time = time_sheet.Value
'On Error GoTo 0

Dim �F�Z����Row As Integer
Dim �F�Z����column As Integer

�F�Z����Row = res_table_start_row
�F�Z����column = res_table_start_colomn

Call setting_time

On Error GoTo Sheet_protect_error

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
                .Cells(�F�Z����Row, �F�Z����column).Interior.Color = RGB(180, 235, 250) '���F
    '           �ǂ�ɂ����Ă͂܂�Ȃ��ꍇ�̐F�ݒ�
            End If
        End If
        On Error GoTo 0
        
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
Sheet_protect_error:
MsgBox ("�V�[�g���ی삳��Ă��邽�߁A�Z���̔w�i�F��ύX�ł��܂���B�}�j���A���̃G���[�ԍ��O�O�Q���݂đΏ����Ă�������")
Exit Sub

End Sub

Public Sub shift_check()
'���݂̃V�t�g���X�V����ׂ������f����v���V�[�W��

On Error GoTo sheet_cal_error
'Worksheets("���C��").EnableCalculation = False
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
End If
Next i

Worksheets("���C��").EnableCalculation = True
sheet_cal_error:
Exit Sub
End Sub

Public Sub shift_output_mainsheet(ByVal now_time As Date)
'���݂̃V�t�g���擾���āA�V�t�g�̕ύX����������V�t�g��\������Z���̃I�u�W�F�N�g���폜���Ă��炽�Ƀv���t�B�[�����o�͂���

'Worksheets("���C��").EnableCalculation = False
Dim j As Integer
Dim now_date As Date
Dim search As Integer
Dim end_time As Date
Dim start_time As Date
Dim Shift(15) As Integer
Dim shp As Shape
Dim rng As Range
Dim k As Integer
Dim L As Integer
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
                If Cells(now_shift_number_row, now_shift_number_column + k).Value <> Shift(k) Then
                    Cells(now_shift_number_row, now_shift_number_column + k).Value = Shift(k)
                    Call shapes_delete(Sheets("���C��").Range(Cells(now_shift_menber_profile_output_row + L * now_shift_menber_profile_output_row_move, now_shift_menber_profile_output_column + L * now_shift_menber_profile_output_column_move), Cells(now_shift_menber_profile_output_row + L * now_shift_menber_profile_output_row_move, now_shift_menber_profile_output_column + L * now_shift_menber_profile_output_column_move)))
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

            L = 0
            For L = 0 To 1
                If Cells(now_shift_number_row, now_shift_number_column + L).Value <> Shift(L) Then
                    Cells(now_shift_number_row, now_shift_number_column + L).Value = Shift(L)
                    On Error GoTo object_error
                    Call shapes_delete(Sheets("���C��").Range(Cells(now_shift_menber_profile_output_row + L * now_shift_menber_profile_output_row_move, now_shift_menber_profile_output_column + L * now_shift_menber_profile_output_column_move), Cells(now_shift_menber_profile_output_row + L * now_shift_menber_profile_output_row_move, now_shift_menber_profile_output_column + L * now_shift_menber_profile_output_column_move)))
                    On Error GoTo 0
                    Sheets("�o��").Cells(Shift(L) + 1, 2).CopyPicture
                    Sheets("���C��").Paste Cells(now_shift_menber_profile_output_row + L * now_shift_menber_profile_output_row_move, now_shift_menber_profile_output_column + L * now_shift_menber_profile_output_column_move)
                End If
            Next L

    End If

Sheets("���C��").Range(corsor_move_target).Select
Exit Sub
sheet_cal_error:
search = 2
Resume Next
object_error:
Exit Sub
                
End Sub

Function shapes_delete(ByVal delete_area As Range)
'�Ώۂ͈̔͂ɂ���}�`���폜�B�������}�`�̖��O��state�̏ꍇ�͍폜���Ȃ�

For Each shp In Sheets("���C��").shapes
    Set rng = Range(shp.TopLeftCell, shp.BottomRightCell)
    If shp.Name <> "state" Then
        If Not (Intersect(rng, delete_area) Is Nothing) Then
            shp.Delete
        End If
    End If
Next

End Function


Public Sub recal()
'����I�ɃV�[�g�̍Čv�Z���s�����߂̃v���V�[�W��
If Worksheets("���C��").EnableCalculation = False Then
    Worksheets("���C��").EnableCalculation = True
End If
Application.Calculate
'�V�[�g�̍Čv�Z���s��
Call shift_check
tm = now() + TimeValue("00:01:00")
Application.OnTime EarliestTime:=tm, Procedure:="recal", Schedule:=True
'tm�ϐ��Ɉꕪ����Z�b�g
'ontime�֐��ňꕪ��ɂ܂�recal�v���V�[�W�������s
'�Ȃ����V�[�g���W���[����recal�v���V�[�W���������Ƃ��܂������Ȃ�

End Sub

Function passcord_inputform()

passcordform.Show

End Function
