@echo off
setlocal
set "ROOT=%~dp0"
set "REPO_PY=%ROOT%..\..\.venv\Scripts\python.exe"
set "K2M_PY=C:\Users\OMEN\Documents\K2M\k2m-edtech-program-\.venv\Scripts\python.exe"

if exist "%REPO_PY%" (
  "%REPO_PY%" "%ROOT%server.py" %*
  exit /b %ERRORLEVEL%
)

if exist "%K2M_PY%" (
  "%K2M_PY%" "%ROOT%server.py" %*
  exit /b %ERRORLEVEL%
)

py -3 "%ROOT%server.py" %*
