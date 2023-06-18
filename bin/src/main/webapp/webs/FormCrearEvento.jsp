<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.text.DateFormat"%><%DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Crear Evento</title>
<style>
        *{
            margin: 0;
            padding: 0;
        }
        .container{
            background-color: rgb(255, 255, 255);
        }
        .menu{
            background-color: #a8a8a2;
            display: flex;
            flex-direction: row;

        }
        .titu{
           color: rgb(0, 0, 0);
           font-size: 40px;
           margin-top: 30px;
           margin-left: 3%;
           font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }
        
        .button-container {
     	text-align: center;
      	margin-bottom: 20px;
    	}
        
        .logo{
            width: 5%;
            height: auto;
            margin-left: 10px;
            margin-top: 15px;
            margin-bottom: 15px;
            border-radius: 5px;
        }
        /*Forms*/
        .espacio_izqui{
            background-color: #ffffff;
            border-radius: 15px;
            
            
        }
        .datev{
            font-size: 42px;
            text-align: center;
            padding-top: 15px;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }
        .formulario{
            background-color: rgb(255, 255, 255);
            width: 100%;
            border-radius: 20px;
            height: auto;
        }

        form .name{
            position: relative;
            margin: 30px 0;
            width: 80%;
        }
        .name label{
         position: absolute;
         top: 50%;
         transform:translateY(-180%);
         font-size: 20px;
         font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }
        .name input {
            padding: 15px;
            margin-top: 20px;
            border-radius: 9px;
            border: 0;
            width: 100%;  
            background-color: #b8b8b6e0;
        }
        form .categ{
            position: relative;
            margin: 30px 0;
                        width: 80%;
        }
        .categ label{
         position: absolute;
         top: 22%;
         transform:translateY(-180%);
         font-size: 20px;
         font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }
        .categ select{
            padding: 15px;
            margin-top: 8px;
            border-radius: 9px;
            border: 0;
            width: 100%;  
            background-color: #b8b8b6e0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        form .descrip{
            position: relative;
            margin: 30px 0;
                        width: 80%;
        }
        .descrip label{
         position: absolute;
         top: 29%;
         transform:translateY(-180%);
         font-size: 20px;
         font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        
        }
        .descrip input{
            padding: 15px;
            margin-top: 5px;
            border-radius: 9px;
            border: 0;
            width: 100%;  
            background-color: #b8b8b6e0;         
        }
        form .ubica{
            position: relative;
            margin: 30px 0;
                    width: 80%;
        }
        
        .ubica label{
         position: absolute;
         top: 20%;
         transform:translateY(-180%);
         font-size: 20px;
         font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        
        }
        .ubica input{
            padding: 15px;
            margin-top: 5px;
            border-radius: 9px;
            border: 0;
            width: 100%;  
            background-color: #b8b8b6e0;          
        }
        form .fechini{
            position: relative;
            margin: 30px 0;
                        width: 80%;
        }
        .fechini label{
         position: absolute;
         top: 20%;
         transform:translateY(-180%);
         font-size: 20px;
         font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        
        }
        .fechini input{
            padding: 15px;
            margin-top: 5px;
            border-radius: 9px;
            border: 0;
            width: 100%;  
            background-color: #b8b8b6e0;          
        }
        form .fechfin{
            position: relative;
            margin: 30px 0;
                        width: 80%;
        }
        
        .fechfin label{
         position: absolute;
         top: 20%;
         transform:translateY(-180%);
         font-size: 20px;
         font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
         
        
        }
        .fechfin input{
            padding: 15px;
            margin-top: 6px;
            border-radius: 9px;
            border: 0;
            width: 100%;  
            background-color: #b8b8b6e0;        
        }
        .tbut{
            background-color: rgb(255, 1, 1);
            color: aliceblue;
            border-radius: 8px;
            border: 0;
            padding: 6px;
            font-size: 25px;
	
            font-family: monospace;
  
        }
        .espacio_izqui{
            display: flex;
            flex-direction: row;
                width: 100%;
            align-items: center;
        }
        
        .contenedor-formulario{
        	margin-top:30px;
        	display: flex; 
        	justify-content: center;
        	align-items: center;
        }
        .inputs-contenedor{
        	width: 50%;
        	display: flex; 
        	flex-direction:column;
        	justify-content: center;
        	align-items: flex-start;
        }
        
        .imagen-contenedor{
        	height: 100%;
        	width: 30%;
        	margin:30px 10px;
        	border: 3px black solid;
        	border-radius: 5px;
        	        	text-align: center;
        	
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
        	
        	 height: 400px;
        	 width: 90% !important;
        }
        
        .botones-div{
        	display: flex;
        	gap:15px;

        	text-align: center;
        	justify-content: space-evenly;
        	align-items: center;
        	margin:15px;
        	padding:5px;
        }
        
         .botones-div button:hover{
         	cursor: pointer;
         }
        
    </style>

</head>
<body>
    <div class="container">
        <header class="cabecera">  
        </header>
        <nav class="menu">
            <img src="../imgs/evento.png" alt="" class="logo">
         <h1 class="titu">CREAR EVENTO</h1>
        </nav>
        <section class="espacio_izqui">
          
          <div class="formulario">
            <h2 class="datev">Datos del Evento</h2>
            <form  action="${pageContext.request.contextPath}/evento" method="POST"  enctype="multipart/form-data">
            
            	<div class="contenedor-formulario">

	            	<div class="inputs-contenedor">
		            	<div class="name ">
		                    <label>Nombre</label>
		                    <input type="text" name="txtNombre" placeholder="Ingrese el Nombre" required>
		                </div>
		                <div class="categ">
		                   <label>Categoria</label>
		                   <select name="txtCategoria" id="" required>
		                           <option value="300">Popular </option>
		                           <option value="301">Cultural </option>
		                           <option value="302">Urbano </option>
		                           <option value="303">Privado </option>
		                   </select>
		                </div>
		                <div class="descrip">
		                	<label>Descripción</label>
		                	<input  type="text" name="txtDescripcion" placeholder="Ingrese la Descripción" required>
		                </div>
		                <div class="ubica">
		                	<label>Ubicación</label>
		                	<input   type="text" name="txtUbicaion" placeholder="Ingrese la Ubicación" required>
		                </div>
		                
		                <div class="fechini">
		                	<label>Fecha Inicio</label>
		                	<input name="txtFechaIni" type="date" min="<%= df.format(new java.util.Date())%>" required>
		                </div>
		                <div class="fechfin">
		                	<label>Fecha Fin</label>
		                	<input name="txtFechaFin" type="date" min="<%= df.format(new java.util.Date())%>" required>
		                </div>
	            	</div>
	            	
	            	
	            	<div class="imagen-contenedor">
		            	<br />
	            		<h2>Imagen de Evento</h2>
		            	<br />
            			<input type="file"  accept="image/*" class= "flayer" name="txtImagen" id="file" alt="" >
            			<label for="file" id="preview"><img  alt="" src="${pageContext.request.contextPath}/imgs/cameraImagen.png"></label>
	       	 			<h3>Medidas 400x300</h3>
	       	 			<br />
	       	 		</div>

              	</div>
                <div class="botones-div">
		            <button class="tbut" type="submit" class="creaeven"  name="opcion" value="reg">Crear</button>
	    	        <button class="tbut" type="submit" class="creaeven"  name="opcion" value="sal">Salir</button>
                 </div>
            </form>
            
          </div>
          
       
        </section>
        
    <%@include file="../comun/footer.jsp" %>

     </div>      
</body>
<script src="${pageContext.request.contextPath}/comun/previsualizarImagen.js"></script>
</html>