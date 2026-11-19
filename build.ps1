$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "Compiling Capstone 1 Manuscript with XeLaTeX" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan

Write-Host "`n[Pass 1/2] Running XeLaTeX..." -ForegroundColor Yellow
& xelatex -interaction=nonstopmode -enable-installer main.tex
if ($LASTEXITCODE -ne 0) {
    Write-Error "Pass 1 failed. Check main.log for details."
}

Write-Host "`n[Pass 2/2] Updating TOC and references..." -ForegroundColor Yellow
& xelatex -interaction=nonstopmode -enable-installer main.tex
if ($LASTEXITCODE -ne 0) {
    Write-Error "Pass 2 failed. Check main.log for details."
}

Write-Host "`n============================================" -ForegroundColor Green
Write-Host "Build complete: main.pdf" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green

