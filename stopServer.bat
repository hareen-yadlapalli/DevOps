@echo off
setlocal enabledelayedexpansion
set %1
set %2
set %3
set %4
set %5
set %6
REM echo in stopServer.bat file
REM echo serverName=%serverName%
REM echo serverUserName=%serverUserName%
REM echo serverPassword=%serverPassword%
REM echo serviceName=%serviceName%

REM echo canRestartServer=%canRestartServer%
if %canRestartServer%==true (
echo "stopping server..."
net use s: %serverName% /u:%serverUserName% %serverPassword%
sc \\%serverName% stop %serviceName
net use s: /delete
)
if %canRestartServer%==false (
echo "Server restart not requested..."
)
