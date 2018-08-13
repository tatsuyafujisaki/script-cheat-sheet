# JScript

## How to run .js
```batch
cscript Main.js //nologo
```

## Template
```js
'use strict';

function singleQuote(s) {
  return "'" + s + "'";
}

function doubleQuote(s) {
  return '"' + s + '"';
}

var shell = WScript.CreateObject('WScript.Shell');
var fso = WScript.CreateObject('Scripting.FileSystemObject');

// Set the script directory to the current directory
shell.CurrentDirectory = fso.GetParentFolderName(WScript.ScriptFullName);
```

## References
* [JScript Version Information (and info about what versions support what elements)](https://msdn.microsoft.com/en-us/library/2z6exc9e.aspx)
* [JScript (ECMAScript3)](https://msdn.microsoft.com/en-us/library/hbxc2t98.aspx)
* [Run Method (Windows Script Host)](https://msdn.microsoft.com/en-us/library/d5fk67ky.aspx)

# VBScript

## How to run .vbs
```batch
cscript Main.vbs //nologo
```

## Template
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

# WScript
Property|Description
---|---
WScript.ScriptFullName|Absolute path to script
WScript.Script|Script name