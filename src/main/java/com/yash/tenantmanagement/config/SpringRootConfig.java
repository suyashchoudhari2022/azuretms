package com.yash.tenantmanagement.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import javax.sql.DataSource;

/**
 * Spring root configuration class. Defines beans related to data source and JDBC template.
 */
@Configuration
@ComponentScan(basePackages = {"com.yash.tenantmanagement"})
public class SpringRootConfig {

    /**
     * Creates and configures a DataSource bean.
     *
     * @return A DataSource object configured for the MySQL database.
     */
    @Bean()
    public DataSource getDataSource() {

        DriverManagerDataSource ds= new DriverManagerDataSource();
        ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
        ds.setUrl("jdbc:mysql://demoserverforapp.mysql.database.azure.com:3306/tenant_db");
        ds.setUsername("adminSQL");
        ds.setPassword("Suyash@2626");
        return ds;

    }

    /**
     * Creates and configures a JdbcTemplate bean.
     *
     * @return A JdbcTemplate object configured with the DataSource.
     */
    @Bean()
    public JdbcTemplate getTemplate() {

        JdbcTemplate jdbcTemplate=new JdbcTemplate();
        jdbcTemplate.setDataSource(getDataSource());
        return jdbcTemplate;
    }

}