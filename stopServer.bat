@echo off
setlocal enabledelayedexpansion
set %1
set %2
set %3
set %4
REM set %5
REM set %6

if %canRestartServer%==true (
echo "stopping server..."
net use s: %serverName% /u:%serverUserName% %ServerUserPwd%

set I=0
set L=-1
:l
if "!serverName:~%I%,1!"=="" goto ld
if "!serverName:~%I%,1!"=="\" set L=%I%
set /a I+=1
goto l
:ld
REM echo %L%
echo Connected to server %serverName:~0,17%
sc %serverName:~0,17% stop %serviceName%

REM sc \\%serverName% stop %serviceName
net use s: /delete
)
if %canRestartServer%==false (
echo "Server restart not requested..."
)
