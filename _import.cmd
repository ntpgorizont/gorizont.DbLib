@echo off
setlocal enabledelayedexpansion
rem set SQLITE3_PATH=C:\sqlite
set file=gorizont

%SQLITE3_PATH%\sqlite3.exe %file%.db < csv\query.sql

echo [OutputDatabaseLinkFile] > %file%.DbLib
echo Version=1.1 >> %file%.DbLib
echo [DatabaseLinks] >> %file%.DbLib
for /f %%f in ("%file%.db") do (
	echo ConnectionString=Provider=MSDASQL.1;Persist Security Info=False;Extended Properties="Driver={SQLite3 ODBC Driver};Database=%%~ff;StepAPI=0;SyncPragma=;NoTXN=0;Timeout=;ShortNames=0;LongNames=0;NoCreat=0;NoWCHAR=0;FKSupport=0;JournalMode=;OEMCP=0;LoadExt=;BigInt=0;JDConv=0;" >> %file%.DbLib
)	
echo AddMode=3 >> %file%.DbLib
echo RemoveMode=1 >> %file%.DbLib
echo UpdateMode=2 >> %file%.DbLib
echo ViewMode=0 >> %file%.DbLib
echo LeftQuote=[ >> %file%.DbLib
echo RightQuote=] >> %file%.DbLib
echo QuoteTableNames=1 >> %file%.DbLib
echo UseTableSchemaName=0 >> %file%.DbLib
echo DefaultColumnType=VARCHAR(255) >> %file%.DbLib
echo LibraryDatabaseType= >> %file%.DbLib
echo LibraryDatabasePath= >> %file%.DbLib
echo DatabasePathRelative=0 >> %file%.DbLib
echo TopPanelCollapsed=0 >> %file%.DbLib
set pp=%~dp0
set pp=%pp:~0,-1%
echo LibrarySearchPath=%pp% >> %file%.DbLib
echo OrcadMultiValueDelimiter=, >> %file%.DbLib
echo SearchSubDirectories=1 >> %file%.DbLib
echo SchemaName=ALTIUM >> %file%.DbLib

set n=1

for /f "usebackq" %%i in (`%SQLITE3_PATH%\sqlite3.exe %file%.db "SELECT name FROM sqlite_master WHERE type ='table' AND name NOT LIKE 'sqlite_%%';"`) do (
	echo import %%i
	%SQLITE3_PATH%\sqlite3.exe -csv %file%.db ".import csv\\%%i.csv %%i"

	echo [Table!n!] >> %file%.DbLib
	echo SchemaName= >> %file%.DbLib
	echo TableName=%%i >> %file%.DbLib
	echo Enabled=True >> %file%.DbLib
	echo UserWhere=0 >> %file%.DbLib
	echo UserWhereText= >> %file%.DbLib
	
	set /a n+=1
)

set m=1

for /f "usebackq" %%i in (`%SQLITE3_PATH%\sqlite3.exe %file%.db "SELECT name FROM sqlite_master WHERE type ='table' AND name NOT LIKE 'sqlite_%%';"`) do (
	echo create FieldMaps for %%i

	for /f "usebackq" %%t in ( `c:\sqlite\sqlite3.exe %file%.db "pragma table_info(%%i);" ^| findstr /C:"Part Name"` ) do (
		if not %%t=="" (
			echo [FieldMap!m!] >> %file%.DbLib
			echo Options=FieldName=%%i.Part Name^|TableNameOnly=%%i^|FieldNameOnly=Part Name^|FieldType=0^|ParameterName=Part Name^|VisibleOnAdd=False^|AddMode=0^|RemoveMode=0^|UpdateMode=0 >> %file%.DbLib
			set /a m+=1
		)
	)

	for /f "usebackq" %%t in ( `c:\sqlite\sqlite3.exe %file%.db "pragma table_info(%%i);" ^| findstr /C:"Description"` ) do (
		if not %%t=="" (
			echo [FieldMap!m!] >> %file%.DbLib
			echo Options=FieldName=%%i.Description^|TableNameOnly=%%i^|FieldNameOnly=Description^|FieldType=1^|ParameterName=[Description]^|VisibleOnAdd=False^|AddMode=0^|RemoveMode=0^|UpdateMode=0 >> %file%.DbLib
			set /a m+=1
		)
	)

	for /f "usebackq" %%t in ( `c:\sqlite\sqlite3.exe %file%.db "pragma table_info(%%i);" ^| findstr /C:"Library Ref"` ) do (
		if not %%t=="" (
			echo [FieldMap!m!] >> %file%.DbLib
			echo Options=FieldName=%%i.Library Ref^|TableNameOnly=%%i^|FieldNameOnly=Library Ref^|FieldType=1^|ParameterName=[Library Ref]^|VisibleOnAdd=False^|AddMode=0^|RemoveMode=0^|UpdateMode=0 >> %file%.DbLib
			set /a m+=1
		)
	)

	for /f "usebackq" %%t in ( `c:\sqlite\sqlite3.exe %file%.db "pragma table_info(%%i);" ^| findstr /C:"Footprint Ref"` ) do (
		if not %%t=="" (
			echo [FieldMap!m!] >> %file%.DbLib
			echo Options=FieldName=%%i.Footprint Ref^|TableNameOnly=%%i^|FieldNameOnly=Footprint Ref^|FieldType=1^|ParameterName=[Footprint Ref]^|VisibleOnAdd=False^|AddMode=0^|RemoveMode=0^|UpdateMode=0 >> %file%.DbLib
			set /a m+=1
		)
	)

	for /f "usebackq" %%t in ( `c:\sqlite\sqlite3.exe %file%.db "pragma table_info(%%i);" ^| findstr /C:"PCB3D Ref"` ) do (
		if not %%t=="" (
			echo [FieldMap!m!] >> %file%.DbLib
			echo Options=FieldName=%%i.PCB3D Ref^|TableNameOnly=%%i^|FieldNameOnly=PCB3D Ref^|FieldType=1^|ParameterName=[PCB3D Ref]^|VisibleOnAdd=False^|AddMode=0^|RemoveMode=0^|UpdateMode=0 >> %file%.DbLib
			set /a m+=1
		)
	)
)	

rem del /q %TMP%\tables.txt