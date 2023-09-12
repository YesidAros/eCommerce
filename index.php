<?php
require_once "config/conexion.php";

$conexion = new Conexion();
// Obtener la ruta solicitada
$request_uri = $_SERVER['REQUEST_URI'];
 
// Eliminar cualquier posible parámetro de consulta de la URL
$request_uri = strtok($request_uri, '?');
echo $request_uri;
// Dividir la URL en segmentos
$segments = explode('/', trim($request_uri, '/'));

// Obtener el controlador y la acción de la URL
$controller = isset($segments[0]) ? $segments[0] : 'home';
$action = isset($segments[1]) ? $segments[1] : 'index';
//echo "<br>".$conexion;
// Incluir el controlador correspondiente y ejecutar la acción
switch ($controller) {
    case 'home':
        include 'controller/HomeController.php';
        $controller = new HomeController();
        break;
    case 'Ecommerce':
        include 'controller/ProductController.php';
        $controller = new ProductController($conexion);
        break;
    // Agrega más casos para otros controladores aquí según tus necesidades

    default:
        // Controlador predeterminado para manejar rutas no encontradas
        include 'controller/NotFoundController.php';
        $controller = new NotFoundController();
        break;
}

// Llamar a la acción del controlador
if (method_exists($controller, $action)) {
    $controller->$action();
} else {
    // Manejar acciones no encontradas
    include 'controller/NotFoundController.php';
    $notFoundController = new NotFoundController();
    $notFoundController->index();
}
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Tienda Virtual UCompensar</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="images/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
    <script src="js/code.jquery.com_jquery-3.7.0.js"></script>
    <script>
        function Cargar_Producto() {
            $("#Producto").load("views/Vista_Elemento.html")
        }
    </script>
</head>

<body>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container px-4 px-lg-5">
            <img src="images/logoNegro.png" class="img-fluid" href="#!">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class=""><a class="nav-link active" aria-current="page" href="index.html">Inicio</a></li>
                    <li class="nav-item"><a class="nav-link" href="#!">Acerca de</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">Productos</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#!">Todos los Productos</a></li>
                            <li>
                                <hr class="dropdown-divider" />
                            </li>
                            <li><a class="dropdown-item" href="#!">Productos Populares </a></li>
                            <li><a class="dropdown-item" href="#!">Productos Nuevos</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="d-flex">
                    <button class="btn btn-outline-dark" type="submit">
                        <i class="bi-cart-fill me-1"></i>
                        Cart
                        <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                    </button>
                </form>
            </div>
        </div>
    </nav>
    <!-- Header-->
    <header class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder">UCOMPENSAR</h1>
                <p class="lead fw-normal text-white-50 mb-0">TIENDA VIRTUAL</p>
            </div>
        </div>
    </header>
    <!-- Section-->
    <div id="Product_list"></div>
    
    <!-- Footer-->
    <footer class="py-5 bg-dark">
        <div class="container">
            <p class="m-0 text-center text-white">Copyright &copy; UCompensar 2023</p>
        </div>
    </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</body>

</html>