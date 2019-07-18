@echo off
setlocal enabledelayedexpansion
set %1
REM mkdir !buildName!

for /f "delims=" %%a in ('wmic OS get localdatetime  ^| find "."') do set datetime=%%a
set "YYYY=%datetime:~0,4%"
set "MM=%datetime:~4,2%"
set "DD=%datetime:~6,2%"
set "HH=%datetime:~8,2%"
set "MI=%datetime:~10,2%"
set "SS=%datetime:~12,2%"
set "fullStamp=!YYYY!-!MM!-!DD!-!HH!-!MI!-!SS!"
set "backupRepoDir=!buildName!_!fullstamp!"
mkdir !backupRepoDir!
set "backupRepoDirFP=%cd%\!backupRepoDir!"
set "buildRepoDirFP=%cd%\BuildDir"
xcopy !buildRepoDirFP! !backupRepoDirFP! /E
cd !backupRepoDir!
REM echo "# test" >> README.md
git init
git add --all
REM git add README.md
git commit -m "commiting the backup for build !buildName!"
git remote add origin https://github.com/hareen-yadlapalli/!backupRepoDir!.git
git push -u origin master