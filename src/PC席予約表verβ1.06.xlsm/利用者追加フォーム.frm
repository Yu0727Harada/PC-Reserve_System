VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} ���p�Ғǉ��t�H�[�� 
   Caption         =   "���p�҂̒ǉ�"
   ClientHeight    =   6594
   ClientLeft      =   112
   ClientTop       =   448
   ClientWidth     =   6475
   OleObjectBlob   =   "���p�Ғǉ��t�H�[��.frx":0000
   StartUpPosition =   1  '�I�[�i�[ �t�H�[���̒���
End
Attribute VB_Name = "���p�Ғǉ��t�H�[��"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Label1_Click()

End Sub

Private Sub UserForm_Initialize()
number_valid = 0
�w�Дԍ��e�L�X�g�{�b�N�X6.SetFocus
End Sub
Private Sub �w�Дԍ��e�L�X�g�{�b�N�X6_KeyPress(ByVal KeyAscii As MSForms.ReturnInteger)
Call keypressrestrict(KeyAscii)

End Sub

Private Sub �w�Дԍ��e�L�X�g�{�b�N�X7_KeyPress(ByVal KeyAscii As MSForms.ReturnInteger)
Call keypressrestrict(KeyAscii)

End Sub


Private Sub �w�Дԍ��e�L�X�g�{�b�N�X8_KeyPress(ByVal KeyAscii As MSForms.ReturnInteger)
Call keypressrestrict(KeyAscii)

End Sub

Private Sub �w�Дԍ��e�L�X�g�{�b�N�X9_KeyPress(ByVal KeyAscii As MSForms.ReturnInteger)
Call keypressrestrict(KeyAscii)

End Sub


Private Sub �w�Дԍ��e�L�X�g�{�b�N�X10_KeyPress(ByVal KeyAscii As MSForms.ReturnInteger)
Call keypressrestrict(KeyAscii)

End Sub

Private Sub �ǉ��o�^�{�^��_Click()

Worksheets("���C��").EnableCalculation = False
'���f�[�^�Ƀf�[�^�����邽�тɃ��C���V�[�g�Čv�Z���N����Ə������d���Ȃ�̂ōČv�Z���~����

Dim �w�Дԍ�6 As Variant
Dim �w�Дԍ�7 As Variant
Dim �w�Дԍ�8 As Variant
Dim �w�Дԍ�9 As Variant
Dim �w�Дԍ�10 As Variant

Call textbox_restrict(�w�Дԍ��e�L�X�g�{�b�N�X6, �w�Дԍ�6)
Call textbox_restrict(�w�Дԍ��e�L�X�g�{�b�N�X7, �w�Дԍ�7)
Call textbox_restrict(�w�Дԍ��e�L�X�g�{�b�N�X8, �w�Дԍ�8)
Call textbox_restrict(�w�Дԍ��e�L�X�g�{�b�N�X9, �w�Дԍ�9)
Call textbox_restrict(�w�Дԍ��e�L�X�g�{�b�N�X10, �w�Дԍ�10)

If number_valid <> 0 Then
    number_valid = 0
    Exit Sub
End If

Dim �����l�\���Q�� As Worksheet
Dim CNT(5) As Integer
Dim �\��m�F As Integer
Dim �w�Дԍ����X�g(5) As Variant
Dim data_num As Integer
data_num = -1

If �w�Дԍ�6 <> "" Then
    data_num = data_num + 1
    �w�Дԍ����X�g(data_num) = �w�Дԍ�6
End If
If �w�Дԍ�7 <> "" Then
    data_num = data_num + 1
    �w�Дԍ����X�g(data_num) = �w�Дԍ�7
End If
If �w�Дԍ�8 <> "" Then
    data_num = data_num + 1
     �w�Дԍ����X�g(data_num) = �w�Дԍ�8
End If
If �w�Дԍ�9 <> "" Then
    data_num = data_num + 1
    �w�Дԍ����X�g(data_num) = �w�Дԍ�9
End If
If �w�Дԍ�10 <> "" Then
    data_num = data_num + 1
    �w�Дԍ����X�g(data_num) = �w�Дԍ�10
End If

If data_num = -1 Then
    MsgBox ("�w�Дԍ�����͂��Ă�������")
    Exit Sub
End If

Call check_res_day
Call check_res_num(�w�Дԍ����X�g(), data_num, CNT())

Dim bl_res_dup_check As Boolean
bl_res_dup_check = res_duplicate_check(data_num, 0, CNT())
If bl_res_dup_check = False Then
    Worksheets("���C��").EnableCalculation = True
    Unload �\��t�H�[��
    Exit Sub
End If

'Dim k As Integer
'    For k = 0 To data_num
'        If CNT(k) >= 2 Then
'            �\��m�F = MsgBox("���ɂQ�R�}�ȏ�\�񂵂Ă��܂����A�\�񂵂Ă�낵���ł����H", vbYesNo + vbwuestion, "�\��̊m�F")
'                If �\��m�F = vbNo Then
'                    Worksheets("���C��").EnableCalculation = True
'                    Unload �\��t�H�[��
'                    Exit Sub
'                Else
'                    Exit For
'                End If
'        End If
'    Next k


'Set �����l�\���Q�� = Worksheets("�����l�\���Q��")
'Dim i As Integer
'For i = 0 To data_num
'    CNT(i) = WorksheetFunction.CountIf(�����l�\���Q��.Range("C16:L62"), �w�Дԍ����X�g(i))
'        If CNT(i) >= 2 Then
'
'            �\��m�F = MsgBox("���ɂQ�R�}�ȏ�\�񂵂Ă��܂����A�\�񂵂Ă�낵���ł����H", vbYesNo + vbwuestion, "�\��̊m�F")
'                If �\��m�F = vbNo Then
'                    Worksheets("���C��").EnableCalculation = True
'                    Unload ���p�Ғǉ��t�H�[��
'                    Exit Sub
'                Else
'                    Exit For
'                End If
'        End If
'Next i
    
Dim �\��R�[�h As Long
Dim add_search As Long
�\��R�[�h = resrveday * 100 + ���ԑ� * 10 + �Ȕԍ�

add_search = WorksheetFunction.Match(�\��R�[�h, Sheets("���f�[�^").Range("D:D"), 1)
'�\��R�[�h�𐶐����āA���ꂪ���Ԗڂɂ���̂��擾

Call stu_num_list_input_rawsheet(add_search, �w�Дԍ����X�g(), data_num)

'Dim Lastcolumn As Long
'
'Lastcolumn = Sheets("���f�[�^").Cells(�ǉ�����ʒu, Columns.count).End(xlToLeft).Column + 1
'
'For j = 0 To i
'    Sheets("���f�[�^").Cells(�ǉ�����ʒu, Lastcolumn + j).Value = �w�Дԍ����X�g(j)
'Next j
'Call input_res_num(�w�Дԍ����X�g(), data_num)

Worksheets("���C��").EnableCalculation = True

'�ǉ�����ʒu�̋󂢂Ă���w�Дԍ��̈ʒu���E������擾���āA�����ɏ��ɑ�����Ă���
adduser.Show
Unload ���p�Ғǉ��t�H�[��


End Sub

Private Sub �L�����Z���ǉ��{�^��_Click()

Unload ���p�Ғǉ��t�H�[��


End Sub
