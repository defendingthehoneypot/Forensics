@echo off
CLS
REM ------------------------------------------------------------------------------------------------------------------------
REM install_sysmon v1.0
REM by Doug Richmond (doug@defendthehoneypot.com)
REM by Bryan Bent (beanious@gmail.com)
REM
REM About:
REM Script to automate installation of sysmon across multiple systems
REM Sysmon Info: https://technet.microsoft.com/en-us/sysinternals/sysmon
REM 
REM Additional Tools Needed:
REM Microsoft sysmon, https://technet.microsoft.com/en-us/sysinternals/sysmon
REM Sysmon config file, https://gist.github.com/Neo23x0/f56bea38d95040b70cf5
REM Microsoft psexec, https://technet.microsoft.com/en-us/sysinternals/pxexec
REM 
REM Folder Structure:
REM		- Main Directory containing tools needed to 
REM			- tools
REM				- sysmon
REM				- psexec
echo.
echo #######################################
echo Create Remote Directory for symson
echo #######################################
echo.
cd %userprofile%\Documents\GitHub\Forensics\
for /F %%i in (hosts.txt) do md \\%%i\c$\windows\sysmon

echo.
echo #######################################
echo Copy sysmon and config file
echo #######################################
echo.
for /F %%i in (hosts.txt) do xcopy /y %userprofile%\documents\GitHub\Forensics\tools\sysmon\* \\%%i\c$\windows\sysmon\

echo.
echo #######################################
echo Install sysmon
echo #######################################
echo.
for /F %%i in (hosts.txt) do %userprofile%\documents\GitHub\Forensics\tools\psexec\psexec64.exe /accepteula \\%%i c:\windows\sysmon\sysmon.exe -i c:\windows\sysmon\config-client.xml -accepteula