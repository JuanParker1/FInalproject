<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="tiles" uri = "http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html class="no-js h-100">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible">
    <title>Shards Dashboard Lite - Free Bootstrap Admin Template – DesignRevision</title>
    <meta name="description" content="A high-quality &amp; free Bootstrap admin dashboard template pack that comes with lots of templates and components.">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" id="main-stylesheet" data-version="1.1.0" href="/resources/shards/styles/shards-dashboards.1.1.0.min.css">
    <link rel="stylesheet" href="/resources/shards/styles/extras.1.1.0.min.css">
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </head>
   <body class="h-100">
   <!-- 팝업 애니메이션 -->
<!--     <div class="color-switcher animated"> -->
<!--       <h5>Accent Color</h5> -->
<!--       <ul class="accent-colors"> -->
<!--         <li class="accent-primary active" data-color="primary"> -->
<!--           <i class="material-icons">check</i> -->
<!--         </li> -->
<!--         <li class="accent-secondary" data-color="secondary"> -->
<!--           <i class="material-icons">check</i> -->
<!--         </li> -->
<!--         <li class="accent-success" data-color="success"> -->
<!--           <i class="material-icons">check</i> -->
<!--         </li> -->
<!--         <li class="accent-info" data-color="info"> -->
<!--           <i class="material-icons">check</i> -->
<!--         </li> -->
<!--         <li class="accent-warning" data-color="warning"> -->
<!--           <i class="material-icons">check</i> -->
<!--         </li> -->
<!--         <li class="accent-danger" data-color="danger"> -->
<!--           <i class="material-icons">check</i> -->
<!--         </li> -->
<!--       </ul> -->
<!--       <div class="actions mb-4"> -->
<!--         <a class="mb-2 btn btn-sm btn-primary w-100 d-table mx-auto extra-action" href="https://designrevision.com/downloads/shards-dashboard-lite/"> -->
<!--           <i class="material-icons">cloud</i> Download</a> -->
<!--         <a class="mb-2 btn btn-sm btn-white w-100 d-table mx-auto extra-action" href="https://designrevision.com/docs/shards-dashboard-lite"> -->
<!--           <i class="material-icons">book</i> Documentation</a> -->
<!--       </div> -->
<!--       <div class="social-wrapper"> -->
<!--         <div class="social-actions"> -->
<!--           <h5 class="my-2">Help us Grow</h5> -->
<!--           <div class="inner-wrapper"> -->
<!--             <a class="github-button" href="https://github.com/DesignRevision/shards-dashboard" data-icon="octicon-star" data-show-count="true" aria-label="Star DesignRevision/shards-dashboard on GitHub">Star</a> -->
<!--             <iframe style="width: 91px; height: 21px;"src="https://yvoschaap.com/producthunt/counter.html#href=https%3A%2F%2Fwww.producthunt.com%2Fr%2Fp%2F112998&layout=wide" width="56" height="65" scrolling="no" frameborder="0" allowtransparency="true"></iframe> -->
<!--           </div> -->
<!--         </div> -->
<!--         <div id="social-share" data-url="https://designrevision.com/downloads/shards-dashboard-lite/" data-text="🔥 Check out Shards Dashboard Lite, a free and beautiful Bootstrap 4 admin dashboard template!" data-title="share"></div> -->
<!--         <div class="loading-overlay"> -->
<!--           <div class="spinner"></div> -->
<!--         </div> -->
<!--       </div> -->
<!--       <div class="close"> -->
<!--         <i class="material-icons">close</i> -->
<!--       </div> -->
<!--     </div> -->
    <div class="color-switcher-toggle animated pulse infinite">
      <i class="material-icons">settings</i>
    </div>
    <div class="container-fluid">
      <div class="row">
        <!-- Main Sidebar--------------------------------------------->
      	   <tiles:insertAttribute name="aside" />
        <!-- End Main Sidebar ------------------------------------------>
        <main class="main-content col-lg-10 col-md-9 col-sm-12 p-0 offset-lg-2 offset-md-3">
          <div class="main-navbar sticky-top bg-white">
            <!-- Main header --------------------------------------------------->
           <tiles:insertAttribute name="header" />
          <!-- / .Main-header --------------------------------------------------->
          </div>
          <div class="main-content-container container-fluid px-4">
          
          <div class="page-header row no-gutters py-4">
			<div class="col-12 col-sm-4 text-center text-sm-left mb-0">
		<span class="text-uppercase page-subtitle">${pageHeader.subtitle}</span>
		<h3 class="page-title">${pageHeader.title}</h3>
			</div>
		</div>
          
            <!-- Main Body ------------------------------------------------------->
            <tiles:insertAttribute name="body" />
            <!-- /Main Body ------------------------------------------------------->
          </div>
          <!-- Main footer ------------------------------------------------------->
          <tiles:insertAttribute name="footer" />
          <!-- /Main footer ------------------------------------------------------->
        </main>
      </div>
    </div>
    <!-- 광고 -->
<!--     <div class="promo-popup animated"> -->
<!--       <a href="http://bit.ly/shards-dashboard-pro" class="pp-cta extra-action"> -->
<!--         <img src="https://dgc2qnsehk7ta.cloudfront.net/uploads/sd-blog-promo-2.jpg"> </a> -->
<!--       <div class="pp-intro-bar"> Need More Templates? -->
<!--         <span class="close"> -->
<!--           <i class="material-icons">close</i> -->
<!--         </span> -->
<!--         <span class="up"> -->
<!--           <i class="material-icons">keyboard_arrow_up</i> -->
<!--         </span> -->
<!--       </div> -->
<!--       <div class="pp-inner-content"> -->
<!--         <h2>Shards Dashboard Pro</h2> -->
<!--         <p>A premium & modern Bootstrap 4 admin dashboard template pack.</p> -->
<!--         <a class="pp-cta extra-action" href="http://bit.ly/shards-dashboard-pro">Download</a> -->
<!--       </div> -->
<!--     </div> -->
    <!-- 광고 -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
    <script src="https://unpkg.com/shards-ui@latest/dist/js/shards.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Sharrre/2.0.1/jquery.sharrre.min.js"></script>
    <script src="/resources/shards/scripts/extras.1.1.0.min.js"></script>
    <script src="/resources/shards/scripts/shards-dashboards.1.1.0.min.js"></script>
    <script src="/resources/shards/scripts/app/app-blog-overview.1.1.0.js"></script>
  </body>
</html>