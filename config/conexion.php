<?php
// Configuración de la conexión a la base de datos
const SERVER = "localhost";
const USER = "root";
const PASS = "";
const DBNAME = "ecommerce";

// Crear una conexión a la base de datos

class Conexion {
    public $conexion = null;

    public function __construct() {
        $this->conexion = new mysqli(SERVER, USER, PASS, DBNAME);
        if ($this->conexion->connect_error) {
            die("Error de conexión: " . $this->conexion->connect_error);
        }
    }

    public function query($query) {
        return $this->conexion->query($query);
    }
}


?>


