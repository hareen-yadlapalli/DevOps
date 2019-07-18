
@echo off
setlocal enabledelayedexpansion
set %1
set %2
set %3
echo action=!action!
echo targetEnv=!targetEnv!
echo buildName=!BuildNum!

REM call this file as restartServer.bat "targetEnv=DEV" "action=stopServer"
REM call this file as restartServer.bat "targetEnv=DEV" "action=startServer"
for /f "tokens=1,* delims==" %%i in (config.properties) do (
    set property=%%i
    set value=%%j
    REM echo !property! = !value!
	REM echo !targetEnv!
	REM echo !property:~0,18!
	REM echo !targetEnv!.serverHomePath
	
	if "!action!"=="backupApp" (
		if "!property:~0,18!"=="!targetEnv!.serverHomePath" (
			REM echo !property! = !value!
			CALL backupApp.bat "serverHomePath=!value!" "buildName=!BuildNum!"		
		)
	)
	if "!action!"=="deployApp" (
		if "!property:~0,18!"=="!targetEnv!.url" (
			REM echo !property! = !value!
			CALL deployApp.bat "serverHomePath=!value!"		
		)
		REM
		REM if "!property:~0,7!"=="!targetEnv!.url" (
		REM	REM echo !property! = !value!
		REM	CALL deployApp.bat "serverURL=!value!"		
		REM)
	)
	if "!action!"=="stopServer" (
		if "!property:~0,18!"=="!targetEnv!.serverHomePath" (
			REM echo !property! = !value!
			CALL stopServer.bat "serverHomePath=!value!"		
		)
	)
	if "!action!"=="startServer" (
		if "!property:~0,18!"=="!targetEnv!.serverHomePath" (
			REM echo !property! = !value!
			CALL startServer.bat "serverHomePath=!value!"		
		)
	)
)
