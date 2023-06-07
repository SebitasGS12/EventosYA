package mantenimiento;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Coneccion.MysqlConector;
import DAO.PaisDAO;
import Models.PaisDTO;

public class MySQLPaisDAO implements PaisDAO {

	@Override
	public ArrayList<PaisDTO> listarPaises() {
		// TODO Auto-generated method stub
		
		ArrayList<PaisDTO> lista = new ArrayList<PaisDTO>();
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pst = null;
		
		try {
			con = MysqlConector.getConexion();
			String sql = " select id,nombre from paises  ";
			pst = con.prepareStatement(sql);
			rs=pst.executeQuery();	
			while (rs.next()) {
		 
				PaisDTO p = new PaisDTO();				
				p.setId(rs.getInt(1)); 
				p.setNombre(rs.getString(2));				 
				lista.add(p);
			}
			
		} catch (Exception e) {
			
			  System.out.println("Error al agregar Usuraio -> en la sentencia "+e.getMessage());
		}finally {
			try {
				if(pst!=null)pst.close();
				if(rs!=null)rs.close();
				if(con!=null)con.close();
			} catch (SQLException e2) {
				System.out.println("Error al cerrar "+e2.getMessage());
			}
		}
	
		
		return lista;
	}

}
