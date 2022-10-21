package com.example.crm_rosa.exception;

public class UserNotFoundException extends RuntimeException {
    public UserNotFoundException(long id) {
        super("L'utilisateur avec l'id " + id + " n'existe pas.");
    }
}
