package com.amazon.hp.common;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.embedded.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.navercorp.lucy.security.xss.servletfilter.XssEscapeServletFilter;

@Configuration
@SpringBootApplication
@ComponentScan
@EnableAutoConfiguration
public class WebConfig extends WebMvcConfigurerAdapter{
    
    /*
     * lucy-xss-filter
     *  
     * */
    /*@Bean
    public FilterRegistrationBean getFilterRegistrationBean(){
        FilterRegistrationBean registrationBean = new FilterRegistrationBean();
        registrationBean.setFilter(new XssEscapeServletFilter());
        registrationBean.setOrder(1);
        registrationBean.addUrlPatterns("/*");	  //filter를 거칠 url patterns
        return registrationBean;
    }*/
    
}

