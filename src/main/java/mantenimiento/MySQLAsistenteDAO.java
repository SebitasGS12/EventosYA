package mantenimiento;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Coneccion.MysqlConector;
import DAO.AsistenteDAO;
import Models.EventoDTO;
import Models.OrganizadorDTO;
import Models.AsistenteDTO;

public class MySQLAsistenteDAO implements AsistenteDAO {

	@Override
	public int registrarAsistencia(AsistenteDTO a) {
		
		int rs = 0;
		PreparedStatement pst = null;
		Connection con = null;
		try {
			con = MysqlConector.getConexion();
			String sql = " insert into asistente  values (null,?,?,?)";
			pst = con.prepareStatement(sql);
			
			pst.setInt(1, a.getIdUsuario());
			pst.setInt(2, a.getIdEvento());
			pst.setString(3, a.getFechaAsistencia());

			
			rs =pst.executeUpdate();
			
		} catch (Exception e) {
			
			  System.out.println("Error al agregar Asistente -> en la sentencia "+e.getMessage());
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
	public int eliminarAsistencia(AsistenteDTO a, EventoDTO e) {

		int rs=0;	/*
		Connection con= null;
		PreparedStatement pst=null;
		try {
		 
			
			con=MysqlConector.getConexion();
			String sql=" delete from  evento   where idEvento=?  ";
			pst=con.prepareStatement(sql);
			//Parametrizar en el orden de los signos de ?  inicia en 1
			pst.setInt(1,codigo);
			//Ejecuci�n
			rs=pst.executeUpdate();	
		} catch (Exception e) {
		  System.out.println("Error en la sentencia "+e.getMessage());
		}finally{
			try {
				if(pst!=null)pst.close();
				if(con!=null)con.close();
			} catch (SQLException e2) {
				System.out.println("Error al cerrar "+e2.getMessage());
			}	
		}
		*/
		return rs;
	}

	@Override
	public ArrayList<AsistenteDTO> listarAsistenciasDeUsuario(int codigo) {
		ArrayList<AsistenteDTO> lista = new ArrayList<AsistenteDTO>();
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pst = null;
		
		try {
			con = MysqlConector.getConexion();
			String sql = " select idAsistente, idUsuario, idEvento, fechaAsistencia from asistente where idUsuario = ? ";
			pst = con.prepareStatement(sql);
			pst.setInt(1, codigo);

			
			rs=pst.executeQuery();	
			while (rs.next()) {
		 
				 
				AsistenteDTO p = new AsistenteDTO();		
				
				p.setIdAsistente(rs.getInt(1)); 
				p.setIdUsuario(rs.getInt(2)); 
				p.setIdEvento(rs.getInt(3)); 
				p.setFechaAsistencia(rs.getString(4)); 
			
				
				lista.add(p);
			}
			
		} catch (Exception e) {
			
			  System.out.println("Error al buscar Asistencia del Usuario -> en la sentencia "+e.getMessage());
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
	public AsistenteDTO buscarAsistente(int codigo) {
		// TODO Auto-generated method stub
		AsistenteDTO p = null;
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pst = null;
		
		try {
			con = MysqlConector.getConexion();
			String sql = " select idAsistente, idUsuario, idEvento, fechaAsistencia from asistente where idAsistente = ? ";
			pst = con.prepareStatement(sql);
			pst.setInt(1, codigo);
	
			
			rs=pst.executeQuery();	
			
			while (rs.next()) {
				
			
				p = new AsistenteDTO();		
				
				p.setIdAsistente(rs.getInt(1)); 
				p.setIdUsuario(rs.getInt(2)); 
				p.setIdEvento(rs.getInt(3)); 
				p.setFechaAsistencia(rs.getString(4)); 
			
				
			}
	
	
			
		} catch (Exception e) {
			
			  System.out.println("Error al buscar Asistente > en la sentencia "+e.getMessage());
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
