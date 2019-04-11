@echo off
set %1
set %2
REM sqlcmd -S localhost -U %DBUser% -P %DBPwd% -i BuildDir\SQLs\Implementation\01_Impl_SQL.sql -e
