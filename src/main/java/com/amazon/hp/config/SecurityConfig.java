package com.amazon.hp.config;

import com.amazon.hp.member.util.security.CustomLoginFailureHandler;
import com.amazon.hp.member.util.security.LoginSuccessHandler;
import com.amazon.hp.member.util.security.UserCryptoUtil;
import com.amazon.hp.member.util.security.UserDetailsService;
import com.amazon.hp.member.util.social.SocialUsersDetailService;

import org.apache.catalina.connector.ClientAbortException;
import org.apache.commons.codec.binary.Base64;
import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.social.security.SocialUserDetailsService;
import org.springframework.social.security.SpringSocialConfigurer;


@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;
   
    @Autowired
    private DataSource datasource;

    @Autowired
    private Environment env;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	
    	http
            .csrf().disable()
            .anonymous()
        .and()
            .formLogin()
            .loginPage("/login")
            .usernameParameter("sec_email")
            .passwordParameter("sec_pwd")            
            .successHandler(successHandler())
			//.successHandler(loginSuccessHandler())
            //.defaultSuccessUrl("/", true)
            
            .loginProcessingUrl("/login/authenticate")
            .failureHandler(new CustomLoginFailureHandler())
        .and()
            .logout()
            .deleteCookies("SESSION")
            .logoutUrl("/logout")
            .logoutSuccessUrl("/")
        .and()
            .authorizeRequests()
            .anyRequest()
            .permitAll()
            .antMatchers("/**").hasRole("USER")
        .and()
            .apply(new SpringSocialConfigurer());
//		.and()
//   		.authenticationProvider(authProvider);
    }

    @Bean
    public SocialUserDetailsService socialUsersDetailService() {
        return new SocialUsersDetailService(userDetailsService);
    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Bean
    public DaoAuthenticationProvider daoAuthenticationProvider() {
        DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
        daoAuthenticationProvider.setUserDetailsService(userDetailsService);
        daoAuthenticationProvider.setPasswordEncoder(passwordEncoder());
        daoAuthenticationProvider.setHideUserNotFoundExceptions(false);
        return daoAuthenticationProvider;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {

        // jjlim@20170516 스프링 시큐리티 패스워드 암호화 로직 수정
        //return new BCryptPasswordEncoder();
        return new PasswordEncoder() {
            @SuppressWarnings("static-access")
			@Override
            public String encode(CharSequence charSequence) {
                String token = null;
                UserCryptoUtil crypto = new UserCryptoUtil();
                String key = env.getProperty("amazoncar.user.key");

                try {
                	//password decoding(20180823)
                	String decode_pwd = new String(Base64.decodeBase64((String)charSequence));
                    token = crypto.encrypt(key, decode_pwd);
                } catch (ClientAbortException cae) {
                	System.out.println(cae.getMessage());
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return token;
            }

            @Override
            public boolean matches(CharSequence charSequence, String s) {
                String token = encode(charSequence);

                if (token.equals(s)) {
                    return true;
                }
                return false;
            }
        };
    } 


    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(daoAuthenticationProvider());
    }

    @Override
    protected UserDetailsService userDetailsService() {
        return userDetailsService;
    }

    @Autowired
    public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception{
        auth.jdbcAuthentication().dataSource(datasource)
                .passwordEncoder(passwordEncoder());
    }

    @Bean
    public AuthenticationSuccessHandler successHandler() {
    	
        return new LoginSuccessHandler("/defaultUrl");
    }
}

