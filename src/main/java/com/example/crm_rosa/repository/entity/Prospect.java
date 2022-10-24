package com.example.crm_rosa.repository.entity;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Entity
public class Prospect {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @ManyToOne(fetch = FetchType.EAGER)
    private User user;
    private String firstName;
    private String lastName;
    private String profilePictureUrl;
    private String email;
    private String mobilePhone;
    private String landlinePhone;
    @ManyToOne(fetch = FetchType.EAGER)
    private Enterprise enterprise;
    private String jobTitle;
    private LocalDate createdAt;
    @Enumerated(EnumType.STRING)
    private ProspectionStatus prospectionStatus;
    @OneToMany(mappedBy = "prospect", fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Note> notes;

    @OneToMany(mappedBy = "prospect", fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Event> events;

    public Prospect() {
    }

    public Prospect(User user, String firstName, String lastName, String profilePictureUrl, String email, String mobilePhone, String landlinePhone, Enterprise enterprise, String jobTitle, LocalDate createdAt, ProspectionStatus prospectionStatus) {
        this.user = user;
        this.firstName = firstName;
        this.lastName = lastName;
        this.profilePictureUrl = profilePictureUrl;
        this.email = email;
        this.mobilePhone = mobilePhone;
        this.landlinePhone = landlinePhone;
        this.enterprise = enterprise;
        this.jobTitle = jobTitle;
        this.createdAt = createdAt;
        this.prospectionStatus = prospectionStatus;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    //TODO: the get/set needs to change when the User entity comes in
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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

    public Enterprise getEnterprise() {
        return enterprise;
    }

    public void setEnterprise(Enterprise enterprise) {
        this.enterprise = enterprise;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public LocalDate getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDate createdAt) {
        this.createdAt = createdAt;
    }

    public ProspectionStatus getProspectionStatus() {
        return prospectionStatus;
    }

    public void setProspectionStatus(ProspectionStatus prospectionStatus) {
        this.prospectionStatus = prospectionStatus;
    }

    public List<Note> getNotes() {
        return notes;
    }

    public void setNotes(List<Note> notes) {
        this.notes = notes;
    }

    public void addNote(Note note){
        this.notes.add(note);

    }

    public void removeNote(Note note){
        this.notes.remove(note);
    }

    public void removeEvent(Event event) { this.events.remove(event);
    }

    public void addEvent(Event event){
        this.events.add(event);
    }
}
