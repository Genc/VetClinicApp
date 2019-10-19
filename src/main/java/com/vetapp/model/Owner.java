package com.vetapp.model;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "OWNER")
public class Owner {

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

    @Column(name = "SURNAME")
    @NotEmpty(message = "Lütfen soyisim bilgisi giriniz!")
    private String surname;

    @Column(name = "ADDRESS")
    @NotEmpty(message = "Lütfen adres bilgisi giriniz!")
    private String address;

    @Column(name = "PHONE_NUMBER")
    @NotEmpty(message = "Lütfen telefon numarası giriniz!")
    private String phoneNumber;

    @Column(name = "MAIL")
    @NotEmpty(message = "Lütfen e-mail giriniz!")
    private String mail;

    @OneToMany(mappedBy = "owner", cascade = CascadeType.ALL)
    private Set<Pet> pets = new HashSet<>();

    public Owner() {
    }

    public Owner(String name, String surname, String address, String phoneNumber, String mail) {
        this.name = name;
        this.surname = surname;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.mail = mail;
    }

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

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public Set<Pet> getPets() {
        return pets;
    }

    public void setPets(Set<Pet> pets) {
        this.pets = pets;
    }

    @Override
    public String toString() {
        return "Owner{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", address='" + address + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", mail='" + mail + '\'' +
                '}';
    }
}
