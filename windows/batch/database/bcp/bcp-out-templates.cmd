@echo off

title %~df0

cd /d %~dp0

set server=server1
set database=database1
set schema=schema1
set user=user1
set password=password1
set table=table1

set query1="SELECT Group + '.' + Name FROM %database%.%schema%.%table%"
set query2=SELECT Binary FROM %database%.%schema%.%table% WHERE Group + '.' + Name =

set tmpfile="%temp%\%random%.tmp"

bcp.exe %query1% queryout %tmpfile% -c -S %server% -U %user% -P %password%

rem Enter the file storage type of field val1 [varbinary(max)]: (Enter)
rem Enter prefix-length of field val1 [8]: 0
rem Enter length of field val1 [0]: (Enter)
rem Enter field terminator [none]: (Enter)
rem Do you want to save this format information in a file? [Y/n] (Enter)
rem Host filename [bcp.fmt]: (Enter)

if exist bcp.fmt (
  for /f "tokens=*" %%l in (%tmpfile%) do (
    bcp.exe "%query2%%%l" queryout "%%l" -S %server% -U %user% -P %password% -f bcp.fmt
  )
) else (
  for /f "tokens=*" %%l in (%tmpfile%) do (
    bcp.exe "%query2%%%l" queryout "%%l" -S %server% -U %user% -P %password%
  )
)

del %tmpfile%