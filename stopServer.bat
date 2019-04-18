@echo off
echo test1
echo %PATH%
cd "C:\Users\Sowmya\Desktop\Hareen\DevOps\apache-tomcat-9.0.17-windows-x64\bin"
REM setx JAVA_HOME "C:\Program Files\Java\jdk1.8.0_201"
echo testing
set JAVA_HOME="C:\ProgramFiles\Java\jdk1.8.0_201"
set JRE_HOME="C:\Program Files\Java\jre1.8.0_201"
echo %JAVA_HOME%
set PATH="%PATH%;%JAVA_HOME%\bin"
shutdown.bat
