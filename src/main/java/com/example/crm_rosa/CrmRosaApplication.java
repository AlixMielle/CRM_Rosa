package com.example.crm_rosa;

import com.example.crm_rosa.repository.EnterpriseRepository;
import com.example.crm_rosa.repository.UserRepository;
import com.example.crm_rosa.repository.entity.Enterprise;
import com.example.crm_rosa.repository.entity.User;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.time.LocalDate;

@SpringBootApplication
public class CrmRosaApplication implements CommandLineRunner {

    private EnterpriseRepository enterpriseRepository;
    private UserRepository userRepository;

    public CrmRosaApplication(EnterpriseRepository enterpriseRepository, UserRepository userRepository) {
        this.enterpriseRepository = enterpriseRepository;
        this.userRepository = userRepository;
    }

    public static void main(String[] args) {
        SpringApplication.run(CrmRosaApplication.class, args);

    }


    @Override
    public void run(String... args) throws Exception {
        System.out.println("COMMAND LINE RUNNER");

        Enterprise enterprise1 = new Enterprise("La boulette", "https://images.pexels.com/photos/5191826/pexels-photo-5191826.jpeg?auto=compress&cs=tinysrgb&w=1200", "123 568 941 00056", "laboulette@gmail.fr", "0654342345", "0987212345","https://fr.wikipedia.org/wiki/La_Boulette", "6 rue des Carmes","2e étage", "NANTES",44000, "Gastronomie, restauration", LocalDate.of(2022, 10, 19));

        Enterprise enterprise2 = new Enterprise("Au boudin moment", "https://images.pexels.com/photos/9693241/pexels-photo-9693241.jpeg?auto=compress&cs=tinysrgb&w=1200", "234 568 941 00056", "auboudinmoment@gmail.fr", "0654342345", "0987212345","https://www.facebook.com/auboudinbar/", "6 impasse du fond de la rue","sonner chez Gladys", "RENNES",35000, "Gastronomie, , humour", LocalDate.now());

        Enterprise enterprise3 = new Enterprise("Fast and serious", "https://images.pexels.com/photos/627718/pexels-photo-627718.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500", "123 568 941 76556", "fastandserious@gmail.fr", "0690842345", "0987765345","https://www.facebook.com/fastnseriouspm/", "88 rue des pilotes","", "NANTES",44000, "Auto-école", LocalDate.of(2022, 6, 13));

        enterpriseRepository.save(enterprise1);
        enterpriseRepository.save(enterprise2);
        enterpriseRepository.save(enterprise3);

        User user1 = new User("Bob", "Gallaghan", "b.gala@webmail.com", "0654341919", "0976514343", "6, rue des Epines", "Saint-Herblain", 44300, "bobgal", "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60", "Apple", "Sales director");
        User user2 = new User("Linda", "Tropez", "linda3@grout.com", "0654332119", "0976987343", "32, rue des Plombiers", "Lille", 59000, "linda90", "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60", "Orange", "UX Designer");
        User user3 = new User("Patrick", "Potier", "pp@yahoo.fr", "0654393449", "0973114343", "10, rue des Chaumières", "Bordeaux", 33000, "patrick", "https://images.unsplash.com/photo-1628890920690-9e29d0019b9b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60", "Groupama", "Manager");

        userRepository.save(user1);
        userRepository.save(user2);
        userRepository.save(user3);

    }
}
