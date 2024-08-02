package ingressosJa.controllers;

import ingressosJa.DTO.IngressoResposta;
import ingressosJa.Services.IngressoService;
import ingressosJa.models.Ingresso;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@RestController
@RequestMapping("/ingresso")
public class IngressoController {

    @Autowired
    private IngressoService ingressoService;

    @PostMapping
    public IngressoResposta VenderIngresso(@RequestBody List<Ingresso> ingresso){
        return ingressoService.venderIngresso(ingresso);
    }

}


