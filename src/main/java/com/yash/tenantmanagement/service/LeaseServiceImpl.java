package com.yash.tenantmanagement.service;

import com.yash.tenantmanagement.dao.LeaseDAO;
import com.yash.tenantmanagement.domain.Lease;
import com.yash.tenantmanagement.domain.LeaseDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Implementation of the {@link LeaseService} interface.
 */
@Service
public class LeaseServiceImpl implements LeaseService {

    /**
     * Data Access Object for managing lease-related data.
     */
    @Autowired
    private LeaseDAO leaseDAO;

    /**
     * Creates a new lease.
     *
     * @param lease The lease object to be created.
     */
    @Override
    @Transactional
    public void createLease(Lease lease) {
        leaseDAO.createLease(lease);
    }

    /**
     * Retrieves a lease by its ID.
     *
     * @param leaseID The ID of the lease to retrieve.
     * @return The lease object with the specified ID, or null if not found.
     */
    @Override
    public Lease getLeaseByID(int leaseID) {
        return leaseDAO.getLeaseByID(leaseID);
    }

    /**
     * Retrieves a list of leases associated with a specific user ID.
     *
     * @param userId The ID of the user.
     * @return A list of lease objects associated with the user.
     */
    @Override
    public List<Lease> getLeasesByUserId(int userId) {
        return leaseDAO.getLeasesByUserId(userId);
    }

    /**
     * Updates an existing lease.
     *
     * @param lease The lease object containing the updated information.
     */
    @Override
    @Transactional
    public void updateLease(Lease lease) {
        leaseDAO.updateLease(lease);
    }

    /**
     * Deletes a lease by its ID.
     *
     * @param leaseID The ID of the lease to delete.
     */
    @Override
    @Transactional
    public void deleteLease(int leaseID) {
        leaseDAO.deleteLease(leaseID);
    }

    /**
     * Retrieves a list of all lease details.
     *
     * @return A list of LeaseDetails objects.
     */
    @Override
    public List<LeaseDetails> getAllLeaseDetails() {
        return leaseDAO.getAllLeaseDetails();
    }

    /**
     * Retrieves the total number of leases.
     *
     * @return The total count of leases.
     */
    @Override
    public int getTotalLeasesCount() {
        return leaseDAO.getTotalLeasesCount();
    }
}