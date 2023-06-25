package mantenimiento;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Coneccion.MysqlConector;
import DAO.CategoriaDAO;
import Models.CategoriaDTO;


public class MySQLCategoriaDAO implements CategoriaDAO {

	@Override
	public ArrayList<CategoriaDTO> listarCategoria() {
		ArrayList<CategoriaDTO> lista = new ArrayList<CategoriaDTO>();
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pst = null;
		
		try {
			con = MysqlConector.getConexion();
			String sql = " select idCategoria, nombreCategoria, descripcionCategoria from categoria ";
			pst = con.prepareStatement(sql);
			rs=pst.executeQuery();	
			while (rs.next()) {
		 
				CategoriaDTO p = new CategoriaDTO();	
				
				p.setIdCategoria(rs.getInt(1)); 
				p.setNombreCategoria(rs.getString(2));
				p.setDescripcionCategoria(rs.getString(3));

				lista.add(p);
			}
			
		} catch (Exception e) {
			
			  System.out.println("Error al listar Categoria -> en la sentencia "+e.getMessage());
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

	@Override
	public CategoriaDTO buscarCategoria(int id) {
		
		
		// TODO Auto-generated method stub
		CategoriaDTO p = null;
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pst = null;
		
		try {
			con = MysqlConector.getConexion();
			String sql = " select idCategoria, nombreCategoria, descripcionCategoria  from categoria where idCategoria =  ? ";
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);

			
			rs=pst.executeQuery();	
			
			while (rs.next()) {
				 
				  p= new CategoriaDTO(
						  rs.getInt(1),
					rs.getString(2),
					rs.getString(3));
	 
			}
			


			
		} catch (Exception e) {
			
			  System.out.println("Error al buscar Categoria > en la sentencia "+e.getMessage());
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

}
