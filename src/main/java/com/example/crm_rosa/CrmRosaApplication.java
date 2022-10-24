package com.example.crm_rosa;

import com.example.crm_rosa.controller.dto.CreateUser;
import com.example.crm_rosa.repository.EnterpriseRepository;
import com.example.crm_rosa.repository.NoteRepository;
import com.example.crm_rosa.repository.ProspectRepository;
import com.example.crm_rosa.repository.UserRepository;
import com.example.crm_rosa.repository.entity.*;
import com.example.crm_rosa.service.UserService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.time.LocalDate;
import java.util.List;

@SpringBootApplication
public class CrmRosaApplication implements CommandLineRunner {

    private EnterpriseRepository enterpriseRepository;
    private UserRepository userRepository;

    private ProspectRepository prospectRepository;
    private UserService userService;

    private NoteRepository noteRepository;

    public CrmRosaApplication(EnterpriseRepository enterpriseRepository, UserRepository userRepository, ProspectRepository prospectRepository, UserService userService, NoteRepository noteRepository) {
        this.enterpriseRepository = enterpriseRepository;
        this.userRepository = userRepository;
        this.prospectRepository = prospectRepository;
        this.userService = userService;
        this.noteRepository = noteRepository;
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
        Enterprise enterprise4 = new Enterprise("Bisou.io", "https://www.brandbucket.com/sites/default/files/logo_uploads/436065/large_bisou.io.png", "123 568 941 00056", "laboulette@gmail.fr", "0654342345", "0987212345","https://fr.wikipedia.org/wiki/La_Boulette", "6 rue des Carmes","2e étage", "NANTES",44000, "Gastronomie, restauration", LocalDate.of(2022, 10, 19));
        Enterprise enterprise5 = new Enterprise("Anesy", "https://www.brandbucket.com/sites/default/files/logo_uploads/71242/large_BB_Anesy_v1_thum.png", "234 568 941 00056", "auboudinmoment@gmail.fr", "0654342345", "0987212345","https://www.facebook.com/auboudinbar/", "6 impasse du fond de la rue","sonner chez Gladys", "RENNES",35000, "Gastronomie, , humour", LocalDate.now());
        Enterprise enterprise6 = new Enterprise("Paqon", "https://www.brandbucket.com/sites/default/files/logo_uploads/111981/large_paqon.png", "123 568 941 76556", "fastandserious@gmail.fr", "0690842345", "0987765345","https://www.facebook.com/fastnseriouspm/", "88 rue des pilotes","", "NANTES",44000, "Auto-école", LocalDate.of(2022, 6, 13));
        Enterprise enterprise7 = new Enterprise("Cuvae", "https://www.brandbucket.com/sites/default/files/logo_uploads/15714/xlarge_cuvae.png0", "123 568 941 00056", "laboulette@gmail.fr", "0654342345", "0987212345","https://fr.wikipedia.org/wiki/La_Boulette", "6 rue des Carmes","2e étage", "NANTES",44000, "Gastronomie, restauration", LocalDate.of(2022, 10, 19));
        Enterprise enterprise8 = new Enterprise("Exorie", "https://i.gyazo.com/051bde13c3dd3887f238439347fef379.png", "234 568 941 00056", "auboudinmoment@gmail.fr", "0654342345", "0987212345","https://www.facebook.com/auboudinbar/", "6 impasse du fond de la rue","sonner chez Gladys", "RENNES",35000, "Gastronomie, , humour", LocalDate.now());
        Enterprise enterprise9 = new Enterprise("Helicier", "https://i.gyazo.com/24764b1a40bf395e36c31ab8a796ca21.png", "123 568 941 76556", "fastandserious@gmail.fr", "0690842345", "0987765345","https://www.facebook.com/fastnseriouspm/", "88 rue des pilotes","", "NANTES",44000, "Auto-école", LocalDate.of(2022, 6, 13));
        Enterprise enterprise10 = new Enterprise("Nouenoux", "https://i.gyazo.com/3aab0758e7bf0c746548c88f9de2b122.png", "123 568 941 00056", "laboulette@gmail.fr", "0654342345", "0987212345","https://fr.wikipedia.org/wiki/La_Boulette", "6 rue des Carmes","2e étage", "NANTES",44000, "Gastronomie, restauration", LocalDate.of(2022, 10, 19));
        Enterprise enterprise11 = new Enterprise("Koury", "https://i.gyazo.com/1677938d1ca9c63c17e1db332f647a7e.png", "234 568 941 00056", "auboudinmoment@gmail.fr", "0654342345", "0987212345","https://www.facebook.com/auboudinbar/", "6 impasse du fond de la rue","sonner chez Gladys", "RENNES",35000, "Gastronomie, , humour", LocalDate.now());
        Enterprise enterprise12 = new Enterprise("Louvement", "https://i.gyazo.com/bdd38b5ac63e2217b3c2407b60db86cf.png", "123 568 941 76556", "fastandserious@gmail.fr", "0690842345", "0987765345","https://www.facebook.com/fastnseriouspm/", "88 rue des pilotes","", "NANTES",44000, "Auto-école", LocalDate.of(2022, 6, 13));

        enterpriseRepository.save(enterprise1);
        enterpriseRepository.save(enterprise2);
        enterpriseRepository.save(enterprise3);
        enterpriseRepository.save(enterprise4);
        enterpriseRepository.save(enterprise5);
        enterpriseRepository.save(enterprise6);
        enterpriseRepository.save(enterprise7);
        enterpriseRepository.save(enterprise8);
        enterpriseRepository.save(enterprise9);
        enterpriseRepository.save(enterprise10);
        enterpriseRepository.save(enterprise11);
        enterpriseRepository.save(enterprise12);

        User admin = new User("Cecile", "Rosa", "rosa@worktogether.fr", "0690989194", "0977654343", "87, rue des Cailloux", "Brest", 29200, "rosarosa", "https://images.unsplash.com/photo-1607105213504-70fed0df97ef?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cGluayUyMGhhaXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60", "EasyToTask", "Formatrice et consultante", true);

        User user1 = new User("Bob", "Gallaghan", "b.gala@webmail.com", "0654341919", "0976514343", "6, rue des Epines", "Saint-Herblain", 44300, "bobtest", "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60", "Apple", "Sales director", false);
        User user2 = new User("Linda", "Tropez", "linda3@grout.com", "0654332119", "0976987343", "32, rue des Plombiers", "Lille", 59000, "lindatest", "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60", "Orange", "UX Designer", false);
        User user3 = new User("Patrick", "Potier", "pp@yahoo.fr", "0654393449", "0973114343", "10, rue des Chaumières", "Bordeaux", 33000, "patricktest", "https://images.unsplash.com/photo-1628890920690-9e29d0019b9b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60", "Groupama", "Manager", false);

        userService.register(admin);
        userService.register(user1);
        userService.register(user2);
        userService.register(user3);

        Prospect prospect1 = new Prospect(user2, "Emile", "Dupont", "https://cdn.onlinewebfonts.com/svg/img_181369.png", "dupont@webmail.com", "0654341919", "0976514343", "7, rue des Ilôts 85200 Fontenay-Le-Compte", enterprise11, "Développeur", LocalDate.of(2022, 6, 13), ProspectionStatus.ONGOING);
        Prospect prospect2 = new Prospect(user1, "Alexandra", "Douillard", "https://cdn.onlinewebfonts.com/svg/img_181369.png","alex.d@webmail.com", "0654333319", "0976518843", "15, impasse des tulipes 74000 Niort", enterprise3, "Cheffe de projet", LocalDate.of(2022, 6, 22), ProspectionStatus.ONGOING);
        Prospect prospect3 = new Prospect(user3, "Victoire", "Le Merle", "https://cdn.onlinewebfonts.com/svg/img_181369.png","vmerle@gmail.com", "0600333319", "0921218843", "90, rue de Vaugirard 75015 Paris", enterprise8, "Chef de projet", LocalDate.of(2021, 11, 22), ProspectionStatus.SEEKUPDATE);
        Prospect prospect4 = new Prospect(admin, "Martin", "Hamel", "https://cdn.onlinewebfonts.com/svg/img_181369.png", "hamel@webmail.com", "0654333319", "0921218843", "neverland", enterprise1, "Développeur", LocalDate.of(2022, 1, 20), ProspectionStatus.NOTSTARTED);
        Prospect prospect5 = new Prospect(user3, "Benoit", "Blin de Lebreton", "https://cdn.onlinewebfonts.com/svg/img_181369.png", "lebreton@mail.bzh", "0654333319", "0921218843", "neverland", enterprise12, "Développeur", LocalDate.of(2021, 1, 28), ProspectionStatus.NOTSTARTED);
        Prospect prospect6 = new Prospect(user3, "Gabrielle", "Lambert", "https://cdn.onlinewebfonts.com/svg/img_181369.png", "lambert@gmail.com", "0654333319", "0921218843", "neverland", enterprise9, "Développeur", LocalDate.of(2022, 4, 5), ProspectionStatus.CLIENT);
        Prospect prospect7 = new Prospect(admin, "Hughes", "Lecompte", "https://cdn.onlinewebfonts.com/svg/img_181369.png", "lecompte@courant.fr", "0654333319", "0921218843", "neverland", enterprise11, "Développeur", LocalDate.of(2021, 4, 20), ProspectionStatus.CLIENT);
        Prospect prospect8 = new Prospect(user2, "Paul Coste", "du Martineau", "https://cdn.onlinewebfonts.com/svg/img_181369.png", "dumartineau@gmail.com", "0654333319", "0921218843", "neverland", enterprise1, "Développeur", LocalDate.of(2022, 10, 5), ProspectionStatus.CLIENT);
        Prospect prospect9 = new Prospect(user3, "Catherine", "Sanchez", "https://cdn.onlinewebfonts.com/svg/img_181369.png", "catsanchez@gmail.com", "0654333319", "0921218843", "neverland", enterprise6, "Développeur", LocalDate.of(2021, 9, 16), ProspectionStatus.ONGOING);
        Prospect prospect10 = new Prospect(user3, "Alexandre", "de la Martel", "https://cdn.onlinewebfonts.com/svg/img_181369.png", "delamartel@gmail.com", "0654333319", "0921218843", "neverland", enterprise8, "Développeur", LocalDate.of(2022, 6, 29), ProspectionStatus.NOTSTARTED);
        Prospect prospect11 = new Prospect(user3, "Guillaume", "Pinto", "https://cdn.onlinewebfonts.com/svg/img_181369.png", "guypinto@webmail.com", "0654333319", "0921218843", "neverland", enterprise8, "Développeur", LocalDate.of(2021, 7, 21), ProspectionStatus.SEEKUPDATE);
        Prospect prospect12 = new Prospect(user3, "Vincent", "Chevallier", "https://cdn.onlinewebfonts.com/svg/img_181369.png", "vincentchevalier@gmail.com", "0654333319", "0921218843", "", enterprise11, "Développeur", LocalDate.of(2021, 12, 2), ProspectionStatus.NOTSTARTED);
        Prospect prospect13 = new Prospect(user3, "Denise", "Tanguy-Muller", "https://cdn.onlinewebfonts.com/svg/img_181369.png", "denisetm@gmail.com", "0654333319", "0921218843", "neverland", enterprise11, "Développeur", LocalDate.of(2022, 2, 5), ProspectionStatus.CLIENT);
        Prospect prospect14 = new Prospect(user1, "Margot", "Martinez", "https://cdn.onlinewebfonts.com/svg/img_181369.png", "marmar@webmail.com", "0654333319", "0921218843", "neverland", enterprise2, "Développeur", LocalDate.of(2022, 2, 19), ProspectionStatus.SEEKUPDATE);
        Prospect prospect15 = new Prospect(admin, "Franck", "Ferrand-Lopez", "https://cdn.onlinewebfonts.com/svg/img_181369.png", "francklopez@gmail.com", "0654333319", "0921218843", "neverland", enterprise9, "Développeur", LocalDate.of(2021, 2, 13), ProspectionStatus.CLIENT);
        Prospect prospect16 = new Prospect(user1, "Pauline", "Thibault", "https://cdn.onlinewebfonts.com/svg/img_181369.png", "paulinethibault@gmail.com", "0654333319", "0921218843", "neverland", enterprise9, "Développeur", LocalDate.of(2021, 3, 30), ProspectionStatus.NOTSTARTED);
        Prospect prospect17 = new Prospect(user1, "Tristan", "Allard", "https://cdn.onlinewebfonts.com/svg/img_181369.png", "tallard@webmail.com", "0654333319", "0921218843", "neverland", enterprise10, "Développeur", LocalDate.of(2021, 4, 25), ProspectionStatus.ONGOING);
        Prospect prospect18 = new Prospect(user1, "Eleonore", "Le Barbier", "https://cdn.onlinewebfonts.com/svg/img_181369.png", "ellebarbier@webmail.com", "0654333319", "0921218843", "neverland", enterprise9, "Développeur", LocalDate.of(2022, 4, 15), ProspectionStatus.ONGOING);
        Prospect prospect19 = new Prospect(user2, "David", "Merle", "https://cdn.onlinewebfonts.com/svg/img_181369.png", "davidmerle@gmail.com", "0654333319", "0921218843", "neverland", enterprise5, "Développeur", LocalDate.of(2021, 12, 20), ProspectionStatus.NOTSTARTED);
        Prospect prospect20 = new Prospect(admin, "Guy", "Neveu", "https://cdn.onlinewebfonts.com/svg/img_181369.png", "guyneveu@gmail.com", "0654333319", "0921218843", "neverland", enterprise9, "Développeur", LocalDate.of(2021, 12, 26), ProspectionStatus.ONGOING);
        Prospect prospect21 = new Prospect(user1, "Jules", "Guibert-Marques", "https://cdn.onlinewebfonts.com/svg/img_181369.png", "julesguibert@gmail.com", "0654333319", "0921218843", "neverland", enterprise6, "Développeur", LocalDate.of(2021, 12, 6), ProspectionStatus.CLIENT);
        Prospect prospect22 = new Prospect(user2, "Marianne-Madeleine", "Bodin", "https://cdn.onlinewebfonts.com/svg/img_181369.png", "marmadebodin@webmail.com", "0654333319", "0921218843", "neverland", enterprise3, "Développeur", LocalDate.of(2022, 4, 30), ProspectionStatus.CLIENT);
        Prospect prospect23 = new Prospect(admin, "Agathe", "de la Langlois", "https://cdn.onlinewebfonts.com/svg/img_181369.png", "agatlanglois@gmail.com", "0654333319", "0921218843", "neverland", enterprise4, "Développeur", LocalDate.of(2022, 2, 5), ProspectionStatus.NOTSTARTED);
        Prospect prospect24 = new Prospect(user1, "Miriam", "Lenfant", "https://cdn.onlinewebfonts.com/svg/img_181369.png", "miriamlenfant@gmail.com", "0654333319", "0921218843", "neverland", enterprise12, "Développeur", LocalDate.of(2022, 8, 8), ProspectionStatus.CLIENT);

        prospectRepository.save(prospect1);
        prospectRepository.save(prospect2);
        prospectRepository.save(prospect3);
        prospectRepository.save(prospect4);
        prospectRepository.save(prospect5);
        prospectRepository.save(prospect6);
        prospectRepository.save(prospect7);
        prospectRepository.save(prospect8);
        prospectRepository.save(prospect9);
        prospectRepository.save(prospect10);
        prospectRepository.save(prospect11);
        prospectRepository.save(prospect12);
        prospectRepository.save(prospect13);
        prospectRepository.save(prospect14);
        prospectRepository.save(prospect15);
        prospectRepository.save(prospect16);
        prospectRepository.save(prospect17);
        prospectRepository.save(prospect18);
        prospectRepository.save(prospect19);
        prospectRepository.save(prospect20);
        prospectRepository.save(prospect21);
        prospectRepository.save(prospect22);
        prospectRepository.save(prospect23);
        prospectRepository.save(prospect24);

        Note note1 = new Note(prospect1, LocalDate.of(2021, 11, 22), "Création prospect Mr Machin", "Mise en contact avec Mr Machin pour formation truc");
        Note note2 = new Note(prospect2, LocalDate.of(2019, 1, 2), "Premier contact avec Mme Devers", "Bon contact, à suivre");
        Note note3 = new Note(prospect3, LocalDate.of(2022, 10, 29), "Rappeler le soir", "Futur client");
        noteRepository.save(note1);
        noteRepository.save(note2);
        noteRepository.save(note3);



    }
}
