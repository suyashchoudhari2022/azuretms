package com.yash.tenantmanagement.dao;
import com.yash.tenantmanagement.domain.Lease;
import com.yash.tenantmanagement.domain.LeaseDetails;

import java.util.List;

/**
 * Data Access Object (DAO) interface for managing lease-related data.
 */
public interface LeaseDAO {
    /**
     * Creates a new lease in the database.
     *
     * @param lease The lease object to be created.
     */
    void createLease(Lease lease);

    /**
     * Retrieves a lease from the database based on its ID.
     *
     * @param leaseID The ID of the lease to retrieve.
     * @return The lease object with the specified ID, or null if not found.
     */
    Lease getLeaseByID(int leaseID);

    /**
     * Retrieves a list of leases associated with a specific user ID.
     *
     * @param userId The ID of the user.
     * @return A list of lease objects associated with the user.
     */
    List<Lease> getLeasesByUserId(int userId);

    /**
     * Updates an existing lease in the database.
     *
     * @param lease The lease object containing the updated information.
     */
    void updateLease(Lease lease);

    /**
     * Deletes a lease from the database based on its ID.
     *
     * @param leaseID The ID of the lease to be deleted.
     */
    void deleteLease(int leaseID);

    /**
     * Retrieves a list of all lease details from the database.
     *
     * @return A list of LeaseDetails objects.
     */
    List<LeaseDetails> getAllLeaseDetails();

    /**
     * Retrieves the total number of leases in the database.
     *
     * @return The total count of leases.
     */
    int getTotalLeasesCount();
}