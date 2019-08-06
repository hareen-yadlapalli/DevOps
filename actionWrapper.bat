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
echo serverUserName=!serverUserName!
echo serverPassword=!serverPassword!
if "!action!"=="startServer" (
	for /f "tokens=1,* delims==" %%i in (config.properties) do (
		set property=%%i
		set value=%%j
		if "!property:~0,14!"=="!targetEnv!.serverName" (
			set serverName=!property!
		)
		if "!property:~0,15!"=="!targetEnv!.serviceName" (
			set serviceName=!property!
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
			set serverName=!property!
		)
		if "!property:~0,15!"=="!targetEnv!.serviceName" (
			set serviceName=!property!
		)
		if "!property:~0,16!"=="!targetEnv!.allPropsRead" (
			CALL stopServer.bat "serverName=!serverName!" "serviceName=!serviceName!" "serverUserName=!serverUserName!" "serverPassword=!serverPassword!"
		)
	)	
)
