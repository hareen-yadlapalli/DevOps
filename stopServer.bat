@echo off
setlocal enabledelayedexpansion
set %1
set %2
set %3
set %4
set %5
set %6
net use s: %serverName% /u:%serverUserName% %serverPassword%
sc \\%serverName% stop %serviceName%
net use s: /delete
