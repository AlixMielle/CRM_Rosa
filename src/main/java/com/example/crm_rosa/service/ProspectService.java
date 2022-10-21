package com.example.crm_rosa.service;

import com.example.crm_rosa.controller.dto.ProspectCreateDto;
import com.example.crm_rosa.controller.dto.ProspectEditDto;
import com.example.crm_rosa.repository.ProspectRepository;
import com.example.crm_rosa.repository.entity.Prospect;
import org.hibernate.ObjectNotFoundException;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class ProspectService {

    private ProspectRepository prospectRepository;
    private EnterpriseService enterpriseService;

    public ProspectService(ProspectRepository prospectRepository, EnterpriseService enterpriseService) {
        this.prospectRepository = prospectRepository;
        this.enterpriseService = enterpriseService;
    }

    public List<Prospect> getAbsolutelyAllProspects(){
        return (List<Prospect>) this.prospectRepository.findAll();
    }

    //TODO: modify when user entity comes in
    public List<Prospect> getAllProspects(long userId){
        return (List<Prospect>) this.prospectRepository.findProspectByUser(userId);
    }

    public Prospect getProspectById(long prospectId){
        return (Prospect) this.prospectRepository.findById(prospectId).orElseThrow(() -> new ObjectNotFoundException(prospectId, "Prospect"));
    }

    //TODO: currentUser needs to be a User
    public void addProspect(ProspectCreateDto prospectCreateDto, long currentUser){
        Prospect prospect = new Prospect();
        prospect.setUser(currentUser);
        prospect.setFirstName(prospectCreateDto.getFirstName());
        prospect.setLastName(prospectCreateDto.getLastName());
        prospect.setProfilePictureUrl(prospectCreateDto.getProfilePictureUrl());
        prospect.setEmail(prospectCreateDto.getEmail());
        prospect.setMobilePhone(prospectCreateDto.getMobilePhone());
        prospect.setLandlinePhone(prospectCreateDto.getLandlinePhone());
        //enterprise stuff
        prospect.setEnterprise(this.enterpriseService.findEnterpriseById(prospectCreateDto.getEnterpriseId()));
        prospect.setJobTitle(prospectCreateDto.getJobTitle());
        prospect.setCreatedAt(LocalDate.now());
        //prospection
        prospect.setProspectionStatus(prospectCreateDto.getProspectionStatus());

        //TODO: add contact to currentUser

        this.prospectRepository.save(prospect);
    }

    public void editProspect(ProspectEditDto prospectEditDto){
        Prospect prospect = new Prospect();
        prospect.setId(prospectEditDto.getId());
        prospect.setFirstName(prospectEditDto.getFirstName());
        prospect.setLastName(prospectEditDto.getLastName());
        prospect.setProfilePictureUrl(prospectEditDto.getProfilePictureUrl());
        prospect.setEmail(prospectEditDto.getEmail());
        prospect.setMobilePhone(prospectEditDto.getMobilePhone());
        prospect.setLandlinePhone(prospectEditDto.getLandlinePhone());
        //enterprise stuff
        prospect.setEnterprise(this.enterpriseService.findEnterpriseById(prospectEditDto.getEnterpriseId()));
        prospect.setJobTitle(prospectEditDto.getJobTitle());
        //prospection
        prospect.setProspectionStatus(prospectEditDto.getProspectionStatus());

        //TODO: add contact to currentUser

        this.prospectRepository.save(prospect);
    }

    public void deleteProspectById(long id){
        this.prospectRepository.deleteById(id);
    }
}
