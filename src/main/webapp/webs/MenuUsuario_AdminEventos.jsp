
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="DAO.DAOFactory"%>
<%@page import="Models.EventoDTO"%>
<%@page import="Models.UsuarioDTO"%>
<%@page import="Models.OrganizadorDTO"%>
<%@page import="java.util.ArrayList"%>

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

    .contenido{
    
    	display: flex;
    	width: 100%;

    }
    
    .container-main{
    	width: 80vw;
    	display: flex;
    	flex-direction:column;
    	align-items: center;
    	
    	height:auto;
    	
    }
    
    .section{
    	width: 100%;
    	height: 100%;
    }
    
    .organize-section {
      background-color: #3D4CD2;
      padding: 20px;
      color: white;
	  text-align: left;      
      height: 30% !important;
    }

    .organize-section h2 {
      color: white;
    }

    .create-event {
      display: flex;
      justify-content: flex-end;
      padding: 10px;
    }

    .create-event a {
      background-color: #5B72EF;
      color: white;
      border: none;
      border-radius: 5px;
      padding: 10px 20px;
      text-decoration: none;
    }
	.create-event a:hover {
       	cursor: pointer;   
       	opacity: .4;
       	transition:.4s all;
    }
    
    

    .registration-section {
      background-color: white;
      padding: 20px;
      height: 60% !important;
    }

    .registration-header {
      display: flex;
      justify-content: space-around;
      margin-bottom:20px; 
    }

    .registration-header img {
      width: 100px;

    }

    .registration-header p {
      font-size: 1.2em;

    }
    
    .registration-header span{
          font-size: 2em;
          font-weight: bold;
          text-align: right;
    	
    }

    .event-list-section {
		color:white;
    }


    .event-list-header{
       background-color: #3D4CD2;
       display: flex;
       justify-content: space-between;
       gap:10px;
       padding: 5px 20px;
       align-items: center;
    }
     .event-list-header a {
      background-color: #5B72EF;
      color: white;
      border: none;
      border-radius: 5px;
      padding: 10px 20px;
    }
	.event-list-header a:hover {
       	cursor: pointer;   
       	opacity: .4;
       	transition:.4s all;
    }
    

    .event-list {
      list-style: none;
      padding: 0;
      background-color: white;
      color:black;
      width: 100%;
      margin-top: 10px;
      font-size: 1.1em;
    }
    
    #table{
    	color:black;
    
    }
    


  </style>
</head>
<body>
<% String msg = (String) request.getAttribute("mensaje");
UsuarioDTO user = (UsuarioDTO) request.getSession().getAttribute("datousu");

//aca es en general , pero solo debe de contar los eventos creados llamados desde la tabla Organizador
DAOFactory fabric = DAOFactory.getDaoFactory(DAOFactory.MySQL);

ArrayList<OrganizadorDTO> listaOrganizador = fabric.getOrganizadorDAO().listarOrganizadorPorUsuario(user.getIdUsuario());

request.getSession().setAttribute("listaOrganizador", listaOrganizador);

int can = listaOrganizador.size();


if (msg==null) msg="";
%>
<%=msg %>

	<%@include file="../comun/header_Salir.jsp" %>

	<div class="contenido">
	
		<%@include file="../comun/aside.html" %> 
		<main class="container-main">
	
	
	    <div class="organize-section section">
	      <h2>Organizar Evento</h2>
	      <br>
	      <p>En esta sección puede ver la lista de eventos registrados en la base de datos</p>

	    </div>
	
	    <div class="registration-section section">
	      <div class="create-event">
	       <a href="${pageContext.request.contextPath}/evento?opcion=irReg">Crear Evento</a>
	      </div>
	      
	      <div class="registration-header">
	        <img src="${pageContext.request.contextPath}/imgs/perfil.png" alt="Icono">
		    <p>Número de registros: <br> <span id="numero-registros"><%= can %> </span></p>
	      </div>
	      <hr>
	      <br />
	      <p>Número de eventos registrados actualmente en la base de datos</p>
	    
	    
	    </div>
	
	    <div class="event-list-section section">
    		<div class="event-list-header">
	      		<h3>Lista de Eventos</h3>
    			<a href="${pageContext.request.contextPath}/evento?opcion=lis&url=ver">Ver Evento</a>
    		</div>
			<table id="table" class="event-list" style="border: 1px solid black;">
				<thead style="background-color: #333; color: white;">
					<tr>
						<th style="padding: 10px; border: 1px solid black;">Id</th>
						<th style="padding: 10px; border: 1px solid black;">Nombre</th>
						<th style="padding: 10px; border: 1px solid black;">Exportar PDF</th>
					</tr>
				</thead>
				<tbody>
					<%
					if (listaOrganizador != null) {
						for (OrganizadorDTO o : listaOrganizador) {
							EventoDTO eve = fabric.getEventoDAO().buscarEvento(o.getIdEvento());
					%>
			
					<tr>
						<td style="padding: 10px; border: 1px solid black;"><%= eve.getIdEvento() %></td>
						<td style="padding: 10px; border: 1px solid black;"><%= eve.getNombreEvento() %></td>
						<td style="padding: 10px; border: 1px solid black;"><a href="evento?opcion=exportar&id=<%=o.getIdOrganizador()%>" target="_blank">Exportar PDF</a></td>
					</tr>
			
					<%
						}
					}
					%>
				</tbody>
			</table>

	    </div>
	  </main>

	
	
	</div>

</body>
</html>
