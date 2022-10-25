package com.example.crm_rosa.repository.entity;

public enum ProspectionStatus {
    NOTSTARTED("pas commencée"), //pas encore contacté
    ONGOING("en cours"),    //en cours
    SEEKUPDATE("prendre contact"), //relance à faire
    CLIENT("client"),   //fini, c'est un client
    DECLINED("refusée");     //refus, fini mais pas client.

    private final String inFrench;

    private ProspectionStatus(String inFrench){
        this.inFrench = inFrench;
    }

    public String getInFrench() {
        return inFrench;
    }
}
