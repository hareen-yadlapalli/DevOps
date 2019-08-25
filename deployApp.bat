@echo off
setlocal enabledelayedexpansion
set %1
set %2
set %3
echo serverURL=%serverURL%
echo appServerUserName=%appServerUserName%
echo appServerPwd=%appServerPwd%
REM echo serverURL=%serverURL% %1
cd BuildDir/BuildFiles
echo "These files will be deployed..."
dir
FOR %%i IN (*.war) DO (
  set fileName=%%i
  echo !fileName!
  set fileNameWOExt=%%~ni
  echo %%~ni
  ..\..\curl\bin\curl -u %appServerUserName%:%appServerPwd% -X PUT -F "file=!fileName!" %serverURL%/manager/text/deploy?path=/SampleWebApp
  )
REM for /f "tokens=*" %%G in ('dir /b /s /a:d "*.war"') do echo Found %%G
REM curl\bin\curl -u mgrscript:mgrscript -X PUT -F "file=SampleWebApp.war" %serverURL%/manager/text/deploy?path=/SampleWebApp
