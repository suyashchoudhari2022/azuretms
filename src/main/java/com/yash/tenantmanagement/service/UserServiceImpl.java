package com.yash.tenantmanagement.service;

import com.yash.tenantmanagement.dao.UserDAO;
import com.yash.tenantmanagement.domain.User;
import com.yash.tenantmanagement.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Implementation of the {@link UserService} interface.
 */
@Service
public class UserServiceImpl implements UserService {

    /**
     * Data Access Object for managing user-related data.
     */
    @Autowired
    private UserDAO userDAO;

    /**
     * Registers a new user.
     *
     * @param user The user object to be registered.
     */
    @Override
    public void registerUser(User user) {
        userDAO.registerUser(user);
    }

    /**
     * Authenticates a user based on the provided username and password.
     *
     * @param username The username of the user.
     * @param password The password of the user.
     * @return The user object if authentication is successful, or null otherwise.
     */
    @Override
    public User loginUser(String username, String password) {
        return userDAO.loginUser(username, password);
    }

    /**
     * Finds a user by their username.
     *
     * @param username The username of the user to find.
     * @return The user object with the specified username, or null if not found.
     */
    @Override
    public User findUserByUsername(String username) {
        return userDAO.findUserByUsername(username);
    }

    /**
     * Retrieves a list of all users.
     *
     * @return A list of all user objects.
     */
    @Override
    public List<User> getAllUsers() {
        return userDAO.getAllUsers();
    }

    /**
     * Deletes a user by their ID.
     *
     * @param userID The ID of the user to delete.
     * @throws RuntimeException if the deletion fails due to a data access issue.
     */
    @Override
    @Transactional
    public void deleteUser(int userID) {
        try {
            userDAO.deleteUser(userID);
        } catch (DataAccessException e) {
            // Log the exception or handle it appropriately

            throw new RuntimeException("Failed to delete user", e);
        }
    }

    /**
     * Retrieves the total number of users.
     *
     * @return The total count of users.
     */
    @Override
    public int getTotalUsersCount() {
        return userDAO.getTotalUsersCount();
    }
}