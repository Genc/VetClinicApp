package com.vetapp.controller;

import com.vetapp.model.Role;
import com.vetapp.model.User;
import com.vetapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
public class RegisterController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = {"/register"}, method = RequestMethod.POST)
    public ModelAndView createUser(@ModelAttribute("createUser") @Valid User user, BindingResult bindingResult, HttpServletRequest request, RedirectAttributes redirectAttributes) throws ServletException {
        ModelAndView model = new ModelAndView();

        if (bindingResult.hasErrors()) {
            model.setViewName("register");
            return model;
        }

        String username = user.getUsername();
        String password = user.getPassword();

        Optional<User> optionalUser = userService.findUserByUsername(username);

        if (optionalUser.isPresent()) {
            model.addObject("alreadyExistsUser", "Kullanıcı adı başka bir kullanıcı tarafından kullanılıyor. Lütfen farklı bir kullanıcı ismi deneyin.");
            model.setViewName("register");
            return model;
        }

        userService.save(user);
        userService.autoLogin(request, username, password);

        List<String> userRoleNames = user.getRoles().stream().map(Role::getName).collect(Collectors.toList());

        String welcomeInfoMessage = "Rolünüz " + userRoleNames.toString() + ". Sistemdeki yetkilerinizin sahip olduğunuz role göre tanımlı olduğunu unutmayın :) ";

        redirectAttributes.addFlashAttribute("welcomeInfoMessage",welcomeInfoMessage);
        redirectAttributes.addFlashAttribute("username",username);
        model.setViewName("redirect:/dashboard");
        return model;
    }

}
