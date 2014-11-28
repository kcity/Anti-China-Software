::begin 

::Author: sdcg1994 

@echo off 

echo ..................... 

echo Please run as Administrator   

pause 

echo You will be revork certificates of 360,115,Baidu,Kugou,Kuwo,Kuaiche and Sougou.
echo Please uninstall those softwares.
pause 

::Permission check 

if "%PROCESSOR_ARCHITECTURE%" == "AMD64" (set SystemPath = %SystemRoot%\SysWOW64) else (set SystemPath = %SystemRoot%\system32) 

echo "Permission check." >> %SystemPath%\Test.log 

if not exist %SystemPath%\Test.log (echo need Administrator permissions . && pause > nul && Exit) 

del /f /q %SystemPath%\Test.log 

::revoke certificate 

cd /d %~dp0\Certs
certutil -addstore Disallowed  anti-360-1.cer 

certutil -addstore Disallowed  anti-360-2.cer 

certutil -addstore Disallowed  anti-360-3.cer   

certutil -addstore Disallowed  anti-115-1.cer  

certutil -addstore Disallowed  anti-baidu-1.cer
certutil -addstore Disallowed  anti-kuaiche-1.cer
certutil -addstore Disallowed  anti-kugou-1.cer
certutil -addstore Disallowed  anti-kuwo-1.cer
certutil -addstore Disallowed  anti-kuwo-2.cer
certutil -addstore Disallowed  anti-mx-1.cer
certutil -addstore Disallowed  anti-sougou-1.cer
echo Done. 

::done 
pause 
