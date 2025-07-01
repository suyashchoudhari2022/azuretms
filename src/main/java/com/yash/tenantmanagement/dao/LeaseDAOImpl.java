package com.yash.tenantmanagement.dao;

import com.yash.tenantmanagement.domain.Lease;
import com.yash.tenantmanagement.domain.LeaseDetails;
import com.yash.tenantmanagement.rm.LeaseDetailsRowMapper;
import com.yash.tenantmanagement.rm.LeaseRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;

/**
 * Implementation of the {@link LeaseDAO} interface using Spring's {@link JdbcTemplate}.
 */
@Repository
public class LeaseDAOImpl implements LeaseDAO {

    /**
     * Spring's JDBC template for executing SQL queries.
     */
    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * Creates a new lease in the database.
     *
     * @param lease The lease object to be created.
     */
    @Override
    public void createLease(Lease lease) {
        String sql = "INSERT INTO Leases (UserID, PropertyID, LeaseStartDate, LeaseEndDate, RentAmount, SecurityDeposit, LeaseAgreement) VALUES (?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, lease.getUserID(), lease.getPropertyID(), lease.getLeaseStartDate(), lease.getLeaseEndDate(), lease.getRentAmount(), lease.getSecurityDeposit(), lease.getLeaseAgreement());
    }

    /**
     * Retrieves a lease from the database based on its ID.
     *
     * @param leaseID The ID of the lease to retrieve.
     * @return The lease object with the specified ID, or null if not found.
     */
    @Override
    public Lease getLeaseByID(int leaseID) {
        String sql = "SELECT * FROM Leases WHERE LeaseID = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new LeaseRowMapper(), leaseID);
        } catch (org.springframework.dao.EmptyResultDataAccessException e) {
            return null; // Lease not found
        }
    }

    /**
     * Retrieves a list of leases associated with a specific user ID.
     *
     * @param userId The ID of the user.
     * @return A list of lease objects associated with the user.
     */
    @Override
    public List<Lease> getLeasesByUserId(int userId) {
        String sql = "SELECT * FROM Leases WHERE UserID = ?";
        return jdbcTemplate.query(sql, new LeaseRowMapper(), userId);
    }

    /**
     * Updates an existing lease in the database.
     *
     * @param lease The lease object containing the updated information.
     */
    @Override
    public void updateLease(Lease lease) {
        String sql = "UPDATE Leases SET LeaseStartDate = ?, LeaseEndDate = ?, RentAmount = ?, SecurityDeposit = ?, LeaseAgreement = ? WHERE LeaseID = ?";
        jdbcTemplate.update(sql, lease.getLeaseStartDate(), lease.getLeaseEndDate(), lease.getRentAmount(), lease.getSecurityDeposit(), lease.getLeaseAgreement(), lease.getLeaseID());

    }

    /**
     * Deletes a lease from the database based on its ID.
     *
     * @param leaseID The ID of the lease to be deleted.
     */
    @Override
    public void deleteLease(int leaseID) {
        String sql = "DELETE FROM Leases WHERE LeaseID = ?";
        jdbcTemplate.update(sql, leaseID);
    }

    /**
     * Retrieves a list of all lease details from the database.
     *
     * @return A list of LeaseDetails objects.
     */
    @Override
    public List<LeaseDetails> getAllLeaseDetails() {
        String sql = "SELECT u.FirstName, u.LastName, p.PropertyName, l.LeaseStartDate, l.LeaseEndDate, l.RentAmount, l.SecurityDeposit, l.LeaseID " +
                "FROM Leases l " +
                "JOIN Users u ON l.UserID = u.UserID " +
                "JOIN Properties p ON l.PropertyID = p.PropertyID";
        return jdbcTemplate.query(sql, new LeaseDetailsRowMapper());
    }

    /**
     * Retrieves the total number of leases in the database.
     *
     * @return The total count of leases.
     */
    @Override
    public int getTotalLeasesCount() {
        String sql = "SELECT COUNT(*) FROM Leases";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }
}