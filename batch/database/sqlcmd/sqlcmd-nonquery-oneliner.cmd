@echo off

SQLCMD.EXE -f 932 -S server1 -d database1 -U user1 -P password1 -Q "TRUNCATE TABLE Table1"