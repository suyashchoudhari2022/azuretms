package com.yash.tenantmanagement.service;

import com.yash.tenantmanagement.dao.PropertyDAO;
import com.yash.tenantmanagement.domain.Property;
import com.yash.tenantmanagement.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Implementation of the {@link PropertyService} interface.
 */
@Service
public class PropertyServiceImpl implements PropertyService {

    /**
     * Data Access Object for managing property-related data.
     */
    @Autowired
    private PropertyDAO propertyDAO;

    /**
     * Adds a new property.
     *
     * @param property The property object to be added.
     */
    @Override
    public void addProperty(Property property) {
        propertyDAO.addProperty(property);
    }

    /**
     * Updates an existing property.
     *
     * @param property The property object containing the updated information.
     */
    @Override
    public void updateProperty(Property property) {
        propertyDAO.updateProperty(property);
    }

    /**
     * Deletes a property by its ID.
     *
     * @param propertyID The ID of the property to delete.
     */
    @Override
    public void deleteProperty(int propertyID) {
        propertyDAO.deleteProperty(propertyID);
    }

    /**
     * Retrieves a property by its ID.
     *
     * @param propertyID The ID of the property to retrieve.
     * @return The property object with the specified ID, or null if not found.
     */
    @Override
    public Property getPropertyByID(int propertyID) {
        return propertyDAO.getPropertyByID(propertyID);
    }

    /**
     * Retrieves a list of all properties.
     *
     * @return A list of all property objects.
     */
    @Override
    public List<Property> getAllProperties() {
        return propertyDAO.getAllProperties();
    }

    /**
     * Retrieves the total number of properties.
     *
     * @return The total count of properties.
     */
    @Override
    public int getTotalPropertiesCount() {
        return propertyDAO.getTotalPropertiesCount();
    }
}