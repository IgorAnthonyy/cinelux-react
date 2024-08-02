package ingressosJa.repositories;

import ingressosJa.models.Sessao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface SessaoRepository extends JpaRepository<Sessao, Integer> {
    @Query("SELECT s FROM Sessao s WHERE s.filme.idFilme = :idFilme AND s.sala.cinema.idCinema = :idCinema")
    List<Sessao> findSessoesByFilmeIdAndCinemaId(@Param("idFilme") Integer idFilme, @Param("idCinema") Integer idCinema);

//    @Query(value = "SELECT DATE(dataHora) AS data FROM sessao GROUP BY DATE(dataHora)", nativeQuery = true)
//    List<Object[]> findGroupedByDate();

    @Query(value = "SELECT * " +
            "FROM sessao s " +
            "JOIN sala sa ON s.fkSala = sa.idSala " +
            "JOIN cinema c ON sa.fkCinema = c.idCinema " +
            "JOIN filme f ON s.fkFilme = f.idFilme " +
            "WHERE DATE(s.dataHora) = :data " +
            "AND c.idCinema = :cinemaId " +
            "AND f.idFilme = :filmeId", nativeQuery = true)
    List<Sessao> findSessoesByDate(
            @Param("data") String data,
            @Param("cinemaId") Integer idCinema,
            @Param("filmeId") Integer idFilme
    );

    @Query(value = "SELECT DISTINCT DATE(s.dataHora) FROM sessao s " +
            "JOIN sala sa ON s.fkSala = sa.idSala " +
            "JOIN cinema c ON sa.fkCinema = c.idCinema " +
            "JOIN filme f ON s.fkFilme = f.idFilme " +
            "WHERE c.idCinema = :cinemaId AND f.idFilme = :filmeId", nativeQuery = true)
    List<Object[]> findGroupedByDate(@Param("cinemaId") Integer idCinema, @Param("filmeId") Integer idFilme);


    @Query(value = "SELECT * " +
            "FROM sessao s " +
            "JOIN sala sa ON s.fkSala = sa.idSala " +
            "JOIN cinema c ON sa.fkCinema = c.idCinema " +
            "JOIN filme f ON s.fkFilme = f.idFilme " +
            "WHERE DATE(s.dataHora) = :data " +
            "AND s.tipoSessao = :tipoSessao " +
            "AND c.idCinema = :cinemaId " +
            "AND f.idFilme = :filmeId", nativeQuery = true)
    List<Sessao> findSessoesByDateAndTipoSessao(
            @Param("data") String data,
            @Param("tipoSessao") String tipoSessao,
            @Param("cinemaId") Integer idCinema,
            @Param("filmeId") Integer idFilme
    );
}
