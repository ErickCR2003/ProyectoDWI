<%-- 
    Document   : Productos
    Created on : 28 may. 2023, 19:44:32
    Author     : carra
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.DecimalFormat" %>


<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Zapatillas Perú</title>
        <link rel="shortcut icon" href="img/logo invertido.png" type="image/x-icon"/>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/productos.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    </head>
    <body>

        <!-- header -->
        <%@include file="../WEB-INF/jspf/header.jspf" %>
        <!-- end header -->

        <div id="carouselExampleIndicators" class="carousel slide mb-3" data-bs-ride="true">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img/dc-manteca-banner.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="img/new-balance-iconic-574.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="img/converse-banner-purple.jpg" class="d-block w-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <main style="margin: 0px 35px">
            <div class="container" style="margin: auto; padding: 10px">
                <form class="d-flex" role="search">
                    <input
                        class="form-control me-2"
                        type="search"
                        placeholder="Buscar"
                        aria-label="Search"
                        />
                    <button class="btn btn-primary" type="submit">Buscar</button>
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
                    <li class="nav-item my-custom-nav-item">
                        <a class="nav-link active my-custom-nav-link" aria-current="page" href="#">Todo</a>
                    </li>
                    <li class="nav-item my-custom-nav-item">
                        <a class="nav-link my-custom-nav-link" href="#">Skateboarding</a>
                    </li>
                    <li class="nav-item my-custom-nav-item">
                        <a class="nav-link my-custom-nav-link" href="#">Deportivas</a>
                    </li>
                    <li class="nav-item my-custom-nav-item">
                        <a class="nav-link my-custom-nav-link" href="#">Casual</a>
                    </li>
                    <li class="nav-item my-custom-nav-item">
                        <a class="nav-link my-custom-nav-link" href="#">Minimalista</a>
                    </li>
                </ul>
            </section>
            <div class="m-5">
                <div
                    class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4"
                    >
                    <c:forEach var="p" items="${listaproductos}">
                        <div class="col">
                            <div class="card shadow-sm bg-body rounded h-100">
                                <img src="${p.getImagen()}" class="card-img-top" alt="..." />
                                <div class="card-body">
                                    <h5 class="card-title text-center h4">${p.getNombre()}</h5>
                                    <p class="card-text text-center mb-1">${p.getDescripcion()}</p>
                                    <p class="card-text text-center lead"><b>S/${p.getPrecio()}</b></p>
                                    <div class="card-text text-center">
                                        <a href="Ctrlindex?accion=AgregarCarrito&id=${p.getID()}" class="btn btn-outline-danger mb-1">Agregar al Carrito</a>
                                        <a href="Ctrlindex?accion=Comprar&id=${p.getID()}" class="btn btn-outline-success">Comprar</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div> 
            </div>
        </main>

        <!-- footer -->
        <%@include file="../WEB-INF/jspf/footer.jspf" %>
        <!-- end footer -->

        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" 
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>

    </body>
</html>

