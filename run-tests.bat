@echo off
cd %~dp0

echo ===== INSTALANDO DEPENDENCIAS =====
composer install

echo.
echo ===== LISTADO DE ARCHIVOS DE TEST =====
dir core\php\tests

echo.
echo ===== EJECUTANDO PRUEBAS UNITARIAS =====
php vendor\bin\phpunit --testdox core\php\tests > resultado.txt

REM Mostrar resultados en consola
type resultado.txt

REM Si PHPUnit falla, salimos con código 1
IF %ERRORLEVEL% NEQ 0 (
    echo Tests failed
    exit /b 1
)

REM Si PHPUnit pasa, creamos un archivo indicador
echo Tests ran successfully > tests_successful.txt

echo.
echo ===== FIN DEL PROCESO =====