package com.yash.tenantmanagement.controller;

import com.yash.tenantmanagement.domain.Lease;
import com.yash.tenantmanagement.domain.LeaseDetails;
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
 * Controller for handling lease-related operations for tenants.
 */
@Controller
public class LeaseController {

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
     * Displays the form for updating lease details.
     *
     * @param leaseID   The ID of the lease to be updated.
     * @param model     The model to add attributes for the view.
     * @param session   The HTTP session.
     * @return The view name for the update lease form, or redirects to login if the user is not logged in.
     */
    @GetMapping("/tenant/updateLease/{leaseID}")
    public String showUpdateLeaseForm(@PathVariable int leaseID, Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }
        Lease lease = leaseService.getLeaseByID(leaseID);
        model.addAttribute("lease", lease);
        return "tenant/updateLease";
    }

    /**
     * Updates the lease with the provided information.
     *
     * @param lease     The lease object containing the updated information.
     * @param session   The HTTP session.
     * @return Redirects to the tenant dashboard after updating the lease, or redirects to login if the user is not logged in.
     */
    @PostMapping("/tenant/updateLease")
    public String updateLease(@ModelAttribute("lease") Lease lease, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }

        leaseService.updateLease(lease);

        return "redirect:/tenant/dashboard";
    }

    /**
     * Deletes a lease based on the provided lease ID.
     *
     * @param leaseID   The ID of the lease to be deleted.
     * @param session   The HTTP session.
     * @return Redirects to the tenant dashboard after deleting the lease, or redirects to login if the user is not logged in.
     */
    @GetMapping("/tenant/deleteLease/{leaseID}")
    public String deleteLease(@PathVariable int leaseID, HttpSession session) {

        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }
        leaseService.deleteLease(leaseID);
        return "redirect:/tenant/dashboard";
    }

    /**
     * Displays a list of leases belonging to the logged-in tenant.
     *
     * @param model     The model to add the list of leases to.
     * @param session   The HTTP session.
     * @return The view name for displaying the tenant's leases, or redirects to login if the user is not logged in.
     */
    @GetMapping("/tenant/myLeases")
    public String showMyLeases(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser"); // Get logged in user
        if (loggedInUser == null) {
            return "redirect:/login";
        }
        int userId = loggedInUser.getUserID(); // Get user ID

        List<Lease> leases = leaseService.getLeasesByUserId(userId); // Retrieve leases from the service
        model.addAttribute("leases", leases); // Add leases to the model

        return "tenant/myLeases"; // Return the name of the JSP view
    }

}