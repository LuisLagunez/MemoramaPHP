@echo off
cd %~dp0

echo ===== INSTALANDO DEPENDENCIAS =====
composer install

echo.
echo ===== LISTADO DE ARCHIVOS DE TEST =====
dir core\php\tests

echo.
echo ===== EJECUTANDO PRUEBAS UNITARIAS =====

REM Ejecutar PHPUnit y redirigir salida a un archivo
php vendor\bin\phpunit --testdox core\php\tests > resultado.txt

REM Mostrar contenido del resultado en consola
type resultado.txt

echo.
echo ===== FIN DEL PROCESO =====