<?php
require_once "config/conexion.php";

$conexion = new Conexion();
// Obtener la ruta solicitada
$request_uri = $_SERVER['REQUEST_URI'];

// Eliminar cualquier posible parámetro de consulta de la URL
$request_uri = strtok($request_uri, '?');
//echo $request_uri;
// Dividir la URL en segmentos
$segments = explode('/', trim($request_uri, '/'));

// Obtener el controlador y la acción de la URL

$controller = (isset($_REQUEST['c'])?$_REQUEST['c']:(isset($segments[0]) ? $segments[0] : 'home') )   ;
$action = (isset($_REQUEST['m'])?$_REQUEST['m']:(isset($segments[1]) ? $segments[1] :'index'))  ;
//echo "<br>".$conexion;
// Incluir el controlador correspondiente y ejecutar la acción


switch ($controller) {
    case 'home':
        include 'controller/HomeController.php';
        $controller = new HomeController();
        require_once ("ecommerce.php");
        break;
    case 'Ecommerce':
        include 'controller/ProductController.php';
        $controller = new ProductController($conexion);
        require_once ("ecommerce.php");
        break;
    case 'peticiones':
        // views/product_detail.php
        include 'controller/ProductController.php';
        $controller = new ProductController($conexion);
        $controller->detalle($_REQUEST['id_producto']);
        break;
        // Agrega más casos para otros controladores aquí según tus necesidades

    default:
        // Controlador predeterminado para manejar rutas no encontradas
        include 'controller/NotFoundController.php';
        $controller = new NotFoundController();
        break;
}
?>
