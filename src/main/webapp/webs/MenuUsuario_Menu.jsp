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






</style>

</head>
<body>
    <header class="hd-pag">
        <img class="pag-img" src="imgs/logo.jpg" alt="">        
        <h1 class="pag-h1">EventosYa</h1>
        <div class="pag-boton">
            <form action="" method="">
                <button type="submit">Salir</button>
            </form>
        </div>
            
    </header>

	<%@include file="../comun/aside.jsp" %>
    <main>



    </main>
    
    <%@include file="../comun/footer.jsp" %>
    
</body>
</html>