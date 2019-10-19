package com.vetapp.repository;

import com.vetapp.model.Pet;

import java.util.List;
import java.util.Optional;

public interface PetRepository {

    List<Pet> findAll();

    Optional<Pet> findById(Long id);

    List<Pet> findByPetName(String petName);

    Long totalPets();

    void save(Pet pet);

    Pet update(Pet pet);

    void delete(Long id);
}
