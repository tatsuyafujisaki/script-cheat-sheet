# Template
```vbs
Option Explicit

Function GetCurrentDirectory()
  With CreateObject("WScript.Shell")
    GetCurrentDirectory= .CurrentDirectory
  End With
End Function

Sub SetCurrentDirectory(ByVal directory)
  With CreateObject("WScript.Shell")
    .CurrentDirectory = directory
  End With
End Sub

Function GetScriptDirectory()
  With CreateObject("Scripting.FileSystemObject")
    GetScriptDirectory = .GetParentFolderName(WScript.ScriptFullName)
  End With
End Function
```

# How to run .vbs
```batch
cscript Main.vbs //nologo
```