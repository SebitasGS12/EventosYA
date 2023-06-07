<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Menu Usuario</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Lexend&display=swap');

        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: 'Lexend', sans-serif;
        }

        .hd-pag {
            background-color: #343838;
            height: 15vh;
            width: 100%;
            display: flex;
            align-items: center;
            box-shadow: 0px 0px 7px gray;
        }

        .pag-img {
            height: 80%;
            margin: 10px;
        }

        .pag-h1 {
            margin: 10px;
            color: white;
        }

        .pag-boton {
            position: absolute;
            right: 0;
            padding: 20px;
        }

        .pag-boton form button {
            color: white;
            width: 200px;
            height: 40px;
            font-size: 1.3em;
            border-radius: 20px;
            background-color: #00B4CC;
            border: none;
        }

        .pag-container {
            display: flex;
            flex-direction: row;
            margin-top: 20px;
        }

        .pag-main {
            width: 80%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            margin-top: 50px;
        }

        .pag-subtitle-container {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 10px;
        }

        .pag-subtitle {
            font-size: 2em;
            margin-right: 10px;
        }


        .pag-search-container {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
        }

        .pag-search-input {
            width: 600px;
            height: 40px;
            padding: 5px;
            font-size: 1em;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .pag-search-button {
            width: 40px;
            height: 40px;
            margin-left: 10px;
            font-size: 1.5em;
            border-radius: 50%;
            border: none;
            background-color: #00B4CC;
            color: white;
            cursor: pointer;
        }

        .pag-event-container {
            border: 1px solid #ccc;
            padding: 20px;
            font-size: 1.2em;
            width: 80%;
            margin-top: 20px;
        }


    .pag-boton form button{
        color: white;
        width: 200px;
        height: 40px;
        font-size: 1.3em;
        border-radius: 20px;
        background-color: #00B4CC;
        border: none;
    }
</style>

</head>
<body>
<header class="hd-pag">
    <img class="pag-img" src="imgs/logo.jpg" alt="">
    <h1 class="pag-h1">EventosYa</h1>
    <div class="pag-boton">
        <form action="" method="">
            <button type="submit">Salir</button>
        </form>
    </div>
</header>

	<div class="pag-container">

	<%@include file="../comun/aside.jsp" %>


    <div class="pag-main">
        <div class="pag-subtitle-container">
            <h2 class="pag-subtitle">Buscar Evento</h2>
        </div>
        <div class="pag-search-container">
            <input type="text" class="pag-search-input" placeholder="Buscar evento">
            <button class="pag-search-button">&#128269;</button>
        </div>
        <div class="pag-event-container">
            <p> Aquí se mostrarán los eventos</p>
        </div>
    </div>
</div>
</body>
</html>
