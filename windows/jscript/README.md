# Template
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

# How to run .js
```batch
cscript Main.js //nologo
```

# References
* [JScript Version Information (and info about what versions support what elements)](https://msdn.microsoft.com/en-us/library/2z6exc9e.aspx)
* [JScript (ECMAScript3)](https://msdn.microsoft.com/en-us/library/hbxc2t98.aspx)
* [Run Method (Windows Script Host)](https://msdn.microsoft.com/en-us/library/d5fk67ky.aspx)