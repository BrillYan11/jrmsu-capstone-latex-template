@echo off
setlocal
cd /d "%~dp0"

echo ============================================
echo Compiling Capstone 1 Manuscript with XeLaTeX
echo ============================================

echo [Pass 1/2] Running XeLaTeX...
xelatex -interaction=nonstopmode -enable-installer main.tex
if %ERRORLEVEL% neq 0 (
    echo.
    echo [ERROR] Pass 1 failed. Check main.log for details.
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo [Pass 2/2] Updating TOC and references...
xelatex -interaction=nonstopmode -enable-installer main.tex
if %ERRORLEVEL% neq 0 (
    echo.
    echo [ERROR] Pass 2 failed. Check main.log for details.
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo ============================================
echo Build complete: main.pdf
echo ============================================
endlocal

