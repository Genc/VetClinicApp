package com.vetapp.configuration;

import com.vetapp.model.Role;
import com.vetapp.model.User;
import com.vetapp.repository.RoleRepository;
import com.vetapp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

@Component
public class DataLoader implements ApplicationRunner {

    private UserRepository userRepository;
    private RoleRepository roleRepository;
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    public DataLoader(UserRepository userRepository, RoleRepository roleRepository, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    @Override
    public void run(ApplicationArguments args) throws Exception {

        // Added roles.

        Role userRole = new Role("ROLE_USER");
        Role adminRole = new Role("ROLE_ADMIN");
        roleRepository.save(userRole);
        roleRepository.save(adminRole);

        // Added admin user.

        String adminPassword = bCryptPasswordEncoder.encode("admin");
        User adminUser = new User("admin", adminPassword, true);
        userRepository.save(adminUser);

        // Admin user has been assigned the admin role.

        Set<Role> adminRoleSet = new HashSet<>(Arrays.asList(adminRole,userRole));
        User admin = userRepository.findUserByUsername("admin").get();

        admin.setRoles(adminRoleSet);
        userRepository.saveAndFlush(admin);
    }
}
