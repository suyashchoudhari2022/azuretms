package com.yash.tenantmanagement.rm;

import com.yash.tenantmanagement.domain.Lease;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * {@link RowMapper} implementation for mapping rows from a {@link ResultSet} to {@link Lease} objects.
 */
public class LeaseRowMapper implements RowMapper<Lease> {

    /**
     * Maps a row from the given {@link ResultSet} to a {@link Lease} object.
     *
     * @param rs     The {@link ResultSet} to map from.
     * @param rowNum The number of the current row.
     * @return A {@link Lease} object populated with data from the {@link ResultSet}.
     * @throws SQLException If a SQLException is encountered getting column values from the {@link ResultSet}.
     */
    @Override
    public Lease mapRow(ResultSet rs, int rowNum) throws SQLException {
        Lease lease = new Lease();
        lease.setLeaseID(rs.getInt("LeaseID"));
        lease.setUserID(rs.getInt("UserID"));
        lease.setPropertyID(rs.getInt("PropertyID"));
        lease.setLeaseStartDate(rs.getDate("LeaseStartDate"));
        lease.setLeaseEndDate(rs.getDate("LeaseEndDate"));
        lease.setRentAmount(rs.getDouble("RentAmount"));
        lease.setSecurityDeposit(rs.getDouble("SecurityDeposit"));
        lease.setLeaseAgreement(rs.getString("LeaseAgreement"));
        return lease;
    }
}