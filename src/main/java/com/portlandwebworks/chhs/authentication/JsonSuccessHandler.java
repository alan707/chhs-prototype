/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.portlandwebworks.chhs.authentication;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

/**
 *
 * @author nick
 */
@Component
public class JsonSuccessHandler implements AuthenticationSuccessHandler {

	private final Logger log = LoggerFactory.getLogger(JsonSuccessHandler.class);
	
	public JsonSuccessHandler() {
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest hsr, HttpServletResponse hsr1, Authentication a) throws IOException, ServletException {
		AuthenticatedUser user = (AuthenticatedUser) a.getPrincipal();
		log.debug("Successful login attempt by {}.", user.getUsername());
		hsr1.setStatus(HttpServletResponse.SC_OK);
		hsr1.setContentType("application/json");
		addAuthCookie(a, hsr1, hsr);
	}

	private void addAuthCookie(Authentication a, HttpServletResponse resp, HttpServletRequest hsr) {
		AuthenticatedUser details = (AuthenticatedUser) a.getPrincipal();
		final Cookie cookie = new Cookie("Token", details.getToken());
		cookie.setPath("/");
		cookie.setMaxAge(-1);
		if(!hsr.getRequestURL().toString().contains("localhost")){
			cookie.setSecure(true); //sending this to any remote host should only be done through https
		}
		resp.addCookie(cookie);
	}
	
}
