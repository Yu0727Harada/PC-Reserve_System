VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} ���p�Ғǉ��t�H�[�� 
   Caption         =   "���p�҂̒ǉ�"
   ClientHeight    =   6585
   ClientLeft      =   105
   ClientTop       =   448
   ClientWidth     =   6482
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

'Worksheets("���C��").EnableCalculation = False
'���f�[�^�Ƀf�[�^�����邽�тɃ��C���V�[�g�Čv�Z���N����Ə������d���Ȃ�̂ōČv�Z���~����

Dim student_number_6 As Variant
Dim student_number_7 As Variant
Dim student_number_8 As Variant
Dim student_number_9 As Variant
Dim student_number_10 As Variant


student_number_6 = translate_number(�w�Дԍ��e�L�X�g�{�b�N�X6, 1)
If student_number_6 = -1 Then
    �w�Дԍ��e�L�X�g�{�b�N�X6 = ""
End If
student_number_7 = translate_number(�w�Дԍ��e�L�X�g�{�b�N�X7, 1)
If student_number_7 = -1 Then
    �w�Дԍ��e�L�X�g�{�b�N�X7 = ""
End If
student_number_8 = translate_number(�w�Дԍ��e�L�X�g�{�b�N�X8, 1)
If student_number_8 = -1 Then
    �w�Дԍ��e�L�X�g�{�b�N�X8 = ""
End If
student_number_9 = translate_number(�w�Дԍ��e�L�X�g�{�b�N�X9, 1)
If student_number_9 = -1 Then
    �w�Дԍ��e�L�X�g�{�b�N�X9 = ""
End If
student_number_10 = translate_number(�w�Дԍ��e�L�X�g�{�b�N�X10, 1)
If student_number_10 = -1 Then
    �w�Дԍ��e�L�X�g�{�b�N�X10 = ""
End If

If number_valid <> 0 Then
    number_valid = 0
    Exit Sub
End If

'Dim �����l�\���Q�� As Worksheet
Dim CNT(5) As Integer
'Dim �\��m�F As Integer
Dim student_number_list(5) As Variant
Dim data_num As Integer
data_num = -1

If student_number_6 <> "" Then
    data_num = data_num + 1
    student_number_list(data_num) = student_number_6
End If
If student_number_7 <> "" Then
    data_num = data_num + 1
    student_number_list(data_num) = student_number_7
End If
If student_number_8 <> "" Then
    data_num = data_num + 1
     student_number_list(data_num) = student_number_8
End If
If student_number_9 <> "" Then
    data_num = data_num + 1
    student_number_list(data_num) = student_number_9
End If
If student_number_10 <> "" Then
    data_num = data_num + 1
    student_number_list(data_num) = student_number_10
End If

If data_num = -1 Then
    MsgBox ("�w�Дԍ�����͂��Ă�������")
    Exit Sub
End If

Call check_res_day
Call check_res_num(student_number_list(), data_num, CNT())

Dim bl_res_dup_check As Boolean
bl_res_dup_check = res_duplicate_check(data_num, 0, CNT())
If bl_res_dup_check = False Then
    Worksheets("���C��").EnableCalculation = True
    Unload �\��t�H�[��
    Exit Sub
End If

    
Dim �\��R�[�h As Long
Dim add_search As Long
�\��R�[�h = resreve_day * 100 + ���ԑ� * 10 + �Ȕԍ�

add_search = WorksheetFunction.Match(�\��R�[�h, Sheets("���f�[�^").Range("D:D"), 1)
'�\��R�[�h�𐶐����āA���ꂪ���Ԗڂɂ���̂��擾

Call stu_num_list_input_rawsheet(add_search, student_number_list(), data_num)

Worksheets("���C��").EnableCalculation = True


adduser.Show

Unload ���p�Ғǉ��t�H�[��
Application.Calculate

End Sub

Private Sub �L�����Z���ǉ��{�^��_Click()

Unload ���p�Ғǉ��t�H�[��


End Sub
