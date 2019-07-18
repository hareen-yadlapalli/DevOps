@echo off
setlocal enabledelayedexpansion
set %1
set %2
REM parameters buildName and serverHomePath

REM echo Taking full backup of all apps, apps list below...
REM cd %serverHomePath%\webapps
REM dir
for /f "delims=" %%a in ('wmic OS get localdatetime  ^| find "."') do set datetime=%%a
set "YYYY=%datetime:~0,4%"
set "MM=%datetime:~4,2%"
set "DD=%datetime:~6,2%"
set "HH=%datetime:~8,2%"
set "MI=%datetime:~10,2%"
set "SS=%datetime:~12,2%"
set "fullStamp=!YYYY!-!MM!-!DD!-!HH!-!MI!-!SS!"
set "backupRepoDir=!buildName!_!fullstamp!"
echo !backupRepoDir!
mkdir !backupRepoDir!
set "backupRepoDirFP=%cd%\!backupRepoDir!"
set "appsRepoDirFP=!serverHomePath!\webapps"


cd !appsRepoDirFP!
set appsRepoDirFP=%cd%

echo !backupRepoDirFP!
echo !appsRepoDirFP!

echo Taking full backup of all apps from the directory !appsRepoDirFP!, apps list below...
dir

xcopy "!appsRepoDirFP!" "!backupRepoDirFP!" /E
cd !backupRepoDirFP!
REM echo "# test" >> README.md
git init
git add --all
REM git add README.md
git commit -m "commiting the backup for build !buildName!"
git remote add origin https://github.com/hareen-yadlapalli/!backupRepoDir!.git
git push -u origin master
REM @echo off
REM setlocal enabledelayedexpansion
REM set %1
REM echo serverHomePath=%serverHomePath%
REM cd %serverHomePath%/webapps
REM echo "These files will be backed up..."
REM dir
REM curl\bin\curl -u mgrscript:mgrscript -X PUT -F "file=SampleWebApp.war" %serverURL%/manager/text/deploy?path=/SampleWebApp




