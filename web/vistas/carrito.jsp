<%-- 
    Document   : carrito
    Created on : 12 jun. 2023, 12:06:14
    Author     : carra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

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
        <c:if test="${mensaje != null}">
            <p>${mensaje}</p>
        </c:if>

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
                                    <th>OPCIONES</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="c" items="${carrito}">
                                    <tr class="text-center">
                                        <td>${status.index + 1}</td>
                                        <td><img src="${c.getImagen()}" height="50px" width="100px" alt="..." /></td>
                                        <td>${c.getNombre()}</td>
                                        <td>${c.getDescripcion()}</td>
                                        <td>${c.getPrecio()}0</td>  
                                        <td>
                                            <input type="hidden" id="idpro" value="${c.getId_producto()}">
                                            <input id="cantidad-${c.getId_producto()}" type="number" class="form-control text-center" min="1" max="12" value="${c.getCantidad()}">
                                        </td>
                                        <td>
                                            <input type="hidden" id="idp" value="${c.getId_producto()}">
                                            <a href="#" id="btnDelete" class="btn btn-outline-danger mb-1"><i class="fa-solid fa-trash"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
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
                                <span>S/ ${totalapagar}0</span>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-8">
                                <span>IGV (18%)</span>
                            </div>
                            <div class="col-4 text-center">
                                <span>S/ ${totalIGV}</span>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-8">
                                <span class="fw-bold">Total de la Compra:</span>
                            </div>
                            <div class="col-4 text-center">
                                <span class="fw-bold">S/ ${totalapagar}0</span>
                            </div>
                        </div>
                        <hr>
                        <div class="d-grid gap-2">
                            <a href="#" id="btnGenerar" class="btn btn-dark">Comprar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script src="js/funciones.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>

        <c:forEach var="c" items="${carrito}">         
            <script>
                $("tr #cantidad-${c.getId_producto()}").click(function () {
                    var cantidad = $(this).parent().find("#cantidad-${c.getId_producto()}").val();
                    var url = "Ctrlindex?accion=ActualizarCantidad";
                    $.ajax({
                        type: 'POST',
                        url: url,
                        data: "idp=" + ${c.getId_producto()} + "&cantidad=" + cantidad,
                        success: function (data, textStatus, jqXHR) {
                            location.href = "Ctrlindex?accion=Carrito";
                        }
                    });
                });
            </script>
        </c:forEach>
            
        <script>

            var rol = "${rol}";
            var idMetodoPago = "${idMetodoPago}";

            $("#btnGenerar").click(function () {
                if (rol !== null && rol === "CLIENTE") {
                    if (idMetodoPago !== "0") {
                        generarCompra();
                            swal({
                                icon: "success",
                                text: "¡Su compra se realizó con éxito!",
                                buttons: ["Volver al carrito", "Seguir Comprando!"],
                                timer: 2500
                            }).then((willDelete) => {
                                if (willDelete) {
                                    parent.location.href = "Ctrlindex?accion=Principal";
                                } else {
                                    parent.location.href = "Ctrlindex?accion=Carrito";
                                }
                            });
                    } else {
                        swal({
                            icon: "error",
                            text: "Debes ingresar un método de pago.",
                            button: false,
                            timer: 2500
                        });
                    }
                } else {
                    swal({
                        icon: "error",
                        text: "Debes iniciar sesión para poder comprar.",
                        button: false,
                        timer: 2500
                    });
                }

            });

            function generarCompra() {
                var url = "Ctrlindex?accion=GenerarCompra";
                $.ajax({
                    type: 'POST',
                    url: url,
                    data: null,
                    success: function (data, textStatus, jqXHR) {
                    }
                });
            }
        </script>
    </body>
</html>
