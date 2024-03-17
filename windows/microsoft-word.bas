Option Explicit

Private Sub Reformat()
    SetMincho12
    ConvertHankakuToZenkaku
    SetHangingIndent 1
End Sub

Private Sub SetHangingIndentOnSelection2()
    SetHangingIndentOnSelection 2
End Sub

Private Sub SetHangingIndentOnSelection5()
    SetHangingIndentOnSelection 5
End Sub

Private Sub SetHangingIndentOnSelection6()
    SetHangingIndentOnSelection 6
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
Private Sub SetHangingIndent(Optional ji As Integer = 2)
    Selection.WholeStory
    Selection.ParagraphFormat.CharacterUnitFirstLineIndent = -1 * ji
End Sub

Private Sub SetHangingIndentOnSelection(Optional ji As Integer = 2)
    Selection.ParagraphFormat.CharacterUnitFirstLineIndent = -1 * ji
End Sub
