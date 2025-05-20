<?php
use PHPUnit\Framework\TestCase;
use Mockery as m;

require_once __DIR__ . '/../MateriasManager.php';
require_once __DIR__ . '/../DataBaseManager.php';

class MateriasManagerTest extends TestCase
{
    protected function tearDown(): void
    {
        m::close(); // Limpia los mocks al final de cada test
    }

    private function injectMockDb($mockDb)
    {
        $materiasManager = MateriasManager::getInstance();
        $refClass = new ReflectionClass($materiasManager);
        $refProp = $refClass->getProperty('dbManager');
        $refProp->setAccessible(true);
        $refProp->setValue($materiasManager, $mockDb);
        return $materiasManager;
    }

    public function testGetMateriaRetornaJson()
    {
        $resultadoSimulado = [
            ['id' => 1, 'nombre' => 'Matemáticas']
        ];

        $mockDb = m::mock('DataBaseManager');
        $mockDb->shouldReceive('realizeQuery')
               ->with("SELECT * FROM materias WHERE id = 1")
               ->andReturn($resultadoSimulado);

        $manager = $this->injectMockDb($mockDb);
        $resultado = $manager->getMateria(1);

        $this->assertJson($resultado);
        $this->assertEquals("Matemáticas", json_decode($resultado, true)[0]['nombre']);
    }

    public function testGetAllMateriaRetornaJson()
    {
        $resultadoSimulado = [
            ['id' => 1, 'nombre' => 'Español'],
            ['id' => 2, 'nombre' => 'Historia']
        ];

        $mockDb = m::mock('DataBaseManager');
        $mockDb->shouldReceive('realizeQuery')
               ->with("SELECT * FROM materias")
               ->andReturn($resultadoSimulado);

        $manager = $this->injectMockDb($mockDb);
        $resultado = $manager->getAllMateria();

        $this->assertJson($resultado);
        $decoded = json_decode($resultado, true)[0];
        $this->assertEquals("Español", $decoded[0]['name']);
        $this->assertEquals("Historia", $decoded[1]['name']);
    }

    public function testSetMateriaInsertaCorrectamente()
    {
        $mockDb = m::mock('DataBaseManager');
        $mockDb->shouldReceive('insertQuery')
               ->with("INSERT INTO materias (nombre) VALUES('Geografía')")
               ->andReturn(true);

        $manager = $this->injectMockDb($mockDb);
        $resultado = $manager->setMateria('Geografía');

        $this->assertEquals("", $resultado); // según implementación, retorna string vacío en éxito
    }

    public function testUpdateMateriaActualizaCorrectamente()
    {
        $mockDb = m::mock('DataBaseManager');
        $mockDb->shouldReceive('insertQuery')
               ->with("UPDATE materias set nombre= 'Física' WHERE id =2")
               ->andReturn(true);

        $manager = $this->injectMockDb($mockDb);
        $resultado = $manager->updateMateria(2, 'Física');

        $this->assertEquals("", $resultado);
    }

    public function testDeleteMateriaEliminaCorrectamente()
    {
        $mockDb = m::mock('DataBaseManager');
        $mockDb->shouldReceive('insertQuery')
               ->with("DELETE FROM materias WHERE id = '3'")
               ->andReturn(true);

        $manager = $this->injectMockDb($mockDb);
        $resultado = $manager->deleteMateria(3);

        $this->assertEquals("", $resultado);
    }
}
