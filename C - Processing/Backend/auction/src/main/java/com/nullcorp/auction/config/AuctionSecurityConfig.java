
package com.nullcorp.auction.config;


import com.nullcorp.auction.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 *
 * @author chris
 */
@Configuration
@EnableWebSecurity
public class AuctionSecurityConfig extends WebSecurityConfigurerAdapter{
    
    @Autowired
    private UserService userDetailsService;
    
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {      
        auth.authenticationProvider(authenticationProvider());              
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()//Restrict access based on HttServletRequest
            .antMatchers("/","/css/**", "/js/**", "/images/**","/user/create").permitAll()
            .anyRequest().authenticated()//Any request to the app must be authenticated(logged in)
            .and()
            .formLogin()//We are customizing the form login process
            .loginPage("/loginPage")//Show my form at the request mapping
            .loginProcessingUrl("/authenticate")//Login form will POST data to this URL for processing username and password
            .permitAll();//Allow everyone to see Login page. Don't have to be logged in.
    }
    
    @Bean
    public DaoAuthenticationProvider authenticationProvider(){
        DaoAuthenticationProvider auth = new DaoAuthenticationProvider();
        auth.setUserDetailsService(userDetailsService);
        auth.setPasswordEncoder(passwordEncoder());
        return auth;
    }
    
    @Bean
    public BCryptPasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }
    
}
