<%-- 
    Document   : login
    Created on : 12 may. 2023, 12:29:00
    Author     : carra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Bootstrap demo</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
    </head>

    <body style="background-color: rgb(3, 54, 70);">

        <div class="d-flex justify-content-center align-items-center" style="height: 100vh;">
            <div class="row justify-content-center align-items-center border rounded p-3 m-3"
                 style="background-color: rgb(250, 250, 250);">
                <svg class="mb-2" xmlns="http://www.w3.org/2000/svg" width="45" height="45" fill="currentColor"
                     class="bi bi-person-circle" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                <path fill-rule="evenodd"
                      d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                </svg>
                <form class="m-3" method="post" action="Login">
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control" name="txtUsuario" placeholder="nombre@ejemplo.com" required>
                        <label for="floatingInput">Email</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="password" class="form-control" name="txtContrasenia" placeholder="Contraseña" required>
                        <label for="floatingPassword">Contraseña</label>
                    </div>
                    <div class="d-flex form-check mb-4 justify-content-between fs-6">
                        <div>
                            <input type="checkbox" class="form-check-input" id="exampleCheck1" checked="checked"/>
                            <label class="form-check-label" for="exampleCheck1">Recordame</label>
                        </div>
                        <a class="text-center text-decoration-none text-secondary" href="#">¿Olvidaste tu contraseña?</a>
                    </div>

                    <input type="hidden" name="accion" value="LOG">
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-dark">Iniciar Sesión</button>
                    </div>
                    <div class="text-center mt-3 fs-6">
                        <p class="mb-1 text-secondary">¿No tienes una cuenta?</p>
                        <a class="text-center" href="Login?accion=SIGNUP">Regístrate aquí</a>
                    </div>

                    <c:if test="${mensaje != null}">
                        <div class="alert alert-danger mt-3 text-center" role="alert">
                            ${mensaje}
                        </div>
                    </c:if>
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
