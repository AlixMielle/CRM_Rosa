package com.example.crm_rosa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping("/")
public class HomeController {

    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/signin")
    public String displaySignInForm() {
        return "signInForm";
    }

    @GetMapping("/signup")
    public String displaySignUpForm(Model model) {
        model.addAttribute("createUser", new CreateUser());
        return "signUpForm";
    }

    @PostMapping("/signup")
    public String signUp(@Valid CreateUser createUser, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("createUser", createUser);
            return "signUpForm";
        } else {
            userService.register(createUser);
            return "redirect:/signin";
        }
    }

    @GetMapping("/home")
    public String displayHome() {
        return "home";
    }
}
