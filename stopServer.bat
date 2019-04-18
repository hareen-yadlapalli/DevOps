@echo off
echo test1
echo %PATH%
cd "C:\Users\Sowmya\Desktop\Hareen\DevOps\apache-tomcat-9.0.17-windows-x64\bin"
setx JAVA_HOME "C:\Program Files\Java\jdk1.8.0_201"
echo testing
echo %JAVA_HOME%
setx PATH "%PATH%;%JAVA_HOME%\bin";
shutdown.bat
