@echo off
set %1
set %2
echo %DBUserName%
echo %DBUserPwd%
sqlcmd -S localhost -U %DBUserName% -P %DBUserPwd% -i BuildDir\SQLs\Implementation\01_Impl_SQL.sql -e
