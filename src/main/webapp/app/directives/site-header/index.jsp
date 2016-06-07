<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<nav class="site-header__navigation navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="site-header__navbar-header navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#topNav">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#/home">
        <img class="site-header__logo" alt="CWDS" src="app/assets/site-header/logo.png">
      </a>
    </div>
    <div class="site-header__collapse collapse navbar-collapse" id="topNav">
      <ul class="site_header__links nav navbar-nav navbar-right">
        <sec:authorize access="isAnonymous()">
          <li><a href="#/register" class="site-header__link">Create Account</a></li>
          <li><a href="#/login" class="site-header__link">Sign In</a></li>
        </sec:authorize>
          <li><a href="#/support" class="site-header__link">Help</a></li>
        <sec:authorize access="isAuthenticated()">
          <li><a href="/logout" class="site-header__link">Logout</a></li>
        </sec:authorize>
      </ul>
    </div>
  </div>
</nav>
