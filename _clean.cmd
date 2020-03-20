@echo off
@echo Removing temporary files...
del   /q debug.log               >nul 2>&1
del   /q footprints\debug.log               >nul 2>&1
del   /q PCB3D\debug.log               >nul 2>&1

rmdir /s /q "History"        >nul 2>&1
rmdir /s /q "symbols\History"        >nul 2>&1
rmdir /s /q "footprints\History"        >nul 2>&1
