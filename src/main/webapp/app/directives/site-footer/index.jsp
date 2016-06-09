<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="site-footer__container container">
  <div class="row">
    <div class="site-footer__info col-sm-3">
      <a href="https://www.facebook.com/PortlandWebworks/" target=_blank"><img class="site-footer__media-image" src="app/assets/site-footer/facebook.png"/></a>
      <a href="#"><img class="site-footer__media-image" src="app/assets/site-footer/instagram.png"/></a>
      <a href="https://twitter.com/portlandwebwork"  target=_blank"><img class="site-footer__media-image" src="app/assets/site-footer/twitter.png"/></a>
    </div>
    <div class="site-footer__info col-sm-2">
      <ul class="list-unstyled">
        <li><a class="site-footer__link" href="#/home">Home</a></li>
        <sec:authorize access="isAnonymous()">
        <li><a class="site-footer__link" href="#/register">Create Account</a></li>
        <li><a class="site-footer__link" href="#/login">Sign In</a></li>
        </sec:authorize>
        <li><a class="site-footer__link" href="#/support">Help</a></li>
        <sec:authorize access="isAuthenticated()">
          <li><a class="site-footer__link" href="#/logout">Sign Out</a></li>
        </sec:authorize>
      </ul>
    </div>
    <div class="site-footer__info col-sm-7">

      <p>A division of Child Welfare Services</p>
      <p>Case Management System</p>
      <p>Address, City, ST, 94445</p>
      <p>(800) 555-1212</p>
    </div>
  </div>
</div>
