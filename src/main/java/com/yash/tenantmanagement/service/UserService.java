package com.yash.tenantmanagement.service;

import com.yash.tenantmanagement.domain.User;

import java.util.List;

/**
 * Service interface for managing user-related operations.
 */
public interface UserService {

    /**
     * Registers a new user.
     *
     * @param user The user object to be registered.
     */
    void registerUser(User user);

    /**
     * Authenticates a user based on the provided username and password.
     *
     * @param username The username of the user.
     * @param password The password of the user.
     * @return The user object if authentication is successful, or null otherwise.
     */
    User loginUser(String username, String password);

    /**
     * Finds a user by their username.
     *
     * @param username The username of the user to find.
     * @return The user object with the specified username, or null if not found.
     */
    User findUserByUsername(String username);

    /**
     * Retrieves a list of all users.
     *
     * @return A list of all user objects.
     */
    List<User> getAllUsers();

    /**
     * Deletes a user by their ID.
     *
     * @param userID The ID of the user to delete.
     */
    void deleteUser(int userID);

    /**
     * Retrieves the total number of users.
     *
     * @return The total count of users.
     */
    int getTotalUsersCount();
}