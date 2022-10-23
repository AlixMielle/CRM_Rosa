package com.example.crm_rosa.controller;

import com.example.crm_rosa.controller.dto.ProspectCreateDto;
import com.example.crm_rosa.controller.dto.ProspectEditDto;
import com.example.crm_rosa.repository.entity.Prospect;
import com.example.crm_rosa.repository.entity.ProspectionStatus;
import com.example.crm_rosa.repository.entity.User;
import com.example.crm_rosa.service.ClientService;
import com.example.crm_rosa.service.EnterpriseService;
import com.example.crm_rosa.service.ProspectService;
import com.example.crm_rosa.service.UserService;
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
    public String displayAllProspects(Model model){
        User user = this.userService.findUserByEmail("rosa@worktogether.fr");//TODO: authentication
        model.addAttribute("clients", this.clientService.getAllClients(user));
        return "clientsAllView";
    }

    @GetMapping("/enterprise/{id}")
    public String displayClientOfEnterprise(Model model, @PathVariable("id") long idEnterprise){
        User user = this.userService.findUserByEmail("rosa@worktogether.fr"); //TODO: authentication
        model.addAttribute("prospects", this.clientService.getClientsByEnterprise(idEnterprise, user));
        return "prospectAllView";
    }

    @GetMapping("/details/{id}")
    public String displayOneProspect(@PathVariable("id") long id, Model model){
        User user = this.userService.findUserByEmail("rosa@worktogether.fr");//TODO: authentication
        Prospect prospect = clientService.getClientById(id);
        if(user.getIsAdmin() || prospect.getUser().equals(user)){
            model.addAttribute("prospect", prospect);
            return "prospectDetailsView";
        } else{
            return "redirect:/prospects/all";
        }
    }

    @GetMapping("/search")
    public String displaySearchedProspects(String search, Model model){
        User user = this.userService.findUserByEmail("rosa@worktogether.fr");//TODO: authentication
        model.addAttribute("prospects", clientService.getClientsBySearch(search, user));
        return "prospectAllView";
    }

    @GetMapping("/add")
    public String displayAddClientForm(Model model){
        model.addAttribute("enterprises", this.enterpriseService.findAllEnterprises());
        model.addAttribute("prospectionStatuses", ProspectionStatus.values());
        model.addAttribute("addingClient", true);
        return "addProspectForm";
    }

    @PostMapping("/add")
    public String addClient(ProspectCreateDto newProspect){
        User user = this.userService.findUserByEmail("rosa@worktogether.fr");//TODO: authentication
        clientService.addClient(newProspect, user);
        return "redirect:/prospects/all";
    }

    @GetMapping("/edit/{id}")
    public String displayEditProspectForm(@PathVariable("id") long id, Model model){
        //TODO: same checks as for create
        model.addAttribute("enterprises", this.enterpriseService.findAllEnterprises());
        model.addAttribute("prospectionStatuses", ProspectionStatus.values());
        model.addAttribute("prospect", clientService.getClientById(id));
        return "addProspectForm";
    }

    @PostMapping("/edit")
    public String editProspect(ProspectEditDto prospectEditDto){
        clientService.editProspect(prospectEditDto);
        return "redirect:/prospects/all";
    }

    @GetMapping("/delete/{id}")
    public String deleteProspectConfirm(@PathVariable("id") long id, Model model){
        model.addAttribute("prospect", clientService.getClientById(id));
        model.addAttribute("isDeleteForm", true);
        return "prospectDetailsView";
    }

    @PostMapping("/delete/{id}")
    public String deleteProspect(@PathVariable("id") long id){
        Prospect prospect = clientService.getClientById(id);
        prospect.getEnterprise().removeProspect(prospect);
        clientService.deleteProspectById(id);
        return "redirect:/prospects/all";
    }
}
