VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} �\��t�H�[�� 
   Caption         =   "�\��t�H�[��"
   ClientHeight    =   7497
   ClientLeft      =   -462
   ClientTop       =   -1799
   ClientWidth     =   6671
   OleObjectBlob   =   "�\��t�H�[��.frx":0000
   StartUpPosition =   1  '�I�[�i�[ �t�H�[���̒���
End
Attribute VB_Name = "�\��t�H�[��"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub checBox_Change()

End Sub

Private Sub CommandButton1_Click()

'If checBox = "" Then
'    checBox = "��"
'Else
'    checBox = ""
'End If

End Sub

Private Sub Label1_Click()

End Sub

Private Sub Label3_Click()

End Sub

Private Sub Label4_Click()

If checBox = "" Then
    checBox = "��"
    �`�F�b�N�{�b�N�X2�R�} = True
Else
    checBox = ""
    �`�F�b�N�{�b�N�X2�R�} = False
End If
End Sub

Private Sub TextBox1_Change()

End Sub

Private Sub Label5_Click()
If checkbox2 = "" Then
    checkbox2 = "��"
    �P�[�u���`�F�b�N = True
Else
    checkbox2 = ""
    �P�[�u���`�F�b�N = False
End If
End Sub

Private Sub UserForm_Initialize()

number_valid = 0
�w�Дԍ��e�L�X�g�{�b�N�X1.SetFocus
'��ԍŏ��Ƀt�H�[�����J�����Ƃ��Ƀe�L�X�g�{�b�N�X�ʒu�ɓ��͏o�����Ԃɂ��Ă���
End Sub

Private Sub �L�����Z��_Click()


Unload �\��t�H�[��

End Sub




Private Sub �`�F�b�N�{�b�N�X2�R�}_Click()

End Sub

Private Sub �w�Дԍ��e�L�X�g�{�b�N�X1_KeyPress(ByVal KeyAscii As MSForms.ReturnInteger)

Call keypressrestrict(KeyAscii)


End Sub

Private Sub �w�Дԍ��e�L�X�g�{�b�N�X2_KeyPress(ByVal KeyAscii As MSForms.ReturnInteger)

Call keypressrestrict(KeyAscii)

End Sub
Private Sub �w�Дԍ��e�L�X�g�{�b�N�X3_KeyPress(ByVal KeyAscii As MSForms.ReturnInteger)

Call keypressrestrict(KeyAscii)

End Sub
Private Sub �w�Дԍ��e�L�X�g�{�b�N�X4_KeyPress(ByVal KeyAscii As MSForms.ReturnInteger)

Call keypressrestrict(KeyAscii)

End Sub

Private Sub �w�Дԍ��e�L�X�g�{�b�N�X5_KeyPress(ByVal KeyAscii As MSForms.ReturnInteger)

Call keypressrestrict(KeyAscii)

End Sub
Private Sub �o�^_Click()

Worksheets("���C��").EnableCalculation = False
'���f�[�^�Ƀf�[�^�����邽�тɃ��C���V�[�g�Čv�Z���N����Ə������d���Ȃ�̂ōČv�Z���~����

Dim �w�Дԍ�1 As Variant
Dim �w�Дԍ�2 As Variant
Dim �w�Дԍ�3 As Variant
Dim �w�Дԍ�4 As Variant
Dim �w�Дԍ�5 As Variant

Call textbox_restrict(�w�Дԍ��e�L�X�g�{�b�N�X1, �w�Дԍ�1)
Call textbox_restrict(�w�Дԍ��e�L�X�g�{�b�N�X2, �w�Дԍ�2)
Call textbox_restrict(�w�Дԍ��e�L�X�g�{�b�N�X3, �w�Дԍ�3)
Call textbox_restrict(�w�Дԍ��e�L�X�g�{�b�N�X4, �w�Дԍ�4)
Call textbox_restrict(�w�Дԍ��e�L�X�g�{�b�N�X5, �w�Дԍ�5)
If number_valid <> 0 Then
    number_valid = 0
    Worksheets("���C��").EnableCalculation = True
    Exit Sub
End If

'�e�L�X�g�{�b�N�X�ɓ��͂��ꂽ�̂�ϊ����w�Дԍ�1 -5�ɂ����
'���[�v�ł��Ȃ��͖̂����Ȕԍ������͂��ꂽ�Ƃ��ɓ��͂��ꂽ���e���폜����Ƃ��ɂ߂�ǂ�����


Dim �����l�\���Q�� As Worksheet
Dim CNT(5) As Integer
Dim �\��m�F As Integer
Dim �w�Дԍ����X�g(5) As Variant
Dim data_num As Integer
data_num = -1
Dim �\��R�[�h As Long
Dim ���݂̈ʒu As Integer
 

If �w�Дԍ�1 <> "" Then
    data_num = data_num + 1
    �w�Дԍ����X�g(data_num) = �w�Дԍ�1
End If
If �w�Дԍ�2 <> "" Then
    data_num = data_num + 1
    �w�Дԍ����X�g(data_num) = �w�Дԍ�2
End If
If �w�Дԍ�3 <> "" Then
    data_num = data_num + 1
     �w�Дԍ����X�g(data_num) = �w�Дԍ�3
End If
If �w�Дԍ�4 <> "" Then
    data_num = data_num + 1
    �w�Дԍ����X�g(data_num) = �w�Дԍ�4
End If
If �w�Дԍ�5 <> "" Then
    data_num = data_num + 1
    �w�Дԍ����X�g(data_num) = �w�Дԍ�5
End If

If data_num = -1 Then
    MsgBox ("�w�Дԍ�����͂��Ă�������")
    Worksheets("���C��").EnableCalculation = True
    Exit Sub
End If

'�w�Дԍ����X�g�ɕϊ������ԍ����O���珇�Ɋi�[�B�������͂���ĂȂ�data_num=-1�̎��ɂ̓v���V�[�W���𔲂���

'Set �����l�\���Q�� = Worksheets("�����l�\���Q��")

If �`�F�b�N�{�b�N�X2�R�} = False Then

    Call check_res_day
    Call check_res_num(�w�Дԍ����X�g(), data_num, CNT())
    
    Dim k As Integer

    For k = 0 To data_num
    
        If CNT(k) >= 2 Then
            �\��m�F = MsgBox("���ɂQ�R�}�ȏ�\�񂵂Ă��܂����A�\�񂵂Ă�낵���ł����H", vbYesNo + vbwuestion, "�\��̊m�F")
                If �\��m�F = vbNo Then
                    Worksheets("���C��").EnableCalculation = True
                    Unload �\��t�H�[��
                    Exit Sub
                Else
                    Exit For
                End If
        End If
    Next k


'
'For k = 0 To data_num
'    CNT(k) = WorksheetFunction.CountIf(�����l�\���Q��.Range("C16:L62"), �w�Дԍ����X�g(k))
'        If CNT(k) >= 2 Then
'
'            �\��m�F = MsgBox("���ɂQ�R�}�ȏ�\�񂵂Ă��܂����A�\�񂵂Ă�낵���ł����H", vbYesNo + vbwuestion, "�\��̊m�F")
'                If �\��m�F = vbNo Then
'                    Worksheets("���C��").EnableCalculation = True
'                    Unload �\��t�H�[��
'                    Exit Sub
'                Else
'                    Exit For
'                End If
'        End If
'Next k

'data_num�̐���f�[�^�̐��Ԃ񃋁[�v���܂킷
'CNT�z��ɏ��ɏd�����𐔂���
'2 �ȏゾ������m�F����

   �\��R�[�h = �\��� * 100 + ���ԑ� * 10 + �Ȕԍ�
    

    On Error GoTo error_process
    ���݂̈ʒu = WorksheetFunction.Match(�\��R�[�h, Sheets("���f�[�^").Range("D:D"), 1)
    On Error GoTo 0
        If �\��R�[�h = WorksheetFunction.Index(Sheets("���f�[�^").Range("D:D"), ���݂̈ʒu) Then
            MsgBox ("���łɂ��̘g�̗\�񂪂��邽�ߗ\�񂪂ł��܂���BLA�Ɋm�F���˗����Ă�������")
            Worksheets("���C��").EnableCalculation = True
            Unload �\��t�H�[��
            Exit Sub
        End If
    
    Sheets("���f�[�^").Rows(���݂̈ʒu + 1).Insert
'    LastRow = Sheets("���f�[�^").Cells(Rows.Count, 1).End(xlUp).Row + 1
    Dim Lastcolumn As Long
    
    Sheets("���f�[�^").Cells(���݂̈ʒu + 1, 1).Value = �\���
    Sheets("���f�[�^").Cells(���݂̈ʒu + 1, 2).Value = ���ԑ�
    Sheets("���f�[�^").Cells(���݂̈ʒu + 1, 3).Value = �Ȕԍ�
    Sheets("���f�[�^").Cells(���݂̈ʒu + 1, 4).Value = �\��R�[�h
    
    
    Call cable_new(�P�[�u���`�F�b�N, ���݂̈ʒu + 1)
    Lastcolumn = Sheets("���f�[�^").Cells(���݂̈ʒu + 1, Columns.Count).End(xlToLeft).Column + 1

    For m = 0 To data_num
        Sheets("���f�[�^").Cells(���݂̈ʒu + 1, Lastcolumn + m).Value = �w�Дԍ����X�g(m)
    Next m
    
    Call input_res_num(�w�Дԍ����X�g(), data_num)

    
End If
        
If �`�F�b�N�{�b�N�X2�R�} = True Then
    If �A���\�� = True Then
'   �V�[�g3�ő�������l���m�F���Ď��̗\�񂪋󂢂Ă邩�m�F

        Call check_res_day
        Call check_res_num(�w�Дԍ����X�g(), data_num, CNT())
'    For o = 0 To data_num
'        CNT(o) = WorksheetFunction.CountIf(�����l�\���Q��.Range("C16:L62"), �w�Дԍ����X�g(k))
'            If CNT(o) >= 1 Then
'                �\��m�F = MsgBox("����1�R�}�ȏ�\�񂵂Ă��܂����A�\�񂵂Ă�낵���ł����H", vbYesNo + vbwuestion, "�\��̊m�F")
'                    If �\��m�F = vbNo Then
'                        Worksheets("���C��").EnableCalculation = True
'                        Unload �\��t�H�[��
'                        Exit Sub
'                    Else
'                        Exit For
'                    End If
'            End If
'    Next o
        Dim L As Integer

        For L = 0 To data_num
        
            If CNT(L) >= 1 Then
                �\��m�F = MsgBox("����1�R�}�ȏ�\�񂵂Ă��܂����A�\�񂵂Ă�낵���ł����H", vbYesNo + vbwuestion, "�\��̊m�F")
                    If �\��m�F = vbNo Then
                        Worksheets("���C��").EnableCalculation = True
                        Unload �\��t�H�[��
                        Exit Sub
                    Else
                        Exit For
                    End If
            End If
        Next L

        �\��R�[�h = �\��� * 100 + ���ԑ� * 10 + �Ȕԍ�
        On Error GoTo error_process
         ���݂̈ʒu = WorksheetFunction.Match(�\��R�[�h, Sheets("���f�[�^").Range("D:D"), 1)
        On Error GoTo 0

             If �\��R�[�h = WorksheetFunction.Index(Sheets("���f�[�^").Range("D:D"), ���݂̈ʒu) Then
                 MsgBox ("���łɂ��̘g�̗\�񂪂��邽�ߗ\�񂪂ł��܂���BLA�Ɋm�F���˗����Ă�������")
                 Worksheets("���C��").EnableCalculation = True
                 Unload �\��t�H�[��
                 Exit Sub
             End If

            Sheets("���f�[�^").Rows(���݂̈ʒu + 1).Insert
            Sheets("���f�[�^").Cells(���݂̈ʒu + 1, 1).Value = �\���
            Sheets("���f�[�^").Cells(���݂̈ʒu + 1, 2).Value = ���ԑ�
            Sheets("���f�[�^").Cells(���݂̈ʒu + 1, 3).Value = �Ȕԍ�
            Sheets("���f�[�^").Cells(���݂̈ʒu + 1, 4).Value = �\��R�[�h
            Call cable_new(�P�[�u���`�F�b�N, ���݂̈ʒu + 1)
            Lastcolumn = Sheets("���f�[�^").Cells(���݂̈ʒu + 1, Columns.Count).End(xlToLeft).Column + 1

            For m = 0 To data_num
                Sheets("���f�[�^").Cells(���݂̈ʒu + 1, Lastcolumn + m).Value = �w�Дԍ����X�g(m)
            Next m
            Call input_res_num(�w�Дԍ����X�g(), data_num)
          
            �\��R�[�h = �\��� * 100 + (���ԑ� + 1) * 10 + �Ȕԍ�
            On Error GoTo error_process
            ���݂̈ʒu = WorksheetFunction.Match(�\��R�[�h, Sheets("���f�[�^").Range("D:D"), 1)
            On Error GoTo 0
            Sheets("���f�[�^").Rows(���݂̈ʒu + 1).Insert
            Sheets("���f�[�^").Cells(���݂̈ʒu + 1, 1).Value = �\���
            Sheets("���f�[�^").Cells(���݂̈ʒu + 1, 2).Value = ���ԑ� + 1
            Sheets("���f�[�^").Cells(���݂̈ʒu + 1, 3).Value = �Ȕԍ�
            Sheets("���f�[�^").Cells(���݂̈ʒu + 1, 4).Value = �\��R�[�h
            Call cable_new(�P�[�u���`�F�b�N, ���݂̈ʒu + 1)
            Lastcolumn = Sheets("���f�[�^").Cells(���݂̈ʒu + 1, Columns.Count).End(xlToLeft).Column + 1

            For m = 0 To data_num
                Sheets("���f�[�^").Cells(���݂̈ʒu + 1, Lastcolumn + m).Value = �w�Дԍ����X�g(m)
            Next m
            Call input_res_num(�w�Дԍ����X�g(), data_num)


    Else
        MsgBox ("�Q�R�}�\��ł��܂���B")
    End If
End If

    Worksheets("���C��").EnableCalculation = True
    Call sheet_color_check
    Unload �\��t�H�[��
    Exit Sub

error_process:

���݂̈ʒu = 1
Resume Next

End Sub
