Attribute VB_Name = "Module1"
Option Explicit

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
Public Const save_on_off As String = "P13" '����I�ɃZ�[�u���邩�ǂ����L�q���Ă�Z���̈ʒu
Public Const corsor_move_target As String = "B12" '�����J�[�\���ړ��̈ړ���
Public Const limit_reserve_count As String = "T14" '����̗\����������͂��Ă���Z���̈ʒu
Public Const limit_res_on_off As String = "T16" '�\�񐧌����[�h�̃I���I�t
Public Const res_table_start_row As Integer = 4 '�\��\�̊J�n�ʒu�i����Z���j
Public Const res_table_start_colomn As Integer = 3 '�\��\�̊J�n�ʒu
Public Const res_table_width_row As Integer = 5 '�\��\�̒������Ȕԍ��̐�
Public Const res_table_width_colomn As Integer = 7 '�\��\�̂Ȃ��������p���Ԃ̋�Ԑ�
Public Const now_shift_number_row As Integer = 7 'LA�R���g���[�������̌��݂̃V�t�gNo��\������Z���̍s�̈ʒu
Public Const now_shift_number_column As Integer = 20 '��̗�̈ʒu�B����͂��̍��ɏ��ɕ\������܂�
Public Const on_time_output As String = "AC2" '���ԑуR�[�h�̓���Z��
Public Const time_for_dup_sheet As String = "AE4" '�\�񂵂Ă���ԍ���\������\�̎����ݒ�

Public Const now_shift_menber_profile_output_row As Integer = 5 '�v���t�B�[����\������Z���̍s
Public Const now_shift_menber_profile_output_column As Integer = 11 '��̗�
Public Const now_shift_menber_profile_output_row_move As Integer = 3 '��l�ڂ�\������Ƃ��ɂ����ړ������s�ɕ\�����邩
Public Const now_shift_menber_profile_output_column_move As Integer = 0 '��̗�o�[�W����
Public Const shift_profile_count As Integer = 2 '�\������v���t�B�[���������ɂ��邩
Public Const profile_height As Integer = 180 '�o�̓V�[�g�̍s�̍���

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


'Public Sub setting_time()
Function setting_time(ByVal now_time As Date)
'���݂̎������R�}���Ƃɂ����ꍇ�����ɂȂ邩���͂���v���V�[�W��

'�Ⴄ�u�b�N���Ђ炢�č�Ƃ��Ă���ꍇ�̓��C���V�[�g��������Ȃ����߃G���[�ɂȂ�̂ŁA�G���[���
'On Error GoTo sheet_cal_error
'now_time = Sheets("���C��").Range(time_sheet).Value
'On Error GoTo 0

'���݂̎����i���C���V�[�g�ɓ����Ă��鎞���j��PC�̐ݒ莞���ł͂Ȃ��@�̎��ԑуR�[�h��Ԃ��B�����͎����̃V���A���l
If now_time < 0.375 Then '-9:00
    setting_time = 0
ElseIf 0.375 < now_time And now_time < 0.4375 Then '9:00-10:30
    setting_time = 1
ElseIf 0.4375 < now_time And now_time <= 0.50694444 Then '10:30-12:10
    setting_time = 2
ElseIf 0.5069444 < now_time And now_time <= 0.5416 Then '12:10-13:00
    setting_time = 3
ElseIf 0.5416 < now_time And now_time <= 0.60416 Then '13:00-14:30
    setting_time = 4
ElseIf 0.60416 < now_time And now_time <= 0.6736 Then '14:30-16:10
    setting_time = 5
ElseIf 0.6736 < now_time And now_time <= 0.74305 Then '16:10-17:50
    setting_time = 6
ElseIf 0.74305 < now_time And now_time <= 0.79166 Then '17:50-19:00
    setting_time = 7
ElseIf 0.79166 < now_time Then '19:00-
    setting_time = 8
End If

'Time��p����΃R���s���[�^�[���v�����ɤ
'�ϐ�now_time���g���΃Z���ł�����܂�
'
'Sheets("���C��").Range(on_time_output).Value = on_time
'Sheets("���C��").Range(time_for_dup_sheet).Value = on_time

Exit Function


sheet_cal_error:
Exit Function
End Function

Function get_view_string(ByVal time_number As Integer)

If Range(date_sheet).Value = Date Then
    If time_number > Sheets("���C��").Range(on_time_output).Value Then
        get_view_string = "�\���"
    ElseIf time_number = Sheets("���C��").Range(on_time_output).Value Then
        get_view_string = "�g�p��"
    Else
        get_view_string = "�g�p��"
    End If
ElseIf Range(date_sheet).Value > Date Then
    get_view_string = "�\���"
ElseIf Range(date_sheet).Value < Date Then
    get_view_string = "�g�p��"
End If

End Function


Public Sub sheet_color_check()
'�\�ɓ��͂���Ă���e�L�X�g�ɏ]���ăZ���̔w�i�F��ݒ肷��v���V�[�W��

'On Error GoTo error
'now_time = time_sheet.Value
'On Error GoTo 0

Dim �F�Z����Row As Integer
Dim �F�Z����column As Integer

�F�Z����Row = res_table_start_row
�F�Z����column = res_table_start_colomn

'Call setting_time


On Error GoTo diffrent_book
With Sheets("���C��")
Do While �F�Z����column < res_table_start_colomn + res_table_width_colomn
    Do While �F�Z����Row < res_table_start_row + res_table_width_row
        On Error GoTo Sheet_protect_error
        If Sheets("���C��").Range(on_time_output).Value > �F�Z����column - 2 And .Range("K2") = Date Then
            If InStr(.Cells(�F�Z����Row, �F�Z����column).Text, "�\���") > 0 Then
                .Cells(�F�Z����Row, �F�Z����column).Interior.Color = RGB(104, 109, 37) '���F�i�e�j
            ElseIf InStr(.Cells(�F�Z����Row, �F�Z����column).Text, "�g�p��") > 0 And InStr(.Cells(�F�Z����Row, �F�Z����column).Text, "�ݏo��") > 0 Then
                .Cells(�F�Z����Row, �F�Z����column).Interior.Color = RGB(104, 37, 37) '�ԁi�e�j
            ElseIf .Cells(�F�Z����Row, �F�Z����column).Text = "�g�p��" Then
                .Cells(�F�Z����Row, �F�Z����column).Interior.Color = RGB(104, 73, 37) '�I�����W�i�e�j
            ElseIf .Cells(�F�Z����Row, �F�Z����column).Text = "" Then
                .Cells(�F�Z����Row, �F�Z����column).Interior.Color = RGB(104, 115, 123) '�e
            Else
                .Cells(�F�Z����Row, �F�Z����column).Interior.Color = RGB(73, 106, 121) '���F�i�e�j
    '           �ǂ�ɂ����Ă͂܂�Ȃ��ꍇ�̐F�ݒ�
            End If
        Else
            If InStr(.Cells(�F�Z����Row, �F�Z����column).Text, "�\���") > 0 Then
                .Cells(�F�Z����Row, �F�Z����column).Interior.Color = RGB(255, 240, 76) '���F
            ElseIf (InStr(.Cells(�F�Z����Row, �F�Z����column).Text, "�g�p��") > 0 Or InStr(.Cells(�F�Z����Row, �F�Z����column).Text, "�g�p��") > 0) And InStr(.Cells(�F�Z����Row, �F�Z����column).Text, "�ݏo��") > 0 Then
                .Cells(�F�Z����Row, �F�Z����column).Interior.Color = RGB(255, 82, 77) '��
            ElseIf .Cells(�F�Z����Row, �F�Z����column).Text = "�g�p��" Or .Cells(�F�Z����Row, �F�Z����column).Text = "�g�p��" Then
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
On Error GoTo 0

Exit Sub

'error:
'
'Exit Sub
Sheet_protect_error:
MsgBox ("�V�[�g���ی삳��Ă��邽�߁A�Z���̔w�i�F��ύX�ł��܂���B�}�j���A���̃G���[�ԍ��O�O�Q���݂đΏ����Ă�������")
Exit Sub

diffrent_book:
Exit Sub
End Sub

Public Sub shift_check()
'���݂̃V�t�g���X�V����ׂ������f����v���V�[�W��

On Error GoTo sheet_cal_error
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


sheet_cal_error:
Exit Sub
End Sub

Public Sub shift_output_mainsheet(ByVal now_time As Date)
'���݂̃V�t�g���擾���āA�V�t�g�̕ύX����������V�t�g��\������Z���̃I�u�W�F�N�g���폜���Ă��炽�Ƀv���t�B�[�����o�͂���

'Dim now_date As Date
'Dim search As Integer
'Dim end_time As Date
'Dim start_time As Date
Dim shift() As Integer
Dim shift_row_list() As Integer
'Dim j As Integer

'ReDim Preserve shift(0)
'Dim shift_time_end As Range

'On Error GoTo object_error
'Set shift_time_end = Sheets("�V�t�g�\").Columns(�Ζ����ԑяI��)
'On Error GoTo 0
'j = 0

'   now_date = Date 'Date�̓R���s���[�^�[��̓��t
'   On Error GoTo sheet_cal_error
'    search = WorksheetFunction.Match(CDbl(now_date), shift_time_end, 1) + 1 '   CDbl�Ō^��ϊ����Ȃ��Ƃ��܂�match�����ł��Ȃ��
'    On Error GoTo 0
'    If Int(now_date) <> Int(WorksheetFunction.Index(shift_time_end, search)) Then 'doble�^���Ǝ����܂Ŋ܁AInt�^�Ȃ���t�݂̂ɂȂ�
'
'    Else '���t����v�����ꍇ�A���Ȃ킿�����̃V�t�g���ɂイ��傭����Ă����΂���
'        Do While now_date = Int(WorksheetFunction.Index(Sheets("�V�t�g�\").Range("B:B"), search)) '
'            end_time = WorksheetFunction.Index(Sheets("�V�t�g�\").Range("B:B"), search) - now_date
'            start_time = WorksheetFunction.Index(Sheets("�V�t�g�\").Range("A:A"), search) - now_date
'            If now_time < end_time And now_time > start_time Then
'                ReDim Preserve shift(j + 1)
'                shift(j) = WorksheetFunction.Index(Sheets("�V�t�g�\").Range("C:C"), search)
'                j = j + 1
'                If j > 5 Then '�V�t�g�l�����T�l��葽���ꍇ�̓��[�v�𔲂���
'                    Exit Do
'                End If
'            End If
'            search = search + 1
'        Loop
'
'    End If
            
   Call get_shift(Time, Date, shift(), shift_row_list())
    
    Dim profile_count As Integer '�\�������v���t�B�[���̐����L�^
    profile_count = 0
    
    Dim k As Integer
    Dim L As Integer
 
    Dim shift_row As Integer
    
    For k = 0 To shift_profile_count  '�\������Ă���v���t�B�[�����폜
            On Error GoTo object_error
            Call Sheets("���C��").Unprotect
            Call shapes_delete(Sheets("���C��").Range(Cells(now_shift_menber_profile_output_row + k * now_shift_menber_profile_output_row_move, now_shift_menber_profile_output_column + k * now_shift_menber_profile_output_column_move), Cells(now_shift_menber_profile_output_row + k * now_shift_menber_profile_output_row_move, now_shift_menber_profile_output_column + k * now_shift_menber_profile_output_column_move)), Sheets("���C��"), True)
            Call Sheets("���C��").protect(UserInterfaceOnly:=True)
            On Error GoTo 0
    Next k
    
    If UBound(shift) = 0 Then '�V�t�g�z��̗v�f�����O���ǂ���
        On Error GoTo nothingzero
        shift_row = WorksheetFunction.Match(0, Sheets("�o��").Cells(1, 1).EntireColumn, 1)
        On Error GoTo 0
            If 0 = WorksheetFunction.Index(Sheets("�o��").Cells(1, 1).EntireColumn, shift_row) Then '�V�t�g���O��������ԍ��O�̃v���t�B�[����\���B�O�̃v���t�B�[�����Ȃ��Ȃ�\�����Ȃ�
                Sheets("�o��").Cells(shift_row, 2).CopyPicture
                Sheets("���C��").Paste Cells(now_shift_menber_profile_output_row, now_shift_menber_profile_output_column)
            End If
    Else
        'Call Quick_sort_single(Shift(), 0, UBound(Shift))
        For L = 0 To UBound(shift) '�V�t�g�z��̗v�f��������
            'If Cells(now_shift_number_row, now_shift_number_column + L).Value <> Shift(L) Then '�V�t�g�ԍ��̕ω����Ȃ��Ȃ�ȉ��̑���͂��Ȃ�
                Cells(now_shift_number_row, now_shift_number_column + L).Value = shift(L)
                
                If profile_count < shift_profile_count And shift(L) <> 0 Then '�܂��v���t�B�[���\�������ݒ�ȉ����V�t�g�ԍ����O�ȊO�Ȃ�ȉ��̏������s��
                    shift_row = WorksheetFunction.Match(shift(L), Sheets("�o��").Cells(1, 1).EntireColumn, 1)
                    If shift(L) <> WorksheetFunction.Index(Sheets("�o��").Cells(1, 1).EntireColumn, shift_row) Then
                        MsgBox ("�G���[�ԍ��Q�O�Q�@�ԍ����o�̓V�[�g�ɑ��݂��܂���B���̂܂܏��������s���܂�")
                    Else
                        Sheets("�o��").Cells(shift_row, 2).CopyPicture
                        Sheets("���C��").Paste Cells(now_shift_menber_profile_output_row + profile_count * now_shift_menber_profile_output_row_move, now_shift_menber_profile_output_column + profile_count * now_shift_menber_profile_output_column_move)
                        profile_count = profile_count + 1
                    End If
                End If
            'End If
        Next L
    End If
    
'            �\�������v���t�B�[���̐�������Ă��Ȃ��悤�Ȃ炷�łɕ\�����Ă���Ƃ�����폜
'    For k = profile_count To shift_profile_count   '�\������Ă���v���t�B�[�����폜
'        Call shapes_delete(Sheets("���C��").Range(Cells(now_shift_menber_profile_output_row + k * now_shift_menber_profile_output_row_move, now_shift_menber_profile_output_column + k * now_shift_menber_profile_output_column_move), Cells(now_shift_menber_profile_output_row + k * now_shift_menber_profile_output_row_move, now_shift_menber_profile_output_column + k * now_shift_menber_profile_output_column_move)))
'    Next k
'
'

Dim m As Integer
m = UBound(shift) '�O�ɕ\�����Ă����V�t�g�̐l�������̃V�t�g�̐l��������������O�̃V�t�g�̃R���g���[���p�l���̗v�f�����폜
Do While Cells(now_shift_number_row, now_shift_number_column + m) <> ""
    Cells(now_shift_number_row, now_shift_number_column + m).Value = ""
    m = m + 1
Loop


Sheets("���C��").Range(corsor_move_target).Select
Exit Sub

object_error:
Exit Sub

nothingzero:
shift_row = 1
Resume Next
                
End Sub

Sub get_shift(ByVal now_time As Date, now_date As Date, ByRef shift() As Integer, ByRef shift_row() As Integer)

Dim search As Integer
Dim end_time As Date
Dim start_time As Date
Dim j As Integer
Dim shift_time_end As Range

On Error GoTo object_error
Set shift_time_end = Sheets("�V�t�g�\").Columns(shift_table.�Ζ����ԑяI��)
On Error GoTo 0
ReDim Preserve shift(0)
ReDim Preserve shift_row(0)
On Error GoTo sheet_cal_error
search = WorksheetFunction.Match(CDbl(now_date), shift_time_end, 1) + 1 '   CDbl�Ō^��ϊ����Ȃ��Ƃ��܂�match�����ł��Ȃ��
On Error GoTo 0
If Int(now_date) <> Int(WorksheetFunction.Index(shift_time_end, search)) Then 'doble�^���Ǝ����܂Ŋ܁AInt�^�Ȃ���t�݂̂ɂȂ�
 
Else '���t����v�����ꍇ�A���Ȃ킿�����̃V�t�g���ɂイ��傭����Ă����΂���
     j = 0
     Do While now_date = Int(WorksheetFunction.Index(Sheets("�V�t�g�\").Range("B:B"), search)) '
         end_time = WorksheetFunction.Index(Sheets("�V�t�g�\").Range("B:B"), search) - now_date
         start_time = WorksheetFunction.Index(Sheets("�V�t�g�\").Range("A:A"), search) - now_date
         If now_time < end_time And now_time > start_time Then
             ReDim Preserve shift(j + 1)
             ReDim Preserve shift_row(j + 1)
             shift(j) = WorksheetFunction.Index(Sheets("�V�t�g�\").Range("C:C"), search)
             shift_row(j) = search
             j = j + 1
             If j > 5 Then '�V�t�g�l�����T�l��葽���ꍇ�̓��[�v�𔲂���
                 Exit Do
             End If
         End If
         search = search + 1
     Loop

End If


Exit Sub
sheet_cal_error:
search = 2
Resume Next
object_error:
Exit Sub
End Sub

Public Sub shapes_delete(ByVal delete_area As Range, book_sheet As Object, range_in As Boolean)
'�Ώۂ͈̔͂ɂ���}�`���폜�B�������}�`�̖��O��state�̏ꍇ�͍폜���Ȃ�
'�Ăяo���̍ۂɍ폜�Ώۂ̃V�[�g���A�N�e�B�u�ɂȂ��Ă��Ȃ��ƃG���[���ł�B
Dim shp As Shape
Dim rng As Range



For Each shp In book_sheet.shapes
    Set rng = Range(shp.TopLeftCell, shp.BottomRightCell)
    If shp.name <> "state" Then
        If range_in = True Then
            If Not (Intersect(rng, delete_area) Is Nothing) Then
                shp.Delete
            End If
        Else
            If Intersect(rng, delete_area) Is Nothing Then
                shp.Delete
            End If
        End If
    End If
Next


End Sub


Public Sub recal()
If Range(save_on_off).Value = "on" Then
    Application.ThisWorkbook.Save
End If

'����I�ɃV�[�g�̍Čv�Z���s�����߂̃v���V�[�W��
Application.Calculate
'�V�[�g�̍Čv�Z���s��
Call shift_check
' Application.Calculate
'Call setting_time
Call sheet_color_check
Application.Calculate


tm = now() + TimeValue("00:01:00")
Application.OnTime EarliestTime:=tm, Procedure:="recal", Schedule:=True
'tm�ϐ��Ɉꕪ����Z�b�g
'ontime�֐��ňꕪ��ɂ܂�recal�v���V�[�W�������s
'�Ȃ����V�[�g���W���[����recal�v���V�[�W���������Ƃ��܂������Ȃ�

End Sub
 
Private Sub Auto_open()
Application.Calculate
If ActiveSheet.name = "���C��" Then
    Call shift_output_mainsheet(Time)
    Call Sheets("���C��").protect(UserInterfaceOnly:=True) '�V�[�g�̕ی�
    Call sheet_color_check
    Call recal
End If

End Sub

Function passcord_inputform()
'0 = true 1=false 2="" 3=�~
passcordform.Show
If passcord_input = passcord Then
    passcord_inputform = 0
    Exit Function
End If

Dim search As Integer
Dim trans_passcord_input As Variant

trans_passcord_input = translate_number(passcord_input, 0)
On Error GoTo error_nothing
search = WorksheetFunction.Match(Int(trans_passcord_input), Sheets("passcord").Cells(1, 1).EntireColumn, 1)
On Error GoTo 0

If Int(trans_passcord_input) = WorksheetFunction.Index(Sheets("passcord").Cells(1, 1).EntireColumn, search) Then
    passcord_inputform = 0
ElseIf passcord_input = "" Then
    MsgBox ("�p�X�R�[�h����͂��Ă�������")
    passcord_inputform = 2
ElseIf passcord_input = -1 Then
    passcord_inputform = 3
    '�~�{�^���������ꂽ�ꍇ
Else
    MsgBox ("�p�X�R�[�h����v���܂���")
    passcord_inputform = 1
End If


Exit Function

error_nothing:

search = 1
Resume Next
End Function

Private Sub unvisible_passcord_sheet()

Worksheets("passcord").Visible = False
Worksheets("passcord").Visible = xlVeryHidden

End Sub

Private Sub visible_passcord_sheet()
Worksheets("passcord").Visible = True

End Sub

