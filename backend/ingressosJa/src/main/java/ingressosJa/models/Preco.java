package ingressosJa.models;

import javax.persistence.*;


@Entity
@Table(name = "preco")
public class Preco {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "idPreco")
    private Integer id;

    @Column(name = "dia")
    private String dia;

    @Column(name = "preco")
    private Double preco;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public Double getPreco() {
        return preco;
    }

    public void setPreco(Double preco) {
        this.preco = preco;
    }
}
