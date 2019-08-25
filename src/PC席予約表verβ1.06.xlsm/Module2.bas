Attribute VB_Name = "Module2"
Option Explicit

Sub profile_update()
Dim inputsheet As Object
Dim outputsheet As Object
Set inputsheet = Worksheets("����")
Set outputsheet = Worksheets("�o��")

Worksheets("���C��").EnableCalculation = False

Dim i As Integer
i = 2
    Do While inputsheet.Cells(i, 1) <> ""
        outputsheet.Cells(i - 1, 1).Value = inputsheet.Cells(i, 1).Value
        Dim cellT As Variant
        Dim cellL As Variant
        Dim cellW As Variant
        Dim cellH As Variant
        
        With outputsheet.Cells(i - 1, 2)
            cellT = .Top
            cellL = .Left
            cellW = .Width
            cellH = .Height
        End With
        
        Dim T As Variant
        Dim L As Variant
        Dim W As Variant
        Dim H As Variant
        
        T = cellT + cellH / 10
        L = cellL + cellW / 2
        W = cellW / 2
        H = cellH - cellH / 4
        
        With outputsheet.Shapes.AddTextbox(Orientation:=msoTextOrientationHorizontal, Left:=L, Top:=T, Width:=W, Height:=H)
            .TextFrame.Characters.Text = inputsheet.Cells(i, 2) & vbLf & inputsheet.Cells(i, 3) & vbLf & inputsheet.Cells(i, 4)
            .Fill.Visible = False
            .Line.Visible = False
                With .TextFrame.Characters.Font
                            .Size = 18
                            .Name = "���m�p�S�V�b�N JP"
                End With
        End With
        
        Dim T2 As Variant
        Dim L2 As Variant
        Dim W2 As Variant
        Dim H2 As Variant
        
        T2 = cellT + cellH * 0.75
        L2 = cellL
        W2 = cellW
        H2 = cellH * 0.25
        With outputsheet.Shapes.AddTextbox(Orientation:=msoTextOrientationHorizontal, Left:=L2, Top:=T2, Width:=W2, Height:=H2)
            .TextFrame.Characters.Text = inputsheet.Cells(i, 6)
            .Fill.Visible = False
            .Line.Visible = False
                With .TextFrame.Characters.Font
                            .Size = 12
                            .Name = "���m�p�S�V�b�N JP"
                End With
        End With
        
        Dim picfile_path As String
'        Dim pic As Object
        picfile_path = inputsheet.Cells(i, 5).Value
        If picfile_path = "" Then
            MsgBox ("�摜�̃p�X������܂���")
        Else
'            Set pic = LoadPicture(picfile_path)
            Dim pic_W As Variant
            Dim pic_H As Variant
            Dim trim_T As Variant
            Dim trim_L As Variant
            Dim trim_R As Variant
            Dim trim_B As Variant
'            pic_H = pic.Height * 0.0378
'            pic_W = pic.Width * 0.0378
            
            outputsheet.Activate
'            �Ȃ񂩂悭�킩��Ȃ����Ǥ�o�̓V�[�g���A�N�e�B�u�ɂ��Ȃ��Ƃ��܂������Ȃ�����Ԃ�selection�ŏ������Ă��邩�炾�Ǝv�����Ǥshape�I�u�W�F�N�g����ł悭�킩��Ȃ�
            ActiveSheet.Pictures.Insert(picfile_path).Select
            With Application.CommandBars
                If .GetEnabledMso("PictureResetAndSize") = True Then .ExecuteMso "PictureResetAndSize"
            End With
'            �摜�ɂ���ăG�N�Z���ɑ}���������_�ŏc�����t�ɂȂ��Ă���ꍇ�����顁i�����炭iPhone�Ȃǂ̎ʐ^�A�v���ł̕ҏW�̂����j���̏ꍇ�A�ȉ��̐����`�ɉ��H���鏈���Ŗ�肪��������̂ŁA�摜�̃��Z�b�g�������āA���ɖ߂������B
            
            pic_H = Selection.Height
            pic_W = Selection.Width
            If pic_H > pic_W Then
                trim_L = 0
                trim_R = 0
                trim_T = (pic_H - pic_W) / 2
                trim_B = (pic_H - pic_W) / 2
                With Selection.ShapeRange.PictureFormat
                    .CropTop = trim_T
                    .CropLeft = trim_L
                    .CropRight = trim_R
                    .CropBottom = trim_B
                End With
            ElseIf pic_H < pic_W Then
                trim_T = 0
                trim_B = 0
                trim_L = (pic_W - pic_H) / 2
                trim_R = (pic_W - pic_H) / 2
                With Selection.ShapeRange.PictureFormat
                    .CropTop = trim_T
                    .CropLeft = trim_L
                    .CropRight = trim_R
                    .CropBottom = trim_B
                End With

            End If
'            MsgBox CLng(Selection.Width) & "*" & CLng(Selection.Height)
            Selection.ShapeRange.AutoShapeType = msoShapeOval
            Selection.Top = cellT + cellH * 0.1
            Selection.Left = cellL + cellL * 0.2
            Selection.Width = cellW * 0.4
        End If
                
        i = i + 1
    Loop

Worksheets("���C��").EnableCalculation = True
End Sub
