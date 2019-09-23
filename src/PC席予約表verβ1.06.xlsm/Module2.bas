Attribute VB_Name = "Module2"
Option Explicit

Sub profile_update()
'���̓V�[�g�̃v���t�B�[���X�V�{�^��

Dim inputsheet As Object
Dim outputsheet As Object
Set inputsheet = Worksheets("����")
Set outputsheet = Worksheets("�o��")

Worksheets("���C��").EnableCalculation = False

Dim shp As Shape

For Each shp In outputsheet.shapes
    shp.Delete
Next shp

Dim i As Integer
i = 2
    Do While inputsheet.Cells(i, 1) <> ""
        outputsheet.Cells(i, 1).Value = inputsheet.Cells(i, 1).Value
        Dim cellT As Variant
        Dim cellL As Variant
        Dim cellW As Variant
        Dim cellH As Variant
        
        With outputsheet.Cells(i, 2)
            cellT = .Top
            cellL = .Left
            cellW = .Width
            cellH = .Height
        End With
        
        Dim T As Variant
        Dim L As Variant
        Dim W As Variant
        Dim H As Variant
        
        T = cellT + cellH * 0.02 '���O�Ə�����\������e�L�X�g�{�b�N�X�̍���̈ʒu�̂��������̈ʒu�BcellT�͕\������Z���̍���̈ʒu�BcellH�̓Z���̍����B�����鐔���𒲐����邱�Ƃňʒu�𒲐��ł���
        L = cellL + cellW * 0.45 '��L�̂��������̈ʒu�B�����鐔���𒲐����邱�Ƃňʒu�𒲐��ł���
        W = cellW / 2 '�e�L�X�g�{�b�N�X�̕��̑傫���B
        H = cellH - cellH / 4 '�e�L�X�g�{�b�N�X�̍����̑傫��
        
        With outputsheet.shapes.AddTextbox(Orientation:=msoTextOrientationHorizontal, Left:=L, Top:=T, Width:=W, Height:=H)
            .TextFrame.Characters.Text = inputsheet.Cells(i, 2) & vbLf & inputsheet.Cells(i, 3) & vbLf & inputsheet.Cells(i, 4)
            .Fill.Visible = False
            .Line.Visible = False
                With .TextFrame.Characters.Font  '�e�L�X�g�{�b�N�X�̃t�H���g�̐ݒ�
                            .Size = 14
                            .Name = "���m�p�S�V�b�N JP"
                End With
        End With
        
        Dim T2 As Variant
        Dim L2 As Variant
        Dim W2 As Variant
        Dim H2 As Variant
        
        T2 = cellT + cellH * 0.55 '�R�����g�̃e�L�X�g�{�b�N�X�̍���̈ʒu�̂��������̈ʒu�BcellT�͕\������Z���̍���̈ʒu�BcellH�̓Z���̍����B�����鐔���𒲐����邱�Ƃňʒu�𒲐��ł���
        L2 = cellL '��L�̂��������̈ʒu�B�����鐔���𒲐����邱�Ƃňʒu�𒲐��ł���
        W2 = cellW '�e�L�X�g�{�b�N�X�̕��̑傫���B
        H2 = cellH * 0.45 '�e�L�X�g�{�b�N�X�̍����̑傫��
        
        With outputsheet.shapes.AddTextbox(Orientation:=msoTextOrientationHorizontal, Left:=L2, Top:=T2, Width:=W2, Height:=H2)
            .TextFrame.Characters.Text = inputsheet.Cells(i, 6)
            .Fill.Visible = False
            .Line.Visible = False
                With .TextFrame.Characters.Font '�t�H���g�̐ݒ�
                            .Size = 10
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
            Selection.ShapeRange.AutoShapeType = msoShapeOval '�摜�̌`
            Selection.Top = cellT + cellH * 0.05 '�摜�̍���̂����̈ʒu
            Selection.Left = cellL + cellL * 0.1 '�摜�̍���̂����̈ʒu
            Selection.Width = cellW * 0.37 '�摜�̕�
        End If
                
        i = i + 1
    Loop

Worksheets("���C��").EnableCalculation = True
End Sub
