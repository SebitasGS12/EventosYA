<%@page import="java.util.ArrayList"%>
<%@page import="Models.EventoDTO"%>

<%@page import="DAO.DAOFactory"%>


<%@page import="Models.UsuarioDTO"%>
<%@page import="Models.OrganizadorDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Editar Evento</title>
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
            width: 75%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
              background-color: #f3f3f3;
              font-size: 1.5em;
        }

        .pag-subtitle-container {
            display: flex;
            align-items: center;
            justify-content: start;
            margin-bottom: 10px;
            background-color: #3d4cd2;
            padding: 20px;
            width: 100%;
                        font-family: 'Lexend';
        }

        .pag-subtitle {
            font-size: 2em;
            color: white;

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


 		.styled {
		    border: 0;
		    height: 50%;
		    padding: 0 30px;
		    font-size: 1rem;
		    text-align: center;
		    display:flex;
		    align-items: center;
		    color: #fff;
		    border-radius: 30px;
		    background-color: #5b72ef;
		    background-image: linear-gradient(to top left, rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2) 50%, rgba(0, 0, 0, 0));
		    box-shadow: inset 2px 2px 3px rgba(255, 255, 255, 0.6), inset -2px -2px 3px rgba(0, 0, 0, 0.6);
		}
		
		 .styled:hover {
			cursor: pointer;
		background-image:none;
		box-shadow:none;


		}

		footer, input, textarea {
		    background: #fff;
		    border: none;
		    -webkit-box-shadow: 0px 1px 4px 2px rgba(0,0,0,0.16);
		    -moz-box-shadow: 0px 1px 4px 2px rgba(0,0,0,0.16);
		    box-shadow: 0px 1px 4px 2px rgba(0,0,0,0.16);
		    border-radius: 15px;
		    display: inline-block;
		} 
		footer button.btn {
		    display: flex;
		    justify-self: flex-end;
		    padding-left: 20px;
		    padding-right: 20px;
		    border-radius: 15px;    
		}
		.NombreEdi{

			font-family: 'Lexend';
			font-style: normal;
			font-weight: 400;
			font-size: 32px;
			line-height: 20px;
			/* identical to box height */
			text-align: start;
			color: #000000;
			width: 100%;
			margin-bottom: 15px;
		}
		
		
		.contenido{
			display: flex;
			width: 100%;
			flex-direction: column;
			padding: 5px;
			align-items: center;
			
		}
		
		
		.item{
			width: 95%;
			margin:10px 0;
			display:flex;
			flex-direction: row;
			gap:5px;
			flex-wrap: wrap;
		}
		
		
		.item .Detalles{
			width:70%;
			background-color: white;
			text-align:left;
			padding:5px;
			border-radius:10px ;
		
		}
		
		
    </style>

</head>
<body>
<% 


	
	
ArrayList<EventoDTO> listaEventos = (ArrayList<EventoDTO>) request.getAttribute("listaDeEventosDelUsuario");
	


String msg = (String) request.getAttribute("mensaje");
if (msg==null) msg="";	
%>
<%=msg %>
	<%@include file="../comun/header_Salir.jsp" %>
	<div class="pag-container">
		<%@include file="../comun/aside.html" %>
	    <div class="pag-main">
	        <div class="pag-subtitle-container">
	            <h2 class="pag-subtitle">Editar Evento</h2>
	        </div>
	        <div class="contenido" style="text-align: center; font-size: 1rem;">
	        	<%
	        	
				if (listaEventos != null) {
					
					for (EventoDTO e : listaEventos) {					
				%>
						        
		        <div class="elemento1 item">
			        <h2 class="NombreEdi"><%=e.getNombreEvento() %></h2>
		            <div class="Detalles" name="Detalles" id="Area">
						<p>Descripcion de Evento : <%=e.getDescripcionEvento()%> </p>		            
						<p>Ubicacion : <%=e.getUbicacionEvento() %></p>		            
						<p>Desde: <%=e.getFechaIncio() %>  Hasta : <%=e.getFechaFin() %></p>		            
		            	<p>Categoria: <%=e.getIdCategoria() %> </p>
		            </div>
					<a class="styled button" href="${pageContext.request.contextPath}/evento?opcion=bus&cod=<%=e.getIdEvento() %>">Editar</a>
		       		<a class="styled button" href="${pageContext.request.contextPath}/evento?opcion=eli&cod=<%=e.getIdEvento() %>">Eliminar</a>
	       		</div>
				<hr style="width: 90%;text-align: center; height: 1px;"  />
				
				<%
					}
				}
	        	%>
	        	
	        

	       	
			</div>
 		</div>
    </div>
    <%@include file="../comun/footer.jsp" %>
</body>
</html>