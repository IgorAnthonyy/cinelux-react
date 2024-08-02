package ingressosJa.repositories;

import ingressosJa.DTO.AssentosSessao;
import ingressosJa.models.Assento;
import ingressosJa.models.Ingresso;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AssentoRepository extends JpaRepository<Assento, Integer> {


    @Query(value = "SELECT a.idAssento as id_Assento, a.numero as numero_, a.tipo as tipo_, s.idSala as idSala_ " +
            "FROM Assento a JOIN Sala s ON a.fkSala = s.idSala " +
            "WHERE s.idSala = :idSala ", nativeQuery = true)
    List<Assento> findAssentosSala(@Param("idSala") Integer idSala);

    @Query(value = "select a from Assento a join Sala s on a.sala.idSala = s.idSala where idSala = :idSala")
    List<Assento> findAssentos(@Param("idSala") Integer idSala);


    @Query(value = "SELECT i FROM Ingresso i WHERE i.sessao = :idSessao")
    List<Ingresso> findIngressos(@Param("idSessao") Integer idSessao);


}
