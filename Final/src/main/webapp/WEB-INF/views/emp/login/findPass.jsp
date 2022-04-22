<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta charset="utf-8" />
        <title>비밀번호찾기</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
        <meta content="Themesbrand" name="author" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!-- Bootstrap Css -->
		<link
			href="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/css/bootstrap.min.css"
			id="bootstrap-style" rel="stylesheet" type="text/css" />
		<!-- Icons Css -->
		<link
			href="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/css/icons.min.css"
			rel="stylesheet" type="text/css" />
		<!-- App Css-->
		<link
			href="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/css/app.min.css"
			id="app-style" rel="stylesheet" type="text/css" />


    </head>

<script>
emvalchkPass = false;		// 이메일 인증번호 확인
comCod = "";
userCod = "";

//사용자 입력 인증코드와 controll 단에서 생성된 난수 비교

$(function() {
	randomCode = "";
	/* 인증번호 이메일 전송 */ //1차 검증완
	$('#codSndBtn').on('click', function(){
// 		alert("codSnd" + "유저에게 코드메일 발송 시작")
	emailvalue = $('#email').val();
		$.ajax({
			type : 'POST',
			url : '/emp/codSnd',
			data : {"email" : emailvalue},
			dataType : 'text',
			success : function(data){
				console.log("codSnd data잘 들어감? : " + data );
				comCod = data; 
				if (data =! null) {
// 					alert("codSnd data잘 들어감? : " + data );
					alert("인증코드 발송 성공" );
				} else {
					alert("인증코드 발송 실패");
				}
			}
		});
	});
	
	
	/*유저 메일로 날아간 인증번호와 서버가 가진 인증번호 비교  */  //2차
	$('#codValChkBtn').on('click', function(){
		var userCod = $('#userCod').val();
// 		alert("유저가 반송한 코드 유효성 검사 시작")
// 		alert(	"comCod : " + comCod +	"userCod : " + userCod )
		
			if (comCod == userCod) {
				emvalchkPass = true;
// 				alert("이메일 인증 성공" + emvalchkPass);
				alert("이메일 인증 성공");
			} else {
				alert("인증코드가 유효하지 않습니다. 인증번호를 다시 확인해 주세요 ");
				return;
			}
		})
	/*유저가 입력한 비밀번호가 첫번째, 두번째 둘다 같은 값인지 확인 */  //3차
	$('#pwdChkBtn').on('click', function(){
		var password1 = $('#password1').val();
		var password2 = $('#password2').val();
// 		alert("유저입력 비밀번호 유효성 검사 시작")
	    passreg = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+]).{8,20}$/;
	    if(!(passreg.test(password1))){
	    	alert("pass형식오류 입니다. 비밀번호는 8글자 이상, 20 글자이하 , 숫자1개이상, 소문자1개, 대문자1개, 특수문자1개 이상");
	    	return false;
	    }else if(password1.length<8 || password1.length>20){
	    	alert("pass 8~20 사이, 숫자1개이상, 소문자1개, 대문자1개, 특수문자1개 이상");
	    	return false;
	    }else if(password1!=password2){
	    	alert("비번 재입력이 틀렸습니다. 다시 입력 해주세요.");
	    	return false;
	    }else{
	    	alert("사용할수 있는 비밀번호 입니다.");
	    }
	    
	})
	
	/*유저 메일로 날아간 인증번호와 서버가 가진 인증번호 비교  */  //2차
	//form 에서 emvalchkPass 검사/ 이름 널이 아닐경우 통과 
	$('#pwdUdateBtn').on('click', function(){
		email = $('#email').val();
		var empPswd = $('#password1').val();
		var empId = $('#empId').val();
		
		if(emvalchkPass){
// 			alert("empPswd : " + empPswd +", empId : " + empId);
			$.ajax({
				type : "POST",
				url : '/emp/empPswdupdate',
				data : {"empId" : empId ,"empPswd" : empPswd },
				dataType : 'text',
				success : function(data) {
// 					alert("empId 22 : " + empId +", empPswd  22: " + empPswd);
					console.log(" 아이디 찾기 data 잘 나옴? : " + data);
					if (data != null) {
						alert("새로운 비밀번호로 변경 했습니다.");
						alert("로그인 페이지로 이동합니다.");
						 location.href="/emp/loginpage"
					} else {
						alert("비밀번호 변경에 실패했습니다. 다시 시도해 주세요");
						return;
					}
				}
			});
		}else{
			alert("비밀번호 변경에 실패했습니다. 다시 시도해 주세요 ");
			return;
		}
		
	});
})	
	 
	 
	</script>
	<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
    
    <body>
        <div class="account-pages my-5 pt-sm-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card overflow-hidden">
                            <div class="bg-primary bg-soft">
                                <div class="row">
                                    <div class="col-7">
                                        <div class="text-primary p-4">
                                            <h5 class="text-primary"><strong>비밀번호 찾기</strong></h5>
                                            <p>이메일과 사번을 통해<br>등록한 이메일로 비밀번호를  <br>발송합니다.</p>
                                        </div>
                                    </div>
                                    <div class="col-5 align-self-end">
                                        <img src="" alt="" class="img-fluid">
                                    </div>
                                </div>
                            </div>
                            <div class="card-body pt-0"> 
                                <div>
                                    <div class="avatar-md profile-user-wid mb-4">
                                    	<span class="avatar-title rounded-circle bg-light">
                                            <img src="/resources/images/truck.png" alt="truck.png" class="img-fluid">
                                        </span>
                                    </div>
                                </div>
                                <div class="p-2">
            
            							<div class="mb-3">
                                            <label for="username" class="form-label">사번</label>
                                            <input type="text" class="form-control" id="empId" placeholder="Enter username" required>
                                            <div class="invalid-feedback">
                                                Please Enter Username
                                            </div>  
                                        </div>
            							
                                        <div class="mb-3">
                                            <label for="useremail" class="form-label">이메일</label>
                                            <input type="email" class="form-control" id="email" placeholder="Enter email" required>  
                                            <div class="invalid-feedback">이메일을 입력해주세요</div>      
                                        </div>
                						
                						<div class="mb-3">
										<label for="username" class="form-label"></label>
										<button class="btn btn-primary waves-effect waves-light"
											type="button" id="codSndBtn" >인증번호 발송</button>
											<span id="warnMsg"></span>
										</div>
										
											<div class="mt-4 d-grid">
										<label for="username" class="form-label">
											<span>인증번호 입력</span>
										</label> 
											<input type="text" class="form-control"
											id="userCod"  name="userCod" placeholder="Enter email-code" required>
										<div class="invalid-feedback">인증번호를 입력해주세요</div>
										</div>
										<div class="mb-3">
										<label for="username" class="form-label"></label>
										<button class="btn btn-primary waves-effect waves-light"
											type="button" id="codValChkBtn" >인증번호 유효성 체크</button>
											<span id="warnMsg"></span>
										</div>
                                        
                    					
                    					  <div class="mb-3">
                                            <label  class="form-label">비밀번호</label>
                                            <input type="password" class="form-control" id="password1" placeholder="Enter password" required>  
                                            <div class="invalid-feedback">새로운 비밀번호를 입력해주세요</div>      
                                        </div>
                                        
                                          <div class="mb-3">
                                            <label  class="form-label">비밀번호 재입력</label>
                                            <input type="password" class="form-control" id="password2" placeholder="Enter password2" required>  
                                            <div class="invalid-feedback">비밀번호를 한번 더 입력해주세요</div>      
                                        </div>
                                        
                                        <div class="mb-3">
										<label for="username" class="form-label"></label>
										<button class="btn btn-primary waves-effect waves-light"
											type="button" id="pwdChkBtn" >비밀번호 검사</button>
											<span id="warnMsg"></span>
									</div>
                    					
                                        <div class="mt-4 d-grid">
										<button class="btn btn-primary waves-effect waves-light"
											type="submit" id="pwdUdateBtn">비밀번호 변경</button>
									</div>
                                </div>
            
                            </div>
                        </div>
                        <div class="mt-5 text-center">
                            
                            <div>
                                <p>이미 계정이 있으세요? <a href="/emp/loginpage" class="fw-medium text-primary" onclick="window.close()">로그인으로 돌아가기</a></p>
                                <p>© <script>document.write(new Date().getFullYear())</script> T-CO Crafted with <i class="mdi mdi-heart text-danger"></i> by T-COWORKER</p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!-- JAVASCRIPT -->
        <script src="assets/libs/jquery/jquery.min.js"></script>
        <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/libs/metismenu/metisMenu.min.js"></script>
        <script src="assets/libs/simplebar/simplebar.min.js"></script>
        <script src="assets/libs/node-waves/waves.min.js"></script>
        
        <!-- App js -->
        <script src="assets/js/app.js"></script>
    </body>
</html>
