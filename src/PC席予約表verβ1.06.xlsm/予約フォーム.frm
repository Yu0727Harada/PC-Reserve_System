VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} �\��t�H�[�� 
   Caption         =   "�\��t�H�[��"
   ClientHeight    =   8442
   ClientLeft      =   -462
   ClientTop       =   -1799
   ClientWidth     =   8022
   OleObjectBlob   =   "�\��t�H�[��.frx":0000
   StartUpPosition =   1  '�I�[�i�[ �t�H�[���̒���
End
Attribute VB_Name = "�\��t�H�[��"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim extend_check As Boolean
Dim cable_check As Boolean

Private Sub Label4_Click()

If checBox = "" Then
    checBox = "��"
    extend_check = True
Else
    checBox = ""
    extend_check = False
End If
End Sub

Private Sub Label5_Click()
If checkbox2 = "" Then
    checkbox2 = "��"
    cable_check = True
Else
    checkbox2 = ""
    cable_check = False
End If
End Sub

Private Sub UserForm_Initialize()

number_valid = 0
�w�Дԍ��e�L�X�g�{�b�N�X1.SetFocus
cable_check = False
extend_check = False
'��ԍŏ��Ƀt�H�[�����J�����Ƃ��Ƀe�L�X�g�{�b�N�X�ʒu�ɓ��͏o�����Ԃɂ��Ă���
End Sub

Private Sub �L�����Z��_Click()

Unload �\��t�H�[��

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

'Worksheets("���C��").EnableCalculation = False
'���f�[�^�Ƀf�[�^�����邽�тɃ��C���V�[�g�Čv�Z���N����Ə������d���Ȃ�̂ōČv�Z���~����

Dim student_number_1 As Variant
Dim student_number_2 As Variant
Dim student_number_3 As Variant
Dim student_number_4 As Variant
Dim student_number_5 As Variant

student_number_1 = translate_number(�w�Дԍ��e�L�X�g�{�b�N�X1, 1)
If student_number_1 = -1 Then
    �w�Дԍ��e�L�X�g�{�b�N�X1 = ""
End If
student_number_2 = translate_number(�w�Дԍ��e�L�X�g�{�b�N�X2, 1)
If student_number_2 = -1 Then
    �w�Дԍ��e�L�X�g�{�b�N�X2 = ""
End If
student_number_3 = translate_number(�w�Дԍ��e�L�X�g�{�b�N�X3, 1)
If student_number_3 = -1 Then
    �w�Дԍ��e�L�X�g�{�b�N�X3 = ""
End If
student_number_4 = translate_number(�w�Дԍ��e�L�X�g�{�b�N�X4, 1)
If student_number_4 = -1 Then
    �w�Дԍ��e�L�X�g�{�b�N�X4 = ""
End If
student_number_5 = translate_number(�w�Дԍ��e�L�X�g�{�b�N�X5, 1)
If student_number_5 = -1 Then
    �w�Дԍ��e�L�X�g�{�b�N�X5 = ""
End If

If number_valid <> 0 Then
    number_valid = 0
    Exit Sub
End If

'�e�L�X�g�{�b�N�X�ɓ��͂��ꂽ�̂�ϊ���student_number_1 -5�ɂ����
'���[�v�ł��Ȃ��͖̂����Ȕԍ������͂��ꂽ�Ƃ��ɓ��͂��ꂽ���e���폜����Ƃ��ɂ߂�ǂ�����

'Dim �����l�\���Q�� As Worksheet
Dim CNT(5) As Integer
'Dim �\��m�F As Integer
Dim student_number_list(5) As Variant
Dim data_num As Integer
data_num = -1

Dim ���݂̈ʒu As Integer
 

If student_number_1 <> "" Then
    data_num = data_num + 1
    student_number_list(data_num) = student_number_1
End If
If student_number_2 <> "" Then
    data_num = data_num + 1
    student_number_list(data_num) = student_number_2
End If
If student_number_3 <> "" Then
    data_num = data_num + 1
     student_number_list(data_num) = student_number_3
End If
If student_number_4 <> "" Then
    data_num = data_num + 1
    student_number_list(data_num) = student_number_4
End If
If student_number_5 <> "" Then
    data_num = data_num + 1
    student_number_list(data_num) = student_number_5
End If

If data_num = -1 Then
    MsgBox ("�w�Дԍ�����͂��Ă�������")
    Exit Sub
End If

'student_number_list�ɕϊ������ԍ����O���珇�Ɋi�[�B�������͂���ĂȂ�data_num=-1�̎��ɂ̓v���V�[�W���𔲂���
Dim extend_bl As String

If extend_check = True Then
    If �A���\�� = False Then
        extend_bl = MsgBox("���̎��ԑт͗\��ł��܂���B��R�}�����\�񂵂܂����H", vbYesNo + vbQuestion, "�\��̊m�F")
        If extend_bl = vbNo Then
            MsgBox ("�\���ʂɈړ����܂��B")
            Unload �\��t�H�[��
            Exit Sub
        Else
            extend_check = False
        End If
    ElseIf Worksheets("���C��").Range(limit_res_on_off).Value = "on" Then
            extend_bl = MsgBox("���݁A���G�̂��ߗ\��̐��������Ă��܂��B�P�R�}�����\�񂵂܂����H", vbYesNo + vbQuestion, "�\��̊m�F")
        If extend_bl = vbNo Then
            MsgBox ("�\���ʂɈړ����܂��B")
            Unload �\��t�H�[��
            Exit Sub
        Else
            extend_check = False
        End If
    End If
End If
    
Call check_res_day
Call check_res_num(student_number_list(), data_num, CNT())
    
Dim bl_dup_check As Boolean
bl_dup_check = res_duplicate_check(data_num, 0, CNT())
    
If bl_dup_check = False Then
    Worksheets("���C��").EnableCalculation = True
    Unload �\��t�H�[��
    Exit Sub
End If
       
Dim bl_res_input_raw As Boolean
bl_res_input_raw = res_input_rawsheet(resreve_day, ���ԑ�, �Ȕԍ�, cable_check, student_number_list(), data_num)
If bl_res_input_raw = False Then
    Unload �\��t�H�[��
    Exit Sub
End If
      
If extend_check = True Then
    bl_res_input_raw = res_input_rawsheet(resreve_day, ���ԑ� + 1, �Ȕԍ�, cable_check, student_number_list(), data_num)
    If bl_res_input_raw = False Then
        Unload �\��t�H�[��
        Exit Sub
    End If
    Unload �\��t�H�[��
    Exit Sub
End If

Unload �\��t�H�[��


End Sub
