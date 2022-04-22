<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>고객등록</title>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function openHomeSearch(){
    new daum.Postcode({
        oncomplete:function(data){
            //input type="text" name=""안에 우편번호,주소,상세주소를 기입한다.
            $('[name=cusPost]').val(data.zonecode);
            $('[name=cusAddr]').val(data.address);
            $('[name=cusAddr2]').val(data.buildingName);
        }
    }).open();
}
</script>
</head>
<body>
	<!-- 폼에서 이름을 쓰지 않으면 컨트롤러에서 받는데에 있어 문제는 없음 -->
<form:form modelAttribute="cusVO" action="/cus/insert" method="post" enctype="multipart/form-data">
	<ul class="list-group list-group-flush">
		<li class="list-group-item p-3">
			<div class="row">
				<div class="col-sm-12 col-md-6">
					<div class="form-group">
					<strong class="text-muted d-block mb-2">이름</strong>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon1">고객명</span>
							</div>
							<form:input path="cusNm" class="form-control" placeholder="고객명을 입력하세요" />
							<font color="red" style="font-size: 8pt;"> 
							<form:errors path="cusNm"/>
							</font>
						</div>
					</div>
					<strong class="text-muted d-block mb-2">연락처</strong>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">고객연락처</span>
						</div>
						<form:input path="cusPne" class="form-control" placeholder="연락처를 입력하세요" />
						<font color="red" style="font-size: 8pt;"> 
						<form:errors path="cusPne"/>
						</font>
					</div>
					<strong class="text-muted d-block mb-2">주소</strong>
					<div class="input-group mb-3">
							<div class="input-group-prepend">
								<button type="button" class="input-group-text" style="color: white; background: lightblue;"
						onclick="openHomeSearch()">주소 검색</button>
							</div>
							<form:input path="cusPost" class="form-control" placeholder="우편번호" />
							<font color="red" style="font-size: 8pt;"> 
							<form:errors path="cusPost"/>
							</font>
					</div>
					<div class="input-group mb-3">
						<form:input path="cusAddr" class="form-control" placeholder="주소" />
							<font color="red" style="font-size: 8pt;"> 
							<form:errors path="cusAddr"/>
						</font>
					</div>
					<div class="input-group mb-3">
						<form:input path="cusAddr2" class="form-control" placeholder="상세주소" />
							<font color="red" style="font-size: 8pt;"> 
							<form:errors path="cusAddr2"/>
						</font>
					</div>
					<form:button class="mb-3 btn btn-outline-success mr-3">고객등록완료</form:button>
					<input type="reset" class="mb-3 btn btn-outline-danger mr-3" value="초기화">
				</div>
				<div class="row">
<!----------------------파일이미지 업로드 -->
				  <div class="col-sm-12 col-md-6">
			        <strong class="text-muted d-block mb-2">고객 이미지</strong>
			        <div class="form-group">
			        	<div class="imgs_wrap"></div>
			        </div>
			        <div class="form-group">
			        	<input type="file" id="input_imgs" name="uploadFile" class="mb-2 btn btn-sm btn-default" multiple />
			        </div>
			      </div>
<!--------------------파일이미지 업로드  -->
				</div>
			</div>
		</li>
	</ul>
</form:form>

<script type="text/javascript">
	$(function(){
		$("#input_imgs").on("change",handleImgsFilesSelect);
	});
	//e : change이벤트를 받음
	function handleImgsFilesSelect(e){
		//이벤트가 일어난 파일객체의 이미지 파일들을 가져옴
		var files = e.target.files;
		//파일들을 배열로 만들어 관리
		var filesArr = Array.prototype.slice.call(files);
		//f : 각각의 파일 객체
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("이미지만 가능합니다.");
				//업로드 종료(실패)
				return;
			}
			//각 이미지를 reader로 읽어들임
			var reader = new FileReader();
			reader.onload = function(e){
				var img_html = "<img src=\"" + e.target.result + "\" style='width:100px;' />";
				$(".imgs_wrap").append(img_html);
			}
			reader.readAsDataURL(f);
		});//end forEach
	}
</script>
</body>
</html>