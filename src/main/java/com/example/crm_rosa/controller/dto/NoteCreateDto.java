package com.example.crm_rosa.controller.dto;

public class NoteCreateDto {

    private long prospectId;
    private String title;
    private String content;

    public NoteCreateDto() {
    }

    public long getProspectId() {
        return prospectId;
    }

    public void setProspectId(long prospectId) {
        this.prospectId = prospectId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
