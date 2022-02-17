@echo off

SET WEBHOOK_URL=https://discord.com/api/webhooks/854163170812624936/5DJ8e5o0S_tmjOlr3Ne8SC-TD-wRDUgo_pV5TfPLnl5hrUtWUAzdk3FmGKtGSUibXiig

:while
if [%1]==[] goto usage

curl -H "Content-Type: application/json" -d "{\"username\": \"%2\", \"content\":\"%1\"}" %WEBHOOK_URL%
goto :eof

:usage
echo needs params
exit /B 1