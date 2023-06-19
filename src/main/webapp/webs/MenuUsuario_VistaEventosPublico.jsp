<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="Models.UsuarioDTO"%>
<%@page import="Models.EventoDTO"%>
<%@page import="Models.CategoriaDTO"%>
<%@page import="Models.AsistenteDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.DAOFactory"%>
<%@page import="Models.OrganizadorDTO"%>
<%@page import="java.io.InputStream" %>


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
    
    .container-1{
    
		flex-direction: row;

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
        font-size:1.5rem;
        margin-bottom: 10px;
        text-align: center;
    }

    .event-info {
        margin-bottom: 5px;
        text-align: left;
    }

	.event-info span{
	
		color: black;
		font-weight: bolder;
	
	
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
    
    .event-flex-detalles{
    
    	display: flex;
    	flex-direction: column;
    	gap:20px;
    	padding: 5px;
    	margin:0 10px; 
    }

    .flex-container {
        display: flex;
        justify-content: center;
        width: 80%;
        
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

/*Por mientras deberia llamar desde Asistente dto*/

AsistenteDTO asis = (AsistenteDTO) request.getAttribute("asistente");

int idorg =asis.getIdAsistente();

//Creacion de datos del evento y usuario

DAOFactory fabrica = DAOFactory.getDaoFactory(DAOFactory.MySQL);
EventoDTO evento = fabrica.getEventoDAO().buscarEvento(asis.getIdEvento());

UsuarioDTO user = fabrica.getUsuarioDAO().buscarUsuario(asis.getIdUsuario());


String msg = (String) request.getAttribute("mensaje");
if (msg==null) msg="";
%>
<%=msg %>

<%@include file="../comun/header_Salir.jsp" %>


<div class="event-container container-1" style="width: 80%; max-width: 1500px; height: 500px;">
    <div class="event-details" style="display: flex; align-self: flex-start; width:70%;height: 100%; ">
        <div class="event-image" style="margin-top: 10px; width: 100%; height: 100%;">
        
			<%
			DAOFactory fabric = DAOFactory.getDaoFactory(DAOFactory.MySQL);

			
            InputStream imagenInputStream = evento.getImagenEvento(); // Obtener el InputStream de la imagen del objeto EventoDTO
            
            String imagenBase64 = fabric.getEventoDAO().ConvertirIMG(imagenInputStream);

				
			
			%>        
            <img src="<%=imagenBase64 %>" alt="ima" width="100%"  height="100%" >
        </div>
    </div>
    <div class="event-details" style="text-align: center;width:30% ;align-self: center;font-size: 1.2em; ">
    
    	<div class="event-flex-detalles" style="">
		    <p class="event-name"><%=evento.getNombreEvento() %></p>
		    <p class="event-info">Fecha de Inicio: <span> <%=evento.getFechaIncio() %></span></p>
		    <p class="event-info">Fecha Fin: <span> <%=evento.getFechaFin() %></span></p>
		    
		    <% 
		    CategoriaDTO categoria = fabric.getCategoriaDAO().buscarCategoria(evento.getIdCategoria());
		    
		    %>
		    <p class="event-info">Categoría: <span> <%=categoria.getNombreCategoria() %></span></p>
    	</div>
    	<br />	
    	<form action="asistente" method="post" >
    	
    		<div >
    		
	    		<input type="text" name="idUser" value="<%=user.getIdUsuario()%>">
	    		<input type="text" name="cod" value="<%=idorg%>">
	    		<input type="text" name="idEvento" value="<%=evento.getIdEvento()%>">

    		</div>
    		
    		<% %>
			<button type="submit" class="event-button event-button-centered" name="opcion" value="reg" >Asistiré!</button>
    	</form>
    	
       	
       	<a style="text-decoration: none;" class="event-button event-button-centered" href="webs/MenuUsuario_Menu.jsp" >Regresar A Menu Principal</a>
	    
    
	</div>
    </div>
<div style="display: flex; justify-content: center; width: 100%;">
    <div class="flex-container">
        <div class="event-container" style="width: 25%; max-width: 400px;  margin-right: 20px;">
            <div class="event-details" style="text-align: center;">
                <p class="event-name">Ubicación</p>
                <div class="event-image" style="margin-top: 10px; width: 100%; height: 90%;">
                    <img src="imgs/mapa_ubicacion.png" alt="Mapa" style="width: 100%; height: 100%;">
                </div>
            </div>
        </div>
        <div class="event-container" style="width: 75%; max-width: none;">
            <p class="event-name">Descripción del Evento</p>
			<p><%=evento.getDescripcionEvento() %></p>
            <p>Creador del Evento</p>
            <p style="color: black;font-size: 1.2rem"><%=user.getNombreUsu()+""+ user.getApellidoUsu() %></p>
            <p style="color: gray;font-size: 0.8rem"><%=user.getCorreoUsu() %></p>
            <img src="imgs/user_MenuUsuario.png" alt="usMen" style="width: 50px; height: 50px;">
        </div>
    </div>
</div>


    <div class="event-container" style="width: 60%; max-width: none; height: 400px; margin-top: 20px; width: 80%;">
        <div>
            <p style="font-weight: bold; font-size: 1.2em; margin-bottom: 10px; text-align: left;">1 comentario</p>
            <div style="display: flex; align-items: center; justify-content: flex-end;">
                <img src="imgs/user_MenuUsuario.png" alt="usMen" style="width: 40px; height: 40px;">
                <input type="text" placeholder="Escribe un comentario largo" style="margin-left: 10px; width: 400px; border: 1px solid gray; padding: 5px;">
                <button style="background-color: gray; color: white; padding: 5px 10px; font-size: 1em; border: none;">Enviar</button>
            </div>
            <div style="background-color: darkgray; padding: 10px; margin-top: 10px;">
                <img src="imgs/womanComentary_MenuUsuario.png" alt="Logo" style="width: 40px; height: 40px; margin-right: 10px;">
                <span style="font-size: 1em;">@User12355</span>
                <p style="font-size: 0.9em; margin-top: 10px;">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
            </div>
        </div>
    </div>
</body>
</html>
