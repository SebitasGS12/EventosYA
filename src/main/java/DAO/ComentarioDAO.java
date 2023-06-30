package DAO;

import java.util.ArrayList;

import Models.ComentarioDTO;

public interface ComentarioDAO {
 public int registrar (ComentarioDTO com);
 public int editar (ComentarioDTO com);
 public int eliminar (int idComentario);
 public int eliminarFromEvento(int idEvento);
 
 
 public ArrayList<ComentarioDTO>listarComentario();
 public ArrayList<ComentarioDTO>listarComentarioPorEvento(int codigoEvento);


}
