@echo off

SET WEBHOOK_URL=
SET content=
SET username=

if "%1"=="" goto usage
:while
if "%1"=="" goto send
if "%1"=="-m" (
    SET content=%2
)
if "%1"=="-n" (
    SET username=%2
)
shift
shift
goto while

:send
if %content%=="" goto usage
curl -H "Content-Type: application/json" -d "{\"username\": \"%username%\", \"content\":\"%content%\"}" %WEBHOOK_URL%
goto :eof

:usage
echo needs params
exit /B 1