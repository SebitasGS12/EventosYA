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
 		.styled {
		 	top: 190px;
		    border: 0;
		    line-height: 2.5;
		    padding: 0 30px;
		    font-size: 1rem;
		    text-align: center;
		    color: #fff;
		    text-shadow: 1px 1px 1px #000;
		    border-radius: 30px;
		    background-color: #5b72ef;
		    background-image: linear-gradient(to top left, rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2) 50%, rgba(0, 0, 0, 0));
		    box-shadow: inset 2px 2px 3px rgba(255, 255, 255, 0.6), inset -2px -2px 3px rgba(0, 0, 0, 0.6);
		}
		footer input, textarea {
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
			width: 400px;
			height: 30px;
			left: 300px;
			top: 200px;
			font-family: 'Lexend';
			font-style: normal;
			font-weight: 400;
			font-size: 32px;
			line-height: 20px;
			/* identical to box height */
			text-align: start;
			color: #000000;
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
	        <div style="text-align: center; font-size: 50px;"><span style="color: #000000; left: 20px">
		        <div class="form-group row">
		        <div class="NombreEdi">Pollada Bailable</div>
	            <textarea name="message" id="Area" cols="140" rows="12"></textarea>
				<input class="favorite styled" type="button" value="Edit">
	       		<input class="favorite styled" type="button" value="Delete">
	       		</div>
	       		 <div class="form-group row">
		        <div class="NombreEdi">Concierto de Maluma</div>
	            <textarea name="message" id="Area" cols="140" rows="12"></textarea>
				<input class="favorite styled" type="button" value="Edit">
	       		<input class="favorite styled" type="button" value="Delete">
	       		</div>
	       		 <div class="form-group row">
		        <div class="NombreEdi">Conferencia con OpenAI</div>
	            <textarea name="message" id="Area" cols="140" rows="12"></textarea>
				<input class="favorite styled" type="button" value="Edit">
	       		<input class="favorite styled" type="button" value="Delete">
	       		</div>
			</div>
 		</div>
    </div>
    <%@include file="../comun/footer.jsp" %>
</body>
</html>