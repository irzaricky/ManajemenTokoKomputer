package com.toko.komputer.util;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class cek_autentikasi implements Filter {
    private List<String> allowedURIs;

    public void init(FilterConfig config) throws ServletException {
        // Add /login (and other allowed URLs) to the list of allowed URIs
        allowedURIs = Arrays.asList("/login.jsp", "/login", "/authenticate", "/static/css/", "/static/js/", "/static/images/");
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        String loginURI = httpRequest.getContextPath() + "/login.jsp";
        String productURI = httpRequest.getContextPath() + "/products"; // Hanya gunakan /products tanpa ekstensi .jsp
        boolean loggedIn = session != null && session.getAttribute("user") != null;
        boolean loginRequest = httpRequest.getRequestURI().equals(loginURI);
        
        // Check if the requested URI matches any of the allowed URIs, considering the contextPath
        String requestURI = httpRequest.getRequestURI();
        String contextPath = httpRequest.getContextPath();
        boolean allowedRequest = allowedURIs.stream()
                .anyMatch(uri -> requestURI.startsWith(contextPath + uri));
        
        boolean isPostLoginRequest = requestURI.equals(contextPath + "/login") && httpRequest.getMethod().equalsIgnoreCase("POST");

        // If user is logged in and the requested URI is the login page, redirect to product page
        if (loggedIn && loginRequest) {
            httpResponse.sendRedirect(productURI); // Redirect to product page if already logged in
            return; // Don't continue filter chain after redirect
        }

        // Allow requests that are login page, already logged in, or allowed static resources
        if (loggedIn || loginRequest || allowedRequest || isPostLoginRequest) {
            chain.doFilter(request, response);
        } else {
            // Handle /products
            if (requestURI.equals(productURI)) {
                if (loggedIn) {
                    httpResponse.sendRedirect(productURI); // Redirect to product page if logged in
                } else {
                    httpResponse.sendRedirect(loginURI);  // Redirect to login page if not logged in
                }
            } else {
                // If user is logged in, redirect to the product page, otherwise login page
                if (loggedIn) {
                    httpResponse.sendRedirect(productURI); // Redirect to product page if logged in
                } else {
                    httpResponse.sendRedirect(loginURI);  // Redirect to login page if not logged in
                }
            }
        }
    }

    public void destroy() {
    }
}
