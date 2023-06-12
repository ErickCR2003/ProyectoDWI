<%-- 
    Document   : empleados
    Created on : 3 jun. 2023, 18:55:52
    Author     : carra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Pantalla flotante con formulario</title>
        <style>
            /* Estilos para la pantalla flotante */
            .popup {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 300px;
                height: 200px;
                padding: 20px;
                background-color: white;
                border: 1px solid #ccc;
                z-index: 9999;
            }
        </style>
    </head>
    <body>
        <button onclick="mostrarPopup()">Mostrar formulario</button>

        <div id="popup" class="popup">
            <h2>Formulario</h2>
            <form action="procesarFormulario.jsp" method="post">
                <!-- Aquí va el contenido de tu formulario -->
                <input type="text" name="nombre" placeholder="Nombre" required><br>
                <input type="email" name="email" placeholder="Email" required><br>
                <input type="submit" value="Enviar">
            </form>
        </div>

        <script>
            // Función para mostrar la pantalla flotante
            function mostrarPopup() {
                document.getElementById("popup").style.display = "block";
            }
        </script>
    </body>
</html>
