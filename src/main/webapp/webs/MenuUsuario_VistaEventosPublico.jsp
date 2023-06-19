<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Lexend&display=swap');
            * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        font-family: 'Lexend', sans-serif;
    }

    body {
        text-align: left;
        
    }
    

    .event-container {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        justify-content: flex-start;
        margin-bottom: 20px;
        padding: 10px;
        border: 1px solid #ccc;
        width: 80%;
        margin: 0 auto; /* Alineación al centro */
    }

    .event-image {
        width: 120px;
        height: 120px;
        flex-shrink: 0;
        margin-bottom: 10px;
        align-self: flex-start;
    }

    .event-name {
        font-weight: bold;
        margin-bottom: 10px;
        text-align: center;
    }

    .event-info {
        margin-bottom: 5px;
        text-align: center;
    }

    .event-button {
        background-color: red;
        color: white;
        border: none;
        padding: 6px 12px;
        border-radius: 3px;
        cursor: pointer;
        font-size: 0.8em;
        align-self: center;
        margin-top: 10px;
    }

    .event-details {
        text-align: center;
    }

    .flex-container {
        display: flex;
        justify-content: center;
        max-width: 1500px;
        margin-top: 20px;
    }

    .flex-container > .event-container:first-child {
        margin-right: 20px;
    }

    .flex-container > .event-container:last-child {
        width: 80%;
        max-width: none;
    }

    .comments-container {
        width: 100%;
        max-width: 100%;
        height: 400px;
        margin: 0 auto;
        display: flex;
        justify-content: flex-end;
    }

    .comments-container > div {
        background-color: white;
        width: 80%;
        max-width: 1000px;
        padding: 20px;
    }

    .comments-container input[type="text"] {
        width: 400px;
    }

    .comments-container button {
        margin-left: 10px;
    }
</style>
</head>
<body>
<%
String msg = (String) request.getAttribute("mensaje");
if (msg==null) msg="";
%>
<%=msg %>
<%@include file="../comun/header_Salir.jsp" %>

<div class="event-container" style="width: 100%; max-width: 1500px; height: 500px;">
    <div class="event-details" style="display: flex; align-self: flex-start;">
        <div class="event-image" style="margin-top: 10px;">
            <img src="../imgs/ims_usuarioimg.jpg" alt="ima" style="width: 600px;">
        </div>
    </div>
    <div class="event-details" style="text-align: center; align-self: flex-end; margin-top: -50px; margin-right: 100px; font-size: 1.2em; margin-left: 10px;">
    <p class="event-name">Nombre de Evento</p>
    <p class="event-info">Fecha de Inicio: 01/01/01</p>
    <p class="event-info">Fecha Fin: 01/01/01</p>
    <p class="event-info">Categoría: Evento ProSalud</p>
    <button class="event-button event-button-centered">Asistiré!</button>
</div>
    </div>
<div style="display: flex; justify-content: center;">
    <div class="flex-container">
        <div class="event-container" style="width: 30%; max-width: 400px; height: 400px; margin-right: 20px;">
            <div class="event-details" style="text-align: center;">
                <p class="event-name">Ubicación</p>
                <div class="event-image" style="margin-top: 10px; width: 100%; height: 90%;">
                    <img src="../imgs/mapa_ubicacion.png" alt="Mapa" style="width: 100%; height: 100%;">
                </div>
            </div>
        </div>
        <div class="event-container" style="width: 80%; max-width: none; height: 400px;">
            <p class="event-name">Descripción del Evento</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
            <p>Creador del Evento</p>
            <p>@User1234</p>
            <img src="../imgs/user_MenuUsuario.png" alt="usMen" style="width: 50px; height: 50px;">
        </div>
    </div>
</div>


    <div class="event-container" style="width: 60%; max-width: none; height: 400px; margin-top: 20px;">
        <div>
            <p style="font-weight: bold; font-size: 1.2em; margin-bottom: 10px; text-align: left;">1 comentario</p>
            <div style="display: flex; align-items: center; justify-content: flex-end;">
                <img src="../imgs/user_MenuUsuario.png" alt="usMen" style="width: 40px; height: 40px;">
                <input type="text" placeholder="Escribe un comentario largo" style="margin-left: 10px; width: 400px; border: 1px solid gray; padding: 5px;">
                <button style="background-color: gray; color: white; padding: 5px 10px; font-size: 1em; border: none;">Enviar</button>
            </div>
            <div style="background-color: darkgray; padding: 10px; margin-top: 10px;">
                <img src="../imgs/womanComentary_MenuUsuario.png" alt="Logo" style="width: 40px; height: 40px; margin-right: 10px;">
                <span style="font-size: 1em;">@User12355</span>
                <p style="font-size: 0.9em; margin-top: 10px;">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
            </div>
        </div>
    </div>
</body>
</html>
