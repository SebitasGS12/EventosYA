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

        .form-input {
            width: 300px;
            height: 30px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 5px;
        }

        .form-input-transparent {
            width: 300px;
            height: 30px;
            margin-bottom: 10px;
            border: none;
            border-bottom: 1px solid #ccc;
            padding: 5px;
            background-color: transparent;
        }

        .form-input-description {
            width: 380px;
            height: 180px;
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
            justify-content: flex-start;
            margin-top: 120px;
        }

        .action-buttons button {
            margin-right: 10px;
            background-color: #3d4cd2;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px;
            cursor: pointer;
        } 
          .form-container1 {
margin:0 1000px 7px 7px; 
border-color:blue;
 float:left; 
 }
            .form-container2 {
position: absolute;
width: 326px;
height: 46px;
left: 1007px;
top: 190px;
background: #FFFFFF;
border-radius: 10px;
 }        
    </style>

</head>
<body>
<% String msg = (String) request.getAttribute("mensaje");
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
	        <div class="form-container1">
	            <label for="name">Nombre:</label>
	            <input type="text" id="name" class="form-input" placeholder="Ingrese su nombre">
	            <label for="location">Ubicación:</label>
	            <input type="text" id="location" class="form-input-transparent" placeholder="Ingrese su ubicación">
	            <textarea id="description" class="form-input-description" placeholder="Ingrese la descripción"></textarea>
	        </div>
	        
	        <div class="form-container2">
	            <label for="category">Categoría:</label>
	            <input type="text" id="category" class="form-input" placeholder="Ingrese la categoría">
	            <label for="from">Desde:</label>
	            <%@page import="java.text.DateFormat"%>
<%DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
<input type="date" class="form-control form-control-lg" id="fromBookingDate" path="fromBookingDate" placeholder="dd/MM/yyyy" min="<%= df.format(new java.util.Date())%>"/>
	            <label for="to">Hasta:</label>
	            <%@page import="java.text.DateFormat"%>
<%DateFormat d = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
<input type="date" class="form-control form-control-lg" id="fromBookingDate" path="fromBookingDate" placeholder="dd/MM/yyyy" min="<%= df.format(new java.util.Date())%>"/>
<form method="post" action="" enctype="multipart/form-data">
	           
	         </form>
	          <table>
	            <tr><td><img id="imgPrueba" style="width:250px; height:300px ; border: dashed blueviolet"></td></tr>
	            <tr><td><input type="file" onchange="mosttrarimagen();"></td></tr>
	            <tr><td></td></tr>
	            
	            </table>
	             <script type="text/javascript">
	            function mosttrarimagen(){
	            	var preview=document.getElementById('imgPrueba');
	            	var file=document.querySelector('input[type=file]').files[0];
	            	var leer = new FileReader();
	            	if(file){
	            		leer.readAsDataURL(file);
	            		leer.onloadend=function(){
	            			preview.src=leer.result;
	            		}
	            		;
	            	}
	            	else{
	            		preview.src="";
	            	}
	            }
	            </script>
	        </div>
	        
	        <div class="action-buttons">
	            <button>Cancelar</button>
	            <button>Actualizar Evento</button>
	        </div>
	    </div>
	    
	</div>
    <%@include file="../comun/footer.jsp" %>
      
</body>
</html>