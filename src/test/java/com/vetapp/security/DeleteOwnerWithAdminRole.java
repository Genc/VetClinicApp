package com.vetapp.security;

import com.vetapp.model.Owner;
import com.vetapp.service.OwnerService;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.TestingAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Optional;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DeleteOwnerWithAdminRole{

    @Autowired
    private OwnerService ownerService;

    @Before
    public void setUp() {
        Owner owner = new Owner("Ömer Faruk","Genç","Sultanbeyli","5397971497","omer@farukgenc.com");
        ownerService.save(owner);

        String userRole = "ROLE_ADMIN";

        TestingAuthenticationToken auth = new TestingAuthenticationToken("user", "pass",userRole);
        SecurityContextHolder.getContext().setAuthentication(auth);
    }

    @After
    public void tearDown() {
        // Token bilgisini test tamamlandıktan sonra silmeliyiz çünkü diğer testleri etkilemeyelim.
        SecurityContextHolder.clearContext();
    }

    @Test
    public void deleteOwner() {
        Optional<Owner> ownerOptional = ownerService.findById(1L);
        System.err.println("Silinecek hayvan sahibi : " + ownerOptional.get());

        ownerService.delete(1L);
    }


}
