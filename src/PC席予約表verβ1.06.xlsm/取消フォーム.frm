VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} ����t�H�[�� 
   Caption         =   "�\��̎���̊m�F"
   ClientHeight    =   5999
   ClientLeft      =   91
   ClientTop       =   420
   ClientWidth     =   7217
   OleObjectBlob   =   "����t�H�[��.frx":0000
   StartUpPosition =   1  '�I�[�i�[ �t�H�[���̒���
End
Attribute VB_Name = "����t�H�[��"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CommandButton1_Click()

Dim �\��R�[�h As Long
Dim ���݂̈ʒu As Long
Dim confirm_number As Variant
Set duplicate = Worksheets("�d���`�F�b�N")
Dim search_stu_row
Dim i As Integer
Dim target_stu_list(10) As Variant

�\��R�[�h = resreve_day * 100 + ���ԑ� * 10 + �Ȕԍ�
���݂̈ʒu = WorksheetFunction.Match(�\��R�[�h, Sheets("���f�[�^").Range("D:D"), 1)
If �\��R�[�h = WorksheetFunction.Index(Sheets("���f�[�^").Range("D:D"), ���݂̈ʒu) Then
    
    For i = 0 To 10
        If Sheets("���f�[�^").Cells(���݂̈ʒu, i + 6).Value = "" Then
            Exit For
        End If
        target_stu_list(i) = Sheets("���f�[�^").Cells(���݂̈ʒu, i + 6).Value
    Next i
    If TextBox1 = passcord Then
        Call Sheets("���f�[�^").Cells(���݂̈ʒu, 1).EntireRow.Delete(xlShiftUp)
        Call delete_res_num(target_stu_list, i - 1)
'        MsgBox ("�\����������܂���")
        delete_confirm.Show
        Unload ����t�H�[��
        Exit Sub
    End If
    
    '�e�L�X�g�{�b�N�X��ϊ�����O�Ƀp�X�R�[�h�����͂���Ă��邩���ꍇ��������
    
'    Call textbox_restrict(TextBox1, �m�F�ԍ�)
    confirm_number = translate_number(TextBox1, 1)
    '���͂��ꂽ�ԍ���ϊ�����
    
    If confirm_number = "" Then
        MsgBox ("�w�Дԍ�����͂��Ă�������")
        Exit Sub
    ElseIf confirm_number = -1 Then
        TextBox1 = ""
        Exit Sub
    End If
    If number_valid <> 0 Then
        number_valid = 0
        Exit Sub
    End If
    
    
'    If �m�F�ԍ� = Sheets("���f�[�^").Cells(���݂̈ʒu, i).Value Then

    Dim result_list As Variant
    result_list = Filter(target_stu_list, Int(confirm_number))
    If UBound(result_list) <> -1 Then
        Call Sheets("���f�[�^").Cells(���݂̈ʒu, 1).EntireRow.Delete(xlShiftUp)
        '        �\�񂵂��f�[�^���폜
        Call delete_res_num(target_stu_list, i - 1)
        Worksheets("���C��").EnableCalculation = True
        Application.Calculate
'        MsgBox ("�\����������܂���")
        delete_confirm.Show
        Unload ����t�H�[��
        Exit Sub
    End If
    
    Dim search As Integer
    On Error GoTo error_nothing
    search = WorksheetFunction.Match(Int(confirm_number), Sheets("passcord").Cells(1, 1).EntireColumn, 1)
    On Error GoTo 0
    If Int(confirm_number) = WorksheetFunction.Index(Sheets("passcord").Cells(1, 1).EntireColumn, search) Then
        Call Sheets("���f�[�^").Cells(���݂̈ʒu, 1).EntireRow.Delete(xlShiftUp)
        '        �\�񂵂��f�[�^���폜
        Call delete_res_num(target_stu_list, i - 1)
        Worksheets("���C��").EnableCalculation = True
        Application.Calculate
'        MsgBox ("�\����������܂���")
        delete_confirm.Show
        Unload ����t�H�[��
        Exit Sub
    End If
    
    '�������Ȃ����[�v���ł�����͂������e���폜
    MsgBox ("�w�Дԍ�����v���܂���B������x���͂��Ă�������")
    TextBox1 = ""

Else
    MsgBox ("�\�񂪂���܂���BLA�Ɋm�F���˗����Ă��������B�G���[�ԍ��P�O�R")
End If

Exit Sub

error_nothing:
search = 1
Resume Next

End Sub


Private Sub Label2_Click()

End Sub

Private Sub TextBox1_KeyPress(ByVal KeyAscii As MSForms.ReturnInteger)

Call keypressrestrict(KeyAscii)

End Sub

Private Sub UserForm_Click()

End Sub

