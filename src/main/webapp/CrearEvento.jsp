<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
            width: 1300px; 
            margin-left: 60px;
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
        .formulario form {
            padding: 0 30px;
            
        }
        form .name{
            position: relative;
            margin: 30px 0;
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
            width: 55%;
            background-color: #b8b8b6e0;
        }
        form .categ{
            position: relative;
            margin: 30px 0;
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
            width: 59%;
            background-color: #b8b8b6e0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        form .descrip{
            position: relative;
            margin: 30px 0;
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
            width: 55%; 
            background-color: #b8b8b6e0;         
        }
        form .ubica{
            position: relative;
            margin: 30px 0;
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
            width: 55%; 
            background-color: #b8b8b6e0;          
        }
        form .fechini{
            position: relative;
            margin: 30px 0;
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
            width: 55%; 
            background-color: #b8b8b6e0;          
        }
        form .fechfin{
            position: relative;
            margin: 30px 0;
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
            width: 55%;  
            background-color: #b8b8b6e0;        
        }
        .tbut{
            background-color: rgb(255, 1, 1);
            color: aliceblue;
            border-radius: 8px;
            border: 0;
            padding: 6px;
            font-size: 25px;
            margin-left: 70%;
            margin-top: -60px;
            margin-bottom: 30px;
            font-family: monospace;
  
        }
        .espacio_izqui{
            display: flex;
            flex-direction: row;
        }
        .flayer{
            width: 100%;
            height: 80%;
            margin-top: 20%;
            border-radius: 10px;
        }
    </style>

</head>
<body>
    <div class="container">
        <header class="cabecera">  
        </header>
        <nav class="menu">
            <img src="imgs/evento.png" alt="" class="logo">
         <h1 class="titu">CREAR EVENTO</h1>
        </nav>
        <section class="espacio_izqui">
          
          <div class="formulario">
            <h2 class="datev">Datos del Evento</h2>
            <form method="post">
                <div class="name">
                    <label>Nombre</label>
                    <input type="text" name="nombre" placeholder="Ingrese el Nombre">
                </div>
                <div class="categ">
                   <label>Categoria</label>
                   <select name="Categoria" id="">
                           <option value="">Popular </option>
                           <option value="">Cultural </option>
                           <option value="">Urbano </option>
                           <option value="">Privado </option>
                   </select>

                </div>
                <div class="descrip">
                 <label>Descripción</label>
                 <input  type="text" name="descripcion" placeholder="Ingrese la Descripción">

                </div>
                <div class="ubica">
                 <label>Ubicación</label>
                 <input   type="text" name="ubicacion" placeholder="Ingrese la Ubicación">
                </div>
                 <div class="fechini">
                 <label>Fecha Inicio</label>
                 <input type="date">
                 </div>
                 <div class="fechfin">
                 <label>Fecha Fin</label>
                 <input type="date">
                 </div>
            <input class="tbut" type="submit" class="creaeven" value="Crear">
            </form>
            
          </div>
          
          <aside class="espacio_derec">
            <img  class= "flayer"src="imgs/flayers.jpg" alt="">
        </aside>
        </section>
        
        <footer class="fin">
    
        </footer>
     </div>      
</body>
</html>