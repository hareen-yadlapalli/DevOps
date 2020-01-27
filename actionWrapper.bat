@echo off
setlocal enabledelayedexpansion
set %1
set %2
set %3
set %4
set %5
REM echo action=!action!
REM echo targetEnv=!targetEnv!
REM echo buildName=!BuildNum!
REM echo appServerUserName=!appServerUserName!
REM echo appServerUserPwd=!appServerUserPwd!
if "!action!"=="startServer" (
	for /f "tokens=1,* delims==" %%i in (config.properties) do (
		set property=%%i 
		set value=%%j
		if "!property:~0,14!"=="!targetEnv!.serverName" (
			set serverName=!value!
		)
		if "!property:~0,15!"=="!targetEnv!.serviceName" (
			set serviceName=!value!
		)
		if "!property:~0,16!"=="!targetEnv!.allPropsRead" (
			CALL startServer.bat "serverName=!serverName!" "serviceName=!serviceName!" "serverUserName=!serverUserName!" "serverPassword=!ServerUserPwd!"
		)
	)	
)

if "!action!"=="stopServer" (
	for /f "tokens=1,* delims==" %%i in (config.properties) do (
		set property=%%i
		set value=%%j
		if "!property:~0,14!"=="!targetEnv!.serverName" (
			set serverName=!value!
		)
		if "!property:~0,15!"=="!targetEnv!.serviceName" (
			set serviceName=!value!
		)
		if "!property:~0,16!"=="!targetEnv!.allPropsRead" (
			CALL stopServer.bat "serverName=!serverName!" "serviceName=!serviceName!" "serverUserName=!serverUserName!" "serverPassword=!ServerUserPwd!"
		)
	)	
)

if "!action!"=="deployApp" (
	REM echo in action wrapper batch file
	for /f "tokens=1,* delims==" %%i in (config.properties) do (
		set property=%%i
		set value=%%j
		if "!property:~0,13!"=="!targetEnv!.serverURL" (
			set serverURL=!value!
			echo serverURL=!serverURL!
		)
		if "!property:~0,16!"=="!targetEnv!.allPropsRead" (
			echo serverURL1=!serverURL!
			CALL deployApp.bat "serverURL=!serverURL!" "appServerUserName=!appServerUserName!" "appServerUserPwd=!appServerUserPwd!"
		)
	)	
)
 




