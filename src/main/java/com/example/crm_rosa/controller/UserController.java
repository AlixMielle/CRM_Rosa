package com.example.crm_rosa.controller;

import com.example.crm_rosa.controller.dto.CreateUser;
import com.example.crm_rosa.repository.entity.Prospect;
import com.example.crm_rosa.repository.entity.User;
import com.example.crm_rosa.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/users")
public class UserController {

    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/all")
    public String displayAllUsers(Model model, @RequestParam(value = "keyword", required = false) String keyword, Authentication authentication){
        User currentUser = this.userService.findUserByEmail(authentication.getName());
        List<User> userList = userService.findUserByName(keyword);
        if(currentUser.getIsAdmin()){
            model.addAttribute("userList", userList);
            model.addAttribute("keyword", keyword);
            model.addAttribute("currentUser", currentUser);
            return "user/listUserView";
        } else{
            return "redirect:/home";
        }
    }

    @GetMapping("/details/{id}")
    public String displayUserProfile(@PathVariable("id") long id, Model model, Authentication authentication){
        User currentUser = this.userService.findUserByEmail(authentication.getName());
        User user = userService.findUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("currentUser", currentUser);
        return "user/detailUserView";
    }

    @GetMapping("/edit/{id}")
    public String editUserForm(@PathVariable("id") long id, Model model, Authentication authentication){
        User currentUser = this.userService.findUserByEmail(authentication.getName());
        User user = userService.findUserById(id);
        if(user.getId() == id){ //a user can only edit themselves
            model.addAttribute("user", user);
            model.addAttribute("currentUser", currentUser);
            return "user/editUserForm";
        } else{
            return "redirect:/users/all";
        }

    }

    @PostMapping ("/edit/{id}")
    public String editUser(@PathVariable("id") long id, CreateUser editUser){
        userService.editUser(id,editUser);
        return "redirect:/users/details/" + id;
    }

    @GetMapping("/delete/{id}")
    public String deleteUserConfirm(@PathVariable("id") long id, Model model, Authentication authentication){
        User currentUser = this.userService.findUserByEmail(authentication.getName());
        User user = this.userService.findUserById(id);
        if(currentUser.getIsAdmin() || currentUser.equals(user)){
            model.addAttribute("user", user);
            model.addAttribute("isDeleteForm", true);
            model.addAttribute("currentUser", currentUser);
            return "user/detailUserView";
        } else{
            return "redirect:/home";
        }
    }

    @PostMapping ("/delete/{id}")
    public String deleteUser(@PathVariable("id") long id, Authentication authentication){
        User currentUser = this.userService.findUserByEmail(authentication.getName());
        if(currentUser.equals(this.userService.findUserById(id))){
            userService.deleteUser(id);
            return "redirect:/logout";
        } else if (currentUser.getIsAdmin()) {
            userService.deleteUser(id);
            return "redirect:/users/all";
        } else{
            return "redirect:/home";
        }
    }


}
