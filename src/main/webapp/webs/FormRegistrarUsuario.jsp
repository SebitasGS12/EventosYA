<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Formulario - Registrar Usuario</title>
  <style>
    /* Estilos CSS aquí */
    body {
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
    }

    .header {
      background-color: #ddd;
      padding: 20px;
      display: flex;
      align-items: center;
    }

    .header img {
      max-width: 30px;
      margin-right: 10px;
    }

    .header h1 {
      margin: 0;
      color: black;
      margin-left: 10px;
    }

    .container {
      padding: 20px;
    }

    .button-container {
      text-align: center;
      margin-bottom: 20px;
    }

    .button {
      display: inline-block;
      background-color: #FF0000;
      color: white;
      padding: 8px 16px;
      text-decoration: none;
      border-radius: 5px;
      font-size: 14px;
      border: none;
      transition: background-color 0.3s;
      margin-top: -10px;
    }

    .button:hover {
      background-color: #990000;
    }

    .button:focus {
      outline: none;
      background-color: #660000;
    }

    .welcome-text {
      font-family: Arial, sans-serif;
      font-weight: bold;
      font-size: 18px;
      color: black;
      text-align: left;
      margin-left: 20px;
    }

    .welcome-text span {
      font-style: italic;
    }

    .input-container {
      display: flex;
      margin-top: 10px;
      /* Espacio entre los rectángulos y el texto anterior */
    }

    .input-container input,
    .input-container select {
      flex: 1;
      padding: 10px;
      border: none;
      background-color: #f2f2f2;
      /* Color gris claro */
      margin-right: 10px;
      /* Espacio entre los rectángulos */
    }

    .checkbox-container {
      display: flex;
      align-items: center;
      margin-top: 10px;
      /* Espacio entre los cuadritos y el texto anterior */
    }

    .checkbox-container input[type="checkbox"] {
      margin-right: 10px;
      /* Espacio entre el cuadrito y el texto */
    }

    .checkbox-container label {
      color: blue;
    }

    .create-account-button {
      text-align: left;
      margin-top: 20px;
      /* Espacio entre el botón y la pregunta */
    }

    .create-account-button button {
      display: inline-block;
      background-color: blue;
      color: white;
      padding: 10px 20px;
      text-decoration: none;
      border-radius: 5px;
      font-size: 16px;
      border: none;
      transition: background-color 0.3s;
    }

    .create-account-button button:hover {
      background-color: #001f66;
    }

    .create-account-button button:focus {
      outline: none;
      background-color: #000b33;
    }

    .form-container {
      float: left;
      width: 50%;
      padding-right: 20px;
    }

    .image-container {
      float: right;
      width: 50%;
      text-align: right;
    }

    .image-container img {
      max-width: 200px;
    }

    .centered-button {
      text-align: center;
    }
  </style>
</head>
<body>
  <section>
    <div class="header">
      <img src="../imgs/logoRegistro.jpg" alt="logo">
      <h1 style="color: black;">REGISTRAR USUARIO</h1>
    </div>

    <div class="container">
      <div class="button-container centered-button">
        <a href="inicio.html" class="button">Regresar INICIO</a>
      </div>

      <div class="button-container">
        <p class="welcome-text" style="margin-left: 20px;">BIENVENIDO A: <span>ENTRADAS YA</span></p>
      </div>

      <div class="form-container">
        <div class="input-container">
          <input type="text" placeholder="NOMBRES">
          <input type="text" placeholder="APELLIDOS">
        </div>

        <div class="input-container">
          <input type="text" placeholder="CORREO ELECTRÓNICO">
        </div>

        <div class="input-container">
          <input type="password" placeholder="CONTRASEÑA">
        </div>

        <div class="input-container">
          <input type="password" placeholder="REPETIR CONTRASEÑA">
        </div>

        <div class="input-container">
          <select>
            <option value="PERÚ" selected>PERÚ</option>
          </select>
          <select>
            <option value="CIUDAD" selected>CIUDAD</option>
          </select>
        </div>

        <div class="input-container">
          <select>
            <option value="">GÉNERO</option>
            <option value="masculino">Masculino</option>
            <option value="femenino">Femenino</option>
            <option value="otro">Otro</option>
          </select>
        </div>

        <div class="checkbox-container">
          <input type="checkbox" id="terms-checkbox">
          <label for="terms-checkbox">HE LEÍDO LOS TÉRMINOS Y CONDICIONES</label>
        </div>

        <div class="checkbox-container">
          <input type="checkbox" id="info-checkbox">
          <label for="info-checkbox">¿USTED DESEA QUE ENTRADAS YA ENVÍE INFORMACIÓN DE EVENTOS?</label>
        </div>

        <div class="create-account-button">
          <button>Crear Cuenta</button>
        </div>
      </div>
    </div>
  </section>

<section>
  <img src="../imgs/RegistrarUsuarioImg.jpg" alt="Imagen">
</section>
    <%@include file="../comun/footer.jsp" %>
</body>
</html>
