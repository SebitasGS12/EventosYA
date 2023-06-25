
<style>
	@import url('https://fonts.googleapis.com/css2?family=Lexend&display=swap');
    *{
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        font-family: 'Lexend', sans-serif;

	}

    
    .header {
      background-color: #343838;
      padding: 20px;
      width: 100%;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    
    .header a{
    
    	color:white;
    	text-decoration: none;
    
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
    
    .header ul {
      list-style-type: none;
      margin: 0;
      padding: 0;
      display: flex;
    }
    
    .header li {
      margin: 0 10px;
    }
    
    .header  li a {
      text-decoration: none;
      color: #fff;
      transition: opacity 0.3s;
    }
    
    .header  li a:hover {
      opacity: 0.7;
    }
    
	.header .inicio-sesion {
      background-color: #00a9e0;
      padding: 10px;
      color: white;
      text-decoration: none;
      transition: opacity 0.3s;
    }
    
    
    .header	.inicio-sesion:hover {
      opacity: 0.7;
    }
    ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover:not(.active) {
    background-color: #111;
}

.active {
    background-color: #4CAF50;
}
li {
    border-right: 1px solid #bbb;
}

li:last-child {
    border-right: none;
}
</style>
<div class="header">
    <h1>
      <img src="${pageContext.request.contextPath}/imgs/logo.jpg" alt="logo">
      <a href="Menu_inicio.jsp">EventosYa</a>
    </h1>
    <ul>
      <li><a href="${pageContext.request.contextPath}/comun/extras/comunidad.html" style="color: white;">Comunidad</a></li>
      <li><a href="${pageContext.request.contextPath}/comun/extras/acercade.html" style="color: white;">Acerca de</a></li>
      <li><a href="${pageContext.request.contextPath}/comun/extras/contacto.html" style="color: white;">Contacto</a></li>
      <li><a href="${pageContext.request.contextPath}/webs/Menu_IniciarSesion.jsp" class="inicio-sesion">Iniciar Sesión</a></li>
    </ul>
  </div>

