<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Menu Usuario </title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Lexend&display=swap');
    *{
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        font-family: 'Lexend', sans-serif;



    }

    
    /*Mod -- Personal*/
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
        .modper{
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
        .nombre{
            flex-direction: column;
            width: 80%;
            height: auto;

            flex-direction: row;
            justify-content: space-evenly;
            display: flex;
            margin-left: 60px;
            margin-top: -40px;
        }
        .nombre label{
          width: 50%;
          height: 40px;
          margin-left: 100px;
          margin-top: 26px;
          text-align: left;
          color: white;
          font-size: 20px;
          padding-top: 4px;
          margin-right: 123px;

        }
        .nombre input{
          width: 50%;
          height: 40px;
          margin-left: -300px;
          margin-right: 150px;
          margin-top: 26px;
          border-radius: 10px;
        }
        
        .nombreusu{
            flex-direction: column;
            height: auto;
            width: 80%;

            flex-direction: row;
            justify-content: space-evenly;
            display: flex;
            margin-left: 60px;
            margin-top: -10px;
        }

        .nombreusu label{
          width: 50%;
         
          height: 40px;
          margin-left: -100px;
          margin-top: 26px;
          text-align: left;
          color: white;
          font-size: 20px;
          padding-top: 4px;
         

        }
        .nombreusu input{
          width: 46%;
          
          height: 40px;
          margin-left: -320px;
        
          margin-top: 26px;
          border-radius: 10px;
          
        }
        .corre{
            flex-direction: column;
            
            height: auto;


            width: 80%;

            flex-direction: row;
            justify-content: space-evenly;
            display: flex;
            margin-left: 60px;
            margin-top: -10px;
        }

        .corre label{
        width: 50%;
        height: 40px;
        margin-left: -100px; 
        margin-top: 26px;
        text-align: left;
        color: white;
        font-size: 20px;
        padding-top: 4px;
         

        }
        .corre input{
          width: 46%;
          
          height: 40px;
          margin-left: -320px;
          margin-top: 26px;
          border-radius: 10px;
        
         
        }
        .fotope{
            flex-direction: column;
            
            height: auto;


            width: 80%;

            flex-direction: row;
            justify-content: space-evenly;
            display: flex;
            margin-left: 60px;
            margin-top: -10px;
        }

        .fotope label{
        width: 50%;
        height: 40px;
        margin-left: -248px; 
        margin-top: 26px;
        text-align: left;
        color: white;
        font-size: 20px;
        padding-top: 4px;
         

        }
        .fotope img{
          width: 15%;
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
            margin-left: 30%;
            margin-top: 80px;
            
        }
        
        .confcamb:hover{
        	cursor: pointer;
        
        }
        
      .section{
     display: flex;
     flex-direction: row;
     margin-top: 20px;
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
		        <h2 class="modper">Editar Perfil</h2>
		        <form method="post" action="${pageContext.request.contextPath}/usuario">
		            <div class="nombre">
		                <label>Nombre</label>
		                <input type="text" name="nam" placeholder="Inserte Nombre">
		            </div>
		            <div class="nombreusu">
		             <label>Nombre  de Usuario</label>
		             <input  type="text" name="nusu" placeholder="Ingrese nombre de cuenta">
		
		            </div>
		            <div class="corre">
		             <label>Correo</label>
		             <input   type="text" name="corr" placeholder="Correo Registrado">
		            </div>
		            <br>
		            <br>
		            <div class="fotope">
		                <label>Foto de Perfil</label>
		                <img src="../imgs/perfil.png" alt="">
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