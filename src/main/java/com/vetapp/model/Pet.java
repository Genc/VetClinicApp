package com.vetapp.model;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "PET")
public class Pet {

    @Id
    @SequenceGenerator(
            name = "vet_sequence",
            sequenceName = "VET_SEQUENCE",
            allocationSize = 1
    )
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "vet_sequence")
    @Column(name = "ID")
    private Long id;

    @Column(name = "NAME")
    @NotEmpty(message = "Lütfen isim bilgisi giriniz!")
    private String name;

    @Column(name = "AGE")
    @NotNull(message = "Lütfen yaş bilgisi giriniz!")
    private Integer age;

    @Column(name = "BREED")
    @NotEmpty(message = "Lütfen tür bilgisi giriniz!")
    private String breed;

    @Column(name = "SPECIES")
    @NotEmpty(message = "Lütfen cins bilgisi giriniz!")
    private String species;

    @Column(name = "DESCRIPTION")
    @NotEmpty(message = "Lütfen açıklama giriniz!")
    private String description;

    @ManyToOne
    @JoinColumn(name = "OWNER_ID")
    private Owner owner;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getBreed() {
        return breed;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }

    public String getSpecies() {
        return species;
    }

    public void setSpecies(String species) {
        this.species = species;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Owner getOwner() {
        return owner;
    }

    public void setOwner(Owner owner) {
        this.owner = owner;
    }
}
