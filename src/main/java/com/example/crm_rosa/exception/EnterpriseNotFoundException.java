package com.example.crm_rosa.exception;

public class EnterpriseNotFoundException extends RuntimeException {
    public EnterpriseNotFoundException(long id) {
        super("Enterprise with id " + id + " does not exist");
    }
}
