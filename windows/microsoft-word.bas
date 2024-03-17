Option Explicit

Private Sub Reformat()
    SetMincho12
    ConvertHankakuToZenkaku
    SetHangingIndent
End Sub

Private Sub SetMincho12()
    Selection.WholeStory
        
    With Selection.Font
        .Name = "MS Mincho"
        .Size = 12
    End With
End Sub

Private Sub ConvertHankakuToZenkaku()
    Selection.WholeStory
    Selection.Range.CharacterWidth = wdWidthFullWidth
End Sub

' "ji" is the number of characters in Japanese
' https://www.kanjipedia.jp/kanji/0002843100
Private Sub SetHangingIndent(Optional ji As Integer = 1)
    Selection.WholeStory
    Selection.ParagraphFormat.CharacterUnitFirstLineIndent = -1 * ji
End Sub
