package ingressosJa.DTO;

import ingressosJa.models.Ingresso;

import java.util.List;

public class IngressoResposta {
    private List<Ingresso> ingresso;
    private String mensagem;

    public IngressoResposta(List<Ingresso> ingresso, String mensagem) {
        this.ingresso = ingresso;
        this.mensagem = mensagem;
    }

    public List<Ingresso> getIngresso() {
        return ingresso;
    }

    public void setIngresso(List<Ingresso> ingresso) {
        this.ingresso = ingresso;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }
}
