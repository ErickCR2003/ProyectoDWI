<%-- 
    Document   : registrate
    Created on : 15 jun. 2023, 15:59:29
    Author     : carra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
        <title>JSP Page</title>
    </head>
    <body style="background-color: rgb(3, 54, 70);">
        <div class="d-flex justify-content-center align-items-center">
            <div class="row justify-content-center align-items-center border rounded p-3 m-3"
                 style="background-color: rgb(250, 250, 250);">

                 <form class="p-3" method="post" action="Login">
                <div class="text-center">
                    <svg class="mb-4" xmlns="http://www.w3.org/2000/svg" width="45" height="45" fill="currentColor"
                         class="bi bi-person-circle" viewBox="0 0 16 16">
                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                    <path fill-rule="evenodd"
                          d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                    </svg>
                </div>
                <div class="form-floating mb-3">
                    <input type="email" class="form-control" name="txtUsuario" placeholder="nombre@ejemplo.com" required>
                    <label for="floatingInput">Correo Electrónico</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="password" class="form-control" name="txtContrasenia" placeholder="Contraseña" required>
                    <label for="floatingPassword">Contraseña</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" name="txtContrasenia" placeholder="Contraseña" required>
                    <label for="floatingPassword">Nombre</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" name="txtContrasenia" placeholder="Contraseña" required>
                    <label for="floatingPassword">Apellido</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="password" class="form-control" name="txtContrasenia" placeholder="Contraseña" required>
                    <label for="floatingPassword">Número de Documento</label>
                </div>
                <div class="form-floating mb-4">
                    <input type="date" class="form-control" name="txtContrasenia" placeholder="Contraseña" required>
                    <label for="floatingPassword">Fecha de Nacimiento</label>
                </div>
                <div class="d-flex form-check mb-4 fs-6 justify-content-center">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1" checked="checked"/>
                    <label class="form-check-label ms-1" for="exampleCheck1">Estoy de acuerdo con las <a href="#">Politicas de Privacidad</a></label>
                </div>

                <input type="hidden" name="accion" value="LOG">
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-dark">Regístrate</button>
                </div>
                <div class="text-center mt-3 fs-6">
                    <p class="mb-1 text-secondary">¿Tienes una cuenta?</p>
                    <a class="text-center" href="Login?accion=other">Ingresa aquí</a>
                </div>
                </form>
            </div>
        </div>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
                integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>

    </body>

</html>
