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
echo %serverUserName%
echo %serverPassword%
net use s: %serverName% /u:%serverUserName% %serverPassword%

set I=0
set L=-1
:l
if "!serverName:~%I%,1!"=="" goto ld
if "!serverName:~%I%,1!"=="\" set L=%I%
set /a I+=1
goto l
:ld
echo %L%
echo %serverName:~0,17%
sc %serverName:~0,17% stop %serviceName%

REM sc \\%serverName% stop %serviceName
net use s: /delete
)
if %canRestartServer%==false (
echo "Server restart not requested..."
)
