package ingressosJa.repositories;

import ingressosJa.models.Preco;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface PrecoRepository extends JpaRepository<Preco, Integer> {

    @Query(value = "SELECT p FROM Preco p ")
    List<Preco> findPrecos();
}
