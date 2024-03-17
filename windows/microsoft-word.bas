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
    Dim numberOfCharacters As Integer
    numberOfCharacters = 1 ' The unit is 字.
    
    Selection.WholeStory
    
    With Selection.ParagraphFormat
        .CharacterUnitFirstLineIndent = -1 * numberOfCharacters
    End With
End Sub
