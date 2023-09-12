<?php

class ProductModel {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    // Agrega métodos para interactuar con la base de datos, por ejemplo:
    
    public function getAllProducts() {
        // Lógica para obtener todos los productos de la base de datos
        $query = "SELECT * FROM producto";
        $result = $this->db->query($query);
        return $result;
    }

    public function getProductById($productId) {
        // Lógica para obtener un producto por ID
        $query = "SELECT * FROM producto WHERE id_producto = $productId";
        $result = $this->db->query($query);
        return $result->fetch_assoc();
    }

    // Agrega más métodos según las necesidades de tu aplicación
}

?>