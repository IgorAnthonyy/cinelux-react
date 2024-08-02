package ingressosJa.controllers;

import ingressosJa.Services.FilmeService;
import ingressosJa.models.Filme;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/filmes")
public class FilmeController {
    @Autowired
    private FilmeService filmeService;

    @GetMapping("/{cinemaId}/emCartaz")
    public List<Filme> getFilmesCartazByCinemaId(@PathVariable Integer cinemaId) {
        return filmeService.findAllCartazByCinemaId(cinemaId);
    }
    @GetMapping("/{cinemaId}/emBreve")
    public List<Filme> getFilmesBreveByCinemaId(@PathVariable Integer cinemaId) {
        return filmeService.findAllBreveByCinemaId(cinemaId);
    }
}
