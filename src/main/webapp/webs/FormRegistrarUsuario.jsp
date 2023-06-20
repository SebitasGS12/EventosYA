<%@page import="Models.CiudadDTO"%>
<%@page import="DAO.DAOFactory"%>
<%@page import="Models.PaisDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Formulario - Registrar Usuario</title>
  <style>
    /* Estilos CSS aquI≠ */
	@import url('https://fonts.googleapis.com/css2?family=Lexend&display=swap');
    *{
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        font-family: 'Lexend', sans-serif;

	}
    .header {
      background-color: #ddd;
      padding: 20px;
      display: flex;
      align-items: center;
    }

    .header img {
      max-width: 30px;
      margin-right: 10px;
    }

    .header h1 {
      margin: 0;
      color: black;
      margin-left: 10px;
    }

    .container {
    	display:flex;
    	flex-direction:row-reverse;
    	justify-content:space-around;
      padding: 20px;
    }

    .button-container {
      text-align: center;
      margin-bottom: 20px;
    }

    .button  ,a{
      display: inline-block;
      background-color: #FF0000;
      color: white;
      padding: 8px 16px;
      text-decoration: none;
      border-radius: 5px;
      font-size: 14px;
      border: none;
      transition: background-color 0.3s;
      margin-top: -10px;
    }

    .button:hover {
      background-color: #990000;
    }

    .button:focus {
      outline: none;
      background-color: #660000;
    }

    .welcome-text {
      font-family: Arial, sans-serif;
      font-weight: bold;
      font-size: 18px;
      color: black;
      text-align: left;
      margin-left: 20px;
    }

    .welcome-text span {
      font-style: italic;
    }

    .input-container {
      display: flex;
      margin-top: 10px;
      /* Espacio entre los rect√°ngulos y el texto anterior */
    }

    .input-container input,
    .input-container select {
      flex: 1;
      padding: 10px;
      border: none;
      background-color: #f2f2f2;
      /* Color gris claro */
      margin-right: 10px;
      /* Espacio entre los rect√°ngulos */
    }

    .input-container input{
    
    	width: 100%;
    }
    .checkbox-container {
      display: flex;
      align-items: center;
      margin-top: 10px;
      /* Espacio entre los cuadritos y el texto anterior */
    }

    .checkbox-container input[type="checkbox"] {
      margin-right: 10px;
      /* Espacio entre el cuadrito y el texto */
    }

    .checkbox-container label {
      color: blue;
    }

    .create-account-button {
      text-align: left;
      margin-top: 20px;
      /* Espacio entre el bot√≥n y la pregunta */
    }

    .create-account-button button {
      display: inline-block;
      background-color: blue;
      color: white;
      padding: 10px 20px;
      text-decoration: none;
      border-radius: 5px;
      font-size: 16px;
      border: none;
      transition: background-color 0.3s;
    }

    .create-account-button button:hover {
      background-color: #001f66;
    }

    .create-account-button button:focus {
      outline: none;
      background-color: #000b33;
    }
	form{
		flex-direction:column;
		height: 60%;
	}
    
    
    .form-container {
	    display: flex;
	    padding: 0 20px;
	    margin: 10px;
	    align-items: flex-start;
	    justify-content: center;
      
     
    }
    

    .image-container {
      float: right;
      width: 50%;
      text-align: right;
    }

    .image-container img {
      max-width: 200px;
    }

    .centered-button {
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

    
    

  </style>
</head>
<body>
	<script src="../comun/ciudades.js" >
		 cargarCiudades();
	</script>
	
	
	<div class="header">
      <img src="../imgs/logoRegistro.jpg" alt="logo">
      <h1 style="color: black;">REGISTRAR USUARIO</h1>
    </div>
    <div class="container"> 
    
    <div class="button-container centered-button">
        <a href="Menu_inicio.jsp" class="button">REGRESAR INICIO</a>
     </div>
     <div class="button-container">
	        <p class="welcome-text" style="margin-left: 20px;">BIENVENIDO A: <span>ENTRADAS YA</span></p>
	</div>
	  
    </div>
	  <form action="${pageContext.request.contextPath}/usuario" method="post">
	  
	  <div class="form-container">
 	 <section>
	      
	      
	     
	       <div class="input-container">
	         <input type="text" name="txtNombre" placeholder="NOMBRES" required="required">
	       </div>
	       	<div class="input-container">
	         <input type="text" name="txtApellidos" placeholder="APELLIDOS" required="required">
	       </div>
	
	       <div class="input-container">
	         <input type="text" name="txtCorreo" placeholder="CORREO ELECTRONICO" required="required">
	       </div>
	
	       <div class="input-container">
	         <input type="password" name="txtContrasenia" placeholder="CONTRASE—ëA" required="required">
	       </div>
			<!-- 
			
	       <div class="input-container">
	         <input type="password" placeholder="REPETIR CONTRASE—ëA">
	       </div>
			
			 -->
			
	
	       <div class="input-container">
	         <select name="pais" id="selectPaises"  onchange="cargarCiudades()" >
	           <option value="null"  selected >Seleccioneö su Pais </option>
	           <% DAOFactory fabric = DAOFactory.getDaoFactory(DAOFactory.MySQL);
	           	ArrayList<PaisDTO> listaPaises = fabric.getPaisDAO().listarPaises();
	           	if(listaPaises != null){
	           		for(PaisDTO p : listaPaises){
	           	%>
	           	<option value="<%=p.getId()%>"  ><%=p.getNombre() %></option>		
	           	<%
	           	
	           		}
	           		
	           	}%>	

	         </select>


	         
	       </div>
	        <div class="input-container">
	        
	        <select name="ciudad" id="selectCiudades" >

	         </select>
	        	
	        
	         </div>
	       
	
	       <div class="input-container">
	         <select name="genero">
	           <option value="">GEâNERO</option>
	           <option value="masculino">Masculino</option>
	           <option value="femenino">Femenino</option>
	           <option value="otro">Otro</option>
	         </select>
	       </div>
	
	       <div class="checkbox-container">
	         <input type="checkbox" id="terms-checkbox">
	         <label for="terms-checkbox">HE LEIçDO LOS TEâRMINOS Y CONDICIONES</label>
	       </div>


	    
      
  </section>
 

	<section>
		
		<br />
			<h2>Imagen de Evento</h2>
			<br />
			<input type="file"  accept="image/*" class= "flayer" name="txtImagen" id="file" alt="" >
			<label for="file" id="preview"><img  alt="" src="${pageContext.request.contextPath}/imgs/RegistrarUsuarioImg.jpg"></label>
			<h3>Medidas 400x300</h3>
		<br />
	
	</section>
	
	 </div>
	   <div class="create-account-button">
			<button type="submit" name="opcion" value="reg" class="btn" >Crear Cuenta</button>
       </div>
       
   
   </form>
   
   
<%@include file="../comun/footer.jsp" %>

</body>
</html>
