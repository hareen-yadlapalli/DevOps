@echo off
setlocal enabledelayedexpansion
set %1
set %2
set %3
set %4
set %5
set %6

echo serverName=%serverName%
echo serverUserName=%serverUserName%
echo serverPassword=%serverPassword%
echo serviceName=%serviceName%

REM net use s: %serverName% /u:%serverUserName% %serverPassword%
REM sc \\%serverName% start %serviceName%
REM net use s: /delete







