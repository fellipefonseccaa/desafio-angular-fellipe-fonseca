@echo off
setlocal
cd /d "%~dp0"

echo =========================================
echo       FORD DASHBOARD - DESAFIO 7
echo =========================================
echo.

where node >nul 2>nul
if errorlevel 1 (
  echo ERRO: Node.js nao foi encontrado.
  echo Instale o Node.js LTS e execute este arquivo novamente.
  pause
  exit /b 1
)

echo Abrindo a API em uma nova janela...
start "API FORD" cmd /k "cd /d ^"%~dp0backend^" && if not exist node_modules npm install && npm start"

timeout /t 3 /nobreak >nul

echo Abrindo o Angular em uma nova janela...
start "ANGULAR FORD" cmd /k "cd /d ^"%~dp0frontend^" && if not exist node_modules npm install && npm start"

echo.
echo Quando terminar de carregar, abra:
echo http://localhost:4200

echo.
echo Login: admin
echo Senha: 123456
pause
