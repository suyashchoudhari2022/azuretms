package com.yash.tenantmanagement.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/**
 * Spring web configuration class. Defines beans related to view resolution and resource handling.
 */
@Configuration
@ComponentScan(basePackages = {"com.yash.tenantmanagement"})
@EnableWebMvc
public class SpringWebConfig extends WebMvcConfigurerAdapter {

    /**
     * Adds resource handlers for serving static resources like CSS, JavaScript, and images.
     *
     * @param registry ResourceHandlerRegistry to configure resource handling.
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        super.addResourceHandlers(registry);
    }

    /**
     * Creates and configures a ViewResolver bean.
     *
     * @return A ViewResolver object configured for JSPs and the specified prefix/suffix.
     */
    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver vr = new InternalResourceViewResolver();
        vr.setViewClass(JstlView.class);
        vr.setPrefix("/WEB-INF/views/");
        vr.setSuffix(".jsp");
        return vr;
    }
}