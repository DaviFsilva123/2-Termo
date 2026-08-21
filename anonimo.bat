@echo off
:: Verifica se o script está rodando como Administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Erro: Execute este arquivo clicando com o botao direito e escolhendo "Executar como Administrador".
    pause
    exit /b
)

:: Cria e define a chave do registro para desativar o modo anonimo (Valor 1)
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "IncognitoModeAvailability" /t REG_DWORD /d 1 /f

echo.
echo Modo Anonimo do Chrome desativado com sucesso neste computador!
echo Reinicie o Google Chrome para aplicar as alteracoes.
echo.
pause
