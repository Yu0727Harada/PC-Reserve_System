VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} �\��ύX�t�H�[�� 
   Caption         =   "�\��̕ύX�Ȃ�"
   ClientHeight    =   6139
   ClientLeft      =   105
   ClientTop       =   448
   ClientWidth     =   5292
   OleObjectBlob   =   "�\��ύX�t�H�[��.frx":0000
   StartUpPosition =   1  '�I�[�i�[ �t�H�[���̒���
End
Attribute VB_Name = "�\��ύX�t�H�[��"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Image2_Click()

End Sub

Private Sub UserForm_Initialize()
�ǉ��{�^��.SetFocus
End Sub

Private Sub �����{�^��_Click()

If �A���\�� = False Then

'    MsgBox ("�����ł��܂���")
    post_confirm.Show
    Unload �\��ύX�t�H�[��
    Exit Sub
ElseIf Sheets("���C��").Range(limit_res_on_off).Value = "on" Then
    limit_res_inform.Show
    Unload �\��ύX�t�H�[��
    Exit Sub
Else
    Dim �\��R�[�h As Long
    Dim ���݂̈ʒu As Long
    �\��R�[�h = resreve_day * 100 + ���ԑ� * 10 + �Ȕԍ�
    ���݂̈ʒu = WorksheetFunction.Match(�\��R�[�h, Sheets("���f�[�^").Range("D:D"), 1)
    Dim �\��m�F As Integer
    Dim CNT(10) As Integer
    Dim �w�Дԍ����X�g(10) As Variant
    Dim cable_check As Boolean
    Dim j As Integer
    Dim k As Integer
    Dim l As Integer
    k = 0
    l = 0
    
    j = 0
    While Sheets("���f�[�^").Cells(���݂̈ʒu, j + 6) <> ""
            �w�Дԍ����X�g(j) = Sheets("���f�[�^").Cells(���݂̈ʒu, j + 6)
            j = j + 1
    Wend

If Sheets("���f�[�^").Cells(���݂̈ʒu, 5) = 0 Then
    cable_check = False
Else
    cable_check = True
End If

    Call check_res_day
    Call check_res_num(�w�Дԍ����X�g(), data_num, CNT())
    
    Dim bl_res_dup_check As Boolean
    bl_res_dup_check = res_duplicate_check(j - 1, 0, CNT())
    If bl_res_dup_check = False Then
        Unload �\��ύX�t�H�[��
        Exit Sub
    End If

    Dim bl_res_input As Boolean
    bl_res_input = res_input_rawsheet(resreve_day, ���ԑ� + 1, �Ȕԍ�, cable_check, �w�Дԍ����X�g(), j - 1)
    
    Unload �\��ύX�t�H�[��

End If

End Sub

Private Sub ����{�^��_Click()

Unload �\��ύX�t�H�[��
����t�H�[��.Show
            

End Sub

Private Sub �ݏo�{�^��_Click()

Call cable
Unload �\��ύX�t�H�[��

End Sub

Private Sub �ǉ��{�^��_Click()

Unload �\��ύX�t�H�[��
���p�Ғǉ��t�H�[��.Show

End Sub
