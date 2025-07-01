package com.yash.tenantmanagement.rm;

import com.yash.tenantmanagement.domain.LeaseDetails;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * {@link RowMapper} implementation for mapping rows from a {@link ResultSet} to {@link LeaseDetails} objects.
 */
public class LeaseDetailsRowMapper implements RowMapper<LeaseDetails> {

    /**
     * Maps a row from the given {@link ResultSet} to a {@link LeaseDetails} object.
     *
     * @param rs     The {@link ResultSet} to map from.
     * @param rowNum The number of the current row.
     * @return A {@link LeaseDetails} object populated with data from the {@link ResultSet}.
     * @throws SQLException If a SQLException is encountered getting column values from the {@link ResultSet}.
     */
    @Override
    public LeaseDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
        LeaseDetails leaseDetails = new LeaseDetails();
        leaseDetails.setFirstName(rs.getString("FirstName"));
        leaseDetails.setLastName(rs.getString("LastName"));
        leaseDetails.setPropertyName(rs.getString("PropertyName"));
        leaseDetails.setLeaseStartDate(rs.getDate("LeaseStartDate"));
        leaseDetails.setLeaseEndDate(rs.getDate("LeaseEndDate"));
        leaseDetails.setRentAmount(rs.getDouble("RentAmount"));
        leaseDetails.setSecurityDeposit(rs.getDouble("SecurityDeposit"));
        leaseDetails.setLeaseID(rs.getInt("LeaseID"));
        return leaseDetails;
    }
}