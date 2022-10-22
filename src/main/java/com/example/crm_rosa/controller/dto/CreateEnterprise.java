package com.example.crm_rosa.controller.dto;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;
import java.util.List;

public class CreateEnterprise {

    private String name;

    private String logoUrl;

    private MultipartFile logoFile;

    private String siret;

    private String email;

    private String mobile;

    private String phone;

    private String website;

    private String address;

    private String additionalAddress;

    private String city;

    private int zipcode;

    private String sector;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate createdAt;

    private List<Long> prospectsIds;

    public CreateEnterprise() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public MultipartFile getLogoFile() {
        return logoFile;
    }

    public void setLogoFile(MultipartFile logoFile) {
        this.logoFile = logoFile;
    }

    public String getSiret() {
        return siret;
    }

    public void setSiret(String siret) {
        this.siret = siret;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAdditionalAddress() {
        return additionalAddress;
    }

    public void setAdditionalAddress(String additionalAddress) {
        this.additionalAddress = additionalAddress;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getZipcode() {
        return zipcode;
    }

    public void setZipcode(int zipcode) {
        this.zipcode = zipcode;
    }

    public String getSector() {
        return sector;
    }

    public void setSector(String sector) {
        this.sector = sector;
    }

    public LocalDate getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDate createdAt) {
        this.createdAt = createdAt;
    }

    public List<Long> getProspectsIds() {
        return prospectsIds;
    }

    public void setProspectsIds(List<Long> prospectsIds) {
        this.prospectsIds = prospectsIds;
    }
}
