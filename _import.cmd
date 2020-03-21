@echo off
setlocal enabledelayedexpansion
rem set SQLITE3_PATH=C:\sqlite

%SQLITE3_PATH%\sqlite3.exe %1.db < csv\query.sql

echo [OutputDatabaseLinkFile] > %1.DbLib
echo Version=1.1 >> %1.DbLib
echo [DatabaseLinks] >> %1.DbLib
for /f %%f in ("%1.db") do (
	echo ConnectionString=Provider=MSDASQL.1;Persist Security Info=False;Extended Properties="Driver={SQLite3 ODBC Driver};Database=%%~ff;StepAPI=0;SyncPragma=;NoTXN=0;Timeout=;ShortNames=0;LongNames=0;NoCreat=0;NoWCHAR=0;FKSupport=0;JournalMode=;OEMCP=0;LoadExt=;BigInt=0;JDConv=0;" >> %1.DbLib
)	
echo AddMode=3 >> %1.DbLib
echo RemoveMode=1 >> %1.DbLib
echo UpdateMode=2 >> %1.DbLib
echo ViewMode=0 >> %1.DbLib
echo LeftQuote=[ >> %1.DbLib
echo RightQuote=] >> %1.DbLib
echo QuoteTableNames=1 >> %1.DbLib
echo UseTableSchemaName=0 >> %1.DbLib
echo DefaultColumnType=VARCHAR(255) >> %1.DbLib
echo LibraryDatabaseType= >> %1.DbLib
echo LibraryDatabasePath= >> %1.DbLib
echo DatabasePathRelative=0 >> %1.DbLib
echo TopPanelCollapsed=0 >> %1.DbLib
for /f %%f in ("%1.db") do ( 
	set pp=%%~dpf
	set pp=!pp:~0,-1!
	echo LibrarySearchPath=!pp! >> %1.DbLib
)
echo OrcadMultiValueDelimiter=, >> %1.DbLib
echo SearchSubDirectories=1 >> %1.DbLib
echo SchemaName=ALTIUM >> %1.DbLib

set n=1

for /f "usebackq" %%i in (`%SQLITE3_PATH%\sqlite3.exe %1.db "SELECT name FROM sqlite_master WHERE type ='table' AND name NOT LIKE 'sqlite_%%';"`) do (
	echo import %%i
	%SQLITE3_PATH%\sqlite3.exe -csv %1.db ".import csv\\%%i.csv %%i"

	echo [Table!n!] >> %1.DbLib
	echo SchemaName= >> %1.DbLib
	echo TableName=%%i >> %1.DbLib
	echo Enabled=True >> %1.DbLib
	echo UserWhere=0 >> %1.DbLib
	echo UserWhereText= >> %1.DbLib
	
	set /a n+=1
)

set m=1

for /f "usebackq" %%i in (`%SQLITE3_PATH%\sqlite3.exe %1.db "SELECT name FROM sqlite_master WHERE type ='table' AND name NOT LIKE 'sqlite_%%';"`) do (
	echo create FieldMaps for %%i

	for /f "usebackq" %%t in ( `c:\sqlite\sqlite3.exe %1.db "pragma table_info(%%i);" ^| findstr /C:"Part Name"` ) do (
		if not %%t=="" (
			echo [FieldMap!m!] >> %1.DbLib
			echo Options=FieldName=%%i.Part Name^|TableNameOnly=%%i^|FieldNameOnly=Part Name^|FieldType=0^|ParameterName=Part Name^|VisibleOnAdd=False^|AddMode=0^|RemoveMode=0^|UpdateMode=0 >> %1.DbLib
			set /a m+=1
		)
	)

	for /f "usebackq" %%t in ( `c:\sqlite\sqlite3.exe %1.db "pragma table_info(%%i);" ^| findstr /C:"Description"` ) do (
		if not %%t=="" (
			echo [FieldMap!m!] >> %1.DbLib
			echo Options=FieldName=%%i.Description^|TableNameOnly=%%i^|FieldNameOnly=Description^|FieldType=1^|ParameterName=[Description]^|VisibleOnAdd=False^|AddMode=0^|RemoveMode=0^|UpdateMode=0 >> %1.DbLib
			set /a m+=1
		)
	)

	for /f "usebackq" %%t in ( `c:\sqlite\sqlite3.exe %1.db "pragma table_info(%%i);" ^| findstr /C:"Library Ref"` ) do (
		if not %%t=="" (
			echo [FieldMap!m!] >> %1.DbLib
			echo Options=FieldName=%%i.Library Ref^|TableNameOnly=%%i^|FieldNameOnly=Library Ref^|FieldType=1^|ParameterName=[Library Ref]^|VisibleOnAdd=False^|AddMode=0^|RemoveMode=0^|UpdateMode=0 >> %1.DbLib
			set /a m+=1
		)
	)

	for /f "usebackq" %%t in ( `c:\sqlite\sqlite3.exe %1.db "pragma table_info(%%i);" ^| findstr /C:"Footprint Ref"` ) do (
		if not %%t=="" (
			echo [FieldMap!m!] >> %1.DbLib
			echo Options=FieldName=%%i.Footprint Ref^|TableNameOnly=%%i^|FieldNameOnly=Footprint Ref^|FieldType=1^|ParameterName=[Footprint Ref]^|VisibleOnAdd=False^|AddMode=0^|RemoveMode=0^|UpdateMode=0 >> %1.DbLib
			set /a m+=1
		)
	)

	for /f "usebackq" %%t in ( `c:\sqlite\sqlite3.exe %1.db "pragma table_info(%%i);" ^| findstr /C:"PCB3D Ref"` ) do (
		if not %%t=="" (
			echo [FieldMap!m!] >> %1.DbLib
			echo Options=FieldName=%%i.PCB3D Ref^|TableNameOnly=%%i^|FieldNameOnly=PCB3D Ref^|FieldType=1^|ParameterName=[PCB3D Ref]^|VisibleOnAdd=False^|AddMode=0^|RemoveMode=0^|UpdateMode=0 >> %1.DbLib
			set /a m+=1
		)
	)
)	

rem del /q %TMP%\tables.txt