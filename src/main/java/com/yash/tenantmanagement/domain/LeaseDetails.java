package com.yash.tenantmanagement.domain;

import java.sql.Date;

/**
 * Represents detailed information about a lease, combining data from different entities.
 */
public class LeaseDetails {
    private String firstName;
    private String lastName;
    private String propertyName;
    private Date leaseStartDate;
    private Date leaseEndDate;
    private double rentAmount;
    private double securityDeposit;
    private int leaseID;

    /**
     * Default constructor for the LeaseDetails class.
     */
    public LeaseDetails() {
    }

    /**
     * Constructor for the LeaseDetails class.
     *
     * @param firstName       The first name of the tenant.
     * @param lastName        The last name of the tenant.
     * @param propertyName    The name of the property being leased.
     * @param leaseStartDate  The start date of the lease.
     * @param leaseEndDate    The end date of the lease.
     * @param rentAmount      The monthly rent amount.
     * @param securityDeposit The security deposit amount.
     * @param leaseID         The unique identifier for the lease.
     */
    public LeaseDetails(String firstName, String lastName, String propertyName, Date leaseStartDate, Date leaseEndDate, double rentAmount, double securityDeposit, int leaseID) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.propertyName = propertyName;
        this.leaseStartDate = leaseStartDate;
        this.leaseEndDate = leaseEndDate;
        this.rentAmount = rentAmount;
        this.securityDeposit = securityDeposit;
        this.leaseID = leaseID;
    }

    /**
     * Gets the first name of the tenant.
     *
     * @return The first name.
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * Sets the first name of the tenant.
     *
     * @param firstName The first name.
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * Gets the last name of the tenant.
     *
     * @return The last name.
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * Sets the last name of the tenant.
     *
     * @param lastName The last name.
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * Gets the name of the property being leased.
     *
     * @return The property name.
     */
    public String getPropertyName() {
        return propertyName;
    }

    /**
     * Sets the name of the property being leased.
     *
     * @param propertyName The property name.
     */
    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    /**
     * Gets the start date of the lease.
     *
     * @return The lease start date.
     */
    public Date getLeaseStartDate() {
        return leaseStartDate;
    }

    /**
     * Sets the start date of the lease.
     *
     * @param leaseStartDate The lease start date.
     */
    public void setLeaseStartDate(Date leaseStartDate) {
        this.leaseStartDate = leaseStartDate;
    }

    /**
     * Gets the end date of the lease.
     *
     * @return The lease end date.
     */
    public Date getLeaseEndDate() {
        return leaseEndDate;
    }

    /**
     * Sets the end date of the lease.
     *
     * @param leaseEndDate The lease end date.
     */
    public void setLeaseEndDate(Date leaseEndDate) {
        this.leaseEndDate = leaseEndDate;
    }

    /**
     * Gets the monthly rent amount.
     *
     * @return The rent amount.
     */
    public double getRentAmount() {
        return rentAmount;
    }

    /**
     * Sets the monthly rent amount.
     *
     * @param rentAmount The rent amount.
     */
    public void setRentAmount(double rentAmount) {
        this.rentAmount = rentAmount;
    }

    /**
     * Gets the security deposit amount.
     *
     * @return The security deposit amount.
     */
    public double getSecurityDeposit() {
        return securityDeposit;
    }

    /**
     * Sets the security deposit amount.
     *
     * @param securityDeposit The security deposit amount.
     */
    public void setSecurityDeposit(double securityDeposit) {
        this.securityDeposit = securityDeposit;
    }

    /**
     * Gets the unique identifier for the lease.
     *
     * @return The lease ID.
     */
    public int getLeaseID() {
        return leaseID;
    }

    /**
     * Sets the unique identifier for the lease.
     *
     * @param leaseID The lease ID.
     */
    public void setLeaseID(int leaseID) {
        this.leaseID = leaseID;
    }
}