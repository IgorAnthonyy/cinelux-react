package ingressosJa;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
@EntityScan(basePackages = {"ingressosJa.models"})
public class IngressosJa {
    public static void main(String[] args) {
        SpringApplication.run(IngressosJa.class,args);
    }

    @Bean
    public CommandLineRunner initialization(){
        return args -> {
            System.out.println("Aplicação rodando na porta http://localhost:8080");
        };
    }
}
