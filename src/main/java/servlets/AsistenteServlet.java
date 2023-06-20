package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Date;

import DAO.AsistenteDAO;
import DAO.DAOFactory;
import DAO.EventoDAO;
import DAO.OrganizadorDAO;
import Models.AsistenteDTO;
import Models.UsuarioDTO;

/**
 * Servlet implementation class AsistenteServlet
 */
@WebServlet(name="CRUD Asistente", urlPatterns = {"/asistente"})

public class AsistenteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AsistenteServlet() {
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
							registrarAsistencia(request,response); 
							break;
				case "del":  
					eliminarAsistencia(request,response); 
					break;
				default:
					throw new IllegalArgumentException("Unexpected value: " + opcion);
				}
		
		
		
	}

	private void eliminarAsistencia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mensaje="";
		String url;
		int ok = 0;

		
		//Entradas
		UsuarioDTO u  = (UsuarioDTO) request.getSession().getAttribute("datousu");
		
		
		int idUsuario= u.getIdUsuario();
		int idEvento = Integer.parseInt(request.getParameter("idEvento"));
		int codOrg = Integer.parseInt(request.getParameter("org"));
		
		System.out.println(codOrg +" "+ idEvento +" "+idUsuario);
		
		String fechaActual =  LocalDateTime.now().toString();
	  
		
		//Obtenemos la fabrica DAO 
		DAOFactory fabrica = DAOFactory.getDaoFactory(DAOFactory.MySQL);
		AsistenteDAO daoAsis = fabrica.getAsistenteDAO();
		
		AsistenteDTO asistente = daoAsis.validarAsistencia(idUsuario, idEvento);
		
		//Procesos 
		

		ok =daoAsis.eliminarAsistencia(asistente.getIdAsistente());
		
		if(ok==0) {
			mensaje+=" <script> alert('"+" Error al eliminar los datos" +"') </script>";
			 
		}else {
			mensaje+=" <script> alert('"+"Eliminación de la Asistencia  "+ asistente.getIdAsistente() +" OK" +"') </script>";
		 
		}
		
		
		
		url = "evento?opcion=bus&org="+ codOrg +"&url=ver&usuario="+idUsuario+"";
		
		request.setAttribute("mensaje", mensaje);
		request.getRequestDispatcher(url).forward(request, response);		 

		
		
	}

	private void registrarAsistencia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mensaje = "";
		String url = "";
		int ok = 0;

		UsuarioDTO u  = (UsuarioDTO) request.getSession().getAttribute("datousu");
		
		
		int idUsuario= u.getIdUsuario();
		int idEvento = Integer.parseInt(request.getParameter("idEvento"));
		int codOrg = Integer.parseInt(request.getParameter("org"));
		
		System.out.println(codOrg +" "+ idEvento +" "+idUsuario);
		
		String fechaActual =  LocalDateTime.now().toString();
		
		AsistenteDTO asistente = new AsistenteDTO(idUsuario,idEvento,fechaActual);
		DAOFactory fabrica = DAOFactory.getDaoFactory(DAOFactory.MySQL);
		
		
		String nombreUser = fabrica.getUsuarioDAO().buscarUsuario(idUsuario).getNombreUsu().toString() + " " + fabrica.getUsuarioDAO().buscarUsuario(idUsuario).getApellidoUsu();
		
		ok = fabrica.getAsistenteDAO().registrarAsistencia(asistente);
		
		if(ok==0) {
			mensaje+=" <script> alert('"+" Error al registrar al asistente" +"') </script>";
			 
		}else {
			mensaje+=" <script> alert('"+"Registro del Asistente ->"+nombreUser +" OK" +"') </script>";
		 
		}
		

		
		request.setAttribute("mensaje", mensaje);
		
		url = "evento?opcion=bus&org="+ codOrg +"&url=ver&usuario="+idUsuario+"";
		request.getRequestDispatcher(url).forward(request, response);;
			
	}

}
