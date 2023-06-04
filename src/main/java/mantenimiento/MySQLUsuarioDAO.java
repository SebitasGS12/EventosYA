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
			pst.setString(4, u.getContraseñaUsu());
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

}
