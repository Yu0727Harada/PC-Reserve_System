VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} �\��ύX�t�H�[�� 
   Caption         =   "�\��̕ύX�Ȃ�"
   ClientHeight    =   4200
   ClientLeft      =   112
   ClientTop       =   448
   ClientWidth     =   4501
   OleObjectBlob   =   "�\��ύX�t�H�[��.frx":0000
   StartUpPosition =   1  '�I�[�i�[ �t�H�[���̒���
End
Attribute VB_Name = "�\��ύX�t�H�[��"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub UserForm_Initialize()
�ǉ��{�^��.SetFocus
End Sub

Private Sub �����{�^��_Click()

If �A���\�� = False Then

'    MsgBox ("�����ł��܂���")
    post_confirm.Show
    Unload �\��ύX�t�H�[��
    Exit Sub

Else
    Worksheets("���C��").EnableCalculation = False
    Dim �\��R�[�h As Long
    Dim ���݂̈ʒu As Long
    �\��R�[�h = �\��� * 100 + ���ԑ� * 10 + �Ȕԍ�
    ���݂̈ʒu = WorksheetFunction.Match(�\��R�[�h, Sheets("���f�[�^").Range("D:D"), 1)
    Dim �\��m�F As Integer
    Dim CNT(10) As Integer
    Dim �w�Дԍ����X�g(10) As Variant
    Dim cable_check As Integer
    Dim j As Integer
    Dim k As Integer
    Dim L As Integer
    j = 0
    k = 0
    L = 0

'    Dim �����l�\���Q�� As Worksheet
'    Set �����l�\���Q�� = Worksheets("�����l�\���Q��")

    
    While Sheets("���f�[�^").Cells(���݂̈ʒu, j + 6) <> ""
            �w�Дԍ����X�g(j) = Sheets("���f�[�^").Cells(���݂̈ʒu, j + 6)
            j = j + 1
    Wend

    cable_check = Sheets("���f�[�^").Cells(���݂̈ʒu, 5)

    Call check_res_day
    Call check_res_num(�w�Дԍ����X�g(), data_num, CNT())

        Do While Sheets("���f�[�^").Cells(���݂̈ʒu, k + 6) <> ""
            If CNT(k) >= 2 And �\��m�F = 0 Then
                �\��m�F = MsgBox("���ɂQ�R�}�ȏ�\�񂵂Ă��܂����A�\�񂵂Ă�낵���ł����H", vbYesNo + vbwuestion, "�\��̊m�F")
                    If �\��m�F = vbNo Then
                        Worksheets("���C��").EnableCalculation = True
                        Unload �\��ύX�t�H�[��
                        Exit Sub
                    End If
            End If
            k = k + 1
        Loop

    �\��R�[�h = �\��� * 100 + (���ԑ� + 1) * 10 + �Ȕԍ�
    ���݂̈ʒu = WorksheetFunction.Match(�\��R�[�h, Sheets("���f�[�^").Range("D:D"), 1)
    Sheets("���f�[�^").Rows(���݂̈ʒu + 1).Insert

'    LastRow = Sheets("���f�[�^").Cells(Rows.Count, 1).End(xlUp).Row + 1
    Sheets("���f�[�^").Cells(���݂̈ʒu + 1, 1).Value = �\���
    Sheets("���f�[�^").Cells(���݂̈ʒu + 1, 2).Value = ���ԑ� + 1
    Sheets("���f�[�^").Cells(���݂̈ʒu + 1, 3).Value = �Ȕԍ�
    Sheets("���f�[�^").Cells(���݂̈ʒu + 1, 4).Value = �\��R�[�h
    Sheets("���f�[�^").Cells(���݂̈ʒu + 1, 5).Value = cable_check

    
        For L = 0 To k - 1
            Sheets("���f�[�^").Cells(���݂̈ʒu + 1, 6 + L).Value = �w�Дԍ����X�g(L)
        Next L
    Call input_res_num(�w�Дԍ����X�g(), k - 1)
    Worksheets("���C��").EnableCalculation = True
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
