<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Usuario Contra</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Lexend&display=swap');
    *{
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        font-family: 'Lexend', sans-serif;



    }

    /*Mod -Contrasenia*/
    .cont_main{
        background-color: #262525;
        display: flex;
        width: 1500px;
        height: 824px;
        
    }
    
    
    

    

    .article_pa{
        flex-direction: row;
        width: 100%;
        border-width: 1px;  
        border-style: solid;
        border-color: white;
    }
    .modcont{
        text-align:center;
        margin-left: -350px;
        height: 80px;
        padding-top: 15px;
        color: white;
        
    }

    .formu{
        display: flex;
        width: 100%;
        flex-direction: column;
        height: 800px;

    }
    .contra{
        flex-direction: column;
        width: 80%;
        height: auto;

        flex-direction: row;
        justify-content: space-evenly;
        display: flex;
        margin-left: 60px;
        margin-top: -40px;
    }
    .contra label{
      width: 50%;
      height: 40px;
      margin-left: 95px;
      margin-top: 26px;
      text-align: left;
      color: white;
      font-size: 20px;
      padding-top: 4px;
      margin-right: 123px;

    }
    .contra input{
      width: 50%;
      height: 40px;
      margin-left: -300px;
      margin-right: 150px;
      margin-top: 26px;
    }
    
    .nuecontra{
        flex-direction: column;
        height: auto;
        width: 80%;

        flex-direction: row;
        justify-content: space-evenly;
        display: flex;
        margin-left: 60px;
        margin-top: -10px;
    }

    .nuecontra label{
      width: 50%;
    
      height: 40px;
      margin-left: -100px;
      margin-top: 26px;
      text-align: left;
      color: white;
      font-size: 20px;
      padding-top: 4px;
     

    }
    .nuecontra input{
      width: 46%;
      
      height: 40px;
      margin-left: -320px;
    
      margin-top: 26px;
    }
    .confcontra{
        flex-direction: column;
        
        height: auto;


        width: 80%;

        flex-direction: row;
        justify-content: space-evenly;
        display: flex;
        margin-left: 60px;
        margin-top: -10px;
    }

    .confcontra label{
    width: 50%;
    height: 40px;
    margin-left: -100px; 
    margin-top: 26px;
    text-align: left;
    color: white;
    font-size: 20px;
    padding-top: 4px;
     

    }
    .confcontra input{
      width: 46%;
      
      height: 40px;
      margin-left: -320px;
      margin-top: 26px;
     
    }
    .confcamb{
        background-color: rgb(11, 15, 243);
        color: white;
        border-radius: 8px;
        border: 0;
        padding: 6px;
        font-size: 25px;
        margin-left: 25%;
        margin-top: 80px;
        
    }

.section{
     display: flex;
     flex-direction: row;
     margin-top:20px;
    }
    
    
      #itemConfig{
    	background-color: rgb(158, 158, 158);
        color: #262525;
    }


    

</style>

</head>
<body>

	<%@include file="../comun/header_Salir.jsp" %>
	
 <section class="section">
	<%@include file="../comun/aside.html" %>
    <main class="cont_main">
    
    
    
	<%@include file="../comun/aside_configuracion.html" %>
	
	
	
<div class="article_pa">
    <div class="formu">
        <h2 class="modcont">Modificar Contraseña</h2>
        <form method="post">
            <div class="contra">
                <label>Contraseña</label>
                <input type="text" name="con" placeholder="Escriba la contraseña">
            </div>
            <div class="nuecontra">
             <label>Nueva Contraseña</label>
             <input  type="text" name="nuecon" placeholder="Digite nueva contraseña">

            </div>
            <div class="confcontra">
             <label>Confirmar Contraseña</label>
             <input   type="text" name="ubicacion" placeholder="Confirme nueva Contraseña">
            </div>
        <input class="confcamb" type="submit"value="Confirmar cambio">
        </form>
        
      </div>
</div>
    </main>
</section>
    <%@include file="../comun/footer.jsp" %>
    
</body>
</html>