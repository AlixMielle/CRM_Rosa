package com.example.crm_rosa.service;

import com.example.crm_rosa.controller.dto.ProspectCreateDto;
import com.example.crm_rosa.controller.dto.ProspectEditDto;
import com.example.crm_rosa.repository.ProspectRepository;
import com.example.crm_rosa.repository.entity.Prospect;
import com.example.crm_rosa.repository.entity.ProspectionStatus;
import com.example.crm_rosa.repository.entity.User;
import org.hibernate.ObjectNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;
import java.util.List;

@Service
public class ClientService {

    private ProspectRepository prospectRepository;
    private EnterpriseService enterpriseService;

    private StorageService storageService;

    public ClientService(ProspectRepository prospectRepository, EnterpriseService enterpriseService, StorageService storageService) {
        this.prospectRepository = prospectRepository;
        this.enterpriseService = enterpriseService;
        this.storageService = storageService;
    }

    public List<Prospect> getAbsolutelyAllClients(){
        return this.prospectRepository.findAllClients();
    }

    public List<Prospect> getAllClients(User user){
        return this.prospectRepository.findOnlyClientByUser(user);
    }

    public List<Prospect> getClientsByEnterprise(long enterpriseId, User user){
        return this.prospectRepository.findClientsByEnterpriseAndUser(enterpriseId, user.getId());
    }

    public Prospect getClientById(long clientId){
        return this.prospectRepository.findClientById(clientId).orElseThrow(() -> new ObjectNotFoundException(clientId, "Prospect"));
    }

    public List<Prospect> getClientsBySearch(String search, User user){
        return this.prospectRepository.findClientBySearch(search, user.getId());
    }

    public void addClient(ProspectCreateDto prospectCreateDto, User currentUser){
        Prospect prospect = new Prospect();
        prospect.setUser(currentUser);
        prospect.setFirstName(prospectCreateDto.getFirstName());
        prospect.setLastName(prospectCreateDto.getLastName());
        prospect.setEmail(prospectCreateDto.getEmail());
        prospect.setMobilePhone(prospectCreateDto.getMobilePhone());
        prospect.setLandlinePhone(prospectCreateDto.getLandlinePhone());
        prospect.setAddress(prospectCreateDto.getAddress());
        //enterprise stuff
        prospect.setEnterprise(this.enterpriseService.findEnterpriseById(prospectCreateDto.getEnterpriseId()));
        prospect.setJobTitle(prospectCreateDto.getJobTitle());
        prospect.setCreatedAt(LocalDate.now());
        //prospection
        prospect.setProspectionStatus(ProspectionStatus.CLIENT);

        MultipartFile pictureProfil = prospectCreateDto.getProfilePictureFile();
        if (pictureProfil == null || pictureProfil.isEmpty()){
            prospect.setProfilePictureUrl(prospectCreateDto.getProfilePictureUrl());
        } else {
            storageService.store(pictureProfil);
            prospect.setProfilePictureUrl("http://localhost:8080/images/" + pictureProfil.getOriginalFilename());
        }

        this.prospectRepository.save(prospect);
    }

    public void editProspect(ProspectEditDto prospectEditDto){
        Prospect prospect = new Prospect();
        prospect.setId(prospectEditDto.getId());
        prospect.setFirstName(prospectEditDto.getFirstName());
        prospect.setLastName(prospectEditDto.getLastName());
        prospect.setEmail(prospectEditDto.getEmail());
        prospect.setMobilePhone(prospectEditDto.getMobilePhone());
        prospect.setLandlinePhone(prospectEditDto.getLandlinePhone());
        prospect.setAddress(prospectEditDto.getAddress());
        //enterprise stuff
        prospect.setEnterprise(this.enterpriseService.findEnterpriseById(prospectEditDto.getEnterpriseId()));
        prospect.setJobTitle(prospectEditDto.getJobTitle());
        //prospection
        prospect.setProspectionStatus(prospectEditDto.getProspectionStatus());

        MultipartFile pictureProfil = prospectEditDto.getProfilePictureFile();
        if (pictureProfil == null || pictureProfil.isEmpty()){
            prospect.setProfilePictureUrl(prospectEditDto.getProfilePictureUrl());
        } else {
            storageService.store(pictureProfil);
            prospect.setProfilePictureUrl("http://localhost:8080/images/" + pictureProfil.getOriginalFilename());
        }

        this.prospectRepository.save(prospect);
    }

    public void deleteProspectById(long id){
        Prospect prospect = this.getClientById(id);
        prospect.getEnterprise().removeProspect(prospect);
        this.prospectRepository.deleteById(id);
    }
}
