<%@page import="java.util.ArrayList"%>
<%@page import="DAO.DAOFactory"%>
<%@page import="Models.EventoDTO"%>
<%@page import="java.io.InputStream" %>
<%@ page import="java.io.ByteArrayOutputStream" %>


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



    
    #itemMenu{
    	background-color: rgb(158, 158, 158);
        color: #262525;
    }
</style>

</head>
<body>
<% String msg = (String) request.getAttribute("mensaje");
if (msg==null) msg="";


	
%>
<%=msg %>
<!-- Usted se ha identificado como: <strong> ${datosusu.nombre} ${datosusu.apellido} </strong> 
 -->
	<%@include file="../comun/header_Salir.jsp" %>

	<div class="pag-container">

	<%@include file="../comun/aside.html" %>


	    <div class="pag-main">
	        <div class="pag-subtitle-container">
	            <h2 class="pag-subtitle">Buscar Evento</h2>
	        </div>
	        <div class="pag-search-container">
	            <input type="text" class="pag-search-input" placeholder="Buscar evento">
	            <button class="pag-search-button">&#128269;</button>
	        </div>
	        <div class="pag-event-container" id="contenedor-eventos">
	            <p> Aquí se mostrarán los eventos</p>
	            
	            <% DAOFactory fabric = DAOFactory.getDaoFactory(DAOFactory.MySQL);
	           	ArrayList<EventoDTO> listaEventos = fabric.getEventoDAO().listarEvento();
	           	if(listaEventos != null){
	           		for(EventoDTO p : listaEventos){
	           			
	                    InputStream imagenInputStream = p.getImagenEvento(); // Obtener el InputStream de la imagen del objeto EventoDTO
	                    
	                    // Leer los bytes de la imagen del InputStream
	                    ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
	                    byte[] buffer = new byte[4096];
	                    int bytesRead;
	                    while ((bytesRead = imagenInputStream.read(buffer)) != -1) {
	                        byteArrayOutputStream.write(buffer, 0, bytesRead);
	                    }
	                    byte[] imagenBytes = byteArrayOutputStream.toByteArray();
	                    
	                    // Convertir los bytes de la imagen a una cadena Base64
	                    String imagenBase64 = java.util.Base64.getEncoder().encodeToString(imagenBytes);
	                    
	                    // Cerrar el InputStream y el ByteArrayOutputStream
	                    imagenInputStream.close();
	                    byteArrayOutputStream.close();
	           	%>
				
    				<img src="data:image/jpeg;base64, <%= imagenBase64 %>" alt="Imagen del evento">

	           	<%
	           			
	           		}
	           		
	           	}%>	
	        </div>
	    </div>
	    
	</div>
    <%@include file="../comun/footer.jsp" %>
    
</body>
<script src="../comun/cargarEventosMenu.js"></script>
</html>
