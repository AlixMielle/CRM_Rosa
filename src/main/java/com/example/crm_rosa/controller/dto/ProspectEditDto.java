package com.example.crm_rosa.controller.dto;

import com.example.crm_rosa.repository.entity.ProspectionStatus;

public class ProspectEditDto {

    private long id;
    private String firstName;
    private String lastName;
    private String profilePictureUrl;
    private String email;
    private String mobilePhone;
    private String landlinePhone;
    private long enterpriseId;
    private String jobTitle;
    private ProspectionStatus prospectionStatus;

    public ProspectEditDto() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getProfilePictureUrl() {
        return profilePictureUrl;
    }

    public void setProfilePictureUrl(String profilePictureUrl) {
        this.profilePictureUrl = profilePictureUrl;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }

    public String getLandlinePhone() {
        return landlinePhone;
    }

    public void setLandlinePhone(String landlinePhone) {
        this.landlinePhone = landlinePhone;
    }

    public long getEnterpriseId() {
        return enterpriseId;
    }

    public void setEnterpriseId(long enterpriseId) {
        this.enterpriseId = enterpriseId;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public ProspectionStatus getProspectionStatus() {
        return prospectionStatus;
    }

    public void setProspectionStatus(ProspectionStatus prospectionStatus) {
        this.prospectionStatus = prospectionStatus;
    }
}
