package DAO;

import java.util.ArrayList;

import Models.AsistenteDTO;
import Models.EventoDTO;

public interface AsistenteDAO {
	
	
	public int registrarAsistencia(AsistenteDTO a);
	
	public int eliminarAsistencia(AsistenteDTO a,EventoDTO e);
	
	public ArrayList<AsistenteDTO>  listarAsistenciasDeUsuario(int codigo);
	public AsistenteDTO  buscarAsistente(int codigo);
	
}
