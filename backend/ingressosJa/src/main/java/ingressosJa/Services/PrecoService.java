package ingressosJa.Services;

import ingressosJa.models.Preco;
import ingressosJa.repositories.PrecoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.Access;
import java.util.List;

@Service
public class PrecoService {
    @Autowired
    private PrecoRepository precoRepository;

    public List<Preco> listarPrecos(){
        return precoRepository.findPrecos();
    }
}
