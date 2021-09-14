@echo off

set file=gorizont
set PATH=%SQLITE3_PATH%;%PATH%

if not exist csv mkdir csv

if exist csv\query.sql del /q csv\query.sql

for /f "usebackq" %%i in (`sqlite3.exe %file%.db "SELECT name FROM sqlite_master WHERE type ='table' AND name NOT LIKE 'sqlite_%%';"`) do (
	echo export %%i
	echo DROP TABLE IF EXISTS %%i; >> csv\query.sql
	sqlite3.exe %file%.db ".schema %%i" >> csv\query.sql
	sqlite3.exe -noheader -csv %file%.db "select * from %%i;" > csv\%%i.csv
)
