package com.example.crm_rosa.controller;

import com.example.crm_rosa.controller.dto.ProspectCreateDto;
import com.example.crm_rosa.controller.dto.ProspectEditDto;
import com.example.crm_rosa.repository.entity.Prospect;
import com.example.crm_rosa.repository.entity.ProspectionStatus;
import com.example.crm_rosa.service.ClientService;
import com.example.crm_rosa.service.EnterpriseService;
import com.example.crm_rosa.service.ProspectService;
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

    public ClientController(ClientService clientService, EnterpriseService enterpriseService) {
        this.clientService = clientService;
        this.enterpriseService = enterpriseService;
    }

    @GetMapping("/all")
    public String displayAllProspects(Model model){
        model.addAttribute("clients", this.clientService.getAbsolutelyAllClients());
        return "clientsAllView";
    }

    @GetMapping("/details/{id}")
    public String displayOneProspect(@PathVariable("id") long id, Model model){
        //TODO: add some checks somewhere to make sure you can't just type the URL manually and get the ID of someone else (will do when users are implemented)
        model.addAttribute("prospect", clientService.getProspectById(id));
        return "prospectDetailsView";
    }

    @GetMapping("/add")
    public String displayAddProspectForm(Model model){
        model.addAttribute("enterprises", this.enterpriseService.findAllEnterprises());
        model.addAttribute("prospectionStatuses", ProspectionStatus.values());
        return "addProspectForm";
    }

    @PostMapping("/add")
    public String addProspect(ProspectCreateDto newProspect){
        //TODO: user stuff again
        clientService.addProspect(newProspect, 0L);
        return "redirect:/prospects/all";
    }

    @GetMapping("/edit/{id}")
    public String displayEditProspectForm(@PathVariable("id") long id, Model model){
        //TODO: same checks as for create
        model.addAttribute("enterprises", this.enterpriseService.findAllEnterprises());
        model.addAttribute("prospectionStatuses", ProspectionStatus.values());
        model.addAttribute("prospect", clientService.getProspectById(id));
        return "addProspectForm";
    }

    @PostMapping("/edit")
    public String editProspect(ProspectEditDto prospectEditDto){
        clientService.editProspect(prospectEditDto);
        return "redirect:/prospects/all";
    }

    @GetMapping("/delete/{id}")
    public String deleteProspectConfirm(@PathVariable("id") long id, Model model){
        model.addAttribute("prospect", clientService.getProspectById(id));
        model.addAttribute("isDeleteForm", true);
        return "prospectDetailsView";
    }

    @PostMapping("/delete/{id}")
    public String deleteProspect(@PathVariable("id") long id){
        Prospect prospect = clientService.getProspectById(id);
        prospect.getEnterprise().removeProspect(prospect);
        clientService.deleteProspectById(id);
        return "redirect:/prospects/all";
    }
}
