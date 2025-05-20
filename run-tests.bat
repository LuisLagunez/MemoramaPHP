@echo off
cd %~dp0

echo ===== INSTALANDO DEPENDENCIAS =====
composer install

echo.
echo ===== LISTADO DE ARCHIVOS DE TEST =====
dir core\php\tests

echo.
echo ===== EJECUTANDO PRUEBAS UNITARIAS =====
cmd /c php vendor\bin\phpunit --testdox core\php\tests\MateriasManagerTest.php

echo.
echo ===== FIN DEL PROCESO =====

pause