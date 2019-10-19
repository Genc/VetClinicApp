package com.vetapp.service;

import com.vetapp.model.Pet;

import java.util.List;
import java.util.Optional;

public interface PetService {

    List<Pet> findAll();

    List<Pet> findByPetName(String petName);

    Optional<Pet> findById(Long id);

    Long totalPets();

    void save(Pet pet);

    Pet update(Pet pet);

    void delete(Long id);

}
