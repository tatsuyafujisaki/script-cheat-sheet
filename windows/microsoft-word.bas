Option Explicit

Sub SetMincho12()
    Selection.WholeStory
        
    With Selection.Font
        .Name = "MS Mincho"
        .Size = 12
    End With
End Sub

Sub ConvertToZenkaku()
    Selection.WholeStory
    Selection.Range.CharacterWidth = wdWidthFullWidth
End Sub

Sub SetHangingIndent()
    Dim ji As Integer ' The number of characters: https://www.kanjipedia.jp/kanji/0002843100
    ji = 1
    
    Selection.WholeStory

    Selection.ParagraphFormat.CharacterUnitFirstLineIndent = -1 * ji
End Sub
