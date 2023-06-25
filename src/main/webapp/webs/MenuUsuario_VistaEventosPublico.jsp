<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="Models.UsuarioDTO"%>
<%@page import="Models.EventoDTO"%>
<%@page import="Models.CategoriaDTO"%>
<%@page import="Models.AsistenteDTO"%>
<%@page import="Models.ComentarioDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.DAOFactory"%>
<%@page import="DAO.AsistenteDAO"%>
<%@page import="jakarta.servlet.ServletContext"%>
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
        padding: 10px;
        border: 1px solid #ccc;
        width: 80%;
        margin: 20px auto; /* Alineación al centro */
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
        position: relative;
  		display: inline-block;
        font-size: 0.8em;
        align-self: center;
        margin-top: 10px;
    }
    
    .event-button .ayuda {
	  visibility: hidden;
	  width: 120px;
	  background-color: #333;
	  color: #fff;
	  text-align: center;
	  border-radius: 6px;
	  padding: 5px;
	  position: absolute;
	  z-index: 1;
	  bottom: 125%;
	  left: 50%;
	  transform: translateX(-50%);
	  /* Otros estilos para el tooltip */
	}
	
	.event-button:hover .ayuda {
  		visibility: visible;
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
    
    .imagenPerfil,.imagenComentario{
    	border:1px solid black;
    }
    
    .red{
    	background-color: red;
    }
    .green{
    	
    	background-color: green;
    }
    
	.btn-comentario{
		font-size: .7em;
		color: gray;
				transition : .5s all; 
		
	}
	
	.btn-comentario:hover{
		cursor: pointer;
		color: blue;	
		font-size: .9em;
		transition : .5s all; 
	
	}
	
	.container-btn-comentario{
		display: flex;
		margin-top: 10px;
		gap:5px;
	}    
    
</style>
</head>
<body>
<%



OrganizadorDTO datosEvento = (OrganizadorDTO) request.getAttribute("organizador");
int idUsuarioPersona = (int) request.getAttribute("usuario");
int idOrganizador = datosEvento.getIdOrganizador();

//Creacion de datos del evento y usuario

DAOFactory fabrica = DAOFactory.getDaoFactory(DAOFactory.MySQL);

EventoDTO eventoOrganizador = fabrica.getEventoDAO().buscarEvento(datosEvento.getIdEvento());

UsuarioDTO userOrganizador = fabrica.getUsuarioDAO().buscarUsuario(datosEvento.getIdUsuario());





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

			
            InputStream imagenInputStream = eventoOrganizador.getImagenEvento(); // Obtener el InputStream de la imagen del objeto EventoDTO
            
            String imagenBase64 = fabric.getEventoDAO().ConvertirIMG(imagenInputStream);

				
			
			%>        
            <img src="<%=imagenBase64 %>" alt="ima" width="100%"  height="100%" >
        </div>
    </div>
    <div class="event-details" style="text-align: center;width:30% ;align-self: center;font-size: 1.2em; ">
    
    	<div class="event-flex-detalles" style="">
		    <p class="event-name"><%=eventoOrganizador.getNombreEvento() %></p>
		    <p class="event-info">Fecha de Inicio: <span> <%=eventoOrganizador.getFechaIncio() %></span></p>
		    <p class="event-info">Fecha Fin: <span> <%=eventoOrganizador.getFechaFin() %></span></p>
		    
		    <% 
		    CategoriaDTO categoria = fabric.getCategoriaDAO().buscarCategoria(eventoOrganizador.getIdCategoria());
		    
		    %>
		    <p class="event-info">Categoría: <span> <%=categoria.getNombreCategoria() %></span></p>
    	</div>
    	<br />	
    	<form action="asistente" method="post" >
    		
    		<div style="display: none" >
    		
	    		<input type="text" name="org" value="<%=idOrganizador%>">
	    		<input type="text" name="idPersona" value="<%=idUsuarioPersona%>">
	    		<input type="text" name="idEvento" value="<%=eventoOrganizador.getIdEvento()%>">

    		</div>
    		<div class="form-buttons" >
    		<%
    			AsistenteDAO AsisDAO = fabric.getAsistenteDAO();
    			if( AsisDAO.validarAsistencia(idUsuarioPersona, eventoOrganizador.getIdEvento()) == null){%>
    				
    				<!-- Asistencia no existe   -->		
					<button type="submit" class="event-button event-button-centered green" name="opcion" value="reg" >Asistiré! <span class="ayuda">No estas Asistiendo</span> </button>
    			<%}else{%>
    				
    				<!-- Asistencia existe   -->		
					<button type="submit" class="event-button event-button-centered red" name="opcion" value="del" >Cancelar Asistencia <span class="ayuda">Ya estas Asistiendo</span></button>
    			<%}
    		%>
    		</div>
    	</form>
    	<br />
       	
       	<a style="text-decoration: none; margin-top: 10px;" class="event-button event-button-centered" href="usuario?opcion=link&val=irMenu" >Regresar A Menu Principal</a>
	    
    
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
			<p><%=eventoOrganizador.getDescripcionEvento() %></p>
            <p>Creador del Evento</p>
            <p style="color: black;font-size: 1.2rem"><%=userOrganizador.getNombreUsu()+""+ userOrganizador.getApellidoUsu() %></p>
            <p style="color: gray;font-size: 0.8rem"><%=userOrganizador.getCorreoUsu() %></p>
            
            <%
            

			UsuarioDTO usuarioPersona = fabric.getUsuarioDAO().buscarUsuario(idUsuarioPersona);
            
            InputStream imagenUsuario = usuarioPersona.getImagenUsuario(); // Obtener el InputStream de la imagen del objeto EventoDTO
            
            String imagenPerfil = fabric.getUsuarioDAO().ConvertirIMG(imagenUsuario);

				
			
			%>        
            <img src="<%=imagenPerfil %>" alt="usMen" class="imagenPerfil" style="width: 50px; height: 50px;">
        </div>
    </div>
</div>


    <div class="event-container event-container-2">
        <div style="margin: 0 auto; width: 80%;">
        	<%    ArrayList<ComentarioDTO> listaComentarios =  fabric.getComentarioDAO().listarComentarioPorEvento(datosEvento.getIdEvento());%>
        
            <p style="font-weight: bold; font-size: 1.2em; margin-bottom: 10px; text-align: left;"><%=listaComentarios.size() %> comentario(s)</p>
           
            
            <div style="display: flex; align-items: center; justify-content:center ;">
            
                <img src="<%=imagenPerfil %>" alt="usMen" class="imagenPerfil" style="width: 40px; height: 40px;">
                
                <form action="comentario" method="post">                
                	
                	<div class="" style="display: none;">
                		    		<input type="text" name="org" value="<%=idOrganizador%>">
                	
              	    		<input type="text" name="idPersona" value="<%=idUsuarioPersona%>">
	    					<input type="text" name="idEvento" value="<%=eventoOrganizador.getIdEvento()%>">	
                	</div>
                
                
	                <input type="text" name="txtComentario" value=" " placeholder="Escribe un comentario largo" style="margin-left: 10px; width: 400px; border: 1px solid gray; padding: 5px;">
	                <button type="submit" name="opcion" value="reg"  style="background-color: gray; color: white; padding: 5px 10px; font-size: 1em; border: none;">Enviar</button>
                </form>
            </div>
            
            
            <%
            
            
            if(listaComentarios.size() == 0){%>
            	<br /><p align='center'> Este evento no tiene Comentarios</p>
            <%
            }else{
            	for(ComentarioDTO comentario : listaComentarios){
            		
            		
            		
					UsuarioDTO userComent = fabric.getUsuarioDAO().buscarUsuario(comentario.getIdUsuario());
					
                    InputStream imagenComentarioUsu = userComent.getImagenUsuario(); 	
                    String imagenComentario = fabric.getUsuarioDAO().ConvertirIMG(imagenComentarioUsu);

           		%>
	            <div style="background-color:#cdcdcd; padding: 10px; margin-top: 10px; width: 90%;">
	            	<div class="" style="display: flex">
    		            <img src="<%=imagenComentario %>" alt="Logo" style="width: 40px; height: 40px; margin-right: 10px;">
		                <span style="font-size: 1.2em;"><%=userComent.getNombreUsu() + " "+ userComent.getApellidoUsu() %></span>
	            	</div>
                	<p id="pContenido" style="font-size: 1em; margin-top: 10px;"><%=comentario.getContenido() %></p>
                	<textarea id="pTextEditable"rows="" cols="" style="width: 90%;height: 70px;display: inline-block;" id="pEdit"><%=comentario.getContenido() %></textarea>
	            	<div class="container-btn-comentario" >
	                	<p style="font-size: .6em;"><%=comentario.getFechaHora() %></p>
                		
                		<a class="btn-comentario" id="editMostrar" >Editar</a>
                		<a class="btn-comentario" style="display: none;" id="editEnviar" >Editar Comentario</a>
                		<a class="btn-comentario"   >Eliminar</a>	
                	</div>
            	</div>
           		
           		
           		<%
            		
            	}
            }
            
            %>

            
            
            
        </div>
    </div>
</body>
<script src="${pageContext.request.contextPath}/comun/procesosComentarioEstilo.js"></script>
</html>
