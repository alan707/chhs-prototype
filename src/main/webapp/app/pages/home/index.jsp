<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%--<p ng-if="home.account">Welcome {{home.account.firstName}} {{home.account.lastName}}</p>--%>
<%--Secured item.--%>
<div class="page-home container">

  <div class="page-home__banner">
    <img class="page-home__banner-image" src="app/assets/home/home-banner.png">
    <h2 class="page-home__banner-slogan">Connecting families</h2>
    <h2 class="page-home__banner-slogan">with foster caregivers.</h2>
  </div>

  <sec:authorize access="isAnonymous()">
    <section class="secondary-nav container-fluid">
      <div class="row">
        <div class="page-home__info-col page-home__info-col-login-btn col-md-1">
          <div>LOG IN</div>
        </div>
        <div class="page-home__info-col page-home__info-col-login-info col-md-5">
          <div>
            <p><a href="#/login">Sign in</a> to find and communicate with foster homes in your area.</p>
          </div>
        </div>
        <div class="page-home__info-col page-home__info-col-account-btn col-md-1">
          <div>NEW ACCOUNT</div>
        </div>
        <div class="page-home__info-col page-home__info-col-account-info col-md-5">
          <div>
            <p><a href="/">Create an account</a> to find and communicate with foster homes in your area.</p>
          </div>
        </div>

      </div>
    </section>
  </sec:authorize>

  <section class="page-home__summary">
    <div class="page-home__summary-section col-md-4">
      <div class="page-home__summary-content">
        <img class="page_home_summary-img" src="app/assets/home/locator.png">
        <h4 class="page-home__summary-header"><a href="">Foster Home Locator</a></h4>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit.
          Aenean euismod bibendum laoreet. Proin
          gravida dolor sit amet lacus accumsan et viverra justo
          commodo. Proin sodales pulvinar tempor.
        </p>
        <p>
          Cum sociis natoque penatibus et magnis dis parturient
          montes, nascetur ridiculus mus.
        </p>
      </div>
    </div>
    <div class="page-home__summary-section col-md-4">
      <div class="page-home__summary-content">
        <img class="page_home_summary-img" src="app/assets/home/message_caseworkers.png">
        <h4 class="page-home__summary-header"><a href="">Message Caseworkers</a></h4>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit.
          Aenean euismod bibendum laoreet. Proin
          gravida dolor sit amet lacus accumsan et viverra justo
          commodo. Proin sodales pulvinar tempor.
        </p>
        <p>
          Cum sociis natoque penatibus et magnis dis parturient
          montes, nascetur ridiculus mus.
        </p>
      </div>
    </div>
    <div class="page-home__summary-section col-md-4">
      <div class="page-home__summary-content">
        <img class="page_home_summary-img" src="app/assets/home/contact.png">
        <h4 class="page-home__summary-header"><a href="">About/Contact CWDS</a></h4>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit.
          Aenean euismod bibendum laoreet. Proin
          gravida dolor sit amet lacus accumsan et viverra justo
          commodo. Proin sodales pulvinar tempor.
        </p>
        <div>
          <strong>CWDS</strong>
          <div>Address, City, ST 94445</div>
          <div>(800) 555-1212</div>
          <div>email@2email.com</div>
        </div>
      </div>
    </div>
  </section>
</div>
