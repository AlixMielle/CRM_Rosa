package com.example.crm_rosa.security;

import com.example.crm_rosa.repository.UserRepository;
import com.example.crm_rosa.repository.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user = userRepository.findUserByEmail(email).orElseThrow(()->new UsernameNotFoundException("Cet utilisateur n'existe pas."));
        return new CustomUserDetails(user);
    }
}
