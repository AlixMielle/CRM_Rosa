package com.example.crm_rosa.controller;

import com.example.crm_rosa.controller.dto.ProspectCreateDto;
import com.example.crm_rosa.controller.dto.ProspectEditDto;
import com.example.crm_rosa.repository.entity.Prospect;
import com.example.crm_rosa.repository.entity.ProspectionStatus;
import com.example.crm_rosa.repository.entity.User;
import com.example.crm_rosa.service.ClientService;
import com.example.crm_rosa.service.EnterpriseService;
import com.example.crm_rosa.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/clients")
public class ClientController {

    private ClientService clientService;
    private EnterpriseService enterpriseService;
    private UserService userService;

    public ClientController(ClientService clientService, EnterpriseService enterpriseService, UserService userService) {
        this.clientService = clientService;
        this.enterpriseService = enterpriseService;
        this.userService = userService;
    }

    @GetMapping("/all")
    public String displayAllProspects(Model model, Authentication authentication){
        User user = this.userService.findUserByEmail(authentication.getName());
        model.addAttribute("clients", this.clientService.getAllClients(user));
        model.addAttribute("currentUser", user);
        return "client/clientsAllView";
    }

    @GetMapping("/enterprise/{id}")
    public String displayClientOfEnterprise(Model model, @PathVariable("id") long idEnterprise, Authentication authentication){
        User user = this.userService.findUserByEmail(authentication.getName());
        model.addAttribute("prospects", this.clientService.getClientsByEnterprise(idEnterprise, user));
        model.addAttribute("currentUser", user);
        return "prospect/prospectAllView";
    }

    @GetMapping("/details/{id}")
    public String displayOneProspect(@PathVariable("id") long id, Model model, Authentication authentication){
        User user = this.userService.findUserByEmail(authentication.getName());
        Prospect prospect = clientService.getClientById(id);
        if(user.getIsAdmin() || prospect.getUser().equals(user)){
            model.addAttribute("prospect", prospect);
            model.addAttribute("currentUser", user);
            return "prospect/prospectDetailsView";
        } else{
            return "redirect:/prospects/all";
        }
    }

    @GetMapping("/search")
    public String displaySearchedProspects(String search, Model model, Authentication authentication){
        User user = this.userService.findUserByEmail(authentication.getName());
        model.addAttribute("prospects", clientService.getClientsBySearch(search, user));
        model.addAttribute("currentUser", user);
        return "prospect/prospectAllView";
    }

    @GetMapping("/add")
    public String displayAddClientForm(Model model, Authentication authentication){
        User user = this.userService.findUserByEmail(authentication.getName());
        model.addAttribute("enterprises", this.enterpriseService.findAllEnterprises());
        model.addAttribute("prospectionStatuses", ProspectionStatus.values());
        model.addAttribute("addingClient", true);
        model.addAttribute("currentUser", user);
        return "prospect/addProspectForm";
    }

    @PostMapping("/add")
    public String addClient(ProspectCreateDto newProspect, Authentication authentication){
        User user = this.userService.findUserByEmail(authentication.getName());
        clientService.addClient(newProspect, user);
        return "redirect:/prospects/all";
    }

    @GetMapping("/edit/{id}")
    public String displayEditProspectForm(@PathVariable("id") long id, Model model, Authentication authentication){
        User user = this.userService.findUserByEmail(authentication.getName());
        Prospect prospect = clientService.getClientById(id);
        if(user.getIsAdmin() || prospect.getUser().equals(user)){
            model.addAttribute("enterprises", this.enterpriseService.findAllEnterprises());
            model.addAttribute("prospectionStatuses", ProspectionStatus.values());
            model.addAttribute("prospect", prospect);
            model.addAttribute("currentUser", user);
            return "prospect/addProspectForm";
        } else{
            return "redirect:/prospects/all";
        }
    }

    @PostMapping("/edit")
    public String editProspect(ProspectEditDto prospectEditDto){
        clientService.editProspect(prospectEditDto);
        return "redirect:/prospects/all";
    }

    @GetMapping("/delete/{id}")
    public String deleteProspectConfirm(@PathVariable("id") long id, Model model, Authentication authentication){
        User user = this.userService.findUserByEmail(authentication.getName());
        Prospect prospect = clientService.getClientById(id);
        if(user.getIsAdmin() || prospect.getUser().equals(user)){
            model.addAttribute("prospect", prospect);
            model.addAttribute("isDeleteForm", true);
            model.addAttribute("currentUser", user);
            return "prospect/prospectDetailsView";
        } else{
            return "redirect:/prospects/all";
        }
    }

    @PostMapping("/delete/{id}")
    public String deleteProspect(@PathVariable("id") long id){
        clientService.deleteProspectById(id);
        return "redirect:/prospects/all";
    }
}
