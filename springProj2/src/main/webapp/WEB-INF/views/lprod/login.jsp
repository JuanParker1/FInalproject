<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<div class="card o-hidden border-0 shadow-lg my-5">
<div class="card-body p-0">
    <!-- Nested Row within Card Body -->
    <div class="row">
        <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
        <div class="col-lg-6">
            <div class="p-5">
                <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                    <c:if test="${message!=null}">
                    	<h4 class="h4 text-gray-900 mb-4">${message}</h1>
                    </c:if>
                </div>
                <form:form class="user" modelAttribute="memberVO"
                	method="post" action="/lprod/login">
                    <div class="form-group">
                        <form:input path="memberid" class="form-control form-control-user" aria-describedby="emailHelp" placeholder="" />
                    </div>
                    <div class="form-group">
                        <form:password path="password" class="form-control form-control-user" placeholder="" />
                    </div>
                    <div class="form-group">
                        <div class="custom-control custom-checkbox small">
                            <input type="checkbox" class="custom-control-input" id="customCheck">
                            <label class="custom-control-label" for="customCheck">Remember
                                Me</label>
                        </div>
                    </div>
                    <a href="#" id="btnLogin" class="btn btn-primary btn-user btn-block">
                        Login
                    </a>
                    <hr>
                    <a href="index.html" class="btn btn-google btn-user btn-block">
                        <i class="fab fa-google fa-fw"></i> Login with Google
                    </a>
                    <a href="index.html" class="btn btn-facebook btn-user btn-block">
                        <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                    </a>
                </form:form>
                    <hr>
                    <div class="text-center">
                        <a class="small" href="forgot-password.html">Forgot Password?</a>
                    </div>
                    <div class="text-center">
                        <a class="small" href="register.html">Create an Account!</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
$(function(){
	$("#btnLogin").on("click",function(){
		$("#memberVO").submit();
	});
});
</script>










