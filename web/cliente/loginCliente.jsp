<%-- 
    Document   : loginCliente
    Created on : 31 may. 2023, 14:43:46
    Author     : carra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
    </head>
    <body>
        
        <div class="d-flex justify-content-center align-items-center" style="height: 100vh;">
            <div class="row justify-content-center align-items-center border rounded p-3 m-3"
                 style="background-color: rgb(250, 250, 250);">
                <svg class="mb-2" xmlns="http://www.w3.org/2000/svg" width="45" height="45" fill="currentColor"
                     class="bi bi-person-circle" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                <path fill-rule="evenodd"
                      d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                </svg>
                <form class="m-3" method="post" action="/ProyectoDWI/ControladorLogin">
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control" name="txtCorreo" placeholder="nombre@ejemplo.com" required>
                        <label for="floatingInput">Correo Electrónico</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="password" class="form-control" name="txtContrasenia" placeholder="Contraseña" required>
                        <label for="floatingPassword">Contraseña</label>
                    </div>
                    <div class="form-check mb-3">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1" checked="checked"/>
                        <label class="form-check-label" for="exampleCheck1">Recuérdame</label>
                    </div>
                    <div class="text-center">
                        <button type="submit" name="btn-login" class="btn btn-primary">Iniciar Sesión</button>
                    </div>
                </form>
            </div>
        </div>
                
        <script src="../js/bootstrap.bundle.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
                integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
    </body>
</html>
