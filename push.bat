@echo off
chcp 65001 > nul
title FalconLens - Automatic GitHub Deploy

echo ==================================================
echo   🦅 FalconLens - Enviando para o GitHub
echo ==================================================
echo.

:: 1. Verifica se a pasta .git ja existe
if not exist .git (
    echo [!] Repositório Git local não encontrado. Configurando...
    git init
    git branch -M main
    git remote add origin https://github.com/LittleLucasR/FalconLens.git
    echo [OK] Repositório inicializado e vinculado com sucesso!
    echo.
)

:: 2. Pede a mensagem do commit
set /p msg="Digite a mensagem do commit (ENTER para 'Update FalconLens'): "
if "%msg%"=="" set msg=Update FalconLens

echo.
echo [+] Preparando arquivos (git add .)...
git add .

echo [+] Criando o commit...
git commit -m "%msg%"

echo [+] Enviando para o GitHub (main)...
git push -u origin main

echo.
echo ==================================================
echo  🚀 FalconLens atualizado com sucesso no GitHub!
echo ==================================================
echo.
pause