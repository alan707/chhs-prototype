package com.portlandwebworks.chhs.authentication;

import com.portlandwebworks.chhs.authentication.token.TokenAuthFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.authentication.Http403ForbiddenEntryPoint;
import org.springframework.security.web.authentication.logout.CookieClearingLogoutHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

/**
 *
 * @author nick
 */
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	private JsonSuccessHandler successHandler;

	@Autowired
	private TokenAuthFilter tokenAuthFilter;

	@Autowired
	private RemoteAuthenticationProvider authProvider;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
				.csrf().disable()
				.formLogin()
				.and()
				.logout()
				.clearAuthentication(true)
				.invalidateHttpSession(true)
				.logoutSuccessUrl("/index.jsp")
				.addLogoutHandler(new CookieClearingLogoutHandler("Token"))
				.and()
				.authorizeRequests()
				.antMatchers("/login").anonymous()
				.antMatchers(HttpMethod.POST, "/api/account").anonymous()
				.antMatchers(HttpMethod.GET, "/api/account/available").anonymous()
				.antMatchers("/api/**").authenticated()
				.anyRequest().permitAll()
				.and()
				.addFilterAfter(authFilter(), TokenAuthFilter.class)
				.addFilter(tokenAuthFilter)
				.exceptionHandling().authenticationEntryPoint(authenticationEntryPoint())
				.and()
				.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);
	}

	@Bean
	public JsonAuthFilter authFilter() {
		JsonAuthFilter jsonAuthFilter = new JsonAuthFilter(authProvider);
		jsonAuthFilter.setAuthenticationSuccessHandler(successHandler);
		jsonAuthFilter.setRequiresAuthenticationRequestMatcher(new AntPathRequestMatcher("/login", "POST"));
		return jsonAuthFilter;
	}

	@Bean
	public AuthenticationEntryPoint authenticationEntryPoint() {
		return new Http403ForbiddenEntryPoint();
	}
}
