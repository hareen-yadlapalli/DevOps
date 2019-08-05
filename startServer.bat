@echo off
setlocal enabledelayedexpansion
set %1
net use s: %serverName% /u:%userName% %password%
sc \\%serverName% stop %serviceName%







