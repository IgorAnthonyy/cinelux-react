package ingressosJa.repositories;

import ingressosJa.models.Filme;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FilmeRepository extends JpaRepository<Filme, Integer> {
        @Query("SELECT DISTINCT f FROM Filme f JOIN f.sessoes s JOIN s.sala sala WHERE sala.cinema.idCinema = :cinemaId AND f.exibicao = 'Em cartaz'")
        List<Filme> findAllCartazByCinemaId(@Param("cinemaId") Integer cinemaId);
        @Query("SELECT DISTINCT f FROM Filme f JOIN f.sessoes s JOIN s.sala sala WHERE sala.cinema.idCinema = :cinemaId AND f.exibicao = 'Em breve'")
        List<Filme> findAllBreveByCinemaId(@Param("cinemaId") Integer cinemaId);
}
