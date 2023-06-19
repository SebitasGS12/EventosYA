package mantenimiento;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Coneccion.MysqlConector;
import DAO.OrganizadorDAO;
import Models.EventoDTO;
import Models.OrganizadorDTO;
import Models.UsuarioDTO;

public class MySQLOrganizadorDAO implements OrganizadorDAO {

	@Override
	public int registrar(UsuarioDTO u,EventoDTO eve ) {
		int rs = 0;
		PreparedStatement pst =null;
		Connection cn = null;
		
		try {
			
			cn =MysqlConector.getConexion();
			
			String sql = " insert into organizador values (null,?,?)";
			pst = cn.prepareStatement(sql);
			

			pst.setInt(1, u.getIdUsuario() );
			pst.setInt(2, eve.getIdEvento() );
			
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

	@Override
	public ArrayList<OrganizadorDTO> listarOrganizadorPorUsuario(int id) {
		// TODO Auto-generated method stub

		ArrayList<OrganizadorDTO> lista = new ArrayList<OrganizadorDTO>();
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pst = null;
		
		try {
			con = MysqlConector.getConexion();
			String sql = " select idOrganizador,idUsuario,idEvento from organizador where idUsuario = ? ";
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);

			
			rs=pst.executeQuery();	
			while (rs.next()) {
		 
				 
				OrganizadorDTO p = new OrganizadorDTO();		
				
				p.setIdOrganizador(rs.getInt(1)); 
				p.setIdUsuario(rs.getInt(2)); 
				p.setIdEvento(rs.getInt(3)); 
			
				
				lista.add(p);
			}
			
		} catch (Exception e) {
			
			  System.out.println("Error al buscar Organizador -> en la sentencia "+e.getMessage());
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
	public int eliminar(  int codigoEvento) {
		int rs=0;
		Connection con= null;
		PreparedStatement pst=null;
		try {
		 
			
			con=MysqlConector.getConexion();
			String sql=" delete from  organizador   where idEvento=?  ";
			pst=con.prepareStatement(sql);
			//Parametrizar en el orden de los signos de ?  inicia en 1
			pst.setInt(1,codigoEvento);
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
		
		return rs;
	}

	@Override
	public OrganizadorDTO buscarOrganizador(int codigo) {
		// TODO Auto-generated method stub
		OrganizadorDTO p = null;
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pst = null;
		
		try {
			con = MysqlConector.getConexion();
			String sql = " select idOrganizador, idUsuario, idEvento from organizador where idOrganizador =  ? ";
			pst = con.prepareStatement(sql);
			pst.setInt(1, codigo);

			
			rs=pst.executeQuery();	
			
			while (rs.next()) {
				 
				  p= new OrganizadorDTO(
					rs.getInt(1),
					rs.getInt(2),
					rs.getInt(3));
			}
			


			
		} catch (Exception e) {
			
			  System.out.println("Error al buscar Organizador > en la sentencia "+e.getMessage());
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
