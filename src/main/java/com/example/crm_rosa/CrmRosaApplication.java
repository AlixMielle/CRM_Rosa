package com.example.crm_rosa;

import com.example.crm_rosa.repository.EnterpriseRepository;
import com.example.crm_rosa.repository.ProspectRepository;
import com.example.crm_rosa.repository.UserRepository;
import com.example.crm_rosa.repository.entity.Enterprise;
import com.example.crm_rosa.repository.entity.Prospect;
import com.example.crm_rosa.repository.entity.ProspectionStatus;
import com.example.crm_rosa.repository.entity.User;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.time.LocalDate;

@SpringBootApplication
public class CrmRosaApplication implements CommandLineRunner {

    private EnterpriseRepository enterpriseRepository;
    private UserRepository userRepository;

    private ProspectRepository prospectRepository;

    public CrmRosaApplication(EnterpriseRepository enterpriseRepository, UserRepository userRepository, ProspectRepository prospectRepository) {
        this.enterpriseRepository = enterpriseRepository;
        this.userRepository = userRepository;
        this.prospectRepository = prospectRepository;
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

        User admin = new User("Cecile", "Rosa", "rosa@worktogether.fr", "0690989194", "0977654343", "87, rue des Cailloux", "Brest", 29200, "rosarosa", "https://images.unsplash.com/photo-1607105213504-70fed0df97ef?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cGluayUyMGhhaXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60", "EasyToTask", "Formatrice et consultante", true);

        User user1 = new User("Bob", "Gallaghan", "b.gala@webmail.com", "0654341919", "0976514343", "6, rue des Epines", "Saint-Herblain", 44300, "bobgal", "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60", "Apple", "Sales director", false);
        User user2 = new User("Linda", "Tropez", "linda3@grout.com", "0654332119", "0976987343", "32, rue des Plombiers", "Lille", 59000, "linda90", "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60", "Orange", "UX Designer", false);
        User user3 = new User("Patrick", "Potier", "pp@yahoo.fr", "0654393449", "0973114343", "10, rue des Chaumières", "Bordeaux", 33000, "patrick", "https://images.unsplash.com/photo-1628890920690-9e29d0019b9b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60", "Groupama", "Manager", false);

        userRepository.save(admin);
        userRepository.save(user1);
        userRepository.save(user2);
        userRepository.save(user3);

        Prospect prospect1 = new Prospect(user2, "Emile", "Dupont", "dupont@webmail.com", "0654341919", "0976514343", "7, rue des Ilôts 85200 Fontenay-Le-Compte", enterprise1, "Développeur", LocalDate.of(2022, 6, 13), ProspectionStatus.ONGOING);
        Prospect prospect2 = new Prospect(user3, "Alexandra", "Douillard", "alex.d@webmail.com", "0654333319", "0976518843", "15, impasse des tulipes 74000 Niort", enterprise1, "Cheffe de projet", LocalDate.of(2022, 6, 22), ProspectionStatus.ONGOING);
        Prospect prospect3 = new Prospect(user1, "Victoire", "Le Merle", "vmerle@gmail.com", "0600333319", "0921218843", "90, rue de Vaugirard 75015 Paris", enterprise3, "Chef de projet", LocalDate.of(2021, 11, 22), ProspectionStatus.SEEKUPDATE);

        prospectRepository.save(prospect1);
        prospectRepository.save(prospect2);
        prospectRepository.save(prospect3);

    }
}
