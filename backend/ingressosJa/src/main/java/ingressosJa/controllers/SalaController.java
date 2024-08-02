package ingressosJa.controllers;

import ingressosJa.Services.SalaService;
import ingressosJa.models.Sala;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/sala")
public class SalaController {
    @Autowired
    private SalaService salaService;

    @GetMapping("/listar")
    public List<Sala> findAll(){
        return salaService.findAll();
    }

}
