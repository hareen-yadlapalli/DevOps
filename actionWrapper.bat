
@echo off
setlocal enabledelayedexpansion
set %1
set %2


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
		echo action is !action!, target environment is !targetEnv!, property value is !property:~0,14!
		if "!property:~0,14!"=="!targetEnv!.serverHomePath" (
			REM echo !property! = !value!
			CALL backupApp.bat "serverURL=!value!"		
		)
	)
	if "!action!"=="deployApp" (
		echo action is !action!, target environment is !targetEnv!, property value is !property:~0,8!
		if "!property:~0,8!"=="!targetEnv!.url" (
			REM echo !property! = !value!
			CALL deployApp.bat "serverURL=!value!"		
		)
	)
	if "!action!"=="stopServer" (
		echo action is !action!, target environment is !targetEnv!, property value is !property:~0,19!
		if "!property:~0,19!"=="!targetEnv!.serverHomePath" (
			REM echo !property! = !value!
			CALL stopServer.bat "serverHomePath=!value!"		
		)
	)
	if "!action!"=="startServer" (
		echo action is !action!, target environment is !targetEnv!, property value is !property:~0,19!
		if "!property:~0,19!"=="!targetEnv!.serverHomePath" (
			REM echo !property! = !value!
			CALL startServer.bat "serverHomePath=!value!"		
		)
	)
)
