package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;

import DAO.AsistenteDAO;
import DAO.ComentarioDAO;
import DAO.DAOFactory;
import DAO.EventoDAO;
import DAO.OrganizadorDAO;

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
	private static int user ;
       
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
		case "exportar":
			exportar(request,response);
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
		case "buscador":
			buscarFiltro(request,response); 
			break;
		case "sal":
				salir(request,response); 
				break;
	 

	 
		default:
			throw new IllegalArgumentException("Unexpected value: " + opcion);
		}
		
	
	}
	private void exportar(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException {
		// TODO Auto-generated method stub
		int idOrg = Integer.parseInt(request.getParameter("id"));
		String url = "";
		int resultado = 1;
		
		response.setContentType("application/pdf");

		OutputStream out = response.getOutputStream();
		try {
			
			DAOFactory fabrica = DAOFactory.getDaoFactory(DAOFactory.MySQL);
			OrganizadorDTO org = fabrica.getOrganizadorDAO().buscarOrganizador(idOrg);
			
			EventoDAO dao = fabrica.getEventoDAO();

			
			resultado = dao.crearPDF(out,org.getIdEvento());
		} catch (Exception e) {
			e.printStackTrace();
	        throw new ServletException("Error al crear el PDF", e);
	    } finally {
	        if (out != null) {
	        	 try {
	                 out.flush(); // Asegurarse de que todos los datos se hayan enviado al navegador
	             } catch (IOException e) {
	                 e.printStackTrace();
	             }
	             out.close(); // Cerrar el OutputStream
	         }
	    }

	    System.out.println(resultado);
		
		
	}

	private void buscarFiltro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String mensaje = "";
		String url = "";
		ArrayList<OrganizadorDTO> listaFiltro = null;
		String  texto = request.getParameter("texto");
		int  usuario  = Integer.parseInt( request.getParameter("usuario"));
		
		try {	
			
			DAOFactory fabrica = DAOFactory.getDaoFactory(DAOFactory.MySQL);
			OrganizadorDAO dao = fabrica.getOrganizadorDAO();
			listaFiltro = dao.buscarPorFiltro(texto);
			
			if (listaFiltro.size() == 0) {
				mensaje  ="<script> alert('Evento No Existe') </script>";
				url="webs/MenuUsuario_Menu.jsp";

			
			}else {
				url = "webs/Menu_Usuario_Menu_BusquedaExistente.jsp";
				
				
			}
			
			

		} catch (Exception e) {
			
			 System.out.println("Error al listar Evento > en la sentencia "+e.getMessage());
		}
		
		
		
		
		request.setAttribute("listaFiltro", listaFiltro);
		request.setAttribute("usuario", usuario);
		request.setAttribute("mensaje", mensaje);

		request.getRequestDispatcher(url).forward(request, response);
		
		
		
		
		
		
		
		
	}

	private void Eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//variables
		String mensaje="";
		String url;
		
		//Entradas
		int codigoEvento=   Integer.parseInt(request.getParameter("cod"));
	  
		
		//Obtenemos la fabrica DAO 
		DAOFactory fabrica = DAOFactory.getDaoFactory(DAOFactory.MySQL);
		EventoDAO daoEve = fabrica.getEventoDAO();
		OrganizadorDAO daoOrg = fabrica.getOrganizadorDAO();
		AsistenteDAO daoAsis = fabrica.getAsistenteDAO();
		ComentarioDAO daoCom = fabrica.getComentarioDAO();
		//Procesos 
		
		//Primero eliminamos al organizador
		int okOrg = daoOrg.eliminar(codigoEvento);
		int okCom = daoCom.eliminarFromEvento(codigoEvento);
		int okAsistentes = daoAsis.eliminarFromEvento(codigoEvento);
		int okEve =daoEve.eliminar(codigoEvento);
		
		if(okOrg==0 || okCom== 0 || okAsistentes== 0 || okEve==0) {
			mensaje+=" <script> alert('"+" Error al eliminar Evento" +"') </script>";
			 
		}else {
			mensaje+=" <script> alert('"+"Eliminación del Evento  "+codigoEvento+" OK" +"') </script>";
		 
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
		
		

		
		String fechaIni= request.getParameter("txtFechaIni");
		String fechaFin= request.getParameter("txtFechaFin");
		int categoria= Integer.parseInt(request.getParameter("txtCategoria"));
		int idEvento = Integer.parseInt(request.getParameter("cod"));
		
		System.out.println("Nombre: " + nombre);
		System.out.println("Descripción: " + descripcion);
		System.out.println("Ubicación: " + ubicacion);
		System.out.println("Fecha de Inicio: " + fechaIni);
		System.out.println("Fecha de Fin: " + fechaFin);
		System.out.println("ID de Categoría: " + categoria);
		//Fabrica
		DAOFactory fabrica = DAOFactory.getDaoFactory(DAOFactory.MySQL);
		EventoDAO dao = fabrica.getEventoDAO();
		

			
			
			
			
		EventoDTO e = new EventoDTO(idEvento,nombre,descripcion,ubicacion,fechaIni,fechaFin,categoria);
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
