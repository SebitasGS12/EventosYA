package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.MultipartConfig;

import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import Models.CiudadDTO;
import Models.EventoDTO;
import Models.UsuarioDTO;

import java.io.IOException;

import DAO.DAOFactory;
import DAO.UsuarioDAO;




/**
 * Servlet implementation class UsuarioServlet
 */

@WebServlet(name="usuario", urlPatterns = {"/usuario"})
@MultipartConfig(maxFileSize = 1024 * 1024 * 10) // Tamaño máximo de la imagen (10 MB ) 

public class UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UsuarioDTO user = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsuarioServlet() {
        super();
        // TODO Auto-generated constructor stub

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String opcion =request.getParameter("opcion");
		
		
		
		System.out.println(" opcion -->" +opcion);
		 
		switch (opcion) {
		case "reg":  
					registrarUsurio(request,response); 
					break;
		case"log":
					validarUsuario(request,response); 
					break;
		case "busUsu":
			buscarUsuario(request,response); 
		case"actUsu":
			       actualizarUsuario(request,response); 
			       break;
		case"link":
		       irAPagina(request,response); 
		       break;	      
					
		case"modContra":
		       modificarContrasenia(request,response); 
		       break;
				
		case"salir":
				salir(request,response); 
				break;
	 
		default:
			throw new IllegalArgumentException("Unexpected value: " + opcion);
		}
		 
	}

