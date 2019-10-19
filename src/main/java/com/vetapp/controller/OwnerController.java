package com.vetapp.controller;

import com.vetapp.model.Owner;
import com.vetapp.service.OwnerService;
import com.vetapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/owner")
public class OwnerController {

    private OwnerService ownerService;
    private UserService userService;

    @Autowired
    public void setOwnerService(OwnerService ownerService, UserService userService) {
        this.ownerService = ownerService;
        this.userService = userService;
    }

    @RequestMapping("/owners")
    public String getAllOwners(ModelMap modelMap) {
        List<Owner> ownerList = ownerService.findAll();
        modelMap.addAttribute("ownerList", ownerList);
        return "owner/owners";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addOwnerPage(@ModelAttribute("owner") Owner owner) {
        return "owner/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addOwner(@ModelAttribute @Valid Owner owner, BindingResult bindingResult,ModelMap modelMap, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            return "owner/add";
        }

        String ownerMail = owner.getMail();
        boolean existEmail = ownerService.existEmail(ownerMail);

        if (existEmail) {
            modelMap.addAttribute("existEmail", "Mail adresi başka bir hayvan sahibi tarafından kullanılmakta.");
            return "owner/add";
        }

        ownerService.save(owner);
        redirectAttributes.addFlashAttribute("owner", owner);
        redirectAttributes.addFlashAttribute("successfullyAddedOwner", "Yeni hayvan sahibi başarı ile eklendi.");
        return "redirect:/owner/owners";
    }

    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    public String ownerDetailPage(@PathVariable("id") Long id, ModelMap modelMap, RedirectAttributes redirectAttributes) {
        Optional<Owner> optionalOwner = ownerService.findById(id);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        boolean isAdmin = userService.isAdmin(authentication);

        if(isAdmin){
            modelMap.addAttribute("admin","admin");
        }

        if (optionalOwner.isPresent()) {
            Owner owner = optionalOwner.get();
            modelMap.addAttribute("ownerInformation", owner);

            if (owner.getPets().isEmpty()) {
                modelMap.addAttribute("notPets", "Sahip olduğunuz herhangi bir hayvan bulunmamakta.");
            }
            return "owner/details";
        }
        redirectAttributes.addFlashAttribute("notFoundOwner", "Girmiş olduğunuz bilgilere göre sistemde kayıtlı hayvan sahibi bulunamadı!");
        return "redirect:/owner/owners";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String updateOwnerPage(@PathVariable Long id, ModelMap modelMap, RedirectAttributes redirectAttributes) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        boolean isAdmin = userService.isAdmin(authentication);

        if(isAdmin){
            modelMap.addAttribute("admin","admin");
        }

        Optional<Owner> optionalOwner = ownerService.findById(id);

        if (optionalOwner.isPresent()) {
            Owner owner = optionalOwner.get();
            modelMap.addAttribute("owner", owner);
            return "owner/edit";
        }

        redirectAttributes.addFlashAttribute("notFoundOwner", "Girmiş olduğunuz bilgilere göre sistemde kayıtlı hayvan sahibi bulunamadı!");
        return "redirect:/owner/owners";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    public String updateOwner(@ModelAttribute @Valid Owner owner, BindingResult bindingResult, RedirectAttributes redirectAttributes, @PathVariable Long id) {
        if (bindingResult.hasErrors()) {
            return "owner/edit";
        }
        ownerService.update(owner);
        redirectAttributes.addFlashAttribute("successfullyUpdatedOwner", owner.getName() + " isimli hayvan sahibinin bilgileri başarı ile güncellendi.");
        return "redirect:/owner/owners";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    public String deleteOwner(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        ownerService.delete(id);
        redirectAttributes.addFlashAttribute("successfullyDeletedOwner", "Seçilen hayvan sahibi ve sahip olduğu hayvanlar başarıyla silindi.");
        return "redirect:/owner/owners";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String searchOwnerPage(@RequestParam(required = false) String ownerName,ModelMap modelMap) {
        if(ownerName == null){
            return "owner/search";
        }

        List<Owner> ownerList = ownerService.findOwnersByOwnerName(ownerName);
        if(ownerList.isEmpty()){
            modelMap.addAttribute("notFoundOwners","Sistemde " + ownerName + " isimli hayvan sahibi bulunamadı! Lütfen isim bilgisini doğru girerek tekrar deneyiniz!");
            return "owner/search";
        }

        modelMap.addAttribute("foundedOwners",ownerName + " ismine sahip hayvan sahipleri başarıyla getirildi.");
        modelMap.addAttribute("ownerList",ownerList);
        return "owner/owners";
    }
}
