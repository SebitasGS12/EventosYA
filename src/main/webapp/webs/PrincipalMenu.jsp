<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>EventosYa - Menu de Inicio</title>
  <style>
    body {
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
      font-family: Arial, sans-serif;
    }
    
    .header {
      background-color: black;
      padding: 20px;
      width: 100%;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    
    .header h1 {
      color: white;
      margin: 0;
      display: flex;
      align-items: center;
    }
    
    .header h1 img {
      margin-right: 10px;
      max-width: 30px;
    }
    
    ul {
      list-style-type: none;
      margin: 0;
      padding: 0;
      display: flex;
      background-color: black;
    }
    
    li {
      margin: 0 10px;
    }
    
    li a {
      font-family: "Comic Sans MS", cursive; /* Mantener la fuente Comic Sans */
      text-decoration: none;
      color: #fff;
      transition: opacity 0.3s;
    }
    
    li a:hover {
      opacity: 0.7;
    }
    
    .inicio-sesion {
      background-color: #00a9e0;
      padding: 10px;
      color: white;
      text-decoration: none;
      transition: opacity 0.3s;
    }
    
    .inicio-sesion:hover {
      opacity: 0.7;
    }
    
    .image-container {
      display: flex;
      justify-content: center;
      margin-top: 20px;
    }
    
    .image-container img {
      margin: 0 10px;
      max-width: 100%;
      height: auto;
    }
  </style>
</head>
<body>
  <div class="header">
    <h1>
      <img src="../imgs/logo.jpg" alt="logo">
      <span style="font-family: Arial, sans-serif;">EventosYa</span>
    </h1>
    <ul>
      <li><a href="#" style="color: white;">Comunidad</a></li>
      <li><a href="#" style="color: white;">Acerca de</a></li>
      <li><a href="#" style="color: white;">Contacto</a></li>
      <li><a href="#" class="inicio-sesion">Iniciar Sesión</a></li>
    </ul>
  </div>
  <div class="image-container">
    <img src="../imgs/inicio1.jpg" alt="inicio1">
    <img src="../imgs/inicio2.jpg" alt="inicio2">
  </div>
  
  
    <%@include file="../comun/footer.jsp" %>
  
</body>
</html>
