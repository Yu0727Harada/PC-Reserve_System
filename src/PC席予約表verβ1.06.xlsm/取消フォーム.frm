VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} ����t�H�[�� 
   Caption         =   "�\��̎���̊m�F"
   ClientHeight    =   6006
   ClientLeft      =   91
   ClientTop       =   413
   ClientWidth     =   7217
   OleObjectBlob   =   "����t�H�[��.frx":0000
   StartUpPosition =   1  '�I�[�i�[ �t�H�[���̒���
End
Attribute VB_Name = "����t�H�[��"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'
'
'Private Sub CommandButton1_Click()
'
'Worksheets("���C��").EnableCalculation = False
'
'Dim �\��R�[�h As Long
'Dim ���݂̈ʒu As Long
'Dim �m�F�ԍ� As String
'
'�\��R�[�h = �\��� * 100 + ���ԑ� * 10 + �Ȕԍ�
'���݂̈ʒu = WorksheetFunction.Match(�\��R�[�h, Sheets("���f�[�^").Range("D:D"), 1)
'If �\��R�[�h = WorksheetFunction.Index(Sheets("���f�[�^").Range("D:D"), ���݂̈ʒu) Then
'
'    If TextBox1 = passcord Then
'        Call Sheets("���f�[�^").Cells(���݂̈ʒu, 1).EntireRow.Delete(xlShiftUp)
'        MsgBox ("�\����������܂���")
'        Worksheets("���C��").EnableCalculation = True
'        Unload ����t�H�[��
'        Exit Sub
'    End If
'
'    '�e�L�X�g�{�b�N�X��ϊ�����O�Ƀp�X�R�[�h�����͂���Ă��邩���ꍇ��������
'
'    Call textbox_restrict(TextBox1, �m�F�ԍ�)
'    '���͂��ꂽ�ԍ���ϊ�����
'
'    If �m�F�ԍ� = "" Then
'        MsgBox ("�w�Дԍ�����͂��Ă�������")
'        Worksheets("���C��").EnableCalculation = True
'        Exit Sub
'    End If
'    If number_valid <> 0 Then
'        number_valid = 0
'        Worksheets("���C��").EnableCalculation = True
'        Exit Sub
'    End If
'
'    Dim i As Integer
'    For i = 6 To 10
'    '�Ƃ肠�����K����1�O�܂ŉ񂵂Ă�
'    '    LastRow = Sheets("���f�[�^").Cells(Rows.Count, 1).End(xlUp).Row + 1
'    '    ���݂̍ŏI�s���擾
'
'    '    Sheets("���f�[�^").Cells(LastRow, 6).Formula = "=mid(indirect(address(" + Str(���݂̈ʒu) + "," + Str(i) + ")),1,8)"
'    '    Sheets("���f�[�^").Cells(LastRow, 7).Formula = "=mid(indirect(address(" + Str(���݂̈ʒu) + "," + Str(i) + ")),9,16)"
'    ''    �ŏI�s�ɊY���̗\��̊w�Дԍ����Q�ɕ����邽�߂̎�������
'    '    '�������������ĕ��ʂɎ擾�����E�{�`���ɂȂ��Ă��܂��Astring�ɕϊ������肵�Ă����܂������Ȃ������B���[�N�V�[�g���mid�֐����g���Ε��ʂɎ擾�ł����̂ŋ���̍�Ƃ��Ă������Ă܂��B
'    '    k = Sheets("���f�[�^").Cells(LastRow, 6).Value
'    '    l = Sheets("���f�[�^").Cells(LastRow, 7).Value
'    ''    �ŏI�s�̌v�Z���ʂ�k�A���Ɋi�[
'    '
'    '    If k = Mid(�m�F�ԍ�, 1, 8) And l = Mid(�m�F�ԍ�, 9) Then
'    '            Sheets("���f�[�^").Cells(LastRow, 6).Clear
'    '            Sheets("���f�[�^").Cells(LastRow, 7).Clear
'    '            ���͂��������폜����
'        If Sheets("���f�[�^").Cells(���݂̈ʒu, i).Value = "" Then
'            Exit For
'        End If
'        If �m�F�ԍ� = Sheets("���f�[�^").Cells(���݂̈ʒu, i).Value Then
'            Call Sheets("���f�[�^").Cells(���݂̈ʒu, 1).EntireRow.Delete(xlShiftUp)
'    '        �\�񂵂��f�[�^���폜
'            Worksheets("���C��").EnableCalculation = True
'            MsgBox ("�\����������܂���")
'            Unload ����t�H�[��
'            Exit Sub
'        End If
'    Next i
'
'    '�������Ȃ����[�v���ł�����͂������e���폜
'    MsgBox ("�w�Дԍ�����v���܂���B������x���͂��Ă�������")
'    Worksheets("���C��").EnableCalculation = True
'    TextBox1 = ""
'
'Else
'    MsgBox ("�\�񂪂���܂���BLA�Ɋm�F���˗����Ă��������B")
'End If
'
'End Sub
'
'Private Sub TextBox1_KeyPress(ByVal KeyAscii As MSForms.ReturnInteger)
'
'Call keypressrestrict(KeyAscii)
'
'End Sub
'
'Private Sub UserForm_Click()
'
'End Sub



Private Sub CommandButton1_Click()

Worksheets("���C��").EnableCalculation = False

Dim �\��R�[�h As Long
Dim ���݂̈ʒu As Long
Dim �m�F�ԍ� As String
Set Duplicate = Worksheets("�d���`�F�b�N")
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
        Worksheets("���C��").EnableCalculation = True
        delete_confirm.Show
        Unload ����t�H�[��
        Exit Sub
    End If
    
    '�e�L�X�g�{�b�N�X��ϊ�����O�Ƀp�X�R�[�h�����͂���Ă��邩���ꍇ��������
    
    Call textbox_restrict(TextBox1, �m�F�ԍ�)
    '���͂��ꂽ�ԍ���ϊ�����
    
    If �m�F�ԍ� = "" Then
        MsgBox ("�w�Дԍ�����͂��Ă�������")
        Worksheets("���C��").EnableCalculation = True
        Exit Sub
    End If
    If number_valid <> 0 Then
        number_valid = 0
        Worksheets("���C��").EnableCalculation = True
        Exit Sub
    End If
    
    
'    If �m�F�ԍ� = Sheets("���f�[�^").Cells(���݂̈ʒu, i).Value Then

    Dim result_list As Variant
    result_list = Filter(target_stu_list, Int(�m�F�ԍ�))
    If UBound(result_list) <> -1 Then
        Call Sheets("���f�[�^").Cells(���݂̈ʒu, 1).EntireRow.Delete(xlShiftUp)
        '        �\�񂵂��f�[�^���폜
        Call delete_res_num(target_stu_list, i - 1)
        Worksheets("���C��").EnableCalculation = True
'        MsgBox ("�\����������܂���")
        delete_confirm.Show
        Unload ����t�H�[��
        Exit Sub
    End If

    
    '�������Ȃ����[�v���ł�����͂������e���폜
    MsgBox ("�w�Дԍ�����v���܂���B������x���͂��Ă�������")
    Worksheets("���C��").EnableCalculation = True
    TextBox1 = ""

Else
    MsgBox ("�\�񂪂���܂���BLA�Ɋm�F���˗����Ă��������B")
End If

End Sub

Private Sub Label1_Click()

End Sub

Private Sub TextBox1_KeyPress(ByVal KeyAscii As MSForms.ReturnInteger)

Call keypressrestrict(KeyAscii)

End Sub

Private Sub UserForm_Click()

End Sub

