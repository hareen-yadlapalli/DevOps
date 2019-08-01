@echo off
setlocal enabledelayedexpansion
set %1
REM echo serverHomePath=%serverHomePath%
echo starting the server, server path is %serverHomePath%
REM cd %serverHomePath%\bin
psexec \\%server_name% -u %server_login% -p %server_password% "%serverHomePath%\startup.bat"
REM startup.bat






