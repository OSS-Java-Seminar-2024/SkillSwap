package org.example.skillSwap.controller;

        import org.springframework.stereotype.Controller;
        import org.springframework.web.bind.annotation.GetMapping;
        import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

    @GetMapping("/")
    public String redirectToLogin() {
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String processLogin(String username, String password) {

        return "redirect:/home";
    }

    @GetMapping("/home")
    public String showHomePage() {
        return "home"; // treba dodat home.html u templates folder
    }
}
