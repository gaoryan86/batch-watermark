@echo off
setlocal

set "SCRIPT_DIR=%~dp0"
set "HTML_FILE=%SCRIPT_DIR%batch-watermark.html"

if not exist "%HTML_FILE%" (
    echo batch-watermark.html was not found.
    echo Expected path: "%HTML_FILE%"
    pause
    exit /b 1
)

start "" "%HTML_FILE%"
