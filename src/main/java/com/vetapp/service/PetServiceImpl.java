package com.vetapp.service;

import com.vetapp.model.Pet;
import com.vetapp.repository.PetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class PetServiceImpl implements PetService {

    private PetRepository petRepository;

    @Autowired
    public void setPetRepository(PetRepository petRepository) {
        this.petRepository = petRepository;
    }

    @Override
    public List<Pet> findAll() {
        return petRepository.findAll();
    }

    @Override
    public Optional<Pet> findById(Long id) {
        return petRepository.findById(id);
    }

    @Override
    public Long totalPets() {
        return petRepository.totalPets();
    }

    @Override
    public List<Pet> findByPetName(String petName) {
        return petRepository.findByPetName(petName);
    }

    @Override
    public void save(Pet pet) {
        petRepository.save(pet);
    }

    @Override
    public Pet update(Pet pet) {
        return petRepository.update(pet);
    }

    @Override
    @Secured("ROLE_ADMIN")
    public void delete(Long id) {
        petRepository.delete(id);
    }
}
