# EdTech Platform One-Click Launch Script
# Run this from the root directory to start all services

Write-Host "Starting EdTech Platform..." -ForegroundColor Cyan

# Check if npm is installed
if (!(Get-Command npm -ErrorAction SilentlyContinue)) {
    Write-Host "Error: npm is not installed. Please install Node.js." -ForegroundColor Red
    exit
}

# Check if python is installed
if (!(Get-Command python -ErrorAction SilentlyContinue)) {
    Write-Host "Error: python is not installed. Please install Python." -ForegroundColor Red
    exit
}

# Start Backend
Write-Host "Starting Backend on Port 4000..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$((Get-Location).Path)\server'; npm run dev"

# Start Frontend
Write-Host "Starting Frontend on Port 5173..." -ForegroundColor Green
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$((Get-Location).Path)\client'; npm run dev"

# Start AI Service
Write-Host "Starting AI Service on Port 8000..." -ForegroundColor Magenta
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$((Get-Location).Path)\ai-service'; python main.py"

Write-Host "All services starting! Please wait a few seconds and visit:" -ForegroundColor Cyan
Write-Host "http://localhost:5173" -ForegroundColor White -BackgroundColor Blue
