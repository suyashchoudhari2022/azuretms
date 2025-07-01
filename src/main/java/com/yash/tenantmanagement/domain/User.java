package com.yash.tenantmanagement.domain;

/**
 * Represents a user in the tenant management system.
 */
public class User {

    private int userID;
    private String username;
    private String password;
    private String email;
    private String firstName;
    private String lastName;
    private String contactNumber;
    private String address;

    /**
     * Default constructor for the User class.
     */
    public User() {
    }

    /**
     * Gets the unique identifier for the user.
     *
     * @return The user ID.
     */
    public int getUserID() {
        return userID;
    }

    /**
     * Sets the unique identifier for the user.
     *
     * @param userID The user ID.
     */
    public void setUserID(int userID) {
        this.userID = userID;
    }

    /**
     * Gets the username of the user.
     *
     * @return The username.
     */
    public String getUsername() {
        return username;
    }

    /**
     * Sets the username of the user.
     *
     * @param username The username.
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * Gets the password of the user.
     *  Note: In a real application, you should never store passwords in plain text.
     *         This example is for demonstration purposes only.
     * @return The password.
     */
    public String getPassword() {
        return password;
    }

    /**
     * Sets the password of the user.
     * Note: In a real application, you should never store passwords in plain text.
     *        This example is for demonstration purposes only.
     * @param password The password.
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * Gets the email address of the user.
     *
     * @return The email address.
     */
    public String getEmail() {
        return email;
    }

    /**
     * Sets the email address of the user.
     *
     * @param email The email address.
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Gets the first name of the user.
     *
     * @return The first name.
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * Sets the first name of the user.
     *
     * @param firstName The first name.
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * Gets the last name of the user.
     *
     * @return The last name.
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * Sets the last name of the user.
     *
     * @param lastName The last name.
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * Gets the contact number of the user.
     *
     * @return The contact number.
     */
    public String getContactNumber() {
        return contactNumber;
    }

    /**
     * Sets the contact number of the user.
     *
     * @param contactNumber The contact number.
     */
    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    /**
     * Gets the address of the user.
     *
     * @return The address.
     */
    public String getAddress() {
        return address;
    }

    /**
     * Sets the address of the user.
     *
     * @param address The address.
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * Returns a string representation of the User object.
     *
     * @return A string containing the user's attributes.
     */
    @Override
    public String toString() {
        return "User{" +
                "userID=" + userID +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", contactNumber='" + contactNumber + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}