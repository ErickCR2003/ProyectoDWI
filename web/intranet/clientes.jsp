<%-- 
    Document   : clientes
    Created on : 4 jul. 2023, 12:55:38
    Author     : carra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    <body>
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
                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1 class="m-0">Clientes</h1>
                            </div><!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a>Inicio</a></li>
                                    <li class="breadcrumb-item active">Clientes</li>
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
                                        <h3 class="d-flex card-title align-items-center">Tabla de Clientes</h3>
                                        <button type="button" class="btn btn-default" id="btn-insert" data-toggle="modal" data-target="#modal-edit">
                                            <i class="fa fa-user-plus"></i>
                                        </button>
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Nombre</th>
                                                    <th>Apellido</th>
                                                    <th>Email</th>
                                                    <th>Fec. Nacimiento</th>
                                                    <th>DNI</th>
                                                    <th>Opciones</th>
                                                </tr>
                                            </thead>
                                            <tbody >
                                                <c:forEach var="p" items="${listausuarios}">
                                                    <tr>
                                                        <td>${p.getID()}</td>
                                                        <td>${p.getNombre()}</td>
                                                        <td>${p.getApellido()}</td>
                                                        <td>${p.getEmail()}</td>
                                                        <td>${p.getFecNacimiento()}</td>
                                                        <td>${p.getDni()}</td>
                                                        <td class="text-center">
                                                            <div class="btn-group">
                                                                <input type="hidden" id="idUser" value="${p.getID()}">
                                                                <button type="button" class="btn btn-warning" id="btn-editar" data-toggle="modal" data-target="#modal-edit">
                                                                    <i class="fa fa-pen"></i>
                                                                </button>
                                                                <button type="button" class="btn btn-danger" id="btn-eliminar">
                                                                    <i class="fa fa-trash"></i>
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>

                                                <div class="modal fade" id="modal-edit">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h4 class="modal-title">Editar Cliente</h4>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form id="form-edit">
                                                                    <div class="form-group">
                                                                        <label for="recipient-name" class="col-form-label">Nombre:</label>
                                                                        <input type="text" class="form-control" id="name">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="recipient-name" class="col-form-label">Apellido:</label>
                                                                        <input type="text" class="form-control" id="lastname">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="recipient-name" class="col-form-label">Email:</label>
                                                                        <input type="email" class="form-control" id="email">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="recipient-name" class="col-form-label">Fecha de Nacimiento:</label>
                                                                        <input type="date" class="form-control" id="fechaNacer">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="recipient-name" class="col-form-label">DNI:</label>
                                                                        <input type="text" maxlength="8" class="form-control" id="dni">
                                                                    </div>
                                                                </form>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                                                <button type="button" class="btn btn-primary" onclick="guardarCambios(${p.getID()})" data-dismiss="modal">Guardar Cambios</button>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <!-- /.modal-content -->
                                                </div>
                                                <!-- /.modal-dialog -->
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
                <!-- /.content -->
                <!-- end Aside -->
            </div>
            <!-- /.content-wrapper -->  

        </div>
        <!-- /.modal -->

        <!-- footer -->
        <%@include file="AdminFooter.jspf" %>
        <!-- end footer -->

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
            $("tr #btn-editar").click(function () {
                var id = $(this).parent().find("#idUser").val();
                $.ajax({
                    url: 'ServletClientes',
                    data: {accion: 'EDIT', id: id},
                    dataType: 'json',
                    success: function (response) {

                        var apellido = response.apellido;
                        var email = response.email;
                        var fechaNacimiento = response.fecNacimiento;
                        var dni = response.dni;

                        // Dividir la fecha en día, mes y año
                        var partes = fechaNacimiento.split("-");
                        var dia = partes[0];
                        var mes = partes[1];
                        var anio = partes[2];

                        // Construir la fecha en formato "yyyy-mm-dd"
                        var fechaConvertida = anio + "-" + mes + "-" + dia;

                        // Establecer los valores en los campos del modal utilizando JavaScript puro
                        document.getElementById('name').value = response.nombre;
                        document.getElementById('lastname').value = apellido;
                        document.getElementById('email').value = email;
                        document.getElementById('fechaNacer').value = fechaConvertida;
                        document.getElementById('dni').value = dni;
                        // ...

                        console.log(response);
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            });
        </script>
        <script>
            function guardarCambios(id) {
                // Obtener los valores actualizados de los campos del modal
                var nombre = document.getElementById('name').value;
                var apellido = document.getElementById('lastname').value;
                var email = document.getElementById('email').value;
                var fecNacimiento = document.getElementById('fechaNacer').value;
                var dni = document.getElementById('dni').value;

                // Dividir la fecha en día, mes y año
                var partes = fecNacimiento.split("-");
                var anio = partes[0];
                var mes = partes[1];
                var dia = partes[2];

                // Construir la fecha en formato "dd-mm-yyyy"
                var fechaConvertida = dia + "-" + mes + "-" + anio;

                $.ajax({
                    url: 'ServletClientes',
                    data: {
                        accion: 'UPT',
                        id: id,
                        nombre: nombre,
                        apellido: apellido,
                        email: email,
                        fecha: fechaConvertida,
                        dni: dni
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
