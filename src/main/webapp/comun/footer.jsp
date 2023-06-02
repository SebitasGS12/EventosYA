<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	
	
	</head>
	
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Lexend&display=swap');
		*{
		padding: 0;
		margin: 0;
		box-sizing: border-box;
		font-family: 'Lexend', sans-serif;
	
		}
	
		footer{
			background-color: #005F6B;
			width: 100%;
		
		}
	
		.lista-footer{
			font-size: 1.3em;
			color: white;
			display: flex;
			flex-direction: row;
			justify-content:space-around;
			align-items: center;    
			list-style: none;
			text-decoration: none;
			background-color: #005F6B;
			
		
		}
	
		.lista-footer li{
	
			margin: 10px;
		}
	
		.lista-footer li:hover{
			cursor: pointer;    
			
		}
	
		.hr-footer{
	
			width: 90vw;
			color:white;
			margin: auto;
	
		}
		
		.container-1{
			display: flex;
			align-items: center;	
			justify-content: center;
			text-align: center;
			height: 50px	;
			color:white;
			font-size: 1.6em;
			font-weight: bold;
			margin:15px 10px;
		}
		
		.container-1 img{
		
	        height: 80%;
       		margin: 10px;
		}
	
		.container-2{
			background-color: #343838;
			padding:20px;
			text-align: center;
		}
		
		
		.container-2 P{
	
				 color: #FFFFFF;
		
		}
	
	</style>
	
	<body>
	
		<footer>
		
			<ul class="lista-footer">
				<li>Terminos y Condiciones</li>
				<li>Politica de Privacidad</li>
				<li>Sobre Nosotros</li>
			</ul>
			
			<hr class="hr-footer" />
			<div class="container-1">
				<p >EventosYa</p>
				<img  class="img-footer" src="https://cibertecedu-my.sharepoint.com/personal/i202124082_cibertec_edu_pe/Documents/CIBERTEC%20CICLO%204/Lenguaje%20de%20Programacion%20II/PF_LPI/ProyectoFinal_Workspace/EventosYa/src/main/webapp/imgs/logo.jpg" alt="">        
			
			</div>
			
			<div class="container-2">
			
			  <p>Copyright 2023. Todos los derechos reservados</p>
				
			</div>
			
		
	
		</footer>
	</body>
</html>