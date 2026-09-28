@echo off
chcp 65001 > nul
title FalconLens - Novo Projeto

echo ==================================================
echo   🦅 FalconLens - Gerador de Novo Projeto
echo ==================================================
echo.

:: 1. Pede o nome do projeto/cliente
set /p folder="Digite o nome da pasta do NOVO projeto (ex: cliente-advocacia): "

if "%folder%"=="" (
    echo [!] Nome inválido. Operação cancelada.
    pause
    exit /b
)

echo.
echo [+] Clonando o template mãe (FalconLens)...
git clone https://github.com/LittleLucasR/FalconLens.git %folder%

if not exist %folder% (
    echo [X] Erro ao clonar o repositório. Verifique a URL ou sua conexão.
    pause
    exit /b
)

:: 2. Entra na pasta do novo projeto
cd %folder%

echo.
echo [+] Desvinculando do Git original (removendo histórico do FalconLens)...
rmdir /s /q .git

echo [+] Inicializando um Git NOVO e limpo para este cliente...
git init
git branch -M main

echo.
:: 3. Pergunta se quer instalar as dependências
set /p install="Deseja rodar 'npm install' agora? (S/N) [Padrão: S]: "
if "%install%"=="" set install=S

if /i "%install%"=="S" (
    echo.
    echo [+] Instalando dependências do projeto (aguarde)...
    call npm install
)

echo.
:: 4. Pergunta se quer abrir direto no VS Code
set /p vscode="Deseja abrir no VS Code agora? (S/N) [Padrão: S]: "
if "%vscode%" grass="" set vscode=S

if /i "%vscode%"=="S" (
    echo [+] Abrindo no VS Code...
    code .
)

echo.
echo ==================================================
echo  🚀 Projeto '%folder%' pronto para rodar!
echo ==================================================
echo.
pause