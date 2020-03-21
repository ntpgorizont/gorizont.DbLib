@echo off
rem set SQLITE3_PATH=C:\sqlite

if not exist csv mkdir csv

if exist csv\query.sql del /q csv\query.sql

for /f "usebackq" %%i in (`%SQLITE3_PATH%\sqlite3.exe %1.db "SELECT name FROM sqlite_master WHERE type ='table' AND name NOT LIKE 'sqlite_%%';"`) do (
	echo export %%i
	echo DROP TABLE IF EXISTS %%i; >> csv\query.sql
	%SQLITE3_PATH%\sqlite3.exe %1.db ".schema %%i" >> csv\query.sql
	%SQLITE3_PATH%\sqlite3.exe -noheader -csv %1.db "select * from %%i;" > csv\%%i.csv
)
