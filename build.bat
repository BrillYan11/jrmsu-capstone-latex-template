@echo off
setlocal
cd /d "%~dp0"

echo ============================================
echo Compiling Capstone 1 Manuscript with XeLaTeX
echo ============================================

where xelatex >nul 2>&1
if %ERRORLEVEL% neq 0 (
    if exist "%LOCALAPPDATA%\Programs\MiKTeX\miktex\bin\x64\xelatex.exe" (
        set "PATH=%LOCALAPPDATA%\Programs\MiKTeX\miktex\bin\x64;%PATH%"
    ) else if exist "%ProgramFiles%\MiKTeX\miktex\bin\x64\xelatex.exe" (
        set "PATH=%ProgramFiles%\MiKTeX\miktex\bin\x64;%PATH%"
    ) else (
        echo.
        echo [ERROR] xelatex was not found on this computer.
        echo Please install MiKTeX ^(https://miktex.org/download^) or TeX Live, then reopen this window.
        pause
        exit /b 1
    )
)

set "EXTRA_ARGS="
xelatex --version 2>&1 | findstr /i "MiKTeX" >nul && set "EXTRA_ARGS=-enable-installer"

echo [Pass 1/2] Running XeLaTeX...
xelatex -interaction=nonstopmode %EXTRA_ARGS% main.tex
if %ERRORLEVEL% neq 0 (
    echo.
    if exist main.log (
        echo [ERROR] Pass 1 failed. Errors from "%CD%\main.log":
        findstr /r /c:"^!" /c:"Fatal" main.log
    ) else (
        echo [ERROR] Pass 1 failed before main.log could be created.
    )
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo [Pass 2/2] Updating TOC and references...
xelatex -interaction=nonstopmode %EXTRA_ARGS% main.tex
if %ERRORLEVEL% neq 0 (
    echo.
    if exist main.log (
        echo [ERROR] Pass 2 failed. Errors from "%CD%\main.log":
        findstr /r /c:"^!" /c:"Fatal" main.log
    ) else (
        echo [ERROR] Pass 2 failed before main.log could be created.
    )
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo ============================================
echo Build complete: main.pdf
echo ============================================
endlocal


