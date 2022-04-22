<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Main Sidebar -->
<aside class="main-sidebar col-12 col-md-3 col-lg-2 px-0">
	<div class="main-navbar">
		<nav
			class="navbar align-items-stretch navbar-light bg-white flex-md-nowrap border-bottom p-0">
			<a class="navbar-brand w-100 mr-0" href="/"
				style="line-height: 25px;">
				<div class="d-table m-auto">
					<img id="main-logo" class="d-inline-block align-top mr-1"
						style="max-width: 25px;"
						src="/resources/shards/images/shards-dashboards-logo.svg"
						alt="Shards Dashboard"> <span
						class="d-none d-md-inline ml-1">FootPrint on Snow</span>
				</div>
			</a> <a class="toggle-sidebar d-sm-inline d-md-none d-lg-none"> <i
				class="material-icons">&#xE5C4;</i>
			</a>
		</nav>
	</div>
	<form action="#"
		class="main-sidebar__search w-100 border-right d-sm-flex d-md-none d-lg-none">
		<div class="input-group input-group-seamless ml-3">
			<div class="input-group-prepend">
				<div class="input-group-text">
					<i class="fas fa-search"></i>
				</div>
			</div>
			<input class="navbar-search form-control" type="text"
				placeholder="Search for something..." aria-label="Search">
		</div>
	</form>
	<div class="nav-wrapper">
		<ul class="nav flex-column">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle text-nowrap px-3" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
				<i class="material-icons">list</i><span>목록</span>
				</a>
				<!-- 하위 리스트 -->
				<div class="dropdown-menu dropdown-menu-small">
				<a class="dropdown-item" href="/cus/list">
				<i class="material-icons">person</i>
				<span>고객목록</span>
				</a>
				<a class="nav-link"	href="/car/list">
				<i class="material-icons">directions_car</i>
				<span>자동차목록</span>
				</a>
				<a class="nav-link"	href="/emp/list">
				<i class="material-icons">group</i>
				<span>직원목록</span>
				</a>
				</div>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle text-nowrap px-3" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
				<i class="material-icons">science</i> <span>실험실</span>
				</a>
				<div class="dropdown-menu dropdown-menu">
				<a class="nav-link" href="/poi/page">Apache-Poi</a>
				<a class="nav-link" href="/poi/webRtc">WebRtc화상회의</a>
				</div>
			</li>
			
			<li class="nav-item">
                <a class="nav-link" href="/resources/shards/index.html">
                  <i class="material-icons">edit</i>
                  <span>Blog Dashboard</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link " href="/resources/shards/components-blog-posts.html">
                  <i class="material-icons">vertical_split</i>
                  <span>Blog Posts</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link " href="/resources/shards/add-new-post.html">
                  <i class="material-icons">note_add</i>
                  <span>Add New Post</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link " href="/resources/shards/form-components.html">
                  <i class="material-icons">view_module</i>
                  <span>Forms &amp; Components</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link " href="/resources/shards/tables.html">
                  <i class="material-icons">table_chart</i>
                  <span>Tables</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link " href="/resources/shards/user-profile-lite.html">
                  <i class="material-icons">person</i>
                  <span>User Profile</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link " href="/resources/shards/errors.html">
                  <i class="material-icons">error</i>
                  <span>Errors</span>
                </a>
              </li>
		</ul>
	</div>
</aside>
<!-- End Main Sidebar -->