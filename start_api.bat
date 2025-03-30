@echo off
cd /d %~dp0

echo [1/3] Starting Python API...
start "" cmd /k "C:\Users\muhit\PycharmProjects\ai_api_server\.venv\Scripts\python.exe -m uvicorn main:app --host 127.0.0.1 --port 8000"
#write your own location
echo [2/3] Waiting for API to be ready...

:waitloop
curl --silent --output nul http://127.0.0.1:8000/docs
if errorlevel 1 (
    timeout /t 1 >nul
    goto waitloop
)

echo [3/3] Launching desktop application...
start "" "AIPredictorUI.exe"

pause
