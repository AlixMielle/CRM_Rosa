package com.example.crm_rosa.repository.entity;

import javax.persistence.*;
import java.util.List;

@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String firstname;

    private String lastname;

    private String email;

    private String mobile;

    private String phone;

    private String address;

    private String city;

    private int zipcode;

    private String password;

    private String pictureUrl;

    private String enterpriseName;

    private String job;

    private boolean isAdmin;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Prospect> prospects;


    public User() {
    }

    public User(String firstname, String lastname, String email, String mobile, String phone, String address, String city, int zipcode, String password, String pictureUrl, String enterpriseName, String job, boolean isAdmin) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.mobile = mobile;
        this.phone = phone;
        this.address = address;
        this.city = city;
        this.zipcode = zipcode;
        this.password = password;
        this.pictureUrl = pictureUrl;
        this.enterpriseName = enterpriseName;
        this.job = job;
        this.isAdmin = isAdmin;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPictureUrl() {
        return pictureUrl;
    }

    public void setPictureUrl(String pictureUrl) {
        this.pictureUrl = pictureUrl;
    }

    public String getEnterpriseName() {
        return enterpriseName;
    }

    public void setEnterpriseName(String enterpriseName) {
        this.enterpriseName = enterpriseName;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public boolean getIsAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
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
