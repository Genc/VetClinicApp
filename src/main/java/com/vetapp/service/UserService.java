package com.vetapp.service;

import com.vetapp.model.User;
import org.springframework.security.core.Authentication;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Optional;

public interface UserService {

    Optional<User> findUserByUsername(String username);

    void save(User user);

    Long totalUsers();

    void autoLogin(HttpServletRequest request, String username, String password);

    String findUsernameOfLoggedInUser();

    boolean isAdmin(Authentication authentication);

}
