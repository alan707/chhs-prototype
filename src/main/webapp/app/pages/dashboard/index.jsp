<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<sec:authorize access="isAnonymous()">

</sec:authorize>

<div class="container">
  <div class="row">
    <div class="col-sm-6">
      <div class="chhs-locator"></div>
    </div>
    <div class="col-sm-6">
      <div class="chhs-messenger"></div>
    </div>
  </div>
</div>
