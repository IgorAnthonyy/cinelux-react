package ingressosJa.Services;

import ingressosJa.DTO.IngressoResposta;
import ingressosJa.models.Assento;
import ingressosJa.models.Cliente;
import ingressosJa.models.Ingresso;
import ingressosJa.models.Sessao;
import ingressosJa.repositories.AssentoRepository;
import ingressosJa.repositories.ClienteRepository;
import ingressosJa.repositories.IngressoRepository;
import ingressosJa.repositories.SessaoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class IngressoService {

    @Autowired
    private IngressoRepository ingressoRepository;

    public IngressoResposta venderIngresso(List<Ingresso> ingressoLista) {
        for (Ingresso ingresso : ingressoLista){
            if (ingresso.getSessao() != 0 && ingresso.getAssento() != null) {
                Optional<Ingresso> response = ingressoRepository.verificarIngresso(ingresso.getSessao(), ingresso.getAssento());
                if (response.isEmpty()) {
                    ingressoRepository.save(ingresso);
                } else {
                    return new IngressoResposta(null, "Assento:" + ingresso.getAssento() + " Indisponível");
                }
            } else {
                return new IngressoResposta(null, "Sessão ou Assento não especificados no ingresso.");
            }
    }
        return new IngressoResposta(ingressoLista, "Ingresso comprado com sucesso");
    }
}

