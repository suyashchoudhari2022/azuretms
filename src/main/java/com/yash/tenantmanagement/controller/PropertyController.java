package com.yash.tenantmanagement.controller;

import com.yash.tenantmanagement.domain.Property;
import com.yash.tenantmanagement.domain.User;
import com.yash.tenantmanagement.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Controller for handling property-related operations.
 */
@Controller
public class PropertyController {

    /**
     * Service for managing property-related operations.
     */
    @Autowired
    private PropertyService propertyService;

    /**
     * Returns the dashboard view.
     *
     * @return The view name for the dashboard.
     */
    @RequestMapping("dashboard")
    public String dash() {

        return "dashboard";
    }

    /**
     * Retrieves a list of all properties and displays them on the property list page.
     *
     * @param model The model to add the list of properties to.
     * @return The view name for the property list page.
     */
    @GetMapping("/list")
    public String listProperties(Model model) {
        List<Property> properties = propertyService.getAllProperties();
        model.addAttribute("properties", properties);
        return "property/list";
    }

    /**
     * Displays the form for adding a new property.
     *
     * @param model The model to add the empty property object to.
     * @return The view name for the add property form.
     */
    @GetMapping("/add")
    public String showAddPropertyForm(Model model) {
        model.addAttribute("property", new Property());
        return "property/add";
    }

    /**
     * Adds a new property to the database.
     *
     * @param property The property object to be added.
     * @return Redirects to the property list page after adding the property.
     */
    @PostMapping("/addproperty")
    public String addProperty(@ModelAttribute("property") Property property) {
        propertyService.addProperty(property);
        return "redirect:/list";
    }

    /**
     * Displays the form for editing an existing property.
     *
     * @param propertyID The ID of the property to be edited.
     * @param model      The model to add the property object to.
     * @return The view name for the edit property form, or redirects to the property list page if the property is not found.
     */
    @GetMapping("/edit/{propertyID}")
    public String showEditPropertyForm(@PathVariable int propertyID, Model model) {
        Property property = propertyService.getPropertyByID(propertyID);
        if (property == null) {
            return "redirect:/list"; // Or show an error message
        }
        model.addAttribute("property", property);
        return "property/edit";
    }

    /**
     * Updates an existing property in the database.
     *
     * @param property The property object containing the updated information.
     * @return Redirects to the property list page after updating the property.
     */
    @PostMapping("/editp")
    public String editProperty(@ModelAttribute("property") Property property) {
        propertyService.updateProperty(property);
        return "redirect:/list";
    }

    /**
     * Deletes a property based on the provided property ID.
     *
     * @param propertyID The ID of the property to be deleted.
     * @return Redirects to the property list page after deleting the property.
     */
    @GetMapping("/delete/{propertyID}")
    public String deleteProperty(@PathVariable int propertyID) {
        propertyService.deleteProperty(propertyID);
        return "redirect:/list";
    }

    /**
     * Displays the details of a specific property.
     *
     * @param propertyID The ID of the property to be viewed.
     * @param model      The model to add the property object to.
     * @return The view name for the property details page, or redirects to the property list page if the property is not found.
     */
    @GetMapping("/view/{propertyID}")
    public String viewProperty(@PathVariable int propertyID, Model model) {
        Property property = propertyService.getPropertyByID(propertyID);
        if (property == null) {
            return "redirect:/list"; // Or show an error message
        }
        model.addAttribute("property", property);
        return "property/view";
    }

    /**
     * Displays the details of a specific property for tenants.
     *
     * @param propertyID The ID of the property to be viewed.
     * @param model      The model to add the property object to.
     * @return The view name for the tenant property details page, or redirects to an error page if the property is not found.
     */
    @GetMapping("/tenant/propertyDetails/{propertyID}")
    public String propertyDetails(@PathVariable int propertyID, Model model) {
        Property property = propertyService.getPropertyByID(propertyID);
        if (property != null) {
            model.addAttribute("property", property);
            return "tenant/propertyDetails";
        } else {
            // Handle the case where the property is not found
            return "error/propertyNotFound"; // Or redirect to a general error page
        }
    }

    /**
     * Retrieves a list of all properties and displays them on the tenant properties page.
     *
     * @param model   The model to add the list of properties to.
     * @param session The HTTP session.
     * @return The view name for the tenant properties page, or redirects to the login page if the user is not logged in.
     */
    @GetMapping("/tenant/properties")
    public String showProperties(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }
        List<Property> properties = propertyService.getAllProperties(); // Get properties from the service
        model.addAttribute("properties", properties); // Add properties to the model

        return "tenant/properties"; // Return the name of the JSP view
    }
}