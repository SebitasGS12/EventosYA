<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <title>Busqueda Existente</title>
   <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
    <style>
       .pag-container {
            display: flex;
            flex-direction: row;
            margin-top: 10px;
        }
    .container-1 input#search:hover, .container-1 input#search:focus, .container-1 input#search:active{
    outline:none;
    background: #f3f3f3;
  }
.container-1 input#search{
  width: 1200px;
  height: 75px;
  background: #ACAAA9;
  border: none;
  font-size: 14pt;
  float: left;
  color: #262626;
  padding-left: 75px;
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border-radius: 5px;
  
    -webkit-transition: background .55s ease;
  -moz-transition: background .55s ease;
  -ms-transition: background .55s ease;
  -o-transition: background .55s ease;
  transition: background .55s ease;
}
.container-1 .icon{
  margin-left: 70px;
  margin-right: 10px;
  z-index: 1;
  color: #4f5b66;
}
.columna1 {
  float: left;
  margin-top: 40px;
margin-left: 120px;
  width: 50%;
  padding-right: 5px;
   border-radius: 5px;
}
.columna2 {
  float: left;
  margin-top: 40px;
  padding-right: 5px;
}







#tabla-precios {
 display:inline-block;
 width:100%;
 margin-top:50px;
 margin-right: 50px;
 margin-left: 50px;
}

/*Columnas*/

.precio-col {
 display:inline-block;
 background-color:#f3f3f3;
 width:100%;
 max-width:500px;
 border-radius:10px;
 margin-bottom:50px;
 box-shadow: 0px 2px 5px #ddd
 
}

@media screen and (min-width:768px) {
 .precio-col {
 width:32%;
 float:left;
 margin-right:2%
 }
 
 .precio-col:last-child {
 margin-right:0
 }
}

/*Headers*/

.precio-col-header {
 background-color:#333;
 padding:20px;
 border-top-left-radius:10px;
 border-top-right-radius:10px
}

.precio-col:nth-child(2) .precio-col-header {
 background-color:#dd9933
}

.precio-col-header h3 {
 color:#f3f3f3;
 text-align:center;
 font-size:30px;
 font-weight:600;
 margin-bottom:0
}

.precio-col-header p {
 text-align:center;
 color:#f3f3f3;
 font-size:14px;
 margin-bottom:0
}

/*Características*/

.precio-col-features {
 padding: 0 20px 20px 20px
}

.precio-col-features p {
 padding:20px 0;
 margin:0;
 text-align:center;
 border-top:1px solid #ddd
}

.precio-col-features p:first-child,
.precio-col-features p:last-child {
 border-top:none
}

/*Comprar*/

.precio-col-comprar {
 padding:10px;
 max-width:250px;
 text-align:center;
 background-color:#dd9933;
 margin: 0 auto 20px;
 border-radius:10px;
 border: 2px solid #dd9933;
 transition: all 0.3s
}

.precio-col-comprar a {
 color:#f3f3f3;
 padding:10px;
 font-size:20px;
 text-transform:uppercase;
 transition: all 0.3s
}

.precio-col-comprar:hover {
 background-color:#f3f3f3;
 transition: all 0.3s
}

.precio-col-comprar:hover a {
 color:#dd9933;
 transition: all 0.3s
}
    </style>
</head>
<body>
<% String msg = (String) request.getAttribute("mensaje");
if (msg==null) msg="";
	
%>
<%=msg %>
	<%@include file="../comun/header_Salir.jsp" %>
	<div class="pag-container">
		<%@include file="../comun/aside.html" %>
	    <div class="pag-main">
	      <div class="box">
  			<div class="container-1">
      			<span class="icon"><i class="fa fa-search" aria-hidden="true"></i></span>
      			<input type="search" id="search" placeholder="Evento Random - Existente / Ejemplo 'Pollada'" />
  			</div>
  			  <div class="fila">
<div id="tabla-precios">

<div class="precio-col">
 <div class="precio-col-header">
  <img src="https://picsum.photos/380/250">
 <h3>Generar</h3>
 <p>proximo Evento</p>
 </div>

<div class="precio-col-features">
 <p>Direccion del Evento</p>
 <p>Nombre del evento</p>
 <p>Fecha del evento</p>
 </div>

<div class="precio-col-comprar">
 <a>Participar</a>
 </div>
 </div>

<div class="precio-col">
 <div class="precio-col-header">
  <img src="https://picsum.photos/380/250">
 <h3>S/.20 c/u</h3>
 <p>Pro Salud</p>
 </div>

<div class="precio-col-features">
 <p>Arequipa</p>
 <p>Pollada Pro Salud</p>
 <p>15 de mayo de 2020</p>
 </div>

<div class="precio-col-comprar">
 <a>Comprar</a>
 </div>
 </div>
<div class="precio-col">
 <div class="precio-col-header">
 <img src="https://picsum.photos/380/250">
 <h3>S/.10 c/u</h3>
 <p>Pro Salud</p>
 </div>

<div class="precio-col-features">
 <p>Pampas Tayacaja</p>
 <p>Gran Pollada Bailable</p>
 <p>05 de mayo de 2020</p>
 </div>

<div class="precio-col-comprar">
 <a href="https://pro.empresiona.com">Participar</a>
 </div>
 </div>

</div>
    </div>
  		</div>
		</div>
	</div>
    <%@include file="../comun/footer.jsp" %>
</body>
</html>