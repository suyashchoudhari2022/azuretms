package com.yash.tenantmanagement.rm;

import com.yash.tenantmanagement.domain.User;
import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * {@link RowMapper} implementation for mapping rows from a {@link ResultSet} to {@link User} objects.
 */
public class UserRowMapper implements RowMapper<User> {

    /**
     * Maps a row from the given {@link ResultSet} to a {@link User} object.
     *
     * @param rs     The {@link ResultSet} to map from.
     * @param rowNum The number of the current row.
     * @return A {@link User} object populated with data from the {@link ResultSet}.
     * @throws SQLException If a SQLException is encountered getting column values from the {@link ResultSet}.
     */
    @Override
    public User mapRow(ResultSet rs, int rowNum) throws SQLException {
        User user = new User();
        user.setUserID(rs.getInt("UserID"));
        user.setUsername(rs.getString("Username"));
        user.setPassword(rs.getString("Password"));
        user.setEmail(rs.getString("Email"));
        user.setFirstName(rs.getString("FirstName"));
        user.setLastName(rs.getString("LastName"));
        user.setContactNumber(rs.getString("ContactNumber"));
        user.setAddress(rs.getString("Address"));

        return user;
    }
}