//UserController.java

package com.yash.tenantmanagement.controller;

import com.yash.tenantmanagement.domain.LeaseDetails;
import com.yash.tenantmanagement.domain.User;
import com.yash.tenantmanagement.service.PropertyService;
import com.yash.tenantmanagement.service.UserService;
import com.yash.tenantmanagement.service.LeaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Controller for handling user authentication, registration, and session management.
 */
@Controller
public class UserController {

    /**
     * Service for managing user-related operations.
     */
    @Autowired
    private UserService userService;

    /**
     * Service for managing property-related operations.
     */
    @Autowired
    private PropertyService propertyService;

    /**
     * Service for managing lease-related operations.
     */
    @Autowired
    private LeaseService leaseService;

    /**
     * Displays the initial view (login page).
     *
     * @param model The model to add the user object to.
     * @return The view name for the login page.
     */
    @GetMapping("/")
    public String show(Model model) {
        model.addAttribute("user", new User());
        return "login";

    }

    /**
     * Displays the login form.
     *
     * @param model The model to add the user object to.
     * @return The view name for the login form.
     */
    @GetMapping("/login")
    public String showLoginForm(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }

    /**
     * Logs out the current user by invalidating the session.
     *
     * @param session The HTTP session to invalidate.
     * @return Redirects to the login page.
     */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Invalidate the session
        return "redirect:/login"; // Redirect to the login page
    }

    /**
     * Handles the user login process.
     *
     * @param user    The user object containing login credentials.
     * @param model   The model to add attributes for the view.
     * @param session The HTTP session.
     * @return Redirects to the appropriate dashboard based on the user role, or displays an error message on the login page.
     */
    @PostMapping("/loginpage")
    public String loginUser(@ModelAttribute("user") User user, Model model, HttpSession session) {

        System.out.println("Login attempt: name=" + user.getUsername() + ", password=" + user.getPassword());

        if ("admin".equals(user.getUsername()) && "admin".equals(user.getPassword())) {

            int totalProperties = propertyService.getTotalPropertiesCount();
            int totalTenants = userService.getTotalUsersCount();
            int totalLeases = leaseService.getTotalLeasesCount();
            List<LeaseDetails> recentLeases = leaseService.getAllLeaseDetails();

            model.addAttribute("totalProperties", totalProperties);
            model.addAttribute("totalTenants", totalTenants);
            model.addAttribute("totalLeases", totalLeases);
            model.addAttribute("recentLeases", recentLeases);

            // System.out.println("Admin login successful. Redirecting to /admindashboard");
            return "dashboard";
        }
        User loggedInUser = userService.loginUser(user.getUsername(), user.getPassword());

        if (loggedInUser != null) {
            session.setAttribute("loggedInUser", loggedInUser);
            session.setAttribute("userId", loggedInUser.getUserID());
            return "redirect:/tenant/dashboard"; // Redirect to tenant dashboard
        } else {
            model.addAttribute("loginError", "Invalid username or password.");
            return "login";
        }
    }

    /**
     * Displays the main dashboard with key statistics.
     *
     * @param model The model to add attributes for the view.
     * @return The view name for the main dashboard.
     */
    @GetMapping("dashboard")
    public String dash(Model model) {
        int totalProperties = propertyService.getTotalPropertiesCount();
        int totalTenants = userService.getTotalUsersCount();
        int totalLeases = leaseService.getTotalLeasesCount();
        List<LeaseDetails> recentLeases = leaseService.getAllLeaseDetails();

        model.addAttribute("totalProperties", totalProperties);
        model.addAttribute("totalTenants", totalTenants);
        model.addAttribute("totalLeases", totalLeases);
        model.addAttribute("recentLeases", recentLeases);

        return "dashboard";
    }

    /**
     * Displays the registration form.
     *
     * @param model The model to add the user object to.
     * @return The view name for the registration form.
     */
    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    /**
     * Handles the user registration process.
     *
     * @param user  The user object containing registration information.
     * @param model The model to add attributes for the view.
     * @return Redirects to the login page after successful registration.
     */
    @PostMapping("/handleuser")
    public String registerUser(@ModelAttribute("user") User user, Model model) {
        System.out.println("user");
        userService.registerUser(user);
        model.addAttribute("registrationSuccess", "Registration successful! Please login.");
        return "login";
    }


}