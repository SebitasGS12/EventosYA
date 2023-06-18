<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="Models.EventoDTO" %>
<%@page import="Models.CategoriaDTO" %>
<%@page import="DAO.DAOFactory" %>
<%@page import="DAO.CategoriaDAO" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.InputStream" %>

<%@page import="java.text.DateFormat"%><%DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>

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

        .form-input {
            width: 300px;
            height: 30px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 5px;
        }

        .form-input-transparent {
            width: 90%;
            height: 30px;
            margin-bottom: 15px;
            border: none;
            border-bottom: 1px solid #ccc;
            padding: 5px;
            background-color: transparent;
        }
        
        input[type="text"]:focus{
        	color:blue;
        	outline:none;
        	font-size:1.1rem;
        	transition:.4s all;
        }
        
		input[type="text"]:not(:focus){
        	color:gray;
        	font-size:16px;
        	transition:.3s all;
        }
	
        .form-input-description {
            width:  95%;
  			height: 280px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 5px;
        }

        .form-input-grayed {
            width: 100px;
            height: 30px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 5px;
            color: gray;
        }

        .add-image-button {
			position: absolute;
			width: 353px;
			height: 174px;
			left: 1px;
			top: 250px;
			background: #DADADA;
			border-radius: 30px;
        }

        .action-buttons {
            display: flex;
            justify-content: space-around;
            align-items:center;
            gap:20px;
            margin: 20px;
        }

        .action-buttons button {
            background-color: #3d4cd2;
            
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px;
            cursor: pointer;
        } 

 		.form-head{
 			width: 100%;
 		}
 	
	 	.formulario-contenido{
	 		display: flex;
	 		flex-direction: row;
	 		width: 100%;

	 	}
	 	
	 	.form-container1 ,.form-container2{
	 		display: flex;
	 		flex-direction: column;
	 		width: 45%;
	 		padding: 5px 10px;
	 		justify-content: center;
	 	}
	 	
	 	.form-container1 label{
	 	
	 		margin-top: 10px;
	 	}
	 	
	 	.form-control{
	 	
	 		width: 50%;
	 		
	 		outline: none;
	 		border:none;
	 		padding: 2px;
	 	
	 	}
	 	
	 	.item-fecha{
	 		display: flex;
	 		flex-direction: row;
	 		gap: 10px;
	 		justify-content: space-around;
	 		margin:5px;
	 		
	 	}
	 	
	 	.flayer{
			display: none;
			
        }
        #preview{
        	margin: auto 5px;

        	
        }
        
        #preview:hover{
        	cursor: pointer;
        
        }
        #preview img{
        	
        	 height: 280px;
        	 width: 90% !important;
        	 margin-top:5px;
        	border: 2.5px #0911D4 solid;
        	border-radius:5px ;

        }
	 	
	 	.img-item{
	 		margin-top:20px;
	 	}
	 	
    </style>

</head>
<body>
<% String msg = (String) request.getAttribute("mensaje");
if (msg==null) msg="";
	
EventoDTO evento = (EventoDTO) request.getAttribute("evento");


%>
<%=msg %>

	<%@include file="../comun/header_Salir.jsp" %>

	<div class="pag-container">
		<%@include file="../comun/aside.html" %>

	    <div class="pag-main">
	        <div class="pag-subtitle-container">
	            <h2 class="pag-subtitle">Editar Evento</h2>
	        </div>
	        
	        <form action="" method="Post" class="form-head">
	        
	        
	        	<div class="formulario-contenido">
	        		<div class="form-container1">
			            <label for="name" class="label-nombre">Nombre:</label>
			            <input type="text" id="name" class="form-input-transparent" placeholder="Ingrese su nombre"  value="<%=evento.getNombreEvento()%>">
			            <label for="location">Ubicación:</label>
			            <input type="text" id="location" class="form-input-transparent" placeholder="Ingrese su ubicación" value="<%=evento.getUbicacionEvento()%>">
			            <textarea id="description" class="form-input-description" placeholder="Ingrese la descripción"><%=evento.getDescripcionEvento()%></textarea>
	       			</div>
	         	        
		     	   <div class="form-container2">
		     	   
		     	   
		            <label for="category">Categoría:</label>
		            <select type="text" id="category" class="form-input-transparent">
		            	 <%
		                 	 	 DAOFactory fabrica = DAOFactory.getDaoFactory(DAOFactory.MySQL);
		                 	 	 CategoriaDAO dao = fabrica.getCategoriaDAO();
		                 	 	 ArrayList<CategoriaDTO> lstCategorias = dao.listarCategoria();
		                 	 	 out.print("<option value='-1'>Seleccione...</option>");
		                 	 	 for(CategoriaDTO c:lstCategorias){
		                 	 		 String selected  ="";
		                 	 		if(c.getIdCategoria() == evento.getIdCategoria()){selected = "selected";}else{selected = " ";}
		                 	 		 out.print("<option "+ selected   +" value='"+ c.getIdCategoria()+ "'  >"+c.getNombreCategoria()+"</option>");
		                 	 	 }
		                 	  
		                 	 %>
		            
		            
		            </select>
					
					<div class="item-fecha">
						
						<label for="from">Desde:</label>
						<input type="date" class="form-control" value="<%=evento.getFechaIncio()  %>" min="<%= df.format(new java.util.Date())%>"  />
						 
					</div>
		           
					<div class="item-fecha">
						<label for="to">Hasta:</label>
						<input type="date" class="form-control" value="<%=evento.getFechaFin()  %>" min="<%= df.format(new java.util.Date())%>"/>
					
					</div>

		          	<div class="img-item">
   						<label for="file" class="label-nombre">Imagen de Evento</label>
   						<br />
						<input type="file"  accept="image/*" class= "flayer" name="txtImagen" id="file" alt="" >
						<%
						
		                    InputStream imagenInputStream = evento.getImagenEvento(); // Obtener el InputStream de la imagen del objeto EventoDTO
		                    
		                    String imagenBase64 = fabrica.getEventoDAO().ConvertirIMG(imagenInputStream);
			
						
						%>
						
						
						<label for="file" id="preview"><img  alt="" src="<%=imagenBase64%>"></label>			            
		            </div>
		        </div>

	        	</div>
				<div class="action-buttons">
					<button  type="submit" name="opcion" value="cancelEdit">Cancelar</button>
					<button type="submit"  name="opcion" value="Edit">Actualizar Evento</button>
				</div>
	        
	        </form>


	 
	    </div>
	    
	</div>
    <%@include file="../comun/footer.jsp" %>
      
</body>
<script src="${pageContext.request.contextPath}/comun/previsualizarImagen.js"></script>


</html>