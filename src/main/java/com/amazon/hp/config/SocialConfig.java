package com.amazon.hp.config;

import com.amazon.hp.member.lib.naver.connect.NaverConnectionFactory;
import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.social.UserIdSource;
import org.springframework.social.config.annotation.ConnectionFactoryConfigurer;
import org.springframework.social.config.annotation.EnableSocial;
import org.springframework.social.config.annotation.SocialConfigurerAdapter;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.connect.UsersConnectionRepository;
import org.springframework.social.connect.mem.InMemoryUsersConnectionRepository;
import org.springframework.social.connect.web.ConnectController;
import org.springframework.social.connect.web.ProviderSignInUtils;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.security.AuthenticationNameUserIdSource;

@Configuration
@EnableSocial
public class SocialConfig extends SocialConfigurerAdapter {

    @Autowired
    private DataSource datasource;

    @Override
    public void addConnectionFactories(ConnectionFactoryConfigurer connectionFactoryConfigurer, Environment environment) {
//  /* facebook connectionFactory is auto registered by spring-social-facebook api */
//        connectionFactoryConfigurer.addConnectionFactory(new FacebookConnectionFactory(
//                environment.getProperty("spring.social.facebook.app-id"),
//                environment.getProperty("spring.social.facebook.app-secret")));

        connectionFactoryConfigurer.addConnectionFactory(new GoogleConnectionFactory(
                environment.getProperty("google.clientId"),
                environment.getProperty("google.clientSecret")));

        connectionFactoryConfigurer.addConnectionFactory(new NaverConnectionFactory(
                environment.getProperty("spring.social.naver.clientId"),
                environment.getProperty("spring.social.naver.clientSecret")));
    }

    @Override
    public UserIdSource getUserIdSource() {
        return new AuthenticationNameUserIdSource();
    }

    // 연결정보를 DB에 저정할때만 사용 하는 것인가 ??? 일단 주석 !!!
    // 우선 메모리에 저장 !!!
    @Override
    public UsersConnectionRepository getUsersConnectionRepository(ConnectionFactoryLocator connectionFactoryLocator) {
        InMemoryUsersConnectionRepository repository = new InMemoryUsersConnectionRepository(connectionFactoryLocator);
        return repository;
    }
//    @Override
//    public UsersConnectionRepository getUsersConnectionRepository(ConnectionFactoryLocator connectionFactoryLocator) {
//        JdbcUsersConnectionRepository repository = new JdbcUsersConnectionRepository(datasource, connectionFactoryLocator, Encryptors.noOpText());
//        return repository;
//    }

    @Bean
    public ConnectController connectController(ConnectionFactoryLocator connectionFactoryLocator, ConnectionRepository connectionRepository) {
        return new ConnectController(connectionFactoryLocator, connectionRepository);
    }

    @Bean
    public ProviderSignInUtils providerSignInUtils(ConnectionFactoryLocator connectionFactoryLocator, UsersConnectionRepository usersConnectionRepository) {
        return new ProviderSignInUtils(connectionFactoryLocator, usersConnectionRepository);
    }
   
}
