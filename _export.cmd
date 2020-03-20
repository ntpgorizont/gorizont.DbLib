@echo off
set SQLITE3_PATH=C:\sqlite

%SQLITE3_PATH%\sqlite3.exe %1 "SELECT name FROM sqlite_master WHERE type ='table' AND name NOT LIKE 'sqlite_%%';" > %TMP%\tables.txt

if not exist %2 mkdir %2

if exist %2\query.sql del /q %2\query.sql
rem echo .mode csv > %2\query.sql

for /f %%i in (%TMP%\tables.txt) do (
	echo export %%i
	echo DROP TABLE IF EXISTS %%i; >> %2\query.sql
	%SQLITE3_PATH%\sqlite3.exe %1 ".schema %%i" >> %2\query.sql
	%SQLITE3_PATH%\sqlite3.exe -noheader -csv %1 "select * from %%i;" > %2\%%i.csv
)

del /q %TMP%\tables.txt