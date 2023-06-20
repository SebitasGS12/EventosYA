
<style>
@import url('https://fonts.googleapis.com/css2?family=Lexend&display=swap');
    *{
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        font-family: 'Lexend', sans-serif;



    }
    
      .header {
      background-color: #343838;
      padding: 20px;
      width: 100%;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    
    .header a{
    
    	color:white;
    	text-decoration: none;
    
    }
    
    .header h1 {
      color: white;
      margin: 0;
      display: flex;
      align-items: center;
    }
    
    .header h1 a img {
      margin-right: 10px;
      max-width: 30px;
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
        cursor: pointer;
    }
</style>


       
<div class="header">
    <h1>
      
      <a href="../usuario?opcion=salir">
      	<img src="imgs/logo.jpg" alt="logo">EventosYa
      	</a>
    </h1>
     <div class="pag-boton">
          <form action="usuario" method="post">
                <button type="submit" name="opcion" value="salir" class="btn">Salir</button>
            </form>
        </div>
           
  </div>
