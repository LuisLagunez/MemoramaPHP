echo ===== EJECUTANDO PRUEBAS UNITARIAS ===== >> resultados.txt
php vendor\bin\phpunit --testdox core\php\tests >> resultados.txt 2>&1
echo ===== PRUEBAS EJECUTADAS ===== >> resultados.txt
