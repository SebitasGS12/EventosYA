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






</style>

</head>
<body>
    <header class="hd-pag">
        <img class="pag-img" src="img/IconoPag.png" alt="">        
        <h1 class="pag-h1">EventosYa</h1>
        <div class="pag-boton">
            <form action="" method="">
                <button type="submit">Salir</button>
            </form>
        </div>
            
    </header>

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
            <h2>Configuracion<br>de Cuneta</h2>
        </div>
    </aside>
    <main>



    </main>
    
</body>
</html>