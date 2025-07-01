// com.yash.tenantmanagement.dao.impl.PropertyDAOImpl.java
package com.yash.tenantmanagement.dao;

import com.yash.tenantmanagement.dao.PropertyDAO;
import com.yash.tenantmanagement.domain.Property;
import com.yash.tenantmanagement.rm.PropertyRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Implementation of the {@link PropertyDAO} interface using Spring's {@link JdbcTemplate}.
 */
@Repository
public class PropertyDAOImpl implements PropertyDAO {

    /**
     * Spring's JDBC template for executing SQL queries.
     */
    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * Adds a new property to the database.
     *
     * @param property The property object to be added.
     */
    @Transactional
    public void addProperty(Property property) {
        String sql = "INSERT INTO Properties (PropertyName, Address, UnitNumber, PropertyType, Size, Amenities, RentAmount, AvailableFrom, AvailableTo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, property.getPropertyName(), property.getAddress(), property.getUnitNumber(), property.getPropertyType(), property.getSize(), property.getAmenities(), property.getRentAmount(), property.getAvailableFrom(), property.getAvailableTo());
    }

    /**
     * Updates an existing property in the database.
     *
     * @param property The property object containing the updated information.
     */
    @Transactional
    public void updateProperty(Property property) {
        String sql = "UPDATE Properties SET PropertyName = ?, Address = ?, UnitNumber = ?, PropertyType = ?, Size = ?, Amenities = ?, RentAmount = ?, AvailableFrom = ?, AvailableTo = ? WHERE PropertyID = ?";
        jdbcTemplate.update(sql, property.getPropertyName(), property.getAddress(), property.getUnitNumber(), property.getPropertyType(), property.getSize(), property.getAmenities(), property.getRentAmount(), property.getAvailableFrom(), property.getAvailableTo(), property.getPropertyID());
    }

    /**
     * Deletes a property from the database based on its ID.
     *
     * @param propertyID The ID of the property to be deleted.
     */
    @Override
    public void deleteProperty(int propertyID) {
        String sql = "DELETE FROM Properties WHERE PropertyID = ?";
        jdbcTemplate.update(sql, propertyID);
    }

    /**
     * Retrieves a property from the database based on its ID.
     *
     * @param propertyID The ID of the property to retrieve.
     * @return The property object with the specified ID, or null if not found.
     */
    @Override
    public Property getPropertyByID(int propertyID) {
        String sql = "SELECT * FROM Properties WHERE PropertyID = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new PropertyRowMapper(), propertyID);
        } catch (org.springframework.dao.EmptyResultDataAccessException e) {
            return null; // Property not found
        }
    }

    /**
     * Retrieves a list of all properties from the database.
     *
     * @return A list of all property objects.
     */
    @Override
    public List<Property> getAllProperties() {
        String sql = "SELECT * FROM Properties";
        return jdbcTemplate.query(sql, new PropertyRowMapper());
    }

    /**
     * Retrieves the total number of properties in the database.
     *
     * @return The total count of properties.
     */
    @Override
    public int getTotalPropertiesCount() {
        String sql = "SELECT COUNT(*) FROM Properties";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }
}