Option Explicit

Sub SetFontToMincho12()
    Selection.WholeStory
        
    With Selection.Font
        .Name = "MS Mincho"
        .Size = 12
    End With
End Sub

Sub ConvertTextToZenkaku()
    Selection.WholeStory
    Selection.Range.CharacterWidth = wdWidthFullWidth
End Sub
