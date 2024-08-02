package ingressosJa.DTO;

import ingressosJa.models.Cliente;

public class AutenticacaoResposta {
    private Cliente cliente;
    private String mensagem;

    public AutenticacaoResposta(Cliente cliente, String mensagem) {
        this.cliente = cliente;
        this.mensagem = mensagem;
    }

    // Getters e setters
    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }
}

