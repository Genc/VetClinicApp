package com.vetapp.repository;

import com.vetapp.model.Pet;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;
import java.util.Optional;

@Repository
public class PetRepositoryImpl implements PetRepository {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Pet> findAll() {
        return entityManager.createQuery("from Pet", Pet.class).getResultList();
    }

    @Override
    public Optional<Pet> findById(Long id) {
        Pet pet = entityManager.find(Pet.class, id);
        return Optional.ofNullable(pet);
    }

    @Override
    public List<Pet> findByPetName(String petName) {
        List<Pet> petList = entityManager.createQuery("from Pet p where lower(p.name) like :petName").setParameter("petName", petName.toLowerCase() + '%').getResultList();
        return petList;
    }

    @Override
    public Long totalPets() {
        return entityManager.createQuery("select count(*) from Pet",Long.class).getSingleResult();
    }

    @Override
    public void save(Pet pet) {
        entityManager.persist(pet);
    }

    @Override
    public Pet update(Pet pet) {
        return entityManager.merge(pet);
    }

    @Override
    public void delete(Long id) {
        entityManager.remove(entityManager.getReference(Pet.class, id));
    }
}
