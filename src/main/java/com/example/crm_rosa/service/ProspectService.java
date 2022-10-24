package com.example.crm_rosa.service;

import com.example.crm_rosa.controller.dto.ProspectCreateDto;
import com.example.crm_rosa.controller.dto.ProspectEditDto;
import com.example.crm_rosa.repository.ProspectRepository;
import com.example.crm_rosa.repository.entity.Prospect;
import com.example.crm_rosa.repository.entity.User;
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

    public List<Prospect> getAllProspects(User user){
        return this.prospectRepository.findProspectByUser(user);
    }

    public List<Prospect> getProspectsByEnterprise(long enterpriseId, User user){
        return this.prospectRepository.findProspectByEnterprise_IdAndUser(enterpriseId, user);
    }

    public Prospect getProspectById(long prospectId){
        return this.prospectRepository.findById(prospectId).orElseThrow(() -> new ObjectNotFoundException(prospectId, "Prospect"));
    }

    public List<Prospect> getProspectsBySearch(String search, User user){
        return this.prospectRepository.findProspectsBySearch(search, user.getId());
    }

    public void addProspect(ProspectCreateDto prospectCreateDto, User currentUser){
        Prospect prospect = new Prospect();
        prospect.setUser(currentUser);
        prospect.setFirstName(prospectCreateDto.getFirstName());
        prospect.setLastName(prospectCreateDto.getLastName());
        prospect.setProfilePictureUrl(prospectCreateDto.getProfilePictureUrl());
        prospect.setEmail(prospectCreateDto.getEmail());
        prospect.setMobilePhone(prospectCreateDto.getMobilePhone());
        prospect.setLandlinePhone(prospectCreateDto.getLandlinePhone());
        prospect.setAddress(prospectCreateDto.getAddress());
        //enterprise stuff
        if(prospectCreateDto.getEnterpriseId() != -1){
            prospect.setEnterprise(this.enterpriseService.findEnterpriseById(prospectCreateDto.getEnterpriseId()));
        }
        prospect.setJobTitle(prospectCreateDto.getJobTitle());
        prospect.setCreatedAt(LocalDate.now());
        //prospection
        prospect.setProspectionStatus(prospectCreateDto.getProspectionStatus());

        this.prospectRepository.save(prospect);
    }

    public void editProspect(ProspectEditDto prospectEditDto){
        Prospect prospect = this.getProspectById(prospectEditDto.getId());
        prospect.setFirstName(prospectEditDto.getFirstName());
        prospect.setLastName(prospectEditDto.getLastName());
        prospect.setProfilePictureUrl(prospectEditDto.getProfilePictureUrl());
        prospect.setEmail(prospectEditDto.getEmail());
        prospect.setMobilePhone(prospectEditDto.getMobilePhone());
        prospect.setLandlinePhone(prospectEditDto.getLandlinePhone());
        prospect.setAddress(prospectEditDto.getAddress());
        //enterprise stuff
        if(prospectEditDto.getEnterpriseId() == -1){
            prospect.setEnterprise(null);
        } else{
            prospect.setEnterprise(this.enterpriseService.findEnterpriseById(prospectEditDto.getEnterpriseId()));
        }
        prospect.setJobTitle(prospectEditDto.getJobTitle());
        //prospection
        prospect.setProspectionStatus(prospectEditDto.getProspectionStatus());

        this.prospectRepository.save(prospect);
    }

    public void deleteProspectById(long id){
        Prospect prospect = this.getProspectById(id);
        prospect.getEnterprise().removeProspect(prospect);
        this.prospectRepository.deleteById(id);
    }
}
