package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.ServletContext;

import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import DAO.DAOFactory;
import DAO.EventoDAO;
import DAO.OrganizadorDAO;
import DAO.UsuarioDAO;
import Models.AsistenteDTO;
import Models.EventoDTO;
import Models.OrganizadorDTO;
import Models.UsuarioDTO;

/**
 * Servlet implementation class EventoServlet
 */
@WebServlet(name="CRUD EVENTOS", urlPatterns = {"/evento"})
@MultipartConfig(maxFileSize = 1024 * 1024 * 10) // Tamaño máximo de la imagen (10 MB ) 

public class EventoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventoServlet() {
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
		case "irReg":
			cargarRegistroEvento(request,response);
			break;
		
		case "reg":  
					registrarEvento(request,response); 
					break;
		case "bus":
			buscarEvento(request,response); 
			break;
		case "lis":  
			listarEvento(request,response); 
			break;
		case "cancelEdit":  
			cancelarEdit(request,response); 
			break;
		case "edit":  
			Actualizar(request,response); 
			break;
		case "eli":  
			Eliminar(request,response); 
			break;
		case "sal":
				salir(request,response); 
				break;
	 

	 
		default:
			throw new IllegalArgumentException("Unexpected value: " + opcion);
		}
		
	
	}
	private void Eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//variables
		String mensaje="";
		String url;
		
		//Entradas
		int codigo=   Integer.parseInt(request.getParameter("cod"));
	  
		
		//Obtenemos la fabrica DAO 
		DAOFactory fabrica = DAOFactory.getDaoFactory(DAOFactory.MySQL);
		EventoDAO daoEve = fabrica.getEventoDAO();
		OrganizadorDAO daoOrg = fabrica.getOrganizadorDAO();
		//Procesos 
		
		//Primero eliminamos al organizador
		int ok2 = daoOrg.eliminar(codigo);
		
		int ok=daoEve.eliminar(codigo);
		
		if(ok==0) {
			mensaje+=" <script> alert('"+" Error al eliminar los datos" +"') </script>";
			 
		}else {
			mensaje+=" <script> alert('"+"Eliminación del Vendedor  "+codigo+" OK" +"') </script>";
		 
		}
		
		if(ok2==0) {
			mensaje+=" <script> alert('"+" Error al eliminar los datos" +"') </script>";
			 
		}else {
			mensaje+=" <script> alert('"+"Eliminación del Organizador  "+codigo+" OK" +"') </script>";
		 
		}
		
		
		url="evento?opcion=lis&url=verGeneral";
		request.setAttribute("mensaje", mensaje);
		request.getRequestDispatcher(url).forward(request, response);		 

		
	}

	private void Actualizar(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


		//Var
		String mensaje = "";
		String url = "";
		int ok = 5;
		//Entradas
		try {
		
			
		String nombre= request.getParameter("txtNombre");
		String descripcion= request.getParameter("txtDescripcion");
		String ubicacion= request.getParameter("txtUbicacion");
		
		//Codigo especial para la imagen :D
		Part archivoImagen = request.getPart("txtImagen");
		InputStream imagen = archivoImagen.getInputStream(); //ruta de la imagen que se cargara a la BD

		
		String fechaIni= request.getParameter("txtFechaIni");
		String fechaFin= request.getParameter("txtFechaFin");
		int categoria= Integer.parseInt(request.getParameter("txtCategoria"));
		int idEvento = Integer.parseInt(request.getParameter("cod"));
		
		System.out.println("Nombre: " + nombre);
		System.out.println("Descripción: " + descripcion);
		System.out.println("Ubicación: " + ubicacion);
		System.out.println("Imagen 1: " + archivoImagen); // Este es solo un ejemplo de impresión, la salida real puede variar según tus necesidades
		System.out.println("Imagen: " + imagen); // Este es solo un ejemplo de impresión, la salida real puede variar según tus necesidades
		System.out.println("Fecha de Inicio: " + fechaIni);
		System.out.println("Fecha de Fin: " + fechaFin);
		System.out.println("ID de Categoría: " + categoria);
		//Fabrica
		DAOFactory fabrica = DAOFactory.getDaoFactory(DAOFactory.MySQL);
		EventoDAO dao = fabrica.getEventoDAO();
		

			
			
			
			
		EventoDTO e = new EventoDTO(idEvento,nombre,descripcion,ubicacion,imagen,fechaIni,fechaFin,categoria);
		ok=dao.actualizar(e);
						 
			 System.out.println(ok);
		} catch (Exception e) {
			System.out.print(""+e.getMessage());
		}
		

		//Procesos 
		
		
		if(ok==0) {
			mensaje+= "<script> alert('"+"Error al actualizar el evento, revisar"+"')</script>";
			
			request.setAttribute("mensaje", mensaje);

			buscarEvento(request, response);
		}else {
			mensaje+=" <script> alert('"+"Registro del evento <strong>"+ "s" +"</strong> OK " +"') </script>";
			url="evento?opcion=lis&url=ver";
			request.setAttribute("mensaje", mensaje);

			request.getRequestDispatcher(url).forward(request, response);
		}


		
	}

	private void cancelarEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "evento?opcion=lis&url=ver";
		
		request.getRequestDispatcher(url).forward(request, response);

		
		
	}

	private void buscarEvento(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ruta = "";
		String url = (String) request.getParameter("url");
		DAOFactory fabrica = DAOFactory.getDaoFactory(DAOFactory.MySQL);

		switch (url) {
		case "edit": {
			
			int idEvento = Integer.parseInt(request.getParameter("cod"));

					
			EventoDTO evento = fabrica.getEventoDAO().buscarEvento(idEvento);
			
			request.setAttribute("evento", evento);
			
			 ruta = "webs/Menu_Usuario_AdminEventos_Editar.jsp";
			
			break;
		}
		case "ver": { //Ver y Cargar evento 
			
			int idOrganizador = Integer.parseInt(request.getParameter("org"));
			int idUsuarioPersona = Integer.parseInt(request.getParameter("usuario"));

			
			OrganizadorDTO org = fabrica.getOrganizadorDAO().buscarOrganizador(idOrganizador);
			
			request.setAttribute("organizador",org);
			request.setAttribute("usuario",idUsuarioPersona);

			 ruta = "webs/MenuUsuario_VistaEventosPublico.jsp";
			
			
			break;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + url);
		}
		
		request.getRequestDispatcher(ruta).forward(request, response);	

		
	}

	private void listarEvento(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url ="";
		
	
		ArrayList<EventoDTO> lstaEvento = new ArrayList<EventoDTO>();
		try {	
		
			DAOFactory fabrica = DAOFactory.getDaoFactory(DAOFactory.MySQL);

			
			ArrayList<OrganizadorDTO> lstaOrganizador = (ArrayList<OrganizadorDTO>) request.getSession().getAttribute("listaOrganizador");
			
			if (lstaOrganizador!= null) {
					
				for (OrganizadorDTO o : lstaOrganizador) {
					try {
						

					EventoDTO e = fabrica.getEventoDAO().buscarEvento(o.getIdEvento());

					
					lstaEvento.add(e);
					} catch (Exception e) {
						System.out.println(e.getMessage());
					}
				}
			}else {
				System.out.println("hay nulidad de eventos");
			}

			
			
			
			String opcionURL = (String) request.getParameter("url");
			
			
			switch (opcionURL) {
			case "ver" :
				url = "webs/AdministrarEvento_EventoRegistrados.jsp";
				break;
			case "verGeneral" :
				UsuarioDTO u  = (UsuarioDTO) request.getSession().getAttribute("datousu");
				request.setAttribute("usuario", u);
				
				
				url = "webs/MenuUsuario_AdminEventos.jsp";
				break;
			default:
				throw new IllegalArgumentException("Unexpected value: " + opcionURL);
			}
		} catch (Exception e) {
			 System.out.println("Error al listar Evento > en la sentencia "+e.getMessage());
		}
		
		
		request.setAttribute("listaDeEventosDelUsuario", lstaEvento);

		request.getRequestDispatcher(url).forward(request, response);
		
		
		
	}

	private void cargarRegistroEvento(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "webs/FormCrearEvento.jsp";
		request.getRequestDispatcher(url).forward(request, response);

		
	}

	private void registrarEvento(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		//variables
		String mensaje="";
		String url;
	
		//Entradas
		String nombre= request.getParameter("txtNombre");
		String descripcion= request.getParameter("txtDescripcion");
		String ubicacion= request.getParameter("txtUbicaion");
		
		//Codigo especial para la imagen :D
		Part archivoImagen = request.getPart("txtImagen");
		InputStream imagen = archivoImagen.getInputStream(); //ruta de la imagen que se cargara a la BD
		
		System.out.println("Imagen: " + imagen); // Este es solo un ejemplo de impresión, la salida real puede variar según tus necesidades

		String fechaIni= request.getParameter("txtFechaIni");
		String fechaFin= request.getParameter("txtFechaFin");
		int categoria= Integer.parseInt(request.getParameter("txtCategoria"));
				
		EventoDTO e = new EventoDTO(nombre,descripcion,ubicacion,imagen,fechaIni,fechaFin,categoria);
		
		//Obtenemos la fabrica DAO 
	    DAOFactory fabrica = DAOFactory.getDaoFactory(DAOFactory.MySQL);
		EventoDAO daoEve = fabrica.getEventoDAO();
		OrganizadorDAO daoOrg = fabrica.getOrganizadorDAO();
		
		
		//Obtener datos Usu
		UsuarioDTO u  = (UsuarioDTO) request.getSession().getAttribute("datousu");
		
		
		
		//Procesos 
		int ok=daoEve.registrar(e);
		
		//Recuperamos el EventoRegistrado(con su id)
		
		EventoDTO ultEve = daoEve.UltimoCodigo();
		
		//Registramos la tabla Organizador
		
		
		int okOrg = daoOrg.registrar(u, ultEve);
		

		if(ok==0) {
			mensaje+= "<script> alert('"+"Error al registrar el evento, revisar"+"')</script>";
			url="evento?opcion=irReg";
		}else {
			mensaje+=" <script> alert('"+"Registro del evento <strong>"+ nombre +"</strong> OK " +"') </script>";
			url="webs/MenuUsuario_AdminEventos.jsp";
		}
		
		
		if(okOrg==0) {
			mensaje+= "<script> alert('"+"Error al registrar el organizador, revisar"+"')</script>";
			url="webs/FormCrearEvento.jsp";
		}else {
			mensaje+=" <script> alert('"+"Registro del organizador <strong>"+ nombre +"</strong> OK " +"') </script>";
			url="webs/MenuUsuario_AdminEventos.jsp";
		}
		
		request.setAttribute("mensaje", mensaje);
		request.setAttribute("usuario", u);
		request.getRequestDispatcher(url).forward(request, response);
	}

	private void salir(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "webs/MenuUsuario_AdminEventos.jsp";	
		
		request.getRequestDispatcher(url).forward(request, response);
		
		
		
	}

}
