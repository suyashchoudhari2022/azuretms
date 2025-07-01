package com.yash.tenantmanagement.service;
import com.yash.tenantmanagement.domain.Lease;
import com.yash.tenantmanagement.domain.LeaseDetails;

import java.util.List;

/**
 * Service interface for managing lease-related operations.
 */
public interface LeaseService {
    /**
     * Creates a new lease.
     *
     * @param lease The lease object to be created.
     */
    void createLease(Lease lease);

    /**
     * Retrieves a lease by its ID.
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
     * Updates an existing lease.
     *
     * @param lease The lease object containing the updated information.
     */
    void updateLease(Lease lease);

    /**
     * Deletes a lease by its ID.
     *
     * @param leaseID The ID of the lease to delete.
     */
    void deleteLease(int leaseID);

    /**
     * Retrieves a list of all lease details.
     *
     * @return A list of LeaseDetails objects.
     */
    List<LeaseDetails> getAllLeaseDetails();

    /**
     * Retrieves the total number of leases.
     *
     * @return The total count of leases.
     */
    int getTotalLeasesCount();
}