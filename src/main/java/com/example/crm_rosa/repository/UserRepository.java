package com.example.crm_rosa.repository;

import com.example.crm_rosa.repository.entity.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {


    @Query("SELECT u FROM User u WHERE u.lastname LIKE %:keyword% OR u.firstname LIKE %:keyword%")
    List<User> searchByName(String keyword);

    User findUserByEmail(String email);
}

