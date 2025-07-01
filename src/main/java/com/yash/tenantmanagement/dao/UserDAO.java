package com.yash.tenantmanagement.dao;

import com.yash.tenantmanagement.domain.User;

import java.util.List;

/**
 * Data Access Object (DAO) interface for managing user-related data.
 */
public interface UserDAO {
    /**
     * Registers a new user in the database.
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
     * Finds a user in the database based on their username.
     *
     * @param username The username of the user to find.
     * @return The user object with the specified username, or null if not found.
     */
    User findUserByUsername(String username);

    /**
     * Retrieves a list of all users from the database.
     *
     * @return A list of all user objects.
     */
    List<User> getAllUsers();

    /**
     * Deletes a user from the database based on their ID.
     *
     * @param userID The ID of the user to be deleted.
     */
    void deleteUser(int userID);

    /**
     * Retrieves the total number of users in the database.
     *
     * @return The total count of users.
     */
    int getTotalUsersCount();
}