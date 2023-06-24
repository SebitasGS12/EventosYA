package mantenimiento;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import DAO.UsuarioDAO;

import Models.EventoDTO;

import Models.OrganizadorDTO;

import Models.UsuarioDTO;
import jakarta.servlet.http.HttpServletRequest;  //esto
import jakarta.servlet.http.HttpSession; //esto pruebas
import Coneccion.MysqlConector;

public class MySQLUsuarioDAO implements UsuarioDAO {

	@Override
	public int registrar(UsuarioDTO u) {

		
		int rs = 0;
		Connection con = null;
		PreparedStatement pst = null;
		
		try {
			con = MysqlConector.getConexion();
			String sql = " insert into Usuarios values (null,?,?,?,?,?,?,?,?) ";
			pst = con.prepareStatement(sql);
			
			pst.setString(1, u.getNombreUsu());
			pst.setString(2, u.getApellidoUsu());
			pst.setString(3, u.getCorreoUsu());
			pst.setString(4, u.getContraseniaUsu());
			pst.setString(5, u.getPaisUsu());
			pst.setString(6, u.getCiudadUsu());
			pst.setString(7, u.getGeneroUsu()); 
			pst.setBlob(8, u.getImagenUsuario());
			
			
			System.out.println(u.getImagenUsuario());
			rs =pst.executeUpdate();
			
		} catch (Exception e) {
			
			  System.out.println("Error al agregar Usuraio -> en la sentencia "+e.getMessage());
		}finally {
			try {
				if(pst!=null)pst.close();
				if(con!=null)con.close();
			} catch (SQLException e2) {
				System.out.println("Error al cerrar "+e2.getMessage());
			}
		}
		
		return rs;
	}

	@Override
	public UsuarioDTO validar(String usuario, String clave) {
		UsuarioDTO u = null;
		Connection con= null;
		PreparedStatement pst=null;
		ResultSet rs = null;
		
		try {
			
			con=MysqlConector.getConexion();
			String sql = "{call usp_validaAcceso(?,?)}";
			pst = con.prepareStatement(sql);
			
			//Parametros
			
			pst.setString(1, usuario);
			pst.setString(2, clave);
			
			//Ejecucion
			
			rs=pst.executeQuery();
			while(rs.next()) {
				u = new UsuarioDTO();
				u.setIdUsuario(Integer.parseInt(rs.getString(1)));
				u.setNombreUsu(rs.getString(2));
				u.setApellidoUsu(rs.getString(3));
				u.setCorreoUsu(rs.getString(4));
				u.setContraseniaUsu(rs.getString(5));
				u.setPaisUsu(rs.getString(6));
				u.setCiudadUsu(rs.getString(7));
				u.setGeneroUsu(rs.getString(8));
				
				
			}
			
			
		} catch (Exception e) {
			  System.out.println("Error en la sentencia "+e.getMessage());
		}finally {
			try {
				if(pst!=null)pst.close();
				if(con!=null)con.close();
				if (rs!=null)rs.close();	
				
			} catch (SQLException e2) {
				System.out.println("Error al cerrar "+e2.getMessage());
			}	
		}
		return u;
	}
	//Actualizar  Nombre
	@Override
	public int actualizarUsuario(UsuarioDTO a) {
		int rso=0;
		Connection cone= null;
		PreparedStatement prst=null;
		
		try {
			cone=MysqlConector.getConexion();
			String sql="update  Usuarios  set nombreUsu=?,apellidoUsu=?,correoUsu=? where idUsuario=?";
			prst=cone.prepareStatement(sql);
			
			//Parametrizar en el orden de los signos de ?  inicia en 1
			
			prst.setString(1, a.getNombreUsu());
			prst.setString(2, a.getApellidoUsu());
			prst.setString(3, a.getCorreoUsu());
			prst.setInt(4, a.getIdUsuario());
			 
			//Para Ejecutarlo
			rso=prst.executeUpdate();	
			
		} catch (Exception e) {
		  System.out.println("Error en la sentencia "+e.getMessage());
		}finally{
			try {
				if(prst!=null)prst.close();
				if(cone!=null)cone.close();
			} catch (SQLException e2) {
				System.out.println("Error al cerrar "+e2.getMessage());
			}	
		}
		
		return rso;
	}
	
