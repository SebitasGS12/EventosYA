package DAO;

import java.util.ArrayList;

import Models.AsistenteDTO;
import Models.EventoDTO;

public interface AsistenteDAO {
	
	
	public int registrarAsistencia(AsistenteDTO a);
	
	public ArrayList<AsistenteDTO>  listarAsistenciasDeUsuario(int codigo);
	public AsistenteDTO  buscarAsistente(int codigo);
	
	public AsistenteDTO validarAsistencia(int idUsuario,int idEvento);

	public int eliminarAsistencia(int codigo);
}
