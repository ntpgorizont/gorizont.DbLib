@echo off
set SQLITE3_PATH=C:\sqlite

%SQLITE3_PATH%\sqlite3.exe %1 < %2\query.sql > %TMP%\tables.txt
%SQLITE3_PATH%\sqlite3.exe %1 "SELECT name FROM sqlite_master WHERE type ='table' AND name NOT LIKE 'sqlite_%%';" > %TMP%\tables.txt

rem echo .mode csv > %2\query.sql

for /f %%i in (%TMP%\tables.txt) do (
	echo import %%i
	%SQLITE3_PATH%\sqlite3.exe -csv %1 ".import %2\\%%i.csv %%i"
)

del /q %TMP%\tables.txt