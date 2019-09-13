@echo off
setlocal enabledelayedexpansion
set %1
set %2
set %3
set %4
set %5
set %6
REM echo in startServer.bat file
REM echo serverName=%serverName%
REM echo serverUserName=%serverUserName%
REM echo serverPassword=%serverPassword%
REM echo serviceName=%serviceName%
REM echo canRestartServer=%canRestartServer%
if %canRestartServer%==true (
echo "starting server..."
net use s: %serverName% /u:%serverUserName% %ServerUserPwd%

set I=0
set L=-1
:l
if "!serverName:~%I%,1!"=="" goto ld
if "!serverName:~%I%,1!"=="\" set L=%I%
set /a I+=1
goto l
:ld
echo %L%
%serverName:~0,17%
sc %serverName:~0,17% start %serviceName%

REM sc %serverName% start %serviceName%
net use s: /delete
)
if %canRestartServer%==false (
echo "Server restart not requested..."
)






