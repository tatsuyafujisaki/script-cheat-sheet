Date.prototype.yyyymmdd = function () {
    var yyyy = this.getFullYear();
    var mm = this.getMonth() + 1;
    var dd = this.getDate();
    return yyyy + '-' + (mm < 10 ? '0' + mm : mm) + '-' + (dd < 10 ? '0' + dd : dd);
};

if (WScript.Arguments.length !== 1) {
    WScript.Echo('Please drop a folder or a file.');
    WScript.Quit();
}

var path = WScript.Arguments.Item(0);
var fso = new ActiveXObject('Scripting.FileSystemObject');

if (fso.FolderExists(path)) {
    fso.MoveFolder(path, path.substr(0, i) + '-' + (new Date()).yyyymmdd());
} else {
    var i = path.lastIndexOf('.');
    fso.MoveFile(path, path.substr(0, i) + '-' + (new Date()).yyyymmdd() + path.substr(i));
}