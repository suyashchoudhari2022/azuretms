package com.yash.tenantmanagement.controller;

import com.yash.tenantmanagement.domain.Lease;
import com.yash.tenantmanagement.domain.Property;
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
 * Controller for handling tenant-related operations.
 */
@Controller
public class TenantController {

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
     * Displays the tenant dashboard with properties and leases.
     *
     * @param model   The model to add attributes for the view.
     * @param session The HTTP session.
     * @return The view name for the tenant dashboard, or redirects to login if the user is not logged in.
     */
    @GetMapping("/tenant/dashboard")
    public String tenantDashboard(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }

        int userId = loggedInUser.getUserID();

        List<Property> properties = propertyService.getAllProperties(); // For "See Properties"
        model.addAttribute("properties", properties);

        List<Lease> leases = leaseService.getLeasesByUserId(userId); // For My Leases
        model.addAttribute("leases", leases);

        model.addAttribute("loggedInUser", loggedInUser);
        return "tenant/dashboard";
    }

    /**
     * Displays a specific property's details for a tenant.
     *
     * @param propertyID The ID of the property to view.
     * @param model      The model to add the property details to.
     * @param session    The HTTP session.
     * @return The view name for viewing a property, or redirects to login if the user is not logged in.
     */
    @GetMapping("/tenant/viewProperty/{propertyID}")
    public String viewProperty(@PathVariable int propertyID, Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }
        Property property = propertyService.getPropertyByID(propertyID);
        model.addAttribute("property", property);
        return "tenant/viewProperty";
    }

    /**
     * Displays the form for leasing a property.
     *
     * @param propertyID The ID of the property to lease.
     * @param model      The model to add attributes for the view.
     * @param session    The HTTP session.
     * @return The view name for the lease property form, or redirects to login if the user is not logged in.
     */
    @GetMapping("/tenant/leaseProperty/{propertyID}")
    public String leaseProperty(@PathVariable int propertyID, Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }
        Property property = propertyService.getPropertyByID(propertyID);
        model.addAttribute("property", property);
        model.addAttribute("lease", new Lease()); // Add a new lease object to the model

        return "tenant/leasePropertyForm";
    }

    /**
     * Creates a new lease for a property.
     *
     * @param lease      The lease object to create.
     * @param propertyID The ID of the property being leased.
     * @param session    The HTTP session.
     * @return Redirects to the tenant dashboard after creating the lease, or redirects to login if the user is not logged in.
     */
    @PostMapping("/tenant/createLease")
    public String createLease(@ModelAttribute("lease") Lease lease, @RequestParam("propertyID") int propertyID, HttpSession session) {

        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }
        int userId = loggedInUser.getUserID();

        lease.setUserID(userId); // Set tenant id to the lease
        lease.setPropertyID(propertyID);

        leaseService.createLease(lease);

        return "redirect:/tenant/dashboard";
    }

}