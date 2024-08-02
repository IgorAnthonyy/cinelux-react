package ingressosJa.controllers;

import ingressosJa.DTO.FiltroSesssao;
import ingressosJa.Services.SessaoService;
import ingressosJa.models.Sessao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/sessoes")
public class SessaoController {
    @Autowired
    private SessaoService sessaoService;

    @GetMapping("/{idCinema}/{idFilme}")
    public List<Sessao> findSessoes(@PathVariable Integer idCinema, @PathVariable Integer idFilme){
      return sessaoService.findSessaoByFilme(idCinema, idFilme);
    }

    @GetMapping("/cinema/{idCinema}/filme/{idFilme}")
    public List<Object[]> getSessoesGroupedByDate(@PathVariable Integer idCinema, @PathVariable Integer idFilme) {
        return sessaoService.getSessoesGroupedByDate(idCinema, idFilme);
    }

    @PostMapping("/filtro")
    public List<Sessao> filtroSessao(@RequestBody FiltroSesssao filtroSesssao){
        return  sessaoService.filtroSessao(filtroSesssao);
    }
}
