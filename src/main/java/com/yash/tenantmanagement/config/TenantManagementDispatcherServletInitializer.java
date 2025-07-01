package com.yash.tenantmanagement.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;

/**
 * Configuration class to initialize the DispatcherServlet programmatically.
 */
public class TenantManagementDispatcherServletInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    /**
     * Specifies the root configuration classes.
     *
     * @return An array of Class objects representing the root configuration classes.
     */
    @Override
    protected Class<?>[] getRootConfigClasses() {

        return new Class[]{SpringRootConfig.class};
    }

    /**
     * Specifies the servlet configuration classes.
     *
     * @return An array of Class objects representing the servlet configuration classes.
     */
    @Override
    protected Class<?>[] getServletConfigClasses() {

        return new Class[]{SpringWebConfig.class};
    }

    /**
     * Callback method to perform custom initialization of the ServletContext.
     *
     * @param servletContext The ServletContext object.
     * @throws ServletException If any exception occurs during startup.
     */
    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        super.onStartup(servletContext);
    }

    /**
     * Specifies the servlet mappings.
     *
     * @return An array of String objects representing the servlet mappings.
     */
    @Override
    protected String[] getServletMappings() {

        return new String[]{"/"};
    }
}