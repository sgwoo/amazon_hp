package com.amazon.hp;

import java.nio.charset.Charset;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.MultipartConfigElement;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.ServerProperties;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.embedded.FilterRegistrationBean;
import org.springframework.boot.context.embedded.MultipartConfigFactory;
import org.springframework.boot.context.web.ErrorPageFilter;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.amazon.hp.common.HTMLCharacterEscapes;

//import com.amazon.hp.common.HTMLCharacterEscapes;

import com.amazon.hp.common.ServerCustomization;
import com.fasterxml.jackson.databind.ObjectMapper;

@Configuration
@SpringBootApplication
@ComponentScan
@EnableAutoConfiguration
public class AmazonHpApplication extends SpringBootServletInitializer {
	
    public static void main(String[] args) {
        SpringApplication.run(AmazonHpApplication.class, args);
    }
   
	//UTF-8 Encoding Bean
	@Bean
	public HttpMessageConverter<String> responseBodyConverter(){
	    return new StringHttpMessageConverter(Charset.forName("UTF-8"));
	}
	
	@Bean
	public Filter characterEncodingFilter(){
	    CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
        characterEncodingFilter.setEncoding("UTF-8");
        characterEncodingFilter.setForceEncoding(true);
	    return characterEncodingFilter;
	}
	
	@Bean
	public ServerProperties getServerProperties() {
	    return new ServerCustomization();
	}
	
	@Bean
	public MultipartConfigElement multipartConfigElement() {
	    MultipartConfigFactory factory = new MultipartConfigFactory();
	    return factory.createMultipartConfig();
	}

	@Bean
	public MultipartResolver multipartResolver() {
	    return new StandardServletMultipartResolver();
	}
	
	//에러페이지 로그가 많아서 disable처리 (20181010)
	@Bean
	public ErrorPageFilter errorPageFilter() {
	    return new ErrorPageFilter();
	}
	
	//에러페이지 로그가 많아서 disable처리 (20181010)
	@Bean
	public FilterRegistrationBean disableSpringBootErrorFilter(ErrorPageFilter filter) {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
        filterRegistrationBean.setFilter(filter);
        filterRegistrationBean.setEnabled(false);
        return filterRegistrationBean;
	}
	
}
