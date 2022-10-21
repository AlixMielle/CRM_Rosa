package com.example.crm_rosa.service;

import com.example.crm_rosa.controller.dto.CreateUser;
import com.example.crm_rosa.exception.UserNotFoundException;
import com.example.crm_rosa.repository.UserRepository;
import com.example.crm_rosa.repository.entity.User;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UserService {

    private UserRepository userRepository;
    private StorageService storageService;

    public UserService(UserRepository userRepository, StorageService storageService) {
        this.userRepository = userRepository;
        this.storageService = storageService;
    }

    public void register(CreateUser createUser) {
        //todo : décommenter pour ajout Security
        //BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        User newUser = new User();
        newUser.setFirstname(createUser.getFirstname());
        newUser.setLastname(createUser.getLastname());
        newUser.setEmail(createUser.getEmail());
        //newUser.setPassword(passwordEncoder.encode(createUser.getPassword()));
        newUser.setPassword((createUser.getPassword()));
        newUser.setPictureUrl(createUser.getPictureUrl());

        MultipartFile picture = createUser.getPictureFile();
        if (picture == null || picture.isEmpty()){
            newUser.setPictureUrl(createUser.getPictureUrl());
        } else {
            storageService.store(picture);
            newUser.setPictureUrl("http://localhost:8080/images/" + picture.getOriginalFilename());
        }
        this.userRepository.save(newUser);
    }


    public User findUserById(long id) {
        return this.userRepository
                .findById(id)
                .orElseThrow(()->new UserNotFoundException(id));
    }

    public void editUser(long id, CreateUser editUser) {
        User user = this.userRepository
                .findById(id)
                .orElseThrow(()->new UserNotFoundException(id));

        user.setFirstname(editUser.getFirstname());
        user.setLastname(editUser.getLastname());
        user.setPassword(editUser.getPassword());
        user.setEmail(editUser.getEmail());

        MultipartFile picture = editUser.getPictureFile();
        if (picture == null || picture.isEmpty()){
            user.setPictureUrl(editUser.getPictureUrl());
        } else {
            storageService.store(picture);
            user.setPictureUrl("http://localhost:8080/images/" + picture.getOriginalFilename());
        }
        this.userRepository.save(user);
    }

    public void deleteUser(long id) {
        userRepository.deleteById(id);
    }
}
