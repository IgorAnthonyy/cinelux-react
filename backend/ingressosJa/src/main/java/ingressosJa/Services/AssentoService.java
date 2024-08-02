package ingressosJa.Services;

import ingressosJa.DTO.AssentosSessao;
import ingressosJa.models.Assento;
import ingressosJa.models.Cinema;
import ingressosJa.models.Ingresso;
import ingressosJa.repositories.AssentoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AssentoService {

    @Autowired
    private AssentoRepository assentoRepository;

    public List<AssentosSessao> listarAssentos(Integer idSessao, Integer idSala) {
        List<AssentosSessao> assentosAtualizados = new ArrayList<>();

        List<Assento> assentos = assentoRepository.findAssentos(idSala);
        List<Ingresso> ingressos = assentoRepository.findIngressos(idSessao);


        for(Assento assentosSessao : assentos){
            AssentosSessao assentoNovo = new AssentosSessao(
                    assentosSessao.getIdAssento(),
                    assentosSessao.getNumero(),
                    assentosSessao.getTipo(),
                    assentosSessao.getSala().getIdSala(),
                    null
            );

            for(Ingresso ingresso : ingressos){
                if(assentosSessao.getIdAssento().equals(ingresso.getAssento())){
                    assentoNovo.setDisponivel(false);
                }
            }
              if(assentoNovo.getDisponivel() == null){
                    assentoNovo.setDisponivel(true);
                }
            assentosAtualizados.add(assentoNovo);
        }
        System.out.println(assentosAtualizados);
        return assentosAtualizados;
    }
}
