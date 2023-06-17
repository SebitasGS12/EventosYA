package mantenimiento;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import DAO.UsuarioDAO;
import Models.UsuarioDTO;
import Coneccion.MysqlConector;

public class MySQLUsuarioDAO implements UsuarioDAO {

	@Override
	public int registrar(UsuarioDTO u) {

		
		int rs = 0;
		Connection con = null;
		PreparedStatement pst = null;
		
		try {
			con = MysqlConector.getConexion();
			String sql = " insert into Usuarios values (null,?,?,?,?,?,?,?) ";
			pst = con.prepareStatement(sql);
			
			pst.setString(1, u.getNombreUsu());
			pst.setString(2, u.getApellidoUsu());
			pst.setString(3, u.getCorreoUsu());
			pst.setString(4, u.getContraseniaUsu());
			pst.setString(5, u.getPaisUsu());
			pst.setString(6, u.getCiudadUsu());
			pst.setString(7, u.getGeneroUsu());
			
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

}
