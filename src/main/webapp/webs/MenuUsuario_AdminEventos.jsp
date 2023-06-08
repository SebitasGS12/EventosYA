<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Menu Usuario </title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Lexend&display=swap');
    *{
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        font-family: 'Lexend', sans-serif;
    }


    #itemAdminEventos{
    	background-color: rgb(158, 158, 158);
        color: #262525;
    }

    .aside-item-active {
      background-color: rgb(158, 158, 158);
      color: #262525;
    }

    /* Estilo: AdminEvento */

    .organize-section {
      background-color: #00B4CC;
      margin-left: 20%;
      padding: 20px;
      color: white;
    }

    .organize-section h2 {
      color: white;
    }

    .create-event {
      display: flex;
      justify-content: flex-start;
      padding: 20px;
    }

    .create-event button {
      background-color: #00B4CC;
      color: white;
      border: none;
      border-radius: 5px;
      padding: 10px 20px;
    }

    .registration-section {
      background-color: white;
      margin-left: 20%;
      padding: 20px;
    }

    .registration-header {
      display: flex;
      align-items: center;
    }

    .registration-header img {
      width: 50px;
      height: 50px;
      margin-right: 10px;
    }

    .registration-header h3 {
      margin: 0;
    }

    .event-list-section {
      background-color: #00B4CC;
      color: white;
      margin-left: 20%;
      padding: 20px;
    }

    .event-list-section h3 {
      margin: 0;
    }

    .event-list {
      list-style: none;
      padding: 0;
    }

    .event-list li {
      display: flex;
      align-items: center;
    }

    .event-list li span {
      margin-right: 5px;
    }

    .event-list li button {
      background-color: #00B4CC;
      color: white;
      border: none;
      border-radius: 5px;
      padding: 5px 10px;
      margin-left: 10px;
    }
  </style>
</head>
<body>

	<%@include file="../comun/header_Salir.jsp" %>


	<%@include file="../comun/aside.html" %>

    <main>


    <section class="organize-section">
      <h2>Organizar Evento</h2>
      <div class="create-event">
        <button>Crear Evento</button>
      </div>
    </section>

    <section class="registration-section">
      <div class="registration-header">
        <img src="ruta-de-la-imagen" alt="Icono">
        <h3>Registros</h3>
      </div>
      <p>Número de registros: <span id="numero-registros">0</span></p>
      <p>Número de registros en la base de datos: <span id="numero-registros-bd">0</span></p>
    </section>

    <section class="event-list-section">
      <h3>Lista de Eventos</h3>
      <ul class="event-list">
        <li>
          <span>Evento 1</span>
          <button>Editar</button>
          <button>Eliminar</button>
        </li>
        <li>
          <span>Evento 2</span>
          <button>Editar</button>
          <button>Eliminar</button>
        </li>
      </ul>
    </section>
  </main>
</body>
</html>
