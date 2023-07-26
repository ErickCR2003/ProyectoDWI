<%-- 
    Document   : carrito
    Created on : 12 jun. 2023, 12:06:14
    Author     : carra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%-- 
    <%
    // Obtén el valor del atributo de solicitud
    Boolean carritoVacio = (Boolean) request.getAttribute("carritovacio");
    // Verifica si el valor es nulo
    boolean isCarritoVacio = (carritoVacio != null && carritoVacio.booleanValue());
    %>
--%>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Zapatillas Perú</title>
        <link rel="shortcut icon" href="img/logo invertido.png" type="image/x-icon"/>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    </head>
    <body>

        <!-- header -->
        <%@include file="../WEB-INF/jspf/header.jspf" %>
        <!-- end header -->

        <div class="container-xxl mt-4 px-5">
            <h3 class="mb-3 text-center">Carrito de Compras</h3>
            <hr class="mb-4">
            <div class="row">
                <div class="col-12 col-lg-8 mb-3">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead class="table-light">
                                <tr class="text-center">
                                    <th>ITEM</th>
                                    <th>IMAGEN</th>
                                    <th>NOMBRE</th>
                                    <th>DESCRIPCION</th>
                                    <th>PRECIO</th>
                                    <th>CANTIDAD</th>
                                    <th>SUBTOTAL</th>
                                    <th>OPCIONES</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="text-center">
                                    <td colspan="8"><label>TU CARRITO ESTÁ VACÍO</label></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-12 col-lg-4">
                    <div>
                        <h4>Resumen</h4>
                    </div>
                    <hr>
                    <div class="mt-3">
                        <div class="row">
                            <div class="col-8">
                                <span>Precio a Pagar:</span>
                            </div>
                            <div class="col-4 text-center">
                                <span>S/ 0.00</span>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-8">
                                <span>IGV (18%)</span>
                            </div>
                            <div class="col-4 text-center">
                                <span>S/ 0.00</span>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-8">
                                <span class="fw-bold">Total de la Compra:</span>
                            </div>
                            <div class="col-4 text-center">
                                <span class="fw-bold">S/ 0.00</span>
                            </div>
                        </div>
                        <hr>
                        <div class="d-grid gap-2">
                            <a href="#" id="btnCompraVacio" class="btn btn-dark">Comprar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Código HTML y JSP -->



        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script src="js/funciones.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>

        <!-- 
                <script>
                    // Comprueba si el carrito está vacío
                    var carritoVacio = <%--<%= isCarritoVacio%>--%>;
        
                    // Si el carrito está vacío, muestra la alerta
                    if (carritoVacio) {
                        alert("El carrito está vacío.");
                    }
                </script>
        -->

    </body>
</html>
