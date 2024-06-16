package br.com.entidade;

import br.com.controle.Pedido;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DAOPedido {
    public void criarPedido(Pedido pedido) throws SQLException {
        String sql = "INSERT INTO pedido (produto_id, quantidade, usuario_id, loja_id) VALUES (?, ?, ?, ?)";
        try (Connection conn = DAO.conectarBanco(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, pedido.getProdutoId());
            stmt.setInt(2, pedido.getQuantidade());
            stmt.setInt(3, pedido.getUsuarioId());
            stmt.setInt(4, pedido.getLojaId());
            stmt.executeUpdate();
        }
    }
}
