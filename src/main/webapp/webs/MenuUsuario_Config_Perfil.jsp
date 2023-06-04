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

    .hd-pag{
        background-color: #343838;
        height: 15vh;
        width: 100%;
        display: flex;
        align-items: center;
        box-shadow: 0px 0px 7px  gray;
    }


    .pag-img{
        height: 80%;
        margin: 10px;
    }
    .pag-h1{
        margin: 10px;
        color: white;
    }


    .pag-boton{
        position: absolute;
        right:  0;
        padding: 20px;
    }


    .pag-boton form button{
        color: white;
        width: 200px;
        height: 40px;
        font-size: 1.3em;
        border-radius: 20px;
        background-color: #00B4CC;
        border: none;
    }

    .pag-aside{
        position: relative;
        display:flex;
        flex-direction: column;
        background-color: rgb(255, 255, 255);
        width: 20%;
        height: 85vh;
        margin: 0 20px;
    }

    
    .aside-item{
        display: flex;
        color: white;
        width: 100%;
        height: 33%;
        margin: auto;
        background-color: #262525;
        align-items: center;
        justify-content: space-evenly;
    }

    .aside-item:hover{
        background-color: grey;
        cursor: pointer;
        transition: 1s all;
        color: #262525;
    }
    .aside-item-active{
        background-color: rgb(158, 158, 158);
        color: #262525;
    }
    
    /*Mod -- Personal*/
    .cont_main{
        background-color: #262525;
        display: flex;
        width: 1500px;
        height: 824px;
        }
        .aside_pa{
            flex-direction: row;
            width: 20%;

            border-width: 1px;  
            border-style: solid;
            border-color: white;
           
        }
        .aside-item1{
            flex-direction: column;
            background-color: #262525;
            color: white;
            width: 100%;
            height: 20%;
            margin: auto;
     
            align-items: center;
            justify-content: space-evenly;

            display: flex;
           
            border-width: 1px;
            border-style: solid;
            border-color: white;
        }
        .aside-item2{
            flex-direction: column;
            background-color: #262525;
            color: white;
            width: 100%;
            height: 20%;
            margin: auto;
     
            align-items: center;
            justify-content: space-evenly;
            display: flex;
            border-width: 1px;  
            border-style: solid;
            border-color: white;
            
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
    }

</style>

</head>
<body>
    <header class="hd-pag">
        <img class="pag-img" src="https://cibertecedu-my.sharepoint.com/personal/i202124082_cibertec_edu_pe/Documents/CIBERTEC%20CICLO%204/Lenguaje%20de%20Programacion%20II/PF_LPI/ProyectoFinal_Workspace/EventosYa/src/main/webapp/imgs/logo.jpg" alt="">        
        <h1 class="pag-h1">EventosYa</h1>
        <div class="pag-boton">
            <form action="" method="">
                <button type="submit">Salir</button>
            </form>
        </div>
            
    </header>
 <section class="section">
    <aside class="pag-aside">
        <div class="aside-item aside-item-active">
            <img src="https://cibertecedu-my.sharepoint.com/personal/i202124082_cibertec_edu_pe/Documents/CIBERTEC%20CICLO%204/Lenguaje%20de%20Programacion%20II/PF_LPI/libs/Imagenes_Repositorio/imgMenuIcon.png" alt="">
            <h2>Menu</h2>
        </div>
        <div class="aside-item ">
            <img src="https://cibertecedu-my.sharepoint.com/personal/i202124082_cibertec_edu_pe/Documents/CIBERTEC%20CICLO%204/Lenguaje%20de%20Programacion%20II/PF_LPI/libs/Imagenes_Repositorio/imgAdmEvnIcon.png" alt="">
            <h2>Administrar<br>Eventos</h2>
        </div>
        <div class="aside-item ">
            <img src="https://cibertecedu-my.sharepoint.com/personal/i202124082_cibertec_edu_pe/Documents/CIBERTEC%20CICLO%204/Lenguaje%20de%20Programacion%20II/PF_LPI/libs/Imagenes_Repositorio/imgConfigIcon.png" alt="">
            <h2>Configuracion<br>de Cuenta</h2>
        </div>
    </aside>
    <main class="cont_main">
<div class="aside_pa">
     <div class="aside-item1">
     <h2>Editar Perfil</h2>
    </div>
    <div class="aside-item2">
    <h2>Modificar <br>Contraseña</h2>
    </div>
</div>
<div class="article_pa">
    <div class="formu">
        <h2 class="modper">Editar Perfil</h2>
        <form method="post">
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