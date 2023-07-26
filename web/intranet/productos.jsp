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
        <!-- DataTables -->
        <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
        <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="dist/css/adminlte.min.css">



    </head>
    <body class="hold-transition sidebar-mini">
        <div class="wrapper">
            <c:if test="${mensaje != null}">
                <p>${mensaje}</p>
            </c:if>

            <!-- Navbar -->
            <%@include file="AdminNavbar.jspf" %>
            <!-- end Navbar -->

            <!-- Aside -->
            <%@include file="AdminAside.jspf" %>
            <!-- end Aside -->

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Aside -->
                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1 class="m-0">Inventario</h1>
                            </div><!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a>Inicio</a></li>
                                    <li class="breadcrumb-item active">Inventario</li>
                                </ol>
                            </div><!-- /.col -->
                        </div><!-- /.row -->
                    </div><!-- /.container-fluid -->
                </div>
                <!-- /.content-header -->
                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="d-flex justify-content-between mx-4 mt-3">
                                        <h3 class="d-flex card-title align-items-center">Tabla de Productos</h3>
                                        <button type="button" class="btn btn-default" id="btn-insert" data-toggle="modal" data-target="#modal-insert">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Imagen</th>
                                                    <th>Nombre</th>
                                                    <th>Precio</th>
                                                    <th>Stock</th>
                                                    <th>Categoria</th>
                                                    <th>Color</th>
                                                    <th>Talla</th>
                                                    <th>Opciones</th>
                                                </tr>
                                            </thead>
                                            <tbody >
                                                <c:forEach var="p" items="${listaproductos}">
                                                    <tr>
                                                        <td><img src="${p.getImagen()}" height="50px" width="110px" alt="..." /></td>
                                                        <td>${p.getNombre()}</td>
                                                        <td>${p.getPrecio()}</td>
                                                        <td>${p.getStock()}</td>
                                                        <td>${p.getCategoria()}</td>
                                                        <td>${p.getColor()}</td>
                                                        <td>${p.getTalla()}</td>
                                                        <td class="text-center">
                                                            <div class="btn-group">
                                                                <input type="hidden" id="idproduct" value="${p.getID()}">
                                                                <button type="button" class="btn btn-warning" id="btn-editar" data-toggle="modal" data-target="#modal-edit">
                                                                    <i class="fa fa-pen"></i>
                                                                </button>
                                                                <button type="button" class="btn btn-danger" id="btn-eliminar" data-toggle="modal" data-target="#modal-edit">
                                                                    <i class="fa fa-trash"></i>
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>

                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.card-body -->
                                </div>
                                <!-- /.card -->
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </section>
                <!-- /modal insert -->
                <div class="modal fade" id="modal-insert">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Insertar Producto</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <div class="modal-body">
                                <form id="form-insert">
                                    <div class="col">
                                        <div class="row">

                                            <div class="col-6 col-sm-6">
                                                <div class="form-group">
                                                    <label for="recipient-name" class="col-form-label">Nombre:</label>
                                                    <input type="text" class="form-control" id="name">
                                                </div>
                                                <div class="form-group">
                                                    <label for="recipient-name" class="col-form-label">Precio:</label>
                                                    <input type="text" class="form-control" id="price" min="0">
                                                </div>
                                                <div class="form-group">
                                                    <label for="recipient-name" class="col-form-label">Stock:</label>
                                                    <input type="number" class="form-control" id="stock" min="0">
                                                </div>
                                                <div class="form-group">
                                                    <label for="recipient-name" class="col-form-label">Genero:</label>
                                                    <select id="genero" class="form-control">
                                                        <option selected>Elige...</option>
                                                        <option value="Hombre" >Hombre</option>
                                                        <option value="Mujer" >Mujer</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleFormControlTextarea1">Descripcion:</label>
                                                    <textarea class="form-control" id="descripcion" rows="3"></textarea>
                                                </div>
                                            </div>
                                            <div class="col-6 col-sm-6">
                                                <div class="form-group">
                                                    <label for="recipient-name" class="col-form-label">Categoria:</label>
                                                    <select id="category" class="form-control">
                                                        <option selected>Elige...</option>
                                                        <c:forEach var="c" items="${listaCategorias}">
                                                            <option value="${c.getID()}" >${c.getNombre()}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="recipient-name" class="col-form-label">Color:</label>
                                                    <select id="color" class="form-control">
                                                        <option selected>Elige...</option>
                                                        <c:forEach var="c" items="${listaColor}">
                                                            <option value="${c.getID()}" >${c.getColor()}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="recipient-name" class="col-form-label">Talla:</label>
                                                    <select id="size" class="form-control">
                                                        <option selected>Elige...</option>
                                                        <c:forEach var="c" items="${listaTalla}">
                                                            <option value="${c.getID()}" >${c.getNumeroCalzado()}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="recipient-name" class="col-form-label">Marca:</label>
                                                    <select id="marca" class="form-control">
                                                        <option selected>Elige...</option>
                                                        <c:forEach var="c" items="${listaMarca}">
                                                            <option value="${c.getID()}" >${c.getMarca()}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="recipient-name" class="col-form-label">Imagen:</label>
                                                    <input type="text" class="form-control" id="image">
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </form>   
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                <button class="btn btn-primary" onclick="insertarProducto()" data-dismiss="modal">Guardar Cambios</button>
                            </div>
                        </div>

                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
                <!-- /.content -->
                <!-- end Aside -->
            </div>
            <!-- /.content-wrapper -->
        </div>
        <!-- REQUIRED SCRIPTS -->
        <!-- jQuery -->
        <script src="plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="dist/js/adminlte.min.js"></script>
        <!-- DataTables  & Plugins -->
        <script src="plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
        <script src="plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
        <script src="plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
        <script src="plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
        <script src="plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
        <script src="plugins/jszip/jszip.min.js"></script>
        <script src="plugins/pdfmake/pdfmake.min.js"></script>
        <script src="plugins/pdfmake/vfs_fonts.js"></script>
        <script src="plugins/datatables-buttons/js/buttons.html5.min.js"></script>
        <script src="plugins/datatables-buttons/js/buttons.print.min.js"></script>
        <script src="plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
        <!-- 
            AdminLTE for demo purposes 
        <script src="dist/js/demo.js"></script> 
        -->

        <!-- Page specific script -->
        <script>
                                    $(function () {
                                        $("#example1").DataTable({
                                            "responsive": true, "lengthChange": false, "autoWidth": false,
                                            "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
                                        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
                                    });
        </script>

        <script>
            function insertarProducto() {
                // Obtener los valores actualizados de los campos del modal
                var nombre = document.getElementById('name').value;
                var price = document.getElementById('price').value;
                var stock = document.getElementById('stock').value;
                var genero = document.getElementById('genero').value;
                var descripcion = document.getElementById('descripcion').value;
                var category = document.getElementById('category').value;
                var color = document.getElementById('color').value;
                var size = document.getElementById('size').value;
                var marca = document.getElementById('marca').value;
                var image = document.getElementById('image').value;

                $.ajax({
                    url: 'ServletProductos',
                    data: {
                        accion: 'INS',
                        nombre: nombre,
                        precio: price,
                        stock: stock,
                        genero: genero,
                        descripcion: descripcion,
                        category: category,
                        color: color,
                        size: size,
                        marca: marca,
                        image: image
                    },
                    success: function (data, textStatus, jqXHR) {
                        location.reload();
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            }
        </script>

    </body>
</html>