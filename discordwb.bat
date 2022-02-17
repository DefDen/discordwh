SET WEBHOOK_URL=

curl -H "Content-Type: application/json" -d "{\"username\": \"%2\", \"content\":\"%1\"}" %WEBHOOK_URL%
