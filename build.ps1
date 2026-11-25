$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "Compiling Capstone 1 Manuscript with XeLaTeX" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan

if (-not (Get-Command xelatex -ErrorAction SilentlyContinue)) {
    $candidates = @(
        "$env:LOCALAPPDATA\Programs\MiKTeX\miktex\bin\x64",
        "$env:ProgramFiles\MiKTeX\miktex\bin\x64"
    )
    $found = $candidates | Where-Object { Test-Path (Join-Path $_ "xelatex.exe") } | Select-Object -First 1
    if ($found) {
        $env:PATH = "$found;$env:PATH"
    } else {
        Write-Error "xelatex was not found on this computer. Please install MiKTeX (https://miktex.org/download) or TeX Live, then reopen your terminal."
    }
}

$extraArgs = @()
$verOut = & xelatex --version
if ($LASTEXITCODE -ne 0) {
    Write-Host "[WARN] xelatex failed to start (mixed MiKTeX DLLs). Updating MiKTeX packages..." -ForegroundColor Yellow
    & miktex packages update
    $verOut = & xelatex --version
}
if (($verOut | Select-Object -First 1) -match "MiKTeX") {
    $extraArgs += "-enable-installer"
}

function Show-LogErrors([string]$pass) {
    $logPath = Join-Path $PSScriptRoot "main.log"
    if (Test-Path $logPath) {
        Select-String -Path $logPath -Pattern '^!|Fatal|Error:|Undefined control sequence' | ForEach-Object { Write-Host $_.Line -ForegroundColor Red }
        Write-Error "$pass failed. Full log: $logPath"
    } else {
        Write-Error "$pass failed before main.log could be created."
    }
}

Write-Host "`n[Pass 1/2] Running XeLaTeX..." -ForegroundColor Yellow
& xelatex -interaction=nonstopmode @extraArgs main.tex
if ($LASTEXITCODE -ne 0) { Show-LogErrors "Pass 1" }

Write-Host "`n[Pass 2/2] Updating TOC and references..." -ForegroundColor Yellow
& xelatex -interaction=nonstopmode @extraArgs main.tex
if ($LASTEXITCODE -ne 0) { Show-LogErrors "Pass 2" }

Write-Host "`n============================================" -ForegroundColor Green
Write-Host "Build complete: main.pdf" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green


