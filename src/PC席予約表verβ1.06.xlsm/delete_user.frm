VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} delete_user 
   Caption         =   "���p�҂̍폜"
   ClientHeight    =   6780
   ClientLeft      =   90
   ClientTop       =   405
   ClientWidth     =   6525
   OleObjectBlob   =   "delete_user.frx":0000
   StartUpPosition =   1  '�I�[�i�[ �t�H�[���̒���
End
Attribute VB_Name = "delete_user"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cancel_Click()
Unload delete_user
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

Private Sub delete_confirm_Click()
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

Dim reserve_cord As Long
Dim now_position As Long
Dim target_stu_list(10) As Variant

reserve_cord = resreve_day * 100 + ���ԑ� * 10 + �Ȕԍ�
now_position = WorksheetFunction.Match(reserve_cord, Sheets("���f�[�^").Range("D:D"), 1)
If reserve_cord = WorksheetFunction.Index(Sheets("���f�[�^").Range("D:D"), now_position) Then
    Dim i As Integer
    Dim j As Integer
    Dim k As Integer
    Dim is_delete As Boolean
    k = 0
    
    For j = 0 To data_num
    
    is_delete = False
        For i = 0 To 10
            If Sheets("���f�[�^").Cells(now_position, i + data_sheet.student_num_start).Value = "" Then
                Exit For
            End If
            If Sheets("���f�[�^").Cells(now_position, i + data_sheet.student_num_start).Value = Int(student_number_list(j)) Then
                Sheets("���f�[�^").Cells(now_position, i + data_sheet.student_num_start).Delete (xlShiftToLeft)
                target_stu_list(k) = student_number_list(j)
                k = k + 1
                i = i - 1
                is_delete = True
            End If
        Next i
        If is_delete = False Then
            MsgBox ("�\�񂵂Ă��Ȃ��ԍ����܂܂�Ă��܂��B�����𑱍s���܂�")
        End If
        is_delete = False
        
    Next j
    
    If Sheets("���f�[�^").Cells(now_position, data_sheet.student_num_start).Value = "" Then
        MsgBox ("���p�҂����Ȃ��Ȃ����߁A���̗\��͍폜���܂�")
        Call Sheets("���f�[�^").Cells(now_position, 1).EntireRow.Delete(xlShiftUp)
    End If
    If k <> 0 Then
        Call delete_res_num(target_stu_list, k - 1)
        MsgBox ("���p�҂��폜���܂���")
    Else
        MsgBox ("���͂��ꂽ�ԍ��Ɉ�v���闘�p�҂����܂���ł����B")
    End If
    
    Unload delete_user
Else
    MsgBox ("�G���[")
End If
    
End Sub
