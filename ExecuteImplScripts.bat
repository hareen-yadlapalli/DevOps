@echo off
 setlocal enabledelayedexpansion

	REM NET use o: /delete /Y

	set %1
	set %2
	set %3
	set %4
	set %5
	set %6
	REM echo %DBUserName%
	REM echo %DBUserPwd%
	REM echo %DBServerName%
	
   REM set rbpy=%9
	set fileName=
	set fileCount=0
	set argCount=0
	set errorsFound=false
	

	set "origfileLocation=%cd%"
    set "implFileLocation=%cd%\BuildDir\SQLs\Implementation"
	
	
    REM echo file location set to !implFileLocation!
	cd !implFileLocation!
    
   FOR %%G in (.\*) DO (
     
	if /I "%%~xG"==".SQL" (

	set /A argCount+=1
	echo Started >> ImplQueryResults!argCount!.log 
	IF "!fileCount!" EQU "0" (
	set fileName=%%~nxG
	set /A fileCount=!fileCount!+1) 
	If "!fileCount!" GTR "1" (
	set fileName=!fileName! and %%~nxG 
	set /A fileCount=!fileCount!+1)
	set /A fileCount="!fileCount!"+1
	REM echo Final FileName string is !fileName!
	for /f "tokens=*" %%a in (%%~nxG) do (
	echo  %%a >> ImplQueryResults!argCount!.log
	)

	echo Result >> ImplQueryResults!argCount!.log
	REM echo sqlcmd -U %DBUserName% -P %DBUserPwd% -S %DBServerName% -i %%~nxG
	echo Executing the script file %%~nxG
	sqlcmd -U %DBUserName% -P %DBUserPwd% -S %DBServerName% -i %%~nxG >> ImplQueryResults!argCount!.log

	FOR /F "tokens=* delims=" %%x in (ImplQueryResults!argCount!.log) DO echo %%x
	) 
  )
  	echo Implementation Scripts Execution if any have been completed
	REM DIR
    echo ArgCount calculated as !argCount!
	IF "!argCount!" EQU "0" (
    echo No implementation SQL files are available in the given location !implFileLocation!
    ERROR
    exit /b 1
    )
	for /f %%i in ('findstr /i "Invalid Incorrect" ImplQueryResults*.log') do (
	echo An error with the script %%i
	set errorsFound=true
	REM @echo I just found a %%i
	)
	IF "!errorsFound!" EQU "true" (
    echo Errors are found in the SQLs, will run the rollback scripts
	cd !origfileLocation!
	ExecuteRBScripts.bat "DBUserName=%DBUserName%" "DBUserPwd=%DBUserPwd%" "DBName=%DBServerName%"
    )
    
