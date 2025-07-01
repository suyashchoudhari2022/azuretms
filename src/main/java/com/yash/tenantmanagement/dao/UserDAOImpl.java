package com.yash.tenantmanagement.dao;

import com.yash.tenantmanagement.dao.UserDAO;
import com.yash.tenantmanagement.domain.User;
import com.yash.tenantmanagement.rm.UserRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Implementation of the {@link UserDAO} interface using Spring's {@link JdbcTemplate}.
 */
@Repository
public class UserDAOImpl implements UserDAO {

    /**
     * Spring's JDBC template for executing SQL queries.
     */
    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * Registers a new user in the database.
     *
     * @param user The user object to be registered.
     */
    @Override
    public void registerUser(User user) {
        String sql = "INSERT INTO Users (Username, Password, Email, FirstName, LastName, ContactNumber, Address) VALUES (?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, user.getUsername(), user.getPassword(), user.getEmail(), user.getFirstName(), user.getLastName(),  user.getContactNumber(), user.getAddress());
    }

    /**
     * Authenticates a user based on the provided username and password.
     *
     * @param username The username of the user.
     * @param password The password of the user.
     * @return The user object if authentication is successful, or null if not found or invalid credentials.
     */
    @Override
    public User loginUser(String username, String password) {
        String sql = "SELECT * FROM Users WHERE Username = ? AND Password = ?";
        try {
            User user = jdbcTemplate.queryForObject(sql, new UserRowMapper(), username, password);
            return user;
        } catch (EmptyResultDataAccessException e) {
            return null; // User not found or invalid credentials
        }
    }

    /**
     * Finds a user in the database based on their username.
     *
     * @param username The username of the user to find.
     * @return The user object with the specified username, or null if not found.
     */
    @Override
    public User findUserByUsername(String username) {
        String sql = "SELECT * FROM Users WHERE Username = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new UserRowMapper(), username);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    /**
     * Retrieves a list of all users from the database.
     *
     * @return A list of all user objects.
     */
    @Override
    public List<User> getAllUsers() {
        String sql = "SELECT * FROM Users";
        return jdbcTemplate.query(sql, new UserRowMapper());
    }

    /**
     * Deletes a user from the database based on their ID.
     *
     * @param userID The ID of the user to be deleted.
     */
    @Override
    public void deleteUser(int userID) {
        String sql = "DELETE FROM Users WHERE UserID = ?";
        jdbcTemplate.update(sql, userID);
    }

    /**
     * Retrieves the total number of users in the database.
     *
     * @return The total count of users.
     */
    @Override
    public int getTotalUsersCount() {
        String sql = "SELECT COUNT(*) FROM Users";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

}