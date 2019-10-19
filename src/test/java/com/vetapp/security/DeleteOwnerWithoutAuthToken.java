package com.vetapp.security;

import com.vetapp.service.OwnerService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DeleteOwnerWithoutAuthToken {

    @Autowired
    private OwnerService ownerService;

    @Test(expected = AuthenticationCredentialsNotFoundException.class)
    public void deleteOwner() {
        ownerService.delete(1L);
    }

}
