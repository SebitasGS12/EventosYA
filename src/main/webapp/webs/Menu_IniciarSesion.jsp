<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <title>Iniciar Sesion</title>
  <style>
    body {
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
      font-family: Arial, sans-serif;
    }
    
    
  </style>
</head>
<body>
<%@include file="../comun/header_normal.jsp" %>	
  <main>
      <div class="container">
        <div class="container_opciones">
          
            <a href="#">Iniciar Sesion</a>
            <a href="#">Registrarse</a>
        </div>
        <img src="" alt="" />
        <div class="container_escritura">
          <div class="escritura_div">          
            <img src="" alt="" /><p>Usuario o Correo</p>
            <input type="text" name="" id="" value="" />
          </div>
          <div class="escritura_div" >          
            <img src="" alt="" /><p>Password</p>
            <input type="password" name="" id="" value="" />
          </div>
          <div>          
            <input type="checkbox" name="" id="checkbox_RecordarUsuario" />
            <label for="checkbox_RecordarUsuario">Recordar Usuario</label>
            <a href="id=""">Iniciar Sesion</a>
            
          
          
          </div>
          
          
        </div>
  
  
        
            
        
      </div>  
    
    
  </main>
  <%@include file="../comun/footer.jsp" %>	
  




  
</body>
</html>
