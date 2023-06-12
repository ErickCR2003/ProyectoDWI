<%-- 
    Document   : Administracion
    Created on : 26 may. 2023, 21:26:30
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

        <!-- <link rel="shortcut icon" href="../img/logo invertido.png" type="image/x-icon"/> -->

        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="dist/css/adminlte.min.css">

        <!-- REQUIRED SCRIPTS -->

        <!-- jQuery -->
        <script src="plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="dist/js/adminlte.min.js"></script>
    </head>
    <body class="hold-transition sidebar-mini">
        <div class="wrapper">


            <!-- Navbar -->
            <%@include file="AdminNavbar.jspf" %>
            <!-- end Navbar -->

            <!-- Aside -->
            <%@include file="AdminAside.jspf" %>
            <!-- end Aside -->

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Aside -->

                <c:choose>
                    <c:when test="${pagina eq 'tablero'}">
                        <%@include file="dashboard.jspf" %>
                    </c:when>
                    <c:when test="${pagina eq 'productos'}">
                        <%@include file="productos.jspf" %>
                    </c:when>
                    <c:when test="${pagina eq 'clientes'}">
                        <%@include file="clientes.jspf" %>
                    </c:when>
                    <c:when test="${pagina eq 'ventas'}">
                        <%@include file="ventas.jspf" %>
                    </c:when>
                    <c:when test="${pagina eq 'config'}">
                        <%@include file="config.jspf" %>
                    </c:when>
                </c:choose>
                <!-- end Aside -->
            </div>
            <!-- /.content-wrapper -->  

            <!-- footer -->
            <%@include file="AdminFooter.jspf" %>
            <!-- end footer -->


        </div>
        <!-- ./wrapper -->
    </body>
</html>

