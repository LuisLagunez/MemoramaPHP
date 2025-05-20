@echo off
cd %~dp0

echo ===== INSTALANDO DEPENDENCIAS =====
composer install

echo ===== LISTADO DE ARCHIVOS DE TEST =====
dir core\php\tests > listado.txt
type listado.txt

echo ===== UBICACIÓN DE PHP =====
php -v > php_version.txt
type php_version.txt
where php > donde_esta_php.txt
type donde_esta_php.txt

echo ===== EJECUTANDO PRUEBAS UNITARIAS =====
php vendor\bin\phpunit --testdox core\php\tests\MateriasManagerTest.php > resultado.txt 2>&1
echo ===== CONTENIDO DE RESULTADO.TXT =====
type resultado.txt

if %ERRORLEVEL% NEQ 0 (
    echo ❌ PHPUnit falló con error %ERRORLEVEL%
    exit /b 1
)

echo ✅ PHPUnit ejecutado correctamente
echo OK > tests_successful.txt