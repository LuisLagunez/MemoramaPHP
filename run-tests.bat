@echo off
cd %~dp0

echo ===== INSTALANDO DEPENDENCIAS =====
composer install

echo.
echo ===== LISTADO DE ARCHIVOS DE TEST =====
dir core\php\tests > listado.txt
type listado.txt

echo.
echo ===== EJECUTANDO PRUEBAS UNITARIAS =====
php vendor\bin\phpunit --testdox core\php\tests\MateriasManagerTest.php > resultado.txt 2>&1
type resultado.txt

REM Si PHPUnit falla, Jenkins lo sabrá
IF %ERRORLEVEL% NEQ 0 (
    echo Tests failed
    exit /b 1
)

echo OK > tests_successful.txt

echo.
echo ===== FIN DEL PROCESO =====