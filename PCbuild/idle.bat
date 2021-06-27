@echo off
rem Start IDLE using the appropriate Python interpreter
set CURRDIR=C:\cpython
start "IDLE" "%CURRDIR%\pythonw.exe" "%CURRDIR%\Lib\idlelib\idle.pyw" %1 %2 %3 %4 %5 %6 %7 %8 %9
