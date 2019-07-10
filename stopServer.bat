@echo off
setlocal enabledelayedexpansion
set %1
REM echo serverHomePath=%serverHomePath%
echo stopping the server, server path is %serverHomePath%
cd %serverHomePath%\bin
shutdown.bat






