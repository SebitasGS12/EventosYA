<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <title>Iniciar Sesion</title>
  <style>
	
	
	
	main{
		background-color: #616161;
		height: 70vh;
		
	}

	.container{
	
		display: flex;
		font-size: 1.6em;
		flex-direction: column;
		gap:10px;
		justify-content: center;
		align-items: center;
		height: 100%;

		
		
		
	}
	.container_opciones{

	}
	
	.container_opciones a{
		margin:10px;
		color:white;
		text-decoration: none;
		
		
	}
	
	
	.container_opciones a:hover{
		margin:5px;
		color:#00B4CC;
		text-decoration: underline;
		transition: .4s all;
		
	}
	
	.container_escritura{
		text-align:center;
		color:white;
		margin:10px;
	}
	.escritura_div{
		display:flex;
		flex-direction:column;
		gap:15px;
		align-items: flex-start;
		justify-content: center;
		margin:15px;
		
	}
	.escritura_div img{
		width: 20px;
		margin: 0 5px;
	}
	.escritura_div input{
		width: 100%;
		outline: none;
		backgroun-color: white;
		border: none;
		height: 40px;
		padding: 10px;
		font-size: .9em;
		color:gray;
		
		
	}
	
	.escritura_botones{
		font-size: 0.8em;
		margin-top:70px;
	}
	
	.escritura_botones a{
	
		background-color: #00B4CC;
		color:white;
		text-decoration: none;
		margin: 5px;
		padding:15px;
	}
		.escritura_botones a:hover{
			background-color:#046A78;
			transition:.4s all;
		}
	
		
	
	
    
    
  </style>
   <script>
    function verContra() {
      var passwordInput = document.getElementById("inputPass");
      if (passwordInput.type === "password") {
        passwordInput.type = "text";
      } else {
        passwordInput.type = "password";
      }
    }
  </script>
</head>
<body>
<%@include file="../comun/header_normal.jsp" %>	
  <main>
      <div class="container">
        <div class="container_opciones">
            <a href="Menu_IniciarSesion.jsp">Iniciar Sesion</a>
            <a href="${pageContext.request.contextPath}/webs/FormRegistrarUsuario.jsp">Registrarse</a>
            
       		 <hr style="width: 100% ; margin:10px 0;" />
        </div>
        
        <div class="container_escritura">
          <div class="escritura_div">          
            <label for="inputUsuario" ><img src="${pageContext.request.contextPath}/imgs/icoUsuario.png" alt="" />Usuario o Correo</label>
            <input type="text" name="" id="inputUsuario" value="" />
          </div>
          <div class="escritura_div" >          
            <label for="inputPass" ><img src="${pageContext.request.contextPath}/imgs/icoPassword.png" alt="" />Password</label>
            <input type="password" name="" id="inputPass" value="" />
          </div>
          <div class="escritura_botones">          
            <input type="checkbox" name="" onclick="verContra()" id="checkBoxVer" />
            <label for=checkBoxVer>Ver Contrasenia</label>
            
            
            <a href="id=""">Iniciar Sesion</a><!-- Pasa por un servlet tener cuidado -->
            
          
          
          </div>
          
          
        </div>
  
  
        
            
        
      </div>  
    
    
  </main>
  <%@include file="../comun/footer.jsp" %>	
  




  
</body>
</html>
