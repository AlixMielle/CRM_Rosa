package com.example.crm_rosa;

import com.example.crm_rosa.repository.EnterpriseRepository;
import com.example.crm_rosa.repository.entity.Enterprise;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.time.LocalDate;

@SpringBootApplication
public class CrmRosaApplication implements CommandLineRunner {

    private EnterpriseRepository enterpriseRepository;

    public CrmRosaApplication(EnterpriseRepository enterpriseRepository) {
        this.enterpriseRepository = enterpriseRepository;
    }

    public static void main(String[] args) {
        SpringApplication.run(CrmRosaApplication.class, args);

    }


    @Override
    public void run(String... args) throws Exception {
        System.out.println("COMMAND LINE RUNNER");

        Enterprise enterprise1 = new Enterprise("La boulette", "https://images.pexels.com/photos/5191826/pexels-photo-5191826.jpeg?auto=compress&cs=tinysrgb&w=1200", "123 568 941 00056", "laboulette@gmail.fr", "0654342345", "0987212345","www.laboulette.fr", "6 rue des Carmes","2e étage", "NANTES",44000, "Gastronomie, restauration", LocalDate.of(2022, 10, 19));

        Enterprise enterprise2 = new Enterprise("Au boudin moment", "https://images.pexels.com/photos/9693241/pexels-photo-9693241.jpeg?auto=compress&cs=tinysrgb&w=1200", "234 568 941 00056", "auboudinmoment@gmail.fr", "0654342345", "0987212345","www.auboudinmoment.fr", "6 impasse du fond de la rue","sonner chez Gladys", "RENNES",35000, "Gastronomie, , humour", LocalDate.now());

        Enterprise enterprise3 = new Enterprise("Fast and serious", "https://images.pexels.com/photos/627718/pexels-photo-627718.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500", "123 568 941 76556", "fastandserious@gmail.fr", "0690842345", "0987765345","www.fastandserious.fr", "88 rue des pilotes","", "NANTES",44000, "Auto-école", LocalDate.of(2022, 6, 13));


        enterpriseRepository.save(enterprise1);
        enterpriseRepository.save(enterprise2);
        enterpriseRepository.save(enterprise3);
    }
}
