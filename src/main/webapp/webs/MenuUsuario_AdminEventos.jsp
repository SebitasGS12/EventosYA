<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Menu Usuario</title>
  <style>
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

    .pag-aside {
      position: fixed;
      display: flex;
      flex-direction: column;
      background-color: rgb(255, 255, 255);
      width: 20%;
      height: 100vh;
      margin: 0;
    }

    .aside-item {
      display: flex;
      color: white;
      width: 100%;
      height: 33%;
      margin: auto;
      background-color: #262525;
      align-items: center;
      justify-content: space-evenly;
    }

    .aside-item:hover {
      background-color: grey;
      cursor: pointer;
      transition: 1s all;
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
  <header class="hd-pag">
    <img class="pag-img" src="https://cibertecedu-my.sharepoint.com/personal/i202124082_cibertec_edu_pe/Documents/CIBERTEC%20CICLO%204/Lenguaje%20de%20Programacion%20II/PF_LPI/ProyectoFinal_Workspace/EventosYa/src/main/webapp/imgs/logo.jpg" alt="">
    <h1 class="pag-h1">EventosYa</h1>
    <div class="pag-boton">
      <form action="" method="">
        <button type="submit">Salir</button>
      </form>
    </div>
  </header>

  <main>
    <section>
      <aside class="pag-aside">
        <div class="aside-item aside-item-active">
          <img src="https://cibertecedu-my.sharepoint.com/personal/i202124082_cibertec_edu_pe/Documents/CIBERTEC%20CICLO%204/Lenguaje%20de%20Programacion%20II/PF_LPI/libs/Imagenes_Repositorio/imgMenuIcon.png" alt="">
          <h2>Menu</h2>
        </div>
        <div class="aside-item">
          <img src="https://cibertecedu-my.sharepoint.com/personal/i202124082_cibertec_edu_pe/Documents/CIBERTEC%20CICLO%204/Lenguaje%20de%20Programacion%20II/PF_LPI/libs/Imagenes_Repositorio/imgAdmEvnIcon.png" alt="">
          <h2>Administrar<br>Eventos</h2>
        </div>
        <div class="aside-item">
          <img src="https://cibertecedu-my.sharepoint.com/personal/i202124082_cibertec_edu_pe/Documents/CIBERTEC%20CICLO%204/Lenguaje%20de%20Programacion%20II/PF_LPI/libs/Imagenes_Repositorio/imgConfigIcon.png" alt="">
          <h2>Configuracion<br>de Cuenta</h2>
        </div>
      </aside>
    </section>

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
