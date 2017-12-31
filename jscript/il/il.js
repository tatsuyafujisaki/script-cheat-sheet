function doubleQuote(s) {
    return '\'' + s + '\'';
}

if (WScript.Arguments.length !== 1) {
    WScript.Echo('please drop a PE file.');
    WScript.Quit();
}

var fso = WScript.CreateObject('Scripting.FileSystemObject');

var inputPath = WScript.Arguments.Item(0);
var outputPath = doubleQuote(fso.BuildPath(fso.GetParentFolderName(inputPath), fso.GetBaseName(inputPath) + '.html'));

inputPath = doubleQuote(inputPath);

shell = WScript.CreateObject('WScript.Shell');

// Output in HTML rather than GUI because the former is color while the latter is black and white.
shell.Run('ildasm.exe /nobar /source /html /out=' + outputPath + ' ' + inputPath, 0, true);

// Open with the default browser.
shell.Run(outputPath);