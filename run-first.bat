
@echo off
rem -------------------------------------
if not "%~1"=="p" start /min cmd.exe /c %0 p&exit
rem -------------------------------------
cd /d "%~dp0"
set "TOPDIR=%cd%"
title "%~n0"
rem -------------------------------------
if "x%PGM_ROOTDIR%" == "x"  set "  PGM_ROOTDIR=D:/pgm"
rem -------------------------------------

rem -------------------------------------
: setlocal enabledelayedexpansion
rem -------------------------------------
setlocal enabledelayedexpansion
rem -------------------------------------


:----------------------------------------
set "ORIGIN_PATH=%PATH%"
set "MINI_PATH=C:/WINDOWS/system32;C:/WINDOWS;C:/WINDOWS/System32/Wbem"
set "PATH=%MINI_PATH%"
:----------------------------------------

set "WORK_HOME=D:/work_home"
if not exist "%WORK_HOME%" mkdir "%WORK_HOME:/=\%"

set "DEV_HOME=%TOPDIR:\=/%/Programs"
set "DEVROOT=%DEV_HOME%"

:----------------------------------------

set "PATH=%DEVROOT%;%PATH%"
:----------------------------------------
echo %PATH%

REM del /f /q "%userprofile%"\Desktop\cvpChrome32.lnk /f >nul 2>nul
REM del /f /q "%userprofile%"\桌面\cvpChrome64.lnk /f >nul 2>nul
if not exist "%public%" if not exist "%userprofile%/Desktop/cvpChrome32.lnk" call :Establish32
if     exist "%public%" if not exist "%userprofile%/Desktop/cvpChrome64.lnk" call :Establish64

REM goto :eof_with_pause
if "%errorlevel%" == "0" goto :eof_with_exit
rem -------------------------------------
:eof_with_pause
pause
:eof_with_exit
exit

:Establish32
if not exist "%userprofile%/Desktop" mkdir "%userprofile%\Desktop"
mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\cvpChrome32.lnk""):b.TargetPath=""%~dp0Programs/cvpChrome.exe"":b.IconLocation=""%~dp0Programs/cvpChrome.exe, 0"":b.WorkingDirectory=""%~dp0Programs"":b.Save:close")
goto :EOF

:Establish64
if not exist "%userprofile%/Desktop" mkdir "%userprofile%\Desktop"
mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\cvpChrome64.lnk""):b.TargetPath=""%~dp0Programs/cvpChrome_x64.exe"":b.IconLocation=""%~dp0Programs/cvpChrome_x64.exe, 0"":b.WorkingDirectory=""%~dp0Programs"":b.Save:close")
goto :EOF

