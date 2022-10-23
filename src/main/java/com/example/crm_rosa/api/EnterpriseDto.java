package com.example.crm_rosa.api;

import com.example.crm_rosa.repository.entity.Enterprise;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

public class EnterpriseDto {

    private Long id;

    private String name;

    private String logo;

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

    public EnterpriseDto() {
    }

    public static EnterpriseDto from(Enterprise enterprise) {
        EnterpriseDto dto = new EnterpriseDto();
        dto.setId(enterprise.getId());
        dto.setName(enterprise.getName());
        dto.setSiret(enterprise.getSiret());
        dto.setLogo(enterprise.getLogo());
        dto.setWebsite(enterprise.getWebsite());
        dto.setEmail(enterprise.getEmail());
        dto.setPhone(enterprise.getPhone());
        dto.setMobile(enterprise.getMobile());
        dto.setAddress(enterprise.getAddress());
        dto.setAdditionalAddress(enterprise.getAdditionalAddress());
        dto.setCity(enterprise.getCity());
        dto.setZipcode(enterprise.getZipcode());
        dto.setSector(enterprise.getSector());
        dto.setCreatedAt(enterprise.getCreatedAt());

        return dto;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
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
}
