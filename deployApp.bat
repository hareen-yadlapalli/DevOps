@echo off
setlocal enabledelayedexpansion
set %1
set %2
set %3
echo serverURL=%serverURL%
echo serverUserName=%serverUserName%
echo serverPassword=%serverPassword%
REM echo serverURL=%serverURL% %1
cd BuildDir/BuildFiles
echo "These files will be deployed..."
dir
REM curl\bin\curl -u mgrscript:mgrscript -X PUT -F "file=SampleWebApp.war" %serverURL%/manager/text/deploy?path=/SampleWebApp




