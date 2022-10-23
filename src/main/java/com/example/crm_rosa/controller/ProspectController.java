package com.example.crm_rosa.controller;

import com.example.crm_rosa.controller.dto.ProspectCreateDto;
import com.example.crm_rosa.controller.dto.ProspectEditDto;
import com.example.crm_rosa.repository.entity.Prospect;
import com.example.crm_rosa.repository.entity.ProspectionStatus;
import com.example.crm_rosa.repository.entity.User;
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
@RequestMapping("/prospects")
public class ProspectController {

    private ProspectService prospectService;
    private EnterpriseService enterpriseService;
    private UserService userService;

    public ProspectController(ProspectService prospectService, EnterpriseService enterpriseService, UserService userService) {
        this.prospectService = prospectService;
        this.enterpriseService = enterpriseService;
        this.userService = userService;
    }

    @GetMapping("/all")
    public String displayAllProspects(Model model){
        User user = this.userService.findUserByEmail("rosa@worktogether.fr"); //TODO: authentication
        model.addAttribute("prospects", this.prospectService.getAllProspects(user));
        return "prospectAllView";
    }

    @GetMapping("/enterprise/{id}")
    public String displayProspectOfEnterprise(Model model, @PathVariable("id") long idEnterprise){
        User user = this.userService.findUserByEmail("rosa@worktogether.fr"); //TODO: authentication
        model.addAttribute("prospects", this.prospectService.getProspectsByEnterprise(idEnterprise, user));
        return "prospectAllView";
    }

    @GetMapping("/details/{id}")
    public String displayOneProspect(@PathVariable("id") long id, Model model){
        User user = this.userService.findUserByEmail("rosa@worktogether.fr");//TODO: authentication
        Prospect prospect = prospectService.getProspectById(id);
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
        model.addAttribute("prospects", prospectService.getProspectsBySearch(search, user));
        return "prospectAllView";
    }

    @GetMapping("/add")
    public String displayAddProspectForm(Model model){
        model.addAttribute("enterprises", this.enterpriseService.findAllEnterprises());
        model.addAttribute("prospectionStatuses", ProspectionStatus.values());
        return "addProspectForm";
    }

    @PostMapping("/add")
    public String addProspect(ProspectCreateDto newProspect){
        User user = this.userService.findUserByEmail("rosa@worktogether.fr");//TODO: authentication
        prospectService.addProspect(newProspect, user);
        return "redirect:/prospects/all";
    }

    @GetMapping("/edit/{id}")
    public String displayEditProspectForm(@PathVariable("id") long id, Model model){
        User user = this.userService.findUserByEmail("rosa@worktogether.fr");//TODO: authentication
        model.addAttribute("enterprises", this.enterpriseService.findAllEnterprises());
        model.addAttribute("prospectionStatuses", ProspectionStatus.values());
        model.addAttribute("prospect", prospectService.getProspectById(id));
        return "addProspectForm";
    }

    @PostMapping("/edit")
    public String editProspect(ProspectEditDto prospectEditDto){
        prospectService.editProspect(prospectEditDto);
        return "redirect:/prospects/all";
    }

    @GetMapping("/delete/{id}")
    public String deleteProspectConfirm(@PathVariable("id") long id, Model model){
        User user = this.userService.findUserByEmail("rosa@worktogether.fr");//TODO: authentication
        model.addAttribute("prospect", prospectService.getProspectById(id));
        model.addAttribute("isDeleteForm", true);
        return "prospectDetailsView";
    }

    @PostMapping("/delete/{id}")
    public String deleteProspect(@PathVariable("id") long id){
        prospectService.deleteProspectById(id);
        return "redirect:/prospects/all";
    }
}
