@echo off
setlocal enabledelayedexpansion
set %1
set %2
set %3
set %4
set %5
set %6
echo in stopServer.bat file
echo serverName=%serverName%
echo serverUserName=%serverUserName%
echo serverPassword=%serverPassword%
echo serviceName=%serviceName%

echo canRestartServer=%canRestartServer%
if %canRestartServer%==true (
echo "stopping server..."
REM net use s: %serverName% /u:%serverUserName% %serverPassword%
REM sc \\%serverName% stop %serviceName%
)
if %canRestartServer%==false (
echo "Server restart not requested..."
)
