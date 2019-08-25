@echo off
setlocal enabledelayedexpansion
set %1
set %2
set %3
set %4
set %5
echo action=!action!
echo targetEnv=!targetEnv!
echo buildName=!BuildNum!
echo appServerUserName=!appServerUserName!
echo appServerPwd=!appServerPwd!
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
			CALL startServer.bat "serverName=!serverName!" "serviceName=!serviceName!" "serverUserName=!serverUserName!" "serverPassword=!serverPassword!"
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
			CALL stopServer.bat "serverName=!serverName!" "serviceName=!serviceName!" "serverUserName=!serverUserName!" "serverPassword=!serverPassword!"
		)
	)	
)

if "!action!"=="deployApp" (
	echo in action wrapper batch file
	for /f "tokens=1,* delims==" %%i in (config.properties) do (
		set property=%%i
		set value=%%j
		if "!property:~0,13!"=="!targetEnv!.serverURL" (
			set serverURL=!value!
		)
		if "!property:~0,16!"=="!targetEnv!.allPropsRead" (
			CALL deployApp.bat "serverURL=!serverURL!" "appServerUserName=!appServerUserName!" "appServerPwd=!appServerPwd!"
		)
	)	
)

