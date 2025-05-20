@echo off
cd %~dp0

echo ===== INSTALANDO DEPENDENCIAS =====
composer install > composer_log.txt
type composer_log.txt

echo.
echo ===== LISTADO DE ARCHIVOS DE TEST =====
dir core\php\tests > listado_archivos.txt
type listado_archivos.txt

echo.
echo ===== EJECUTANDO PRUEBAS UNITARIAS =====
C:\xampp\php\php.exe vendor\bin\phpunit --testdox core\php\tests\MateriasManagerTest.php > resultados.txt
type resultados.txt

echo.
echo ===== FIN DEL PROCESO =====
