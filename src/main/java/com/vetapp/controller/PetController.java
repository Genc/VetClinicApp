package com.vetapp.controller;

import com.vetapp.model.Owner;
import com.vetapp.model.Pet;
import com.vetapp.service.OwnerService;
import com.vetapp.service.PetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping(value = "/pet")
public class PetController {

    private PetService petService;
    private OwnerService ownerService;

    @Autowired
    public PetController(PetService petService, OwnerService ownerService) {
        this.petService = petService;
        this.ownerService = ownerService;
    }

    @RequestMapping(value = "/pets")
    public String getAllPets(ModelMap modelMap) {
        List<Pet> petList = petService.findAll();
        modelMap.addAttribute("petList", petList);
        return "pet/pets";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addPetPage(@ModelAttribute("pet") Pet pet, ModelMap modelMap) {
        List<Owner> ownerList = ownerService.findAll();
        boolean ownerListEmpty = ownerList.isEmpty();
        if (ownerListEmpty) {
            modelMap.addAttribute("ownerNotFound", "Şuanda sistemde kayıtlı hayvan sahibi olmadığından dolayı yeni bir hayvan ekleyemezsiniz!");
        }
        return "pet/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addPet(@ModelAttribute("pet") @Valid Pet pet, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            return "pet/add";
        }
        petService.save(pet);
        redirectAttributes.addFlashAttribute("pet", pet);
        redirectAttributes.addFlashAttribute("successfullyAddedPet", "Yeni hayvan başarı ile eklendi.");
        return "redirect:/pet/pets";
    }

    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    public String petDetailPage(@PathVariable("id") Long id, ModelMap modelMap, RedirectAttributes redirectAttributes) {
        Optional<Pet> optionalPet = petService.findById(id);

        if (optionalPet.isPresent()) {
            Pet pet = optionalPet.get();
            modelMap.addAttribute("petInformation", pet);
            return "pet/details";
        }
        redirectAttributes.addFlashAttribute("notFoundPet", "Girmiş olduğunuz bilgilere göre sistemde kayıtlı hayvan bulunamadı!");
        return "redirect:/pet/pets";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String updatePetPage(@PathVariable Long id, ModelMap modelMap, RedirectAttributes redirectAttributes) {
        Optional<Pet> optionalPet = petService.findById(id);

        if (optionalPet.isPresent()) {
            Pet pet = optionalPet.get();
            modelMap.addAttribute("pet", pet);
            return "pet/edit";
        }

        redirectAttributes.addFlashAttribute("notFoundPet", "Girmiş olduğunuz bilgilere göre sistemde kayıtlı hayvan bulunamadı!");
        return "redirect:/pet/pets";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    public String updatePet(@ModelAttribute @Valid Pet pet, BindingResult bindingResult, RedirectAttributes redirectAttributes, @PathVariable Long id) {
        if (bindingResult.hasErrors()) {
            return "pet/edit";
        }
        petService.update(pet);
        redirectAttributes.addFlashAttribute("successfullyUpdatedPet", pet.getName() + " isimli hayvanın bilgileri başarı ile güncellendi.");
        return "redirect:/pet/pets";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    public String deletePet(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        petService.delete(id);
        redirectAttributes.addFlashAttribute("successfullyDeletedPet", "Seçilen hayvan başarıyla silindi.");
        return "redirect:/pet/pets";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String searchPetPage(@RequestParam(required = false) String petName, ModelMap modelMap) {
        if (petName == null) {
            return "pet/search";
        }

        List<Pet> petList = petService.findByPetName(petName);
        if (petList.isEmpty()) {
            modelMap.addAttribute("notFoundPets", "Sistemde " + petName + " isimli hayvan bulunamadı! Lütfen isim bilgisini doğru girerek tekrar deneyiniz!");
            return "pet/search";
        }
        modelMap.addAttribute("foundedPets", petName + " ismine sahip hayvanlar başarıyla getirildi.");
        modelMap.addAttribute("petList", petList);
        return "pet/pets";
    }

    @ModelAttribute("ownerList")
    public List<Owner> prepareOwnerList() {
        return ownerService.findAll();
    }
}