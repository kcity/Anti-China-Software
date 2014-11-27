@echo off
echo .....................
echo 运行前请确认使用管理员权限
pause
echo 按回车后将自动吊销360的代码签名证书，请三思而后行。
pause
if "%PROCESSOR_ARCHITECTURE%" == "AMD64" (set SystemPath = %SystemRoot%\SysWOW64) else (set SystemPath = %SystemRoot%\system32)
echo "Permission check." >> %SystemPath%\Test.log
if not exist %SystemPath%\Test.log (echo 需要管理员权限. && pause > nul && Exit)
del /f /q %SystemPath%\Test.log
cd /d %~dp0
certutil -addstore Disallowed  anti-360-1.cer
certutil -addstore Disallowed  anti-360-2.cer
certutil -addstore Disallowed  anti-360-3.cer  
certutil -addstore Disallowed  anti-360-4.cer 
echo Done.
pause
