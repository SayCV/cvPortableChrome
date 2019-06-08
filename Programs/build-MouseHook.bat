
@echo off
rem -------------------------------------
if not "%~1"=="p" start /min cmd.exe /c %0 p&exit
rem -------------------------------------
cd /d "%~dp0"
set "TOPDIR=%cd%"
title "%~n0"
rem -------------------------------------
if "x%WBK_ROOTDIR%" == "x"      set "WBK_ROOTDIR=D:/wbk"
if "x%PGM_ROOTDIR%" == "x"      set "  PGM_ROOTDIR=D:/pgm"
if "x%PGMBAK_ROOTDIR%" == "x"   set "  PGMBAK_ROOTDIR=E:/pgm"
if "x%PGMBAK2_ROOTDIR%" == "x"  set "  PGMBAK2_ROOTDIR=F:/pgm"
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

rem -------------------------------------
if "x1" == "x1" (
rem set "MSYSTEM=MINGW64"
set "MSYSTEM_MSYS=true"
set "MSYSTEM_MINGW=false"
call "!WBK_ROOTDIR!/etc/skel/tpl.tools.env.msys2.bat"
)
rem -------------------------------------

rem -------------------------------------
if "x1" == "x1" (
if "x!PELLESC_VER!" == "x" set "PELLESC_VER=9.00"
set "PELLESC_TOPDIR=!PGM_ROOTDIR!/DEV/PellesC-v!PELLESC_VER!"
if not exist "!PELLESC_TOPDIR!" set "PELLESC_TOPDIR=!PGMBAK_ROOTDIR!/DEV/PellesC-v!PELLESC_VER!"
if not exist "!PELLESC_TOPDIR!" set "PELLESC_TOPDIR=!PGMBAK2_ROOTDIR!/DEV/PellesC-v!PELLESC_VER!"

set "PELLESC_ROOTDIR=!PELLESC_TOPDIR!"
SET "PELLESC=!PELLESC_ROOTDIR!"
@set "PATH=!PELLESC_ROOTDIR!/bin;%PATH%"

)
rem -------------------------------------


rem -------------------------------------
echo [debug] [Action] Start.
:     Action Start
rem -------------------------------------

cd MouseHook

make -f Makefile.PellesC >%TOPDIR%/%~n0.make.log 2>&1

goto :_my_eof_

:finished_with_error
echo %error%
goto :_my_eof_

:_my_eof_
POPD

rem PAUSE

