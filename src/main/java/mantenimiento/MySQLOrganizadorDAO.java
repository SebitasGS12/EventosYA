package mantenimiento;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Coneccion.MysqlConector;
import DAO.OrganizadorDAO;
import Models.OrganizadorDTO;

public class MySQLOrganizadorDAO implements OrganizadorDAO {

	@Override
	public int registrar(OrganizadorDTO u) {
		int rs = 0;
		PreparedStatement pst =null;
		Connection cn = null;
		
		try {
			
			cn =MysqlConector.getConexion();
			
			String sql = " insert into organizador values (null,?,?)";
			pst = cn.prepareStatement(sql);
			

			pst.setInt(1, u.getIdUsuario() );
			pst.setInt(2, u.getIdEvento() );
			
			rs = pst.executeUpdate();
			
			
			
			
		} catch (Exception e) {
			  System.out.println("Error al agregar Organizador -> en la sentencia "+e.getMessage());
		}finally {
			try {
				if(pst!=null)pst.close();
				if(cn!=null)cn.close();
			} catch (SQLException e2) {
				System.out.println("Error al cerrar "+e2.getMessage());
			}
		}
		
		return rs;
	}

}
