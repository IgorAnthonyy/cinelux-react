package ingressosJa.Services;

import ingressosJa.DTO.AutenticacaoResposta;
import ingressosJa.models.Cliente;
import ingressosJa.models.Ingresso;
import ingressosJa.repositories.ClienteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ClienteService {
    @Autowired
    private ClienteRepository clienteRepository;

    public AutenticacaoResposta cadastrarCliente(Cliente cliente){
        Optional<Cliente> clienteOptional = clienteRepository.findByUsername(cliente.getUsername());

        if(clienteOptional.isPresent()){
            return new AutenticacaoResposta(null, "Username já existe");
        }else{
            Optional<Cliente> clienteOptional1 = clienteRepository.findByEmail(cliente.getEmail());

            if(clienteOptional1.isPresent()){
                return new AutenticacaoResposta(null, "já existe uma conta vinculada a esse email");
            }
            return new AutenticacaoResposta(clienteRepository.save(cliente), "Usuário cadastrado");
        }
    }
    public AutenticacaoResposta autenticarCliente(Cliente cliente){
        Optional<Cliente> response =  clienteRepository.autenticarUsuario(cliente.getEmail(), cliente.getSenha());

        if (response.isPresent()) {
            return new AutenticacaoResposta(response.get(), "Autenticado com sucesso");
        }else{
            return new AutenticacaoResposta(null, "Credenciais inválidas");
        }
    }
    public List<Ingresso> buscarIngressos(Integer id){
        return clienteRepository.buscarIngressos(id);
    }

}
