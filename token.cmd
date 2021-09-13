@echo off

setlocal enableextensions
setlocal enabledelayedexpansion

for /f "delims=: tokens=1" %%i in ('git remote get-url origin') do set HSTR=%%i
for /f "delims=: tokens=3" %%i in ('git remote get-url origin') do set TSTR=%%i

if not defined TSTR (
	for /f "delims=: tokens=2" %%i in ('git remote get-url origin') do set TSTR=%%i
	set TSTR=!TSTR:~2!
	set MSTR=://%1:x-oauth-basic@
) else (
	set MSTR=://%1:
)

git remote set-url origin %HSTR%%MSTR%%TSTR%

@echo token updated