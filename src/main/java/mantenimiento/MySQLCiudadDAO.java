package mantenimiento;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Coneccion.MysqlConector;
import DAO.CiudadDAO;
import Models.CiudadDTO;


public class MySQLCiudadDAO implements CiudadDAO {

	@Override
	public ArrayList<CiudadDTO> buscarCiudadPorIdPais(int id) {
		// TODO Auto-generated method stub

		ArrayList<CiudadDTO> lista = new ArrayList<CiudadDTO>();
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pst = null;
		
		try {
			con = MysqlConector.getConexion();
			String sql = " select  id , nombre , pais_id from ciudades where pais_id =  ? ";
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);

			
			rs=pst.executeQuery();	
			while (rs.next()) {
		 
				CiudadDTO p = new CiudadDTO();				
				p.setId(rs.getInt(1)); 
				p.setNombre(rs.getString(2));				 
				p.setId_pais(rs.getInt(3)); 
				
				lista.add(p);
			}
			
		} catch (Exception e) {
			
			  System.out.println("Error al buscar Paises-> en la sentencia "+e.getMessage());
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
