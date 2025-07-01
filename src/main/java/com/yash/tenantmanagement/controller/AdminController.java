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
 * Controller for handling administrative functionalities such as user management and lease details.
 */
@Controller
public class AdminController {

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
     * Retrieves a list of all users and displays them in the admin users page.
     *
     * @param model The model to add the user list to.
     * @return The view name for the admin users page.
     */
    @GetMapping("/admin/users")
    public String listUsers(Model model) {
        List<User> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/users";
    }

    /**
     * Deletes a user based on the provided user ID.
     *
     * @param userID The ID of the user to delete.
     * @return Redirects to the admin users page after deletion.
     */
    @GetMapping("/admin/deleteUser/{userID}")
    public String deleteUser(@PathVariable int userID) {
        userService.deleteUser(userID);
        return "redirect:/admin/users";
    }

    /**
     * Retrieves a list of all lease details and displays them on the admin lease details page.
     *
     * @param model The model to add the lease details list to.
     * @return The view name for the admin lease details page.
     */
    @GetMapping("/admin/leaseDetails")
    public String listLeaseDetails(Model model) {
        List<LeaseDetails> leaseDetailsList = leaseService.getAllLeaseDetails();
        model.addAttribute("leaseDetailsList", leaseDetailsList);
        return "admin/leaseDetails"; // JSP file name
    }

    /**
     * Deletes a lease based on the provided lease ID.
     *
     * @param leaseID The ID of the lease to delete.
     * @return Redirects to the admin lease details page after deletion.
     */
    @GetMapping("/admin/deleteLease/{leaseID}")
    public String deleteLease(@PathVariable int leaseID) {
        leaseService.deleteLease(leaseID);
        return "redirect:/admin/leaseDetails"; // Redirect back to the lease list
    }

    /**
     * Invalidates the current session and redirects the user to the login page.
     *
       @param session The HTTP session to invalidate.
     * @return Redirects to the login page.
     */
    @GetMapping("admin/logout")
    public String adminlogout(HttpSession session) {
        session.invalidate(); // Invalidate the session
        return "redirect:/login"; // Redirect to the login page
    }

}