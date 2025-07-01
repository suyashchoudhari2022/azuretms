package com.yash.tenantmanagement.dao;

import com.yash.tenantmanagement.domain.Property;

import java.util.List;

/**
 * Data Access Object (DAO) interface for managing property-related data.
 */
public interface PropertyDAO {
    /**
     * Adds a new property to the database.
     *
     * @param property The property object to be added.
     */
    void addProperty(Property property);

    /**
     * Updates an existing property in the database.
     *
     * @param property The property object containing the updated information.
     */
    void updateProperty(Property property);

    /**
     * Deletes a property from the database based on its ID.
     *
     * @param propertyID The ID of the property to be deleted.
     */
    void deleteProperty(int propertyID);

    /**
     * Retrieves a property from the database based on its ID.
     *
     * @param propertyID The ID of the property to retrieve.
     * @return The property object with the specified ID, or null if not found.
     */
    Property getPropertyByID(int propertyID);

    /**
     * Retrieves a list of all properties from the database.
     *
     * @return A list of all property objects.
     */
    List<Property> getAllProperties();

    /**
     * Retrieves the total number of properties in the database.
     *
     * @return The total count of properties.
     */
    int getTotalPropertiesCount();
}