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
                If Cells(7, 20 + k).Value <> Shift(k) Then
                    Cells(7, 20 + k).Value = Shift(k)
                    Call shapes_delete(Sheets("���C��").Range(Cells(5 + L * 3, 11), Cells(5 + L * 3, 11)))
'                    For Each shp In Sheets("���C��").shapes
'                        Set rng = Range(shp.TopLeftCell, shp.BottomRightCell)
'                        If Not (Intersect(rng, Sheets("���C��").Range(Cells(5 + k * 3, 11), Cells(5 + k * 3, 11))) Is Nothing) Then
'                            shp.Delete
'                        End If
'                    Next
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
                If Cells(7, 20 + L).Value <> Shift(L) Then
                    Cells(7, 20 + L).Value = Shift(L)
                    
                    Call shapes_delete(Sheets("���C��").Range(Cells(5 + L * 3, 11), Cells(5 + L * 3, 11)))
'                    For Each shp In Sheets("���C��").shapes
'                        Set rng = Range(shp.TopLeftCell, shp.BottomRightCell)
'                        If Not (Intersect(rng, Sheets("���C��").Range(Cells(5 + L * 3, 11), Cells(5 + L * 3, 11))) Is Nothing) Then
'                            shp.Delete
'                        End If
'                    Next
                    Sheets("�o��").Cells(Shift(L) + 1, 2).CopyPicture
                    Sheets("���C��").Paste Cells(5 + L * 3, 11)
                End If
            Next L

    End If

Sheets("���C��").Cells(12, 2).Select
Exit Sub
sheet_cal_error:
search = 2
Resume Next
                
End Sub

Function shapes_delete(ByVal delete_area As Range)
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

Application.Calculate
'�V�[�g�̍Čv�Z���s��
Call shift_check
tm = now() + TimeValue("00:01:00")
Application.OnTime EarliestTime:=tm, Procedure:="recal", Schedule:=True
'tm�ϐ��Ɉꕪ����Z�b�g
'ontime�֐��ňꕪ��ɂ܂�recal�v���V�[�W�������s
'�Ȃ����V�[�g���W���[����recal�v���V�[�W���������Ƃ��܂������Ȃ�

End Sub

