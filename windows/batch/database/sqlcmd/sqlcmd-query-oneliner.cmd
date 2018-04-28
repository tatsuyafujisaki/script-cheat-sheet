@echo off

SQLCMD.EXE -W -h -1 -s "|" -f 932 -S server1 -d database1 -U user1 -P password1 -Q "SET NOCOUNT ON; SELECT * FROM Table1" -o Table1.txt