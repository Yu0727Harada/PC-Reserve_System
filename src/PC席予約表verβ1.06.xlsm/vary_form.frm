VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} vary_form 
   Caption         =   "�\��̕ύX�Ȃ�"
   ClientHeight    =   8352.001
   ClientLeft      =   90
   ClientTop       =   420
   ClientWidth     =   5160
   OleObjectBlob   =   "vary_form.frx":0000
   StartUpPosition =   1  '�I�[�i�[ �t�H�[���̒���
End
Attribute VB_Name = "vary_form"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub delete_use_button_Click()

Unload vary_form
delete_user.Show

End Sub


Private Sub UserForm_Initialize()

Dim targt_time_text As String

If (���ԑ� = 1) Then
    target_time_text = "1������"
ElseIf (���ԑ� = 2) Then
    target_time_text = "2������"
ElseIf (���ԑ� = 3) Then
    target_time_text = "���x��"
ElseIf (���ԑ� = 4) Then
    target_time_text = "3������"
ElseIf (���ԑ� = 5) Then
    target_time_text = "4������"
ElseIf (���ԑ� = 6) Then
    target_time_text = "5������"
ElseIf (���ԑ� = 7) Then
    target_time_text = "���܂�"
End If

Dim target_pc_text As String

If (�Ȕԍ� = 1) Then
    target_pc_text = "�P�Ԃ�PC��"
ElseIf (�Ȕԍ� = 2) Then
    target_pc_text = "2�Ԃ�PC��"
ElseIf (�Ȕԍ� = 3) Then
    target_pc_text = "3�Ԃ�PC��"
ElseIf (�Ȕԍ� = 4) Then
    target_pc_text = "4�Ԃ�PC��"
ElseIf (�Ȕԍ� = 5) Then
    target_pc_text = "5�Ԃ�PC��"
End If


Label3 = target_time_text + "��" + target_pc_text + "��" + vbCrLf + "�\��ύX"



�ǉ��{�^��.SetFocus


End Sub

Private Sub �����{�^��_Click()

If �A���\�� = False Then

'    MsgBox ("�����ł��܂���")
    post_confirm.Show
    Unload vary_form
    Exit Sub
ElseIf Sheets("���C��").Range(limit_res_on_off).Value = "on" Then
    limit_res_inform.Show
    Unload vary_form
    Exit Sub
Else
    Dim �\��R�[�h As Long
    Dim ���݂̈ʒu As Long
    �\��R�[�h = resreve_day * 100 + ���ԑ� * 10 + �Ȕԍ�
    ���݂̈ʒu = WorksheetFunction.Match(�\��R�[�h, Sheets("���f�[�^").Range("D:D"), 1)
    Dim �\��m�F As Integer
    Dim CNT(10) As Integer
    Dim student_number_list(10) As Variant
    Dim cable_check As Boolean
    Dim j As Integer
    Dim k As Integer
    Dim L As Integer
    k = 0
    L = 0
    
    j = 0
    While Sheets("���f�[�^").Cells(���݂̈ʒu, j + 6) <> ""
            student_number_list(j) = Sheets("���f�[�^").Cells(���݂̈ʒu, j + 6)
            j = j + 1
    Wend

If Sheets("���f�[�^").Cells(���݂̈ʒu, 5) = 0 Then
    cable_check = False
Else
    cable_check = True
End If

    Call check_res_day
    Call check_res_num(student_number_list(), data_num, CNT())
    
    Dim bl_res_dup_check As Boolean
    bl_res_dup_check = res_duplicate_check(j - 1, 0, CNT())
    If bl_res_dup_check = False Then
        Unload vary_form
        Exit Sub
    End If

    Dim bl_res_input As Boolean
    bl_res_input = res_input_rawsheet(resreve_day, ���ԑ� + 1, �Ȕԍ�, cable_check, student_number_list(), j - 1)
    
    Unload vary_form

End If

End Sub

Private Sub �ސȃ{�^��_Click()

Unload vary_form
Call leave
            

End Sub

Private Sub �ݏo�{�^��_Click()

Call cable
Unload vary_form

End Sub

Private Sub �ǉ��{�^��_Click()

Unload vary_form
���p�Ғǉ��t�H�[��.Show

End Sub

