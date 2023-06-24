package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;

import DAO.DAOFactory;
import Models.ComentarioDTO;
/**
 * Servlet implementation class ComentarioServlet
 */
@WebServlet(name="CRUD COMENTARIO", urlPatterns = {"/comentario"})

public class ComentarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComentarioServlet() {
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
					registrarComentario(request,response); 
					break;
		case "del":  
			eliminarComentario(request,response); 
			break;
		case "act":  
			editarComentario(request,response); 
			break;
		default:
			throw new IllegalArgumentException("Unexpected value: " + opcion);
		}

	}

	private void editarComentario(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void eliminarComentario(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void registrarComentario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int ok ;
		String url = "";
		String mensaje = "";
		
		
		int idEvento = Integer.parseInt( request.getParameter("idEvento"));
		int idOrg = Integer.parseInt( request.getParameter("org"));
		int idUsuario= Integer.parseInt(request.getParameter("idPersona"));
		String contenido = request.getParameter("txtComentario");
		String fechaActual =  LocalDateTime.now().toString();

		
		ComentarioDTO comentario = new ComentarioDTO(idEvento,idUsuario,contenido,fechaActual);
		
		
		DAOFactory fabric = DAOFactory.getDaoFactory(DAOFactory.MySQL);
		
		ok = fabric.getComentarioDAO().registrar(comentario);
		
		if(ok==0) {
			mensaje+= "<script> alert('"+"Error al registrar el comentario, revisar"+"')</script>";
		}else {
			mensaje+=" <script> alert('"+"Comentario agregado " +"') </script>";
		}
		
		
		
		request.setAttribute("mensaje", mensaje);
		
		url = "evento?opcion=bus&org="+ idOrg +"&url=ver&usuario="+idUsuario+"";
		request.getRequestDispatcher(url).forward(request, response);;
		
	}

}