private void irAPagina(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

		String ruta = request.getParameter("val");
		String url = "";
		UsuarioDTO usuario = user;
		
		switch (ruta) {
		case "irMenu": {
			url = "webs/MenuUsuario_Menu.jsp";
			break;
		}
		case "irEdit": {
			url = "webs/MenuUsuario_AdminEventos.jsp";
			break;
		}
		case "irConfig": {
			url="webs/MenuUsuario_Config_Contra.jsp";
			break;
			
		}case "irConfirm" :{
			url="webs/ConfirmarRegistro.jsp";
			break;
		}
		
		default:
			throw new IllegalArgumentException("Unexpected value: " + ruta);
		}
		request.getSession().setAttribute("datousu", usuario);	

		request.getRequestDispatcher(url).forward(request, response);	

	}

	//Humberto
	private void modificarContrasenia(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		//variables
		String mensaje="";
		String url;
		
		//Entradas
		int codigo=  Integer.parseInt(request.getParameter("txtcodigo"));
		String contra= request.getParameter("txtcontra");
		String nuevacontra= request.getParameter("txtnuecontra");
		
		
		System.out.println("codigo "+codigo);
		System.out.println("contra"+contra);
		System.out.println("nuevacontra "+nuevacontra);
		System.out.println("confirmarcontra "+nuevacontra);

		//Obtenemos la fabrica DAO 
		DAOFactory fabrica = DAOFactory.getDaoFactory(DAOFactory.MySQL);
		UsuarioDAO dao = fabrica.getUsuarioDAO();

		//Contructor con  parámetros
		UsuarioDTO m = new UsuarioDTO(codigo,nuevacontra); 
	  
		//Procesos
		int ok=dao.ModificarContrasenia(m);
		
		if(ok==0) {
			mensaje+=" <script> alert('"+" Error al actualizar" +"') </script>";
			url="webs/MenuUsuario_Config_Contra.jsp";
		}else {
			mensaje+=" <script> alert('"+"Actualización correcta  "+codigo+" OKEY" +"') </script>";
			url = "webs/Menu_IniciarSesion.jsp";	
		}
		
		request.setAttribute("mensaje", mensaje);
		request.getRequestDispatcher(url).forward(request, response);	
		
	}

	private void actualizarUsuario(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
	//Humberto 
		//variables
		String mensaje="";
		String url;
		
		//Entradas
		int codigo=  Integer.parseInt(request.getParameter("txtid"));
		String nombre= request.getParameter("txtnombre");
		String apellidoUsu= request.getParameter("txtapellido");
		String correoUsu= request.getParameter("txtcorreo");
		
		
		System.out.println("codigo "+codigo);
		System.out.println("nombre "+nombre);
		System.out.println("apellido "+apellidoUsu);
		System.out.println("correoUsu "+correoUsu);

		//Obtenemos la fabrica DAO 
		DAOFactory fabrica = DAOFactory.getDaoFactory(DAOFactory.MySQL);
		UsuarioDAO dao = fabrica.getUsuarioDAO();

		//Contructor con  parámetros
		UsuarioDTO a = new UsuarioDTO(codigo,nombre,apellidoUsu,correoUsu); 
	  
		//Procesos
		int ok=dao.actualizarUsuario(a);
		
		if(ok==0) {
			mensaje+=" <script> alert('"+" Error al actualizar" +"') </script>";
		    url="usuario?opcion=link&val=irConfig";
		    
		}else {
			mensaje+=" <script> alert('"+"Actualización correcta  "+nombre+" OKEY" +"') </script>";
			url = "webs/Menu_IniciarSesion.jsp";	
		    
		}
		
		request.setAttribute("mensaje", mensaje);
		request.getRequestDispatcher(url).forward(request, response);	
	}

	private void salir(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "webs/Menu_inicio.jsp";	
		
		request.getRequestDispatcher(url).forward(request, response);
		
		
	}

	private void validarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		//Variables
		String mensaje ="",url="";
		
		//Entrada de Datos
		String usuario = request.getParameter("txtCorreo");
		String clave= request.getParameter("txtContra");

		System.out.println(usuario);
		System.out.println(clave);

		//Proceso
		DAOFactory fabrica = DAOFactory.getDaoFactory(DAOFactory.MySQL);
		UsuarioDTO u = fabrica.getUsuarioDAO().validar(usuario, clave);
		user = u;
		
		
		if (u!=null) {
			mensaje += "<script>alert('"+"Bienvenido"+u.getNombreUsu()+"');</script>";
			url = "webs/MenuUsuario_Menu.jsp";
			//Mostrar Informacion
			HttpSession miSession= request.getSession();
			System.out.println("ID Session " + miSession.getId());
			System.out.println("Fecha --- " +  new SimpleDateFormat().format(miSession.getCreationTime()));
			System.out.println("Duracion ---" + miSession.getMaxInactiveInterval() );
			
			ServletContext serverContext = getServletContext();
			serverContext.setAttribute("datousu", u);
			
			request.getSession().setAttribute("mensaje", mensaje);
			request.getSession().setAttribute("datousu", u);	
			
			
			
		}else {
			mensaje += "<script>alert(' Usuario o clave incorrecto');</script>";
			url = "webs/Menu_IniciarSesion.jsp";	
			
			request.getSession().setAttribute("mensaje",mensaje);

		}
	
		
		//Salida a la pagina principal
		request.getRequestDispatcher(url).forward(request, response);
	}

	private void registrarUsurio(HttpServletRequest request, HttpServletResponse response)  throws IOException, ServletException {
		
		//variables
		String mensaje="";
		String url;
		int ok =0 ;
		//Entradas
		String nombre= request.getParameter("txtNombre");
		String apellido= request.getParameter("txtApellidos");
		String correo= request.getParameter("txtCorreo");
		String contraseña= request.getParameter("txtContrasenia");
		String pais= request.getParameter("pais");
		String ciudad= request.getParameter("ciudad");
		String genero= request.getParameter("genero");
		Part archivoImagen = request.getPart("txtImagen");
		InputStream imagen = archivoImagen.getInputStream(); //ruta de la imagen que se cargara a la BD

		
		UsuarioDTO u = new UsuarioDTO(nombre,apellido,correo,contraseña,pais,ciudad,genero,imagen);
		user = u;
		
		//Obtenemos la fabrica DAO 
	    DAOFactory fabrica = DAOFactory.getDaoFactory(DAOFactory.MySQL);
		UsuarioDAO dao = fabrica.getUsuarioDAO();
				
		//Procesos 
		
		try {
			 ok=dao.registrar(u);
			
		} catch (Exception e) {
			e.printStackTrace();

		}
		
		if(ok==0) {
			mensaje+="Error al registrar los datos, revisar";
			url="webs/Menu_inicio.jsp";
		}else {
			mensaje+=" <script> alert('"+"Registro del usuario <strong>"+nombre+"</strong> OK, ingrese al sistema" +"') </script>";
			url="usuario?opcion=link&val=irConfirm";
		}
		
		request.setAttribute("mensaje", mensaje);
		
		request.getSession().setAttribute("datousu", u);	
		request.getRequestDispatcher(url).forward(request, response);

		
	}
	//Buscar -Humberto
	private void buscarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idUsuario = Integer.parseInt(request.getParameter("txtid"));

		DAOFactory fabrica = DAOFactory.getDaoFactory(DAOFactory.MySQL);
		
		UsuarioDTO usuario = fabrica.getUsuarioDAO().buscarUsuario(idUsuario);
		
		request.setAttribute("usuario",usuario);
		
		request.getRequestDispatcher("webs/MenuUsuario_Config_Perfil.jsp").forward(request, response);	
		
	}

}
