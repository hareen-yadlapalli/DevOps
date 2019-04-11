echo %cd%
dir
sqlcmd -S localhost -U demouser -P demopwd -i BuildDir\SQLs\Implementation\01_Impl_SQL.sql -e
