package com.yash.tenantmanagement.rm;

import com.yash.tenantmanagement.domain.Property;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * {@link RowMapper} implementation for mapping rows from a {@link ResultSet} to {@link Property} objects.
 */
public class PropertyRowMapper implements RowMapper<Property> {

    /**
     * Maps a row from the given {@link ResultSet} to a {@link Property} object.
     *
     * @param rs     The {@link ResultSet} to map from.
     * @param rowNum The number of the current row.
     * @return A {@link Property} object populated with data from the {@link ResultSet}.
     * @throws SQLException If a SQLException is encountered getting column values from the {@link ResultSet}.
     */
    @Override
    public Property mapRow(ResultSet rs, int rowNum) throws SQLException {
        Property property = new Property();
        property.setPropertyID(rs.getInt("PropertyID"));
        property.setPropertyName(rs.getString("PropertyName"));
        property.setAddress(rs.getString("Address"));
        property.setUnitNumber(rs.getString("UnitNumber"));
        property.setPropertyType(rs.getString("PropertyType"));
        property.setSize(rs.getInt("Size"));
        property.setAmenities(rs.getString("Amenities"));
        property.setRentAmount(rs.getDouble("RentAmount"));
        property.setAvailableFrom(rs.getDate("AvailableFrom"));
        property.setAvailableTo(rs.getDate("AvailableTo"));
        return property;
    }
}