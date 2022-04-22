<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="/resources/htmltopdf/html2canvas.min.js"></script>
<script type="text/javascript" src="/resources/htmltopdf/html2pdf.bundle.min.js"></script>
<script type="text/javascript" src="/resources/htmltopdf/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/htmltopdf/jspdf.min.js"></script>

    <div class="color-switcher-toggle animated pulse infinite">
      <i class="material-icons">settings</i>
    </div>
    
    <div class="main-content-container container-fluid px-4 detail">
            <!-- Main Navbar -->
          <!-- / .main-navbar -->
          
          <!-- 
          		업데이트 성공시 뜨는 문 
          <div class="alert alert-success alert-dismissible fade show mb-0" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
            <i class="fa fa-check mx-2"></i>
            <strong>Success!</strong> Your profile has been updated! </div>
           -->
          <div class="main-content-container container-fluid px-4">
            <!-- Default Light Table -->
            <div class="row">
              <div class="col-lg-4">
                <div class="card card-small mb-4 pt-3">
                  <div class="card-header border-bottom text-center">
                    <div class="mb-3 mx-auto">
                    <c:forEach var="attachFilesVO" items="${cusVO.attachFilesVO}">
                      <img class="rounded-circle" src="${attachFilesVO.uploadFileName}" alt="User Avatar" width="110"> 
                      </c:forEach>
                      </div>
                    <h4 class="mb-0">${cusVO.cusNm}</h4>
                    <button type="button" class="mb-2 btn btn-sm btn-pill btn-outline-primary mr-2">
                      <i class="material-icons mr-1">person_add</i>Follow</button>
                  </div>
                  <ul class="list-group list-group-flush">
                  
<!--                     <li class="list-group-item px-4"> -->
<!--                       <div class="progress-wrapper"> -->
<!--                         <strong class="text-muted d-block mb-2">Workload</strong> -->
<!--                         <div class="progress progress-sm"> -->
<!--                           <div class="progress-bar bg-primary" role="progressbar" aria-valuenow="74" aria-valuemin="0" aria-valuemax="100" style="width: 74%;"> -->
<!--                             <span class="progress-value">74%</span> -->
<!--                           </div> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </li> -->

                    <li class="list-group-item p-4">
                      <strong class="text-muted d-block mb-2">Description</strong>
                      <span>회원 페이지의 상세보기 페이지입니다.</span>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="col-lg-8">
                <div class="card card-small mb-4">
                  <div class="card-header border-bottom">
                    <h6 class="m-0"><strong>고객 상세 정보</strong></h6>
                  </div>
                  <ul class="list-group list-group-flush">
                    <li class="list-group-item p-3">
                      <div class="row">
                        <div class="col">
                          <form>
                            <div class="form-row">
                              <div class="form-group col-md-6">
                                <label for="feFirstName">고객번호</label>
                                <input type="text" class="form-control" id="cusNum" placeholder="" value="${cusVO.cusNum}"> </div>
                              <div class="form-group col-md-6">
                                <label for="feLastName">고객명</label>
                                <input type="text" class="form-control" id="cusNm" placeholder="" value="${cusVO.cusNm}"> </div>
                            </div>
                            <div class="form-row">
                              <div class="form-group col-md-6">
                                <label for="feEmailAddress">연락처</label>
                                <input type="text" class="form-control" id="cusPne" placeholder="" value="${cusVO.cusPne}"> </div>
                            </div>
                            <div class="form-group">
                              <label for="feInputAddress">Address</label>
                              <input type="text" class="form-control" id="cusAddr" value="${cusVO.cusAddr}"> </div>
                            <div class="form-row">
<!--                               <div class="form-group col-md-12"> -->
<!--                                 <label for="feDescription">Description</label> -->
<!--                                 <textarea class="form-control" name="feDescription" rows="5">Lorem ipsum dolor sit amet consectetur adipisicing elit. Odio eaque, quidem, commodi soluta qui quae minima obcaecati quod dolorum sint alias, possimus illum assumenda eligendi cumque?</textarea> -->
<!--                               </div> -->
                            </div>
                            <button type="submit" class="btn btn-accent">정보 수정하기</button>
                            <a class="btn btn-warning" href="/cus/list">목록으로</a>
                            <button type="button" class="btn btn-secondary" onclick="makePdf()">pdf다운로드</button>
                          </form>
                        </div>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <!-- End Default Light Table -->
          </div>
    </div>
<script type="text/javascript">
// 	function makePdf(){
// 		html2canvas($(".detail")[0]).then(function(canvas){
// 			var doc = new jsPDF("1","px",[1600,900]);
// 			var imgData = canvas.toDataURL("image/png");
// 			doc.addImage(imgData,"PNG",0,0);
// 			doc.save("sample.pdf");
// 		});
// 	}
	function makePdf(){
		  html2canvas($(".detail")[0]).then(function(canvas) {
		      var imgData = canvas.toDataURL('image/png');
		      var imgWidth = 210;
		      var pageHeight = 290;
		      var imgHeight = canvas.height*imgWidth/canvas.width;

		      var doc = new jsPDF({
		          'orientation': 'p',
		          'unit': 'mm',
		          'format': 'a4'
		      });
		      doc.addImage(imgData, 'PNG', 0, 0, imgWidth, imgHeight);
		      doc.save('result.pdf');
		  });
	}
</script>
