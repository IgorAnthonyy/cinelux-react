package ingressosJa.repositories;

import ingressosJa.models.Ingresso;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface IngressoRepository extends JpaRepository<Ingresso, Integer> {

   @Query(value = "SELECT i FROM Ingresso i WHERE fkSessao = :idSessao AND fkAssento = :idAssento")
    Optional<Ingresso> verificarIngresso(@Param("idSessao") Integer idSessao, @Param("idAssento") Integer idAssento);
}
