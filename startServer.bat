@echo off
setlocal enabledelayedexpansion
set %1
REM echo serverHomePath=%serverHomePath%
echo starting the server, server path is %serverHomePath%
cd %serverHomePath%\bin
startup.bat






