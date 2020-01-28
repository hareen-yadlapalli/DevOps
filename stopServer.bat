@echo off
echo before enable
setlocal enabledelayedexpansion
echo after enable
set %1
echo after 1 %1
set %2
echo after 2
set %3
echo after 3
set %4
echo after 4
set %5
echo after 5
set %6
echo in stop server
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
