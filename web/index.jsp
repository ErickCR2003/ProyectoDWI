
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap demo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    </head>
    <body>
        <header>
            <nav class="navbar navbar-dark bg-dark">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">NavBar</a>

                    <button
                        class="navbar-toggler"
                        type="button"
                        data-bs-toggle="offcanvas"
                        data-bs-target="#offcanvasDarkNavbar"
                        aria-controls="offcanvasDarkNavbar"
                        >
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div
                        class="offcanvas offcanvas-end text-bg-dark"
                        tabindex="-1"
                        id="offcanvasDarkNavbar"
                        aria-labelledby="offcanvasDarkNavbarLabel"
                        >
                        <div class="offcanvas-header">
                            <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">
                                Dark offcanvas
                            </h5>
                            <button
                                type="button"
                                class="btn-close btn-close-white"
                                data-bs-dismiss="offcanvas"
                                aria-label="Close"
                                ></button>
                        </div>
                        <div class="offcanvas-body">
                            <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                                <li class="nav-item">
                                    <a class="nav-link" href="login.jsp"
                                       >Iniciar Sesión</a
                                    >
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Nosotros</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a
                                        class="nav-link dropdown-toggle"
                                        href="#"
                                        role="button"
                                        data-bs-toggle="dropdown"
                                        aria-expanded="false"
                                        >
                                        Dropdown
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-dark">
                                        <li><a class="dropdown-item" href="#">Action</a></li>
                                        <li>
                                            <a class="dropdown-item" href="#">Another action</a>
                                        </li>
                                        <li>
                                            <hr class="dropdown-divider" />
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>

            <div
                id="carouselExampleIndicators"
                class="carousel slide"
                data-bs-ride="true"
                style="padding: 2.5rem"
                >
                <div class="carousel-indicators">
                    <button
                        type="button"
                        data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="0"
                        class="active"
                        aria-current="true"
                        aria-label="Slide 1"
                        ></button>
                    <button
                        type="button"
                        data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="1"
                        aria-label="Slide 2"
                        ></button>
                    <button
                        type="button"
                        data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="2"
                        aria-label="Slide 3"
                        ></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="img/1920x500.gif" class="d-block w-100" alt="..." />
                    </div>
                    <div class="carousel-item">
                        <img src="img/1920x500.gif" class="d-block w-100" alt="..." />
                    </div>
                    <div class="carousel-item">
                        <img src="img/1920x500.gif" class="d-block w-100" alt="..." />
                    </div>
                </div>
                <button
                    class="carousel-control-prev"
                    type="button"
                    data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="prev"
                    >
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button
                    class="carousel-control-next"
                    type="button"
                    data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="next"
                    >
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </header>

        <main style="margin: 0px 35px">
            <div class="container" style="margin: auto; padding: 10px">
                <form class="d-flex" role="search">
                    <input
                        class="form-control me-2"
                        type="search"
                        placeholder="Search"
                        aria-label="Search"
                        />
                    <button class="btn btn-success" type="submit">Search</button>
                </form>
            </div>
            <section
                style="
                height: 60px;
                display: flex;
                justify-content: center;
                align-items: center;
                margin: 0.5rem 0rem;
                "
                >
                <ul class="nav justify-content-center">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="ControladorXD?accion=todo">Todo</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Skate</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Deportivas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Casual</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Minimalista</a>
                    </li>
                </ul>
            </section>
            <section
                style="
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 0px 15px;
                margin: 20px 0px 40px 0px;
                "
                >
                <div
                    class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4"
                    >
                    <c:forEach var="p" items="${listaproductos}">
                        <div class="col">
                            <div class="card" style="width: 18rem;">
                                <img src="img/400X200.gif" class="card-img-top" alt="..." />
                                <div class="card-body">
                                    <h5 class="card-title text-center">${p.getNombre()}</h5>
                                    <p class="card-text">${p.getTalla()}<br>
                                                         ${p.getColor()}<br>
                                    </p>
                                    <p class="card-text">$/${p.getPrecio()}</p>
                                    <a class="btn btn-outline-primary">Agregar al Carrito</a>
                                    <a class="btn btn-danger">Comprar</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div> 
            </section>
        </main>
        <footer>
            <div class="container-fluid">
                <div class="row row-cols-sm-2 row-cols-md-3 row-cols-lg-4 p-5 bg-dark text-white">
                    <div class="col-xs-12 col-md-6 col-lg-3 mb-3 text-center">
                        <p class="h3">Zapatillas Perú</p>
                    </div>
                    <div class="col-xs-12 col-md-6 col-lg-3 mb-3 text-center">
                        <p class=" mb-3">ACERCA DE NOSOTROS</p>
                        <div class="mb-2">
                            <a class="text-white text-decoration-none" href="#">Soporte Técnico</a>
                        </div>
                        <div class="mb-2">
                            <a class="text-white text-decoration-none" href="#">Trabaja con Nosotros</a>
                        </div>
                        <div class="mb-2">
                            <a class="text-white text-decoration-none" href="#">Formulario de Contacto</a>
                        </div>            
                    </div>
                    <div class="col-xs-12 col-md-6 col-lg-3 mb-3 text-center">
                        <p class=" mb-3">GARANTÍAS</p>
                        <div class="mb-2">
                            <a class="text-white text-decoration-none" href="#">Soporte Técnico</a>
                        </div>
                        <div class="mb-2">
                            <a class="text-white text-decoration-none" href="#">Trabaja con Nosotros</a>
                        </div>
                        <div class="mb-2">
                            <a class="text-white text-decoration-none" href="#">Formulario de Contacto</a>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-6 col-lg-3 mb-3 text-center">
                        <p class=" mb-3">CONTÁCTANOS</p>
                        <div class="mb-2">
                            <a class="text-white text-decoration-none" href="#"><i class="fa-brands fa-square-facebook"></i> Facebook</a>
                        </div>
                        <div class="mb-2">
                            <a class="text-white text-decoration-none" href="#"><i class="fa-brands fa-instagram"></i> Instagram</a>
                        </div>
                        <div class="mb-2">
                            <a class="text-white text-decoration-none" href="#"><i class="fa-brands fa-twitter"></i> Twitter</a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    </body>
    <script>
        // Verificar si ya se redirigió
        if (!localStorage.getItem("redireccionado")) {
            // Redireccionar
            window.location.href = "http://localhost:8080/ProyectoDWI/ControladorXD?accion=todo";
            // Establecer el indicador de redirección en el almacenamiento local
            localStorage.setItem("redireccionado", "true");
        }

    </script>
</html>
