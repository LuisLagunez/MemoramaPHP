@echo off
cd %~dp0

echo ===== INSTALANDO DEPENDENCIAS ===== > resultados.txt
composer install >> resultados.txt 2>&1

echo. >> resultados.txt
echo ===== LISTADO DE ARCHIVOS DE TEST ===== >> resultados.txt
dir core\php\tests >> resultados.txt 2>&1

echo. >> resultados.txt
echo ===== EJECUTANDO PRUEBAS UNITARIAS ===== >> resultados.txt
C:\xampp\php\php.exe vendor\bin\phpunit --testdox core\php\tests >> resultados.txt 2>&1

echo. >> resultados.txt
echo ===== FIN DEL PROCESO ===== >> resultados.txt
