package com.example.crm_rosa.service;

import com.example.crm_rosa.controller.dto.CreateEnterprise;
import com.example.crm_rosa.exception.EnterpriseNotFoundException;
import com.example.crm_rosa.repository.EnterpriseRepository;
import com.example.crm_rosa.repository.entity.Enterprise;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;
import java.util.List;

@Service
public class EnterpriseService {

    private EnterpriseRepository enterpriseRepository;
    private StorageService storageService;

    public EnterpriseService(EnterpriseRepository enterpriseRepository, StorageService storageService) {
        this.enterpriseRepository = enterpriseRepository;
        this.storageService = storageService;
    }

    public List<Enterprise> findAllEnterprises() {
        return (List<Enterprise>) this.enterpriseRepository.findAll();
    }

    public List<Enterprise> findEnterpriseByName(String keyword) {
        if (keyword != null){
            return this.enterpriseRepository.searchByName(keyword);
        }
        return (List<Enterprise>) this.enterpriseRepository.findAll();
    }

    public Enterprise findEnterpriseById(long id) {
        return this.enterpriseRepository
                .findById(id)
                .orElseThrow(()->new EnterpriseNotFoundException(id));
    }

    public void addEnterprise(CreateEnterprise createEnterprise) {

        Enterprise e = new Enterprise();
        e.setName(createEnterprise.getName());
        e.setSiret(createEnterprise.getSiret());
        e.setEmail(createEnterprise.getEmail());
        e.setMobile(createEnterprise.getMobile());
        e.setPhone(createEnterprise.getPhone());
        e.setWebsite(createEnterprise.getWebsite());
        e.setAddress(createEnterprise.getAddress());
        e.setAdditionalAddress(createEnterprise.getAdditionalAddress());
        e.setCity(createEnterprise.getCity());
        e.setZipcode(createEnterprise.getZipcode());
        e.setSector(createEnterprise.getSector());
        e.setCreatedAt(LocalDate.now());

        MultipartFile logo = createEnterprise.getLogoFile();
        if (logo == null || logo.isEmpty()){
            e.setLogo(createEnterprise.getLogoUrl());
        } else {
            storageService.store(logo);
            e.setLogo("http://localhost:8080/images/" + logo.getOriginalFilename());
        }

        this.enterpriseRepository.save(e);
    }

    public void deleteEnterprise(long id) {
        enterpriseRepository.deleteById(id);
    }

    public void editEnterprise(long id, CreateEnterprise editEnterprise) {
        Enterprise enterprise = this.enterpriseRepository
                .findById(id)
                .orElseThrow(()->new EnterpriseNotFoundException(id));

        enterprise.setName(editEnterprise.getName());
        enterprise.setSiret(editEnterprise.getSiret());
        enterprise.setEmail(editEnterprise.getEmail());
        enterprise.setMobile(editEnterprise.getMobile());
        enterprise.setPhone(editEnterprise.getPhone());
        enterprise.setWebsite(editEnterprise.getWebsite());
        enterprise.setAddress(editEnterprise.getAddress());
        enterprise.setAdditionalAddress(editEnterprise.getAdditionalAddress());
        enterprise.setCity(editEnterprise.getCity());
        enterprise.setZipcode(editEnterprise.getZipcode());
        enterprise.setSector(editEnterprise.getSector());

        this.enterpriseRepository.save(enterprise);
    }
}