	@Override
	public int ModificarContrasenia(UsuarioDTO m) {
		int rso=0;
		Connection cone= null;
		PreparedStatement prst=null;
		
		try {
			cone=MysqlConector.getConexion();
			String sql="update  Usuarios  set contraseñaUsu=? where idUsuario=?";
			prst=cone.prepareStatement(sql);
			
			//Parametrizar en el orden de los signos de ?  inicia en 1
			
			prst.setString(1, m.getContraseniaUsu());
			prst.setInt(2, m.getIdUsuario());
			 
			//Para Ejecutarlo
			rso=prst.executeUpdate();	
			
		} catch (Exception e) {
		  System.out.println("Error en la sentencia "+e.getMessage());
		}finally{
			try {
				if(prst!=null)prst.close();
				if(cone!=null)cone.close();
			} catch (SQLException e2) {
				System.out.println("Error al cerrar "+e2.getMessage());
			}	
		}
		
		return rso;
	}

	@Override
	public UsuarioDTO buscarUsuario(int codigo) {
		// TODO Auto-generated method stub
		UsuarioDTO p = null;
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pst = null;
		
		try {
			con = MysqlConector.getConexion();
			String sql = " select idUsuario, nombreUsu, apellidoUsu, correoUsu, contraseñaUsu, paisUsu, ciudadUsu, generoUsu ,imagenUsu from usuarios where idUsuario =  ? ";
			pst = con.prepareStatement(sql);
			pst.setInt(1, codigo);

			
			rs=pst.executeQuery();	
			
			while (rs.next()) {
				 
				  p= new UsuarioDTO(
					rs.getInt(1),
					rs.getString(2),
					rs.getString(3),
					rs.getString(4),
					rs.getString(5),
					rs.getString(6),
					rs.getString(7),
					rs.getString(8),
					rs.getBinaryStream(9));

			}
			


			
		} catch (Exception e) {
			
			  System.out.println("Error al buscar Usuario > en la sentencia "+e.getMessage());
		}finally {
			try {
				if(pst!=null)pst.close();
				if(rs!=null)rs.close();
				if(con!=null)con.close();
			} catch (SQLException e2) {
				System.out.println("Error al cerrar "+e2.getMessage());
			}
		}
	
		
		
		return p;
	}

	@Override
	public String ConvertirIMG(InputStream imagenInputStream) {
		
		String imagenBase64= "";
		
		
		System.out.println(imagenInputStream);
		 if(imagenInputStream != null){
			 ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
			 byte[] buffer = new byte[4096];
			 int bytesRead;
			 try {
				while ((bytesRead = imagenInputStream.read(buffer)) != -1) {
				     byteArrayOutputStream.write(buffer, 0, bytesRead);
				 }
				 byte[] imagenBytes = byteArrayOutputStream.toByteArray();
				 System.out.println(imagenBase64);

				 
				 try {
					
					 imagenBase64 = "data:image/jpeg;base64,"+java.util.Base64.getEncoder().encodeToString(imagenBytes);
				} catch (Exception e) {
					e.printStackTrace();
				}
				 // Convertir los bytes de la imagen a una cadena Base64
				 System.out.println(imagenBase64);

				 // Cerrar el InputStream y el ByteArrayOutputStream
				 imagenInputStream.close();
				 byteArrayOutputStream.close();
				 
				 if (imagenBase64.equals("data:image/jpeg;base64,")) {
					 imagenBase64 = "/EventosYa/imgs/imagenEditarEvento.png";
				 }
				 
				 
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		 }else {
			 imagenBase64 = "/EventosYa/imgs/imagenEditarEvento.png";
			 
			 
		 }
		 
		 System.out.println(imagenBase64);
		 
		 return imagenBase64;
	}

}
