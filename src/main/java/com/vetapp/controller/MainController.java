package com.vetapp.controller;

import com.vetapp.model.User;
import com.vetapp.service.OwnerService;
import com.vetapp.service.PetService;
import com.vetapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("loggedInUser")
public class MainController {

    private UserService userService;
    private PetService petService;
    private OwnerService ownerService;

    @Autowired
    public MainController(UserService userService, PetService petService, OwnerService ownerService) {
        this.userService = userService;
        this.petService = petService;
        this.ownerService = ownerService;
    }

    @RequestMapping(value = {"/", "/index", "/index.html"})
    public ModelAndView indexPage() {
        ModelAndView modelAndView = new ModelAndView();
        String loggedInUser = userService.findUsernameOfLoggedInUser();
        modelAndView.addObject("loggedInUser", loggedInUser);
        modelAndView.setViewName("index");
        return modelAndView;
    }

    @RequestMapping(value = {"/dashboard", "/dashboard.html"})
    public ModelAndView dashboardPage(ModelAndView modelAndView) {

        Long totalUsers = userService.totalUsers();
        Long totalOwners = ownerService.totalOwners();
        Long totalPets = petService.totalPets();

        String loggedInUser = userService.findUsernameOfLoggedInUser();
        modelAndView.addObject("loggedInUser", loggedInUser);

        modelAndView.addObject("totalUsers",totalUsers);
        modelAndView.addObject("totalOwners",totalOwners);
        modelAndView.addObject("totalPets",totalPets);

        modelAndView.setViewName("dashboard");
        return modelAndView;
    }

    @RequestMapping(value = {"/register", "/register.html"})
    public ModelAndView registerPage(@ModelAttribute("createUser") User user, ModelAndView modelAndView) {
        String loggedInUser = userService.findUsernameOfLoggedInUser();
        if (!loggedInUser.equals("anonymousUser")) {
            modelAndView.setViewName("redirect:/dashboard");
            return modelAndView;
        }
        modelAndView.setViewName("register");
        return modelAndView;
    }

    @RequestMapping(value = {"/login", "/login.html"})
    public ModelAndView loginPage(ModelAndView modelAndView) {
        String loggedInUser = userService.findUsernameOfLoggedInUser();
        if (!loggedInUser.equals("anonymousUser")) {
            modelAndView.setViewName("redirect:/dashboard");
            return modelAndView;
        }
        modelAndView.setViewName("login");
        return modelAndView;
    }
}
