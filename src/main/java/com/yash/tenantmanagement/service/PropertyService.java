package com.yash.tenantmanagement.service;

import com.yash.tenantmanagement.domain.Property;

import java.util.List;

/**
 * Service interface for managing property-related operations.
 */
public interface PropertyService {

    /**
     * Adds a new property.
     *
     * @param property The property object to be added.
     */
    void addProperty(Property property);

    /**
     * Updates an existing property.
     *
     * @param property The property object containing the updated information.
     */
    void updateProperty(Property property);

    /**
     * Deletes a property by its ID.
     *
     * @param propertyID The ID of the property to delete.
     */
    void deleteProperty(int propertyID);

    /**
     * Retrieves a property by its ID.
     *
     * @param propertyID The ID of the property to retrieve.
     * @return The property object with the specified ID, or null if not found.
     */
    Property getPropertyByID(int propertyID);

    /**
     * Retrieves a list of all properties.
     *
     * @return A list of all property objects.
     */
    List<Property> getAllProperties();

    /**
     * Retrieves the total number of properties.
     *
     * @return The total count of properties.
     */
    int getTotalPropertiesCount();
}