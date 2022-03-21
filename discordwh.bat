@echo off
SET WEBHOOK_URL=
SET content=
SET username=
SET avatar=
SET test=

if "%1"=="" goto usage
:while
if "%1"=="" goto send
if "%1"=="-?" goto usage
if "%1"=="-h" goto usage
if "%1"=="-m" (
    SET content=%~2
    shift
)
if "%1"=="-n" (
    SET username=%~2
    shift
)
if "%1"=="-a" (
    SET avatar=%~2
    shift
)
if "%1"=="--test" (
    SET test="true"
)
shift
goto while

:send
if defined test (
    echo curl -H "Content-Type: application/json" -d "{\"username\":\"%username%\", \"content\":\"%content%\", \"avatar_url\":\"%avatar%\", \"allowed_mentions\":{\"parse\":[\"everyone\",\"users\"]}}" %WEBHOOK_URL% > command.txt
) else (
    curl -H "Content-Type: application/json" -d "{\"username\":\"%username%\", \"content\":\"%content%\", \"avatar_url\":\"%avatar%\", \"allowed_mentions\":{\"parse\":[\"everyone\",\"users\"]}}" %WEBHOOK_URL% 
)
goto :eof

:usage
echo Params
echo REQUIRED
echo -m: The message body
echo OPTIONAL
echo -n: The name of the webhook
echo -a: The avatar of the webhook
echo --test: Echoes command into text file
exit /B 1