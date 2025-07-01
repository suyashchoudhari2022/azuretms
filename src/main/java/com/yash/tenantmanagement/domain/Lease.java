// Lease.java (Domain)
package com.yash.tenantmanagement.domain;

import java.sql.Date;

/**
 * Represents a lease agreement between a tenant and a property owner.
 */
public class Lease {
    private int leaseID;
    private int userID;
    private int propertyID;
    private Date leaseStartDate;
    private Date leaseEndDate;
    private double rentAmount;
    private double securityDeposit;
    private String leaseAgreement;

    /**
     * Default constructor for the Lease class.
     */
    public Lease() {
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

    /**
     * Gets the user ID associated with the lease (tenant).
     *
     * @return The user ID.
     */
    public int getUserID() {
        return userID;
    }

    /**
     * Sets the user ID associated with the lease (tenant).
     *
     * @param userID The user ID.
     */
    public void setUserID(int userID) {
        this.userID = userID;
    }

    /**
     * Gets the property ID associated with the lease.
     *
     * @return The property ID.
     */
    public int getPropertyID() {
        return propertyID;
    }

    /**
     * Sets the property ID associated with the lease.
     *
     * @param propertyID The property ID.
     */
    public void setPropertyID(int propertyID) {
        this.propertyID = propertyID;
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
     * Gets the monthly rent amount for the lease.
     *
     * @return The rent amount.
     */
    public double getRentAmount() {
        return rentAmount;
    }

    /**
     * Sets the monthly rent amount for the lease.
     *
     * @param rentAmount The rent amount.
     */
    public void setRentAmount(double rentAmount) {
        this.rentAmount = rentAmount;
    }

    /**
     * Gets the security deposit amount for the lease.
     *
     * @return The security deposit amount.
     */
    public double getSecurityDeposit() {
        return securityDeposit;
    }

    /**
     * Sets the security deposit amount for the lease.
     *
     * @param securityDeposit The security deposit amount.
     */
    public void setSecurityDeposit(double securityDeposit) {
        this.securityDeposit = securityDeposit;
    }

    /**
     * Gets the lease agreement document (e.g., file path or URL).
     *
     * @return The lease agreement document.
     */
    public String getLeaseAgreement() {
        return leaseAgreement;
    }

    /**
     * Sets the lease agreement document (e.g., file path or URL).
     *
     * @param leaseAgreement The lease agreement document.
     */
    public void setLeaseAgreement(String leaseAgreement) {
        this.leaseAgreement = leaseAgreement;
    }
}