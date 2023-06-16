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
	     
	       
	    </div>
	    
	</div>
    <%@include file="../comun/footer.jsp" %>
      
</body>
</html>