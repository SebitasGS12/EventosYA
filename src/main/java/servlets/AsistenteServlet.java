package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Date;

import DAO.DAOFactory;
import Models.AsistenteDTO;

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
				default:
					throw new IllegalArgumentException("Unexpected value: " + opcion);
				}
		
		
		
	}

	private void registrarAsistencia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mensaje = "";
		String url = "";
		int ok = 0;

		
		int idUsuario= Integer.parseInt(request.getParameter("idUser"));
		int idEvento = Integer.parseInt(request.getParameter("idEvento"));
		int codOrg = Integer.parseInt(request.getParameter("cod"));
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
		
		request.getRequestDispatcher("evento?opcion=bus&cod="+ codOrg +"&url=ver").forward(request, response);;
		
	}

}
