@echo off
SET WEBHOOK_URL=
SET content=
SET username=
SET avatar=

if "%1"=="" goto usage
:while
if "%1"=="" goto send
if "%1"=="-?" goto usage
if "%1"=="-h" goto usage
if "%1"=="-m" (
    SET content=%~2
)
if "%1"=="-n" (
    SET username=%~2
)
if "%1"=="-a" (
    SET avatar=%~2
)
shift
shift
goto while

:send
curl -H "Content-Type: application/json" -d "{\"username\":\"%username%\", \"content\":\"%content%\", \"avatar_url\":\"%avatar%\"}" %WEBHOOK_URL%
goto :eof

:usage
echo Params
echo REQUIRED
echo -m: The message body
echo OPTIONAL
echo -n: The name of the webhook
echo -a: The avatar of the webhook
exit /B 1