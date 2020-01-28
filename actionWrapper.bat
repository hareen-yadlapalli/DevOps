@echo off
setlocal enabledelayedexpansion
echo in action wrapper
echo %action%
set %1
echo 1 action wrapper
set %2
echo 2 action wrapper
set %3
echo 3 action wrapper
set %4
echo 4 action wrapper
set %5
echo testing
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
			echo calling stop server
			CALL stopServer.bat "serverName=!serverName!" "serviceName=!serviceName!" "serverUserName=!serverUserName!" "serverPassword=!ServerUserPwd!"
		    echo stop server called
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
 




