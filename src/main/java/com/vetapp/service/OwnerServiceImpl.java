package com.vetapp.service;

import com.vetapp.model.Owner;
import com.vetapp.repository.OwnerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class OwnerServiceImpl implements OwnerService {

    private OwnerRepository ownerRepository;

    @Autowired
    public void setOwnerRepository(OwnerRepository ownerRepository) {
        this.ownerRepository = ownerRepository;
    }

    @Override
    public List<Owner> findAll() {
        return ownerRepository.findAll();
    }

    @Override
    public Optional<Owner> findById(Long id) {
        return ownerRepository.findById(id);
    }

    @Override
    public boolean existEmail(String email) {
        return ownerRepository.existEmail(email);
    }

    @Override
    public Long totalOwners() {
        return ownerRepository.totalOwners();
    }

    @Override
    public List<Owner> findOwnersByOwnerName(String ownerName) {
        return ownerRepository.findOwnersByOwnerName(ownerName);
    }

    @Override
    public void save(Owner owner) {
        ownerRepository.save(owner);
    }

    @Override
    public Owner update(Owner owner) {
        return ownerRepository.update(owner);
    }

    @Override
    @Secured(value = "ROLE_ADMIN")
    public void delete(Long id) {
        ownerRepository.delete(id);
    }
}
