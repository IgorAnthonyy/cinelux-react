package ingressosJa.Services;

import ingressosJa.models.Cinema;
import ingressosJa.models.Sala;
import ingressosJa.repositories.CinemaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CinemaService {
    @Autowired
    private CinemaRepository cinemaRepository;

    public List<Cinema> findAll() {
        List<Cinema> cinemas = cinemaRepository.findAll();
        return cinemas;
    }

    public List<Sala> findSalas(){
        Optional<Cinema> cinema = cinemaRepository.findById(1);
        return cinema.get().getSalas();
    }

}
