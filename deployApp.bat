@echo off
setlocal enabledelayedexpansion
set %1
REM echo serverURL=%serverURL% %1
pwd
dir
cd BuildDir/BuildFiles
pwd
dir
curl\bin\curl -u mgrscript:mgrscript -X PUT -F "file=SampleWebApp.war" %serverURL%/manager/text/deploy?path=/SampleWebApp




