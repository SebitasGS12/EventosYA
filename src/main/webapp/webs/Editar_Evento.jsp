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
            background-color: #00B4CC;
            padding: 10px;
        }

        .pag-subtitle {
            font-size: 2em;
            color: white;
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

        .form-container {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            justify-content: center;
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
            width: 600px;
            height: 150px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 5px;
        }

        .form-input-grayed {
            width: 300px;
            height: 30px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 5px;
            color: gray;
        }

        .add-image-button {
            width: 30px;
            height: 30px;
            margin-left: 10px;
            font-size: 1.2em;
            border-radius: 50%;
            border: none;
            background-color: transparent;
            color: gray;
            cursor: pointer;
        }

        .action-buttons {
            display: flex;
            justify-content: flex-start;
            margin-top: 20px;
        }

        .action-buttons button {
            margin-right: 10px;
            background-color: #00B4CC;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px;
            cursor: pointer;
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
	        <div class="form-container">
	            <label for="name">Nombre:</label>
	            <input type="text" id="name" class="form-input" placeholder="Ingrese su nombre">
	            <label for="location">Ubicación:</label>
	            <input type="text" id="location" class="form-input-transparent" placeholder="Ingrese su ubicación">
	            <label for="description">Descripción:</label>
	            <textarea id="description" class="form-input-description" placeholder="Ingrese la descripción"></textarea>
	        </div>
	        
	        <div class="form-container">
	            <label for="category">Categoría:</label>
	            <input type="text" id="category" class="form-input" placeholder="Ingrese la categoría">
	            <label for="from">Desde:</label>
	            <select id="from" class="form-input">
	                <option value="option1">Opción 1</option>
	                <option value="option2">Opción 2</option>
	            </select>
	            <label for="to">Hasta:</label>
	            <select id="to" class="form-input">
	                <option value="option1">Opción 1</option>
	                <option value="option2">Opción 2</option>
	            </select>
	            <div class="image-container">
	                <label for="add-image">Añadir imagen:</label>
	                <input type="text" id="add-image" class="form-input-grayed" placeholder="Añadir imagen" readonly>
	                <button class="add-image-button">+</button>
	            </div>
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
