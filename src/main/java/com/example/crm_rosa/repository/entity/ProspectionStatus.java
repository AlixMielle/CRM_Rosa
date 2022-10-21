package com.example.crm_rosa.repository.entity;

public enum ProspectionStatus {
    NOTSTARTED, //pas encore contacté
    ONGOING,    //en cours
    SEEKUPDATE, //relance à faire
    CLIENT,   //fini, c'est un client
    DECLINED     //refus, fini mais pas client.
}
