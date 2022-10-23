package com.example.crm_rosa.controller;

import com.example.crm_rosa.controller.dto.CreateUser;
import com.example.crm_rosa.repository.entity.User;
import com.example.crm_rosa.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.List;

@Controller
public class HomeController {

    private UserService userService;

    public HomeController(UserService userService) {
        this.userService = userService;
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
    public String displayHome(Model model) {
        List<User> userList = userService.findAllUsers();
        model.addAttribute("userList", userList);
        return "home";
    }
}
