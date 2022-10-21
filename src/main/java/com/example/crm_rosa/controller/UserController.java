package com.example.crm_rosa.controller;

import com.example.crm_rosa.controller.dto.CreateUser;
import com.example.crm_rosa.repository.entity.User;
import com.example.crm_rosa.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/users")
public class UserController {

    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/edit/{id}")
    public String editUserForm(@PathVariable("id") long id, Model model){
        User user = userService.findUserById(id);
        model.addAttribute("user", user);
        return "user/editUserForm";
    }

    @PostMapping ("/edit/{id}")
    public RedirectView editUser(@PathVariable("id") long id, CreateUser editUser){
        userService.editUser(id,editUser);
        return new RedirectView("/users/details/" + id);
    }

    @GetMapping("/details/{id}")
    public String displayUserProfile(@PathVariable("id") long id, Model model){
        User user = userService.findUserById(id);
        model.addAttribute("user", user);
        return "user/detailUserView";
    }

    @PostMapping ("/delete/{id}")
    public RedirectView deleteEnterprise(@PathVariable("id") long id){
        userService.deleteUser(id);
        return new RedirectView("/home");
    }


}
