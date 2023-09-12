<?php
require_once ("model/ProductModel.php");
//$conexion = null; */


class ProductController {
    private $productModel;

    public function __construct($conexion) {
        // Instancia el modelo de productos pasando la conexión a la base de datos
        $this->productModel = new ProductModel($conexion);
    }

    public function index() {
        // Obtener todos los productos
        $products = $this->productModel->getAllProducts();
        include 'views/product_list.php';

        // Lógica para cargar la vista y mostrar los productos
    }

    public function detalle($productId) {
        // Obtener detalles de un producto por su ID
        $product = $this->productModel->getProductById($productId);

        // Lógica para cargar la vista y mostrar los detalles del producto
    }

}

?>