<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Confirmar Registro</title>
<style>
        *{
            margin: 0;
            padding: 0;
        }
        .container{
            background-color: rgb(255, 255, 255);
        }
        .menu{
            background-color: rgb(0, 0, 0);
            display: flex;
            flex-direction: row;

        }
        .titu{
           color: rgb(252, 252, 252);
           font-size: 45px;
           margin-top: 45px;
           margin-left: 10%;
           font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }
        .logo{
            width: 8%;
            height: auto;
            margin-left: 10px;
            margin-top: 15px;
            margin-bottom: 15px;
            border-radius: 5px;
        }
        .espacio_izqui{
            background-color: #d3d3c9;
            width: 60%;
            margin-left: 20%;
            margin-top: 30px;
            border-radius: 15px;
            
        }
        .bienve{
            font-size: 50px;
            text-align: center;
            padding-top: 20px;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
           


        }
        .check{
           margin-left: 46%;
           margin-top: 30px;
           width: 100px;
        }
        .textbie{
            font-size: 30px;
            text-align: center;
            padding-top: 20px;
            font-family: Arial, Helvetica, sans-serif;
        }
        .inic{
            background-color: rgb(22, 224, 32);
            color: aliceblue;
            border-radius: 8px;
            border: 0;
            padding: 6px;
            font-size: 25px;
            margin-left: 40%;
            margin-top: 30px;
            margin-bottom: 30px;
            font-family: monospace;
        }
         .inic a {
            text-decoration: none;
            color: aliceblue;
        }
    </style>
</head>
<body>
<div class="container">
    <header class="cabecera">  
    </header>
    <nav class="menu">
        <img src="imgs/Logo_Grup.jpeg" alt="" class="logo">
     <h1 class="titu">EventosYa</h1>
    </nav>
    <section class="espacio_izqui">
      <div class="cuadro">
        <h2 class="bienve"> Bienvenido a Eventos Ya</h2>
        <img src="imgs/cheque.png" alt="" class="check">
        <p class="textbie">Hola{nombre usuario},<br>gracias por registrarte a <br>EventosYa.<br>Nos alegra que estes aqui.</p>
        <button class="inic"><a href="CrearEvento.jsp">Iniciar Sesion</a></button>
      </div>
    </section>
    <aside class="espacio_derec">

    </aside>
    <footer class="fin">

    </footer>
</div>
</body>
</html>