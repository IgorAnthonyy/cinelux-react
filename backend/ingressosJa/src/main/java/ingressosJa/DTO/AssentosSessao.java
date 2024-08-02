package ingressosJa.DTO;

import ingressosJa.models.Assento;

import java.util.List;

public class AssentosSessao {
        private Integer idAssento;
        private String numero;
        private String tipo;
        private Integer idSala;
        private Boolean disponivel;

        public AssentosSessao(Integer idAssento, String numero, String tipo, Integer idSala, Boolean disponivel) {
                this.idAssento = idAssento;
                this.numero = numero;
                this.tipo = tipo;
                this.idSala = idSala;
                this.disponivel = disponivel;
        }

        public Integer getIdAssento() {
                return idAssento;
        }

        public void setIdAssento(Integer idAssento) {
                this.idAssento = idAssento;
        }

        public String getNumero() {
                return numero;
        }

        public void setNumero(String numero) {
                this.numero = numero;
        }

        public String getTipo() {
                return tipo;
        }

        public void setTipo(String tipo) {
                this.tipo = tipo;
        }

        public Integer getIdSala() {
                return idSala;
        }

        public void setIdSala(Integer idSala) {
                this.idSala = idSala;
        }

        public Boolean getDisponivel() {
                return disponivel;
        }

        public void setDisponivel(Boolean disponivel) {
                this.disponivel = disponivel;
        }
}
