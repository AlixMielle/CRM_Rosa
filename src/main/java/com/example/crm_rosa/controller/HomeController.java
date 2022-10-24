package com.example.crm_rosa.controller;

import com.example.crm_rosa.controller.dto.CreateUser;
import com.example.crm_rosa.repository.entity.Enterprise;
import com.example.crm_rosa.repository.entity.Prospect;
import com.example.crm_rosa.repository.entity.User;
import com.example.crm_rosa.service.EnterpriseService;
import com.example.crm_rosa.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.List;

@Controller
public class HomeController {

    private UserService userService;
    private EnterpriseService enterpriseService;

    public HomeController(UserService userService, EnterpriseService enterpriseService) {
        this.userService = userService;
        this.enterpriseService = enterpriseService;
    }

    @GetMapping("/signin")
    public String displaySignInForm() {
        return "connexion/signInForm";
    }

    @GetMapping("/signup")
    public String displaySignUpForm(Model model) {
        model.addAttribute("createUser", new CreateUser());
        return "connexion/signUpForm";
    }

    @PostMapping("/signup")
    public String signUp(@Valid CreateUser createUser, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("createUser", createUser);
            return "connexion/signUpForm";
        } else {
            userService.register(createUser);
            return "redirect:/signin";
        }
    }

    @GetMapping("/home")
    public String displayHome(Model model, Authentication authentication) {
        User user = this.userService.findUserByEmail(authentication.getName());
        List<Enterprise> enterprisesOfUser = this.enterpriseService.getEnterprisesOfUser(user);
        int nbProspects = 0;
        int nbRelance = 0;
        int nbClients = 0;
        for (Prospect p : user.getProspects()) {
            switch (p.getProspectionStatus()){
                case CLIENT:
                    nbClients++;
                    break;
                case SEEKUPDATE:
                    nbRelance++;
                case NOTSTARTED:
                case ONGOING:
                    nbProspects++;
                    break;
            }
        }
        model.addAttribute("user", user);
        model.addAttribute("nbProspects", nbProspects);
        model.addAttribute("nbRelance", nbRelance);
        model.addAttribute("nbClients", nbClients);
        model.addAttribute("nbEnterprises", enterprisesOfUser.size());
        return "connexion/home";
    }
}
