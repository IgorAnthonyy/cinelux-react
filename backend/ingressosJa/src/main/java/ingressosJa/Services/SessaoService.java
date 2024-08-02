package ingressosJa.Services;

import ingressosJa.DTO.FiltroSesssao;
import ingressosJa.models.Sessao;
import ingressosJa.repositories.SessaoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.ArrayList;
import java.util.List;

@Service
public class SessaoService {
    @Autowired
    private SessaoRepository sessaoRepository;

    public List<Sessao> findSessaoByFilme(Integer idCinema, Integer idFilme){
        return sessaoRepository.findSessoesByFilmeIdAndCinemaId(idCinema, idFilme);
    }

    public List<Object[]> getSessoesGroupedByDate(Integer idCinema, Integer idFilme) {
        return sessaoRepository.findGroupedByDate(idCinema, idFilme);
    }

    public List<Sessao> filtroSessao(FiltroSesssao filtroSesssao){
        List<Sessao> listaAtualizada = new ArrayList<>();

        if(filtroSesssao.getTipoSessao().equals("Todos")){

            List<Sessao> lista = sessaoRepository.findSessoesByDate(
                 filtroSesssao.getData(),
                 filtroSesssao.getIdCinema(),
                 filtroSesssao.getIdFilme()
         );
            for(Sessao sessao : lista){
                Sessao sessao2 = new Sessao();

                sessao2.setIdSessao(sessao.getIdSessao());
                sessao2.setDataHora(sessao.getDataHora());
                sessao2.setTipoSessao(sessao.getTipoSessao());
                sessao2.setIdSala(sessao.getSala().getIdSala());

                listaAtualizada.add(sessao2);
            }

            return listaAtualizada;

        }else{
            List<Sessao> lista =  sessaoRepository.findSessoesByDateAndTipoSessao(
                    filtroSesssao.getData(),
                    filtroSesssao.getTipoSessao(),
                    filtroSesssao.getIdCinema(),
                    filtroSesssao.getIdFilme()
            );
            if(lista.isEmpty()){
                return listaAtualizada;
            }
            else{
            for(Sessao sessao : lista){
                Sessao sessao1 = new Sessao();

                sessao1.setIdSessao(sessao.getIdSessao());
                sessao1.setDataHora(sessao.getDataHora());
                sessao1.setTipoSessao(sessao.getTipoSessao());
                sessao1.setIdSala(sessao.getSala().getIdSala());

                listaAtualizada.add(sessao1);
            }

            return listaAtualizada;
            }
        }
    }
}
