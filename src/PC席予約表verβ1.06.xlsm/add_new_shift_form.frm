VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} add_new_shift_form 
   Caption         =   "�V�t�g�̒ǉ�"
   ClientHeight    =   4635
   ClientLeft      =   90
   ClientTop       =   405
   ClientWidth     =   7095
   OleObjectBlob   =   "add_new_shift_form.frx":0000
   StartUpPosition =   1  '�I�[�i�[ �t�H�[���̒���
End
Attribute VB_Name = "add_new_shift_form"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit



Private Sub ComboBox2_Change()

End Sub

Private Sub CommandButton1_Click()

If ComboBox2.ListIndex = -1 Then
    MsgBox ("���O��I�����Ă�������")
    Exit Sub
End If

Dim end_time As Date

If ComboBox1.ListIndex = -1 Then
    end_time = DateAdd("n", 120, Date + Time)
ElseIf ComboBox1.ListIndex = 0 Then
    end_time = DateAdd("n", 15, Date + Time)
Else
    end_time = DateAdd("n", 30 * ComboBox1.ListIndex, Date + Time)
End If

Dim search As Integer
Dim shift_time_end As Range
Set shift_time_end = Worksheets("�V�t�g�\").Columns(shift_table.�Ζ����ԑяI��)
On Error GoTo data_nothing
search = WorksheetFunction.Match(CDbl(end_time), shift_time_end, 1)
With Worksheets("�V�t�g�\")
    .Cells(search + 1, 2).EntireRow.Insert
    .Cells(search + 1, 1) = Date + Time
    .Cells(search + 1, 2) = end_time
    .Cells(search + 1, 3) = Sheets("����").Cells(2 + ComboBox2.ListIndex, 1)
End With

MsgBox ("�V�t�g�ɒǉ����܂���")
Call shift_output_mainsheet(Time)
Unload add_new_shift_form

Exit Sub

data_nothing:
search = 2

End Sub


Private Sub UserForm_Initialize()

CommandButton1.SetFocus

With ComboBox1
    .AddItem "15���Ζ�"
    .AddItem "30���Ζ�"
    .AddItem "60���Ζ�"
    .AddItem "90���Ζ�"
    .AddItem "120���Ζ�"
End With

Dim i As Integer
i = 2

With ComboBox2
    While Sheets("����").Cells(i, 1) <> ""
        .AddItem Sheets("����").Cells(i, 4).Value
        i = i + 1
    Wend
End With

ComboBox2.ListRows = 5

End Sub
