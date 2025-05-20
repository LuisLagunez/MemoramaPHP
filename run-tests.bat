@echo off
cd %~dp0

echo ===== INSTALANDO DEPENDENCIAS =====
composer install

echo.
echo ===== LISTADO DE ARCHIVOS DE TEST =====
dir core\php\tests

echo.
echo ===== COMPROBANDO UBICACIÓN DE PHPUNIT =====
dir vendor\bin > contenido_vendor_bin.txt
type contenido_vendor_bin.txt

echo.
echo ===== EJECUTANDO PRUEBAS UNITARIAS =====
php vendor\bin\phpunit --testdox core\php\tests\MateriasManagerTest.php > resultado.txt 2>&1

echo.
echo ===== RESULTADO DE LAS PRUEBAS =====
type resultado.txt

echo.
echo ===== FIN DEL PROCESO =====