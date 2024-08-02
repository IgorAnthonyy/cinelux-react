package ingressosJa.models;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
//import java.util.Date;

@Entity
@Table(name = "ingresso")
public class Ingresso {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "idIngresso")
    private Integer idIngresso;

    @Column(name = "dataHora")
    private String dataHora;

//    @ManyToOne(fetch = FetchType.LAZY)
    @Column(name = "fkCliente")
//    @JsonIgnore
    private Integer cliente;

//    @ManyToOne(fetch = FetchType.LAZY)
    @Column(name = "fkSessao")
//    @JsonIgnore
    private Integer sessao;

//    @ManyToOne(fetch = FetchType.LAZY)
////    @JsonIgnore
    @Column(name = "fkAssento")
    private Integer assento;

//    @ManyToOne(fetch = FetchType.LAZY)
    @Column(name = "total")
//    @JsonIgnore
    private Double total;

    public Ingresso() {
    }


    public String getDataHora() {
        return dataHora;
    }

    public void setDataHora(String dataHora) {
        this.dataHora = dataHora;
    }


    public Integer getAssento() {
        return assento;
    }

    public void setAssento(Integer assento) {
        this.assento = assento;
    }

    public int getCliente() {
        return cliente;
    }

    public void setCliente(int cliente) {
        this.cliente = cliente;
    }

    public int getSessao() {
        return sessao;
    }

    public void setSessao(int sessao) {
        this.sessao = sessao;
    }

}
