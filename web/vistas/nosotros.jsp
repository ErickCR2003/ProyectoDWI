<%-- 
    Document   : nosotros
    Created on : 15 jun. 2023, 13:14:02
    Author     : carra
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .text-justify {
                text-align: justify;
            }
        </style>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Zapatillas Perú</title>
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    </head>
    <body>

        <header>
            <nav class="navbar navbar-dark bg-dark sticky-top">
                <div class="container-fluid">
                    <div class="d-flex align-items-center mx-3">
                        <a class="navbar-brand" href="../Ctrlindex?accion=Principal">Zapatillas Perú</a>
                        <div class="nav-item d-flex align-items-center">
                            <i class="fa-solid fa-cart-shopping" style="color: #ffffff;"><label>(${contador})</label></i>
                            <a class="nav-link text-white-50 mx-1" href="../Ctrlindex?accion=Carrito">Carrito</a>
                        </div>
                        <div class="nav-item d-flex align-items-center">
                            <a class="nav-link text-white-50 mx-1" >${usuario}</a>
                        </div>

                    </div>
                    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
                        <div class="offcanvas-header">
                            <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">Zapatillas Perú</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                        </div>
                        <div class="offcanvas-body">
                            <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="../Login">Iniciar Sesión</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="../Login?accion=OUT">Cerrar Sesión</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>
        </header>

        <section class="section-about">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h1 class="section-title" style="margin-top: 20px;"> ¿Quienes Somos?</h1>
                        <div class="text-justify" style="margin-top: 30px; margin-left: 200px; margin-right: 200px;">
                            <p class="section-description">Somos una tienda especializada en zapatillas de alta calidad y estilo. Nuestro objetivo es brindar a nuestros clientes las mejores opciones de calzado deportivo y urbano.
                                Ofrecemos una amplia selección de marcas reconocidas y modelos exclusivos. Trabajamos directamente con los fabricantes para asegurarnos de ofrecer productos auténticos y de excelente calidad.
                                En nuestra tienda, encontrarás un equipo de expertos apasionados por las zapatillas que están dispuestos a brindarte asesoramiento personalizado y recomendaciones para encontrar el par perfecto.</p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Nuevas imágenes en paralelo -->
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">

                        <img src="../img/img-nosotros/Tiennda1.jpg" alt="Imagen referencial" class="Imagen Tiennda1" style="width: 500px; margin-top: 35px;">
                    </div>
                    <div class="col-lg-6">

                        <img src="../img/img-nosotros/Tienda2.jpg" alt="Imagen referencial" class="Imagen Tienda2" style="width: 500px; margin-top: 35px;">
                    </div>
                </div>
            </div>
        </section>


        <section class="section-about">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6" style="text-align: justify; padding-right:140px">
                        <h2 class="section-title" style="margin-top: 130px;">Misión</h2>                 
                        <p class="section-description" style="margin-top: 30px;">Nuestra misión es proporcionar a los clientes de "Zapatillas Peru" un acceso fácil y conveniente a su amplia 
                            gama de productos de calidad a través de un sitio web intuitivo y eficiente. Buscamos mejorar la 
                            experiencia de compra de los usuarios y optimizar los procesos de venta y gestión del stock.</p>
                    </div>
                    <div class="col-lg-6" >
                        <img src="../img/img-nosotros/Mision1.jpg" alt="Imagen referencial" class="Imagen Mision1" style="width: 500px; margin-top: 90px;">
                    </div>
                </div>
            </div>
        </section>

        <section class="section-about">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 order-lg-2" style="text-align: justify; padding-right:140px">
                        <h2 class="section-title" style="margin-top: 150px;">Visión</h2>
                        <p class="section-description" style="margin-top: 20px;">Nuestra visión es convertir a "Zapatillas Peru" en un referente en la industria de importación de zapatillas en Perú, 
                            a través de la implementación de tecnologías avanzadas y una plataforma en línea altamente funcional.                
                        <p>Buscamos ser reconocidos por nuestra excelencia en el servicio al cliente, la disponibilidad de productos y la eficiencia en las operaciones.</p>
                    </div>
                    <div class="col-lg-6 order-lg-1">
                        <img src="../img/img-nosotros/Vision1.jpg" alt="Ultima Imagen" class="Imagen Vision1" style="width: 500px; margin-top: 35px;">
                    </div>
                </div>
            </div>
        </section>
                     
           
        <script src="../js/bootstrap.bundle.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" 
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>

    </body>
</html>
