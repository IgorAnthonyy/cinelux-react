package ingressosJa.controllers;

import ingressosJa.Services.PrecoService;
import ingressosJa.models.Preco;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/precos")
public class PrecoController {
    @Autowired
    private PrecoService precoService;

    @GetMapping()
    public List<Preco> listarPrecos(){
        return precoService.listarPrecos();
    }
}
