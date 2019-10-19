package com.vetapp.repository;

import com.vetapp.model.Owner;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;
import java.util.Optional;

@Repository
public class OwnerRepositoryImpl implements OwnerRepository {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Owner> findAll() {
        return entityManager.createQuery("from Owner", Owner.class).getResultList();
    }

    @Override
    public Optional<Owner> findById(Long id) {
        Owner owner = entityManager.find(Owner.class, id);
        return Optional.ofNullable(owner);

    }

    @Override
    public List<Owner> findOwnersByOwnerName(String ownerName) {
        List<Owner> ownerList = entityManager.createQuery("from Owner o where lower(o.name) like :ownerName").setParameter("ownerName", ownerName.toLowerCase() + '%').getResultList();
        return ownerList;
    }

    @Override
    public boolean existEmail(String email) {
        Query query = entityManager.createQuery("from Owner o where o.mail = : email");
        boolean isEmpty = query.setParameter("email", email).getResultList().isEmpty();
        return !isEmpty;
    }

    @Override
    public Long totalOwners() {
        return entityManager.createQuery("select count(*) from Owner", Long.class).getSingleResult();
    }

    @Override
    public void save(Owner owner) {
        entityManager.persist(owner);
    }

    @Override
    public Owner update(Owner owner) {
        return entityManager.merge(owner);
    }

    @Override
    public void delete(Long id) {
        entityManager.remove(entityManager.getReference(Owner.class, id));
    }
}