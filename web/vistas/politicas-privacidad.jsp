<%-- 
    Document   : politicas-privacidad
    Created on : 4 jul. 2023, 10:52:11
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

        <div class="container">
            <h2 class="text-center mt-4 mb-3">POLÍTICAS DE PRIVACIDAD</h2>  

            <p class="text-justify"style="padding-bottom:30px;">La presente política de privacidad se encuentra acorde a lo previsto en la normativa peruana sobre protección de datos personales y
                deberá ser leída de manera integral para un cabal entendimiento. Esta tiene por objeto principal proporcionarle una visión clara de 
                para qué usamos los datos personales que el titular de datos personales (en adelante “Usted”) nos proporciona al navegar por nuestra 
                página web y el uso de nuestra APP. Asimismo, busca que Usted pueda conocer, entre otros, nuestros esfuerzos por protegerlos, las opciones
                que tiene para controlar sus datos personales y proteger su privacidad a través del ejercicio de derechos que la normativa le faculta;
                y, que además, pueda conocer los terceros con los que podremos compartir esta información</p> 

            <h3>I. IDENTIDAD Y DOMICILIO DEL RESPONSABLE</h3>
            <p class="text-justify" ></p>
            <p class="text-justify"style="padding-bottom:30px;">El responsable del tratamiento de sus datos personales será Fashion Fitness Perú S.A.C. (en lo sucesivo “Fashion Fitness”). 
                En tal sentido, sobre esta empresa recaerá la titularidad de los diferentes Banco de Datos Personales debidamente registrados ante la Autoridad 
                Nacional de Protección de Datos Personales. Su domicilio se encuentra ubicado en JR. El Haras N. 154 Urb. El Aras, La Molina-Lima Lima12.</p>

            <h3>II. DATOS PERSONALES QUE SERÁN TRADADOS POPR EL RESPONSABLE</h3>
            <p class="text-justify" ></p>
            <p class="text-justify" style="padding-bottom:30px;">El responsable del tratamiento de sus datos personales será Fashion Fitness Perú S.A.C. (en lo sucesivo “Fashion Fitness”). 
                En tal sentido, sobre esta empresa recaerá la titularidad de los diferentes Banco de Datos Personales debidamente registrados ante la Autoridad 
                Nacional de Protección de Datos Personales. Su domicilio se encuentra ubicado en JR. El Haras N. 154 Urb. El Aras, La Molina-Lima Lima12.</p>

            <h3>III. FINES CON LOS QUE UTILIZAREMOS SUS DATOS PERSONALES</h3>
            <p class="text-justify" style="margin-top: 20px;">Los datos personales que recopila Fashion Fitness se utilizarán para los fines que se detallan a continuación:</p>
            <p class="text-justify">
                <b>
                    A. Fines correspondientes a la existencia, mantenimiento y cumplimiento de una relación jurídica entre Fashion Fitness y Usted, 
                    la prestación de servicios básicos por parte de Fashion Fitness y cumplimiento de mandatos legales</p>
            </b>
            <UL TYPE="disc">
            <LI>
                <p class="text-justify">Identificarlo para poder contratar con Fashion Fitness la compraventa de productos ofrecida vía Internet y a través de aplicaciones.
            <LI>
                <p class="text-justify">Dar cumplimiento a obligaciones contraídas producto de contrato celebrado con Usted. Entre otras, dar cumplimiento a nuestras obligaciones de entrega de productos, 
                    incluyendo la información sobre el procesamiento, la entrega y el estado de su pedido; y devolución de ser el caso.
            <LI>
                <p class="text-justify">Atención de servicio al cliente, para efectos de utilizar sus datos personales para identificar la información de su pedido, historial de contacto y procesar sus solicitudes.
                    Dar cumplimiento a obligaciones legales, así como atender a requerimientos de las autoridades competentes.
            </UL>

            <p class="text-justify">
            <b>
                B. Fines comerciales y de marketing de Fashion Fitness</p>
            </b>
            <UL TYPE="disc">
                <LI>
                    <p class="text-justify">Fines de identificación, para efectos de crear un registro único (global) que permite a los sistemas de Fashion Fitness identificarle en cualquier parte del mundo, así como crear un perfil para Usted con la información necesaria
                        para ofrecerle nuestros productos y servicios de manera personalizada y poder analizar su forma de interactuar con nuestra marca.
                <LI>
                    <p class="text-justify">Informar de manera personalizada sobre nuevos productos o servicios que estén relacionados con lo contratado anteriormente por Usted o del estudio que hayamos podido realizar de sus preferencias; información sobre compromisos, 
                        promociones, concursos y ofertas; información sobre productos y servicios que Usted nos haya solicitado; afiliaciones a las comunidades de Fashion Fitness, programas de fidelización, eventos y nuestras aplicaciones.
                <LI>
                    <p class="text-justify" style="padding-bottom:30px;">Realizar estudios internos sobre hábitos de consumo, a fin de mejorar la relación con nuestros clientes, mejorar su experiencia, desarrollar nuevos productos y servicios y mejorar nuestra tecnología.
            </UL>  

            <h3>IV. IDENTIDAD Y DOMICILIO DEL RESPONSABLE</h3>
            <p class="text-justify" style="margin-top: 20px;">Habrá ocasiones en las que necesitemos transferir sus datos personales al interior del Perú y de manera limitada fuera de Perú, a esto último se le denomina flujo transfronterizo de datos. En tales circunstancias, 
                Fashion Fitness tomará las medidas oportunas para garantizar que su información personal esté protegida adecuadamente acorde con los estándares de la legislación peruana, asumiendo el tercero las obligaciones previstas por dicho 
                ordenamiento, en particular, las que corresponde al titular del banco de datos personales.</p>
            <p class="text-justify">Como mínimo, estas medidas incluyen la realización de revisiones en aspectos de seguridad de los destinatarios y la formalización de contratos con tales receptores para garantizar que emplean las mismas o similares medidas administrativas, 
                físicas y técnicas que Fashion Fitness en Perú, de manera que sus datos estén protegidos adecuadamente.</p> 
            <p class="text-justify">En virtud de lo expuesto, al aceptar estos términos de nuestra Política de Privacidad, usted está aceptando la transferencia al interior del país y el flujo transfronterizo de sus datos personales. Cabe indicar que Fashion Fitness trata 
            sus datos personales con responsabilidad y de forma confidencial. Asimismo, no realiza ningún tipo de transferencia de datos personales sin su previo consentimiento, salvo las excepciones previstas en el ordenamiento u orden motivada de alguna autoridad.</p>
        </div>

        <script src="../js/bootstrap.bundle.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" 
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>

    </body>
</html>