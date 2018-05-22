@echo off

sqlcmd -S (local)\SQLEXPRESS -E

rem You can issue queries after login as follows.
rem SELECT @@VERSION
rem GO
