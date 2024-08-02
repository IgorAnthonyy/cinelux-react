package ingressosJa.controllers;

import ingressosJa.Services.ClienteService;
import ingressosJa.DTO.AutenticacaoResposta;
import ingressosJa.models.Cliente;
import ingressosJa.models.Ingresso;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/cliente")
public class ClienteController {
    @Autowired
    private ClienteService clienteService;

    @PostMapping("/cadastrar")
    public AutenticacaoResposta cadastrarCliente(@RequestBody Cliente cliente){
        return clienteService.cadastrarCliente(cliente);
    }
    @PostMapping("/autenticar")
    public AutenticacaoResposta autenticarCliente(@RequestBody Cliente cliente){
        return clienteService.autenticarCliente(cliente);
    }

    @GetMapping("/{clienteId}/ingressos")
    public List<Ingresso> buscarIngressos(@PathVariable Integer clienteId){
        return clienteService.buscarIngressos(clienteId);
    }
}
