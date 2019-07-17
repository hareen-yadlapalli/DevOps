@echo off
setlocal enabledelayedexpansion
set %1
REM echo serverHomePath=%serverHomePath%
cd %serverHomePath%/webapps
echo "These files will be backed up..."
dir
REM curl\bin\curl -u mgrscript:mgrscript -X PUT -F "file=SampleWebApp.war" %serverURL%/manager/text/deploy?path=/SampleWebApp




