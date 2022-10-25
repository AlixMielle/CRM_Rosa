package com.example.crm_rosa.repository.entity;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Entity
public class Enterprise {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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

    private LocalDate createdAt;

    @OneToMany(mappedBy = "enterprise", fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Prospect> prospects;

    public Enterprise() {
    }

    public Enterprise(String name, String logo, String siret, String email, String mobile, String phone, String website, String address, String additionalAddress, String city, int zipcode, String sector, LocalDate createdAt) {
        this.name = name;
        this.logo = logo;
        this.siret = siret;
        this.email = email;
        this.mobile = mobile;
        this.phone = phone;
        this.website = website;
        this.address = address;
        this.additionalAddress = additionalAddress;
        this.city = city;
        this.zipcode = zipcode;
        this.sector = sector;
        this.createdAt = createdAt;
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

    public List<Prospect> getProspects() {
        return prospects;
    }

    public void setProspects(List<Prospect> prospects) {
        this.prospects = prospects;
    }

    public void addProspect(Prospect prospect){
        this.prospects.add(prospect);
    }

    public void removeProspect(Prospect prospect){
        this.prospects.remove(prospect);
    }
}
