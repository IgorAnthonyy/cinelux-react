package ingressosJa.controllers;

import ingressosJa.DTO.AssentosSessao;
import ingressosJa.Services.AssentoService;
import ingressosJa.models.Assento;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import java.util.List;

@RestController
@RequestMapping("/assento")
public class AssentoController {
    @Autowired
    private AssentoService assentoService;

    @GetMapping("/sessao/{idSessao}/sala/{idSala}")
    public List<AssentosSessao> getAssentosBySalaIdAndSessaoId(@PathVariable Integer idSessao, @PathVariable Integer idSala) {
        return assentoService.listarAssentos(idSessao, idSala);
    }


}
