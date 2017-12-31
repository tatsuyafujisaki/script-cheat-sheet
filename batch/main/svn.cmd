rem Reset working copy
tortoiseproc /noui /path:. /command:cleanup /cleanup /revert /delunversioned /delignored /refreshshell /externals

rem Delete trunk/branch/tag
svn delete -m "Delete branch1." {url}

rem Move trunk/branch/tag
svn move -m "Back up branch1." {url_from} {url_to}

rem Make branch from trunk
svn copy -m "Make trunk from branch1." {trunk} {branch1}

rem Make trunk from a branch
svn move -m "" {trunk} {tags/trunk-snapshot-yyyymmdd}
svn copy -m "" {branches/branch1} {trunk}
rem After making trunk from a branch, don't forget to ..
rem Point to dev database
rem Set scm to refer to trunk <scm><connection>scm:svn:http://example.com/trunk</connection></scm>

rem Restore deleted branch
svn copy -m "" https://example.com/repo/branches/branch1@<M> https://example.com/repo

rem Chckout specific version
svn checkout -r 1234 http://example.com/repo

rem Update subdirectories of repositories
for /d %%d in (%~dp0\*) do (
    svn update -q --accept theirs-full %%d
)

rem How to partially check out no-longer-existing directory
rem http://svnbook.red-bean.com/en/1.7/svn.advanced.sparsedirs.html
svn co -r 1234 --depth empty http://example.com/svn/grandfather
cd grandfather
svn update -r 1234 --set-depth empty father
cd father
svn update -r 1234 --set-depth empty son
cd son
svn update -r 1234 --set-depth infinity grandson_and_descendants
cd grandson_and_descendants