package com.yash.tenantmanagement.domain;

import java.sql.Date;

/**
 * Represents a property available for lease or rent.
 */
public class Property {

    private int propertyID;
    private String propertyName;
    private String address;
    private String unitNumber;
    private String propertyType;
    private Integer size;
    private String amenities;
    private double rentAmount;
    private Date availableFrom;
    private Date availableTo;

    /**
     * Default constructor for the Property class.
     */
    public Property() {
    }

    /**
     * Gets the unique identifier for the property.
     *
     * @return The property ID.
     */
    public int getPropertyID() {
        return propertyID;
    }

    /**
     * Sets the unique identifier for the property.
     *
     * @param propertyID The property ID.
     */
    public void setPropertyID(int propertyID) {
        this.propertyID = propertyID;
    }

    /**
     * Gets the name of the property.
     *
     * @return The property name.
     */
    public String getPropertyName() {
        return propertyName;
    }

    /**
     * Sets the name of the property.
     *
     * @param propertyName The property name.
     */
    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    /**
     * Gets the address of the property.
     *
     * @return The property address.
     */
    public String getAddress() {
        return address;
    }

    /**
     * Sets the address of the property.
     *
     * @param address The property address.
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * Gets the unit number of the property (e.g., apartment number).
     *
     * @return The unit number.
     */
    public String getUnitNumber() {
        return unitNumber;
    }

    /**
     * Sets the unit number of the property.
     *
     * @param unitNumber The unit number.
     */
    public void setUnitNumber(String unitNumber) {
        this.unitNumber = unitNumber;
    }

    /**
     * Gets the type of the property (e.g., apartment, house, condo).
     *
     * @return The property type.
     */
    public String getPropertyType() {
        return propertyType;
    }

    /**
     * Sets the type of the property.
     *
     * @param propertyType The property type.
     */
    public void setPropertyType(String propertyType) {
        this.propertyType = propertyType;
    }

    /**
     * Gets the size of the property (e.g., square footage).
     *
     * @return The property size.
     */
    public Integer getSize() {
        return size;
    }

    /**
     * Sets the size of the property.
     *
     * @param size The property size.
     */
    public void setSize(Integer size) {
        this.size = size;
    }

    /**
     * Gets the list of amenities available at the property (e.g., pool, gym, parking).
     *
     * @return The property amenities.
     */
    public String getAmenities() {
        return amenities;
    }

    /**
     * Sets the list of amenities available at the property.
     *
     * @param amenities The property amenities.
     */
    public void setAmenities(String amenities) {
        this.amenities = amenities;
    }

    /**
     * Gets the monthly rent amount for the property.
     *
     * @return The rent amount.
     */
    public double getRentAmount() {
        return rentAmount;
    }

    /**
     * Sets the monthly rent amount for the property.
     *
     * @param rentAmount The rent amount.
     */
    public void setRentAmount(double rentAmount) {
        this.rentAmount = rentAmount;
    }

    /**
     * Gets the date when the property becomes available for lease or rent.
     *
     * @return The availability start date.
     */
    public Date getAvailableFrom() {
        return availableFrom;
    }

    /**
     * Sets the date when the property becomes available for lease or rent.
     *
     * @param availableFrom The availability start date.
     */
    public void setAvailableFrom(Date availableFrom) {
        this.availableFrom = availableFrom;
    }

    /**
     * Gets the date until which the property is available (if applicable).
     *
     * @return The availability end date.
     */
    public Date getAvailableTo() {
        return availableTo;
    }

    /**
     * Sets the date until which the property is available.
     *
     * @param availableTo The availability end date.
     */
    public void setAvailableTo(Date availableTo) {
        this.availableTo = availableTo;
    }

    /**
     * Returns a string representation of the Property object.
     *
     * @return A string containing the property's attributes.
     */
    @Override
    public String toString() {
        return "Property{" +
                "propertyID=" + propertyID +
                ", propertyName='" + propertyName + '\'' +
                ", address='" + address + '\'' +
                ", unitNumber='" + unitNumber + '\'' +
                ", propertyType='" + propertyType + '\'' +
                ", size=" + size +
                ", amenities='" + amenities + '\'' +
                ", rentAmount=" + rentAmount +
                ", availableFrom=" + availableFrom +
                ", availableTo=" + availableTo +
                '}';
    }
}