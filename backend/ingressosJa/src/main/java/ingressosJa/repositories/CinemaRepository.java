package ingressosJa.repositories;

import ingressosJa.models.Cinema;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import java.util.Optional;

@Repository
public interface CinemaRepository extends JpaRepository<Cinema, Integer> {

    @Query("SELECT c FROM Cinema c LEFT JOIN FETCH c.salas WHERE c.idCinema = :id")
    Optional<Cinema> findCinemaWithSalasById(Integer id);

}
