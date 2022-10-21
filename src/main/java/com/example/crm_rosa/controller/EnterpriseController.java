package com.example.crm_rosa.controller;

import com.example.crm_rosa.controller.dto.CreateEnterprise;
import com.example.crm_rosa.repository.entity.Enterprise;
import com.example.crm_rosa.service.EnterpriseService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;

@Controller
@RequestMapping("/enterprises")
public class EnterpriseController {

    private EnterpriseService enterpriseService;
    //private ProspectService prospectService;

    public EnterpriseController(EnterpriseService enterpriseService) {
        this.enterpriseService = enterpriseService;
        //todo : ajouter prospectService
    }

    @GetMapping("/all")
    public String displayAllEnterprises(Model model, @RequestParam(value = "keyword", required = false) String keyword){
        List<Enterprise> enterpriseList = enterpriseService.findEnterpriseByName(keyword);
        model.addAttribute("enterpriseList", enterpriseList);
        model.addAttribute("keyword", keyword);
        return "listEnterpriseView";
    }

    @GetMapping("/details/{id}")
    public String displayOneEnterprise(@PathVariable("id") long id, Model model){
        Enterprise enterprise = enterpriseService.findEnterpriseById(id);
        model.addAttribute("enterprise", enterprise);
        return "detailEnterpriseView";
    }

    @GetMapping("/add")
    public String createEnterpriseForm(Model model){
        //todo : ajouter la liste des prospects ?
        //List<Prospect> prospectList = prospectService.findAllProspects();
        //model.addAttribute("prospectsList", prospectsList);
        return "createEnterpriseForm";
    }

    @PostMapping("/add")
    public String createEnterprise(CreateEnterprise createEnterprise){
        enterpriseService.addEnterprise(createEnterprise);
        return "redirect:/enterprises/all";
    }

    @PostMapping ("/delete/{id}")
    public RedirectView deleteEnterprise(@PathVariable("id") long id){
        enterpriseService.deleteEnterprise(id);
        return new RedirectView("/enterprises/all");
    }

    @GetMapping("/edit/{id}")
    public String editEnterpriseForm(@PathVariable("id") long id, Model model){
        Enterprise enterprise = enterpriseService.findEnterpriseById(id);
        model.addAttribute("enterprise", enterprise);
        return "editEnterpriseForm";
    }

    @PostMapping ("/edit/{id}")
    public RedirectView editEnterprise(@PathVariable("id") long id, CreateEnterprise editEnterprise){
        enterpriseService.editEnterprise(id,editEnterprise);
        return new RedirectView("/enterprises/details/" + id);
    }

}
