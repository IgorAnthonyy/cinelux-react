package ingressosJa.models;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.List;

@Entity
@Table(name = "filme")
public class Filme {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "idFilme")
    private Integer idFilme;

    @Column(name = "titulo")
    private String titulo;
    @Column(name = "descricao")
    private String descricao;

    @Column(name = "capa")
    private String capa;

    @Column(name = "genero")
    private String genero;

    @Column(name = "duracaoMin")
    private Integer duracaoMin;

    @Column(name = "classificacao")
    private String classificacao;
    @Column(name = "exibicao")
    private String exibicao;

    @OneToMany(mappedBy = "filme", fetch = FetchType.LAZY)
    @JsonIgnore
    private List<Sessao> sessoes;

    public String getExibicao() {
        return exibicao;
    }

    public void setExibicao(String exibicao) {
        this.exibicao = exibicao;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public List<Sessao> getSessoes() {
        return sessoes;
    }

    public void setSessoes(List<Sessao> sessoes) {
        this.sessoes = sessoes;
    }

    public Integer getIdFilme() {
        return idFilme;
    }

    public void setIdFilme(Integer idFilme) {
        this.idFilme = idFilme;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getCapa() {
        return capa;
    }

    public void setCapa(String capa) {
        this.capa = capa;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public Integer getDuracaoMin() {
        return duracaoMin;
    }

    public void setDuracaoMin(Integer duracaoMin) {
        this.duracaoMin = duracaoMin;
    }

    public String getClassificacao() {
        return classificacao;
    }

    public void setClassificacao(String classificacao) {
        this.classificacao = classificacao;
    }
}
