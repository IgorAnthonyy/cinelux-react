package ingressosJa.models;

import javax.persistence.*;

@Entity
@Table(name = "tipo") // Nome da tabela no banco de dados
public class Tipo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idTipo") // Nome da coluna no banco de dados
    private Integer idTipo;

    @Column(name = "descricao") // Nome da coluna no banco de dados
    private String descricao;

    public Integer getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(Integer idTipo) {
        this.idTipo = idTipo;
    }

    public String getTipo() {
        return descricao;
    }

    public void setTipo(String tipo) {
        this.descricao = tipo;
    }
}
