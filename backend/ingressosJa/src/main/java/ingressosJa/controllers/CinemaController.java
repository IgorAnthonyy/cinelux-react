package ingressosJa.controllers;

import ingressosJa.Services.CinemaService;
import ingressosJa.models.Cinema;
import ingressosJa.models.Sala;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/cinema")
public class CinemaController {

    @Autowired
    private CinemaService cinemaService;

    @GetMapping("/listar")
    public List<Cinema> listarCinemas(){
        System.out.println(cinemaService.findAll());
//     return cinemaService.findAll();
    return cinemaService.findAll();
    }
//    @GetMapping("/listar")
//    public String listarCinemas(){
//        System.out.println(cinemaService.findAll());
////     return cinemaService.findAll();
//    return cinemaService.findAll().get(0).getNome();
//    }

    @GetMapping("/listar/salas")
    public List<Sala> listarSalas(){
//        System.out.println(cinemaService.findAll());
//     return cinemaService.findAll();
    return cinemaService.findSalas();
    }
    @GetMapping
    public String teste(){
     return "Teste";
    }
}
