<style >

	@import url('https://fonts.googleapis.com/css2?family=Lexend&display=swap');

		*{
		padding: 0;
		margin: 0;
		box-sizing: border-box;
		font-family: 'Lexend', sans-serif;
	
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
<aside class="pag-aside">
	 <div class="aside-item aside-item-active">
	     <img src="imgs/asideMenu.png" alt="">
	     <h2>Menu</h2>
	 </div>
	 <div class="aside-item ">
	     <img src="imgs/asideAdminEventos.png" alt="">
	     <h2>Administrar<br>Eventos</h2>
	 </div>
	 <div class="aside-item ">
	     <img src="imgs/asideConfig.png" alt="">
	     <h2>Configuracion<br>de Cuenta</h2>
	 </div>
</aside>
