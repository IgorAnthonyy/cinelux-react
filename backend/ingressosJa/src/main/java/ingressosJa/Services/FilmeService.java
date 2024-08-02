package ingressosJa.Services;

import ingressosJa.models.Filme;
import ingressosJa.repositories.FilmeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FilmeService {
    @Autowired
    private FilmeRepository filmeRepository;

    public List<Filme> findAllCartazByCinemaId(Integer id){
      return filmeRepository.findAllCartazByCinemaId(id);
    }
    public List<Filme> findAllBreveByCinemaId(Integer id){
      return filmeRepository.findAllBreveByCinemaId(id);
    }
}
