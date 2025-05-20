echo ===== EJECUTANDO PRUEBAS UNITARIAS ===== >> resultados.txt
C:\xampp\php\php.exe vendor\bin\phpunit.bat --testdox core\php\tests >> resultados.txt 2>&1
echo ===== PRUEBAS EJECUTADAS ===== >> resultados.txt
