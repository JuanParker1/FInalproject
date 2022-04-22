<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="card card-small mb-4">
	<div id="card-header border-bottom">
	
		<div style="float: right;" class="form-row">
			<div class="form-group">
			<form name="searchForm" id="searchForm" action="/cus/list"
				method="get">
				<a href="#" class="btn btn-success btn-icon-split"
					onclick="fn_submit()"> 
					<span class="icon text-white-50">
						<i class="fas fa-check"></i>
					</span><span class="text">검색</span>
				</a>
				<label><input type="search" name="keyWord" id="keyWord"
					class="form-control form-control-sm" placeholder="검색어를 입력하세요"
					aria-controls="dataTable" value="${param.keyWord}"></label>
			</form>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="form-group col-md-2.5">
			<select id="cntPerPage" name="sel" onchange="selChange()" class="form-control form-control-sm">
				<option value="5"
					<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
				<option value="10"
					<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
				<option value="15"
					<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
				<option value="20"
					<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
			</select>
			</div>
		</div>
	</div>
	<div class="card-body p-0 pb-3 text-center">
		<table class="table mb-0">
			<thead class="bg-light">
				<tr>
					<th scope="col" class="border-0">NO</th>
					<th scope="col" class="border-0">고객명</th>
					<th scope="col" class="border-0">주소</th>
					<th scope="col" class="border-0">번호</th>
				</tr>
			</thead>
			<tbody>
			<!-- foreach문으로 반복해서 리스트 출력 -->
			<!-- model.addAttribute("list", new ArticlePage(total, currentPage, size, 5, list));-->
			<c:forEach var="cusVO" items="${list.content}">
				<tr>
					<td>${cusVO.rnum}</td>
					<td><a href="/cus/detail?cusNum=${cusVO.cusNum}">${cusVO.cusNm}</a></td>
					<td>${cusVO.cusAddr}</td>
					<td>${cusVO.cusPne}</td>
				</tr>
			</c:forEach>				
			</tbody>
		</table>
		<div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite" style="float: left;">
				Showing ${list.currentPage*10-9}

				<c:if test='${list.currentPage*10 <= total}'>
               	to ${list.currentPage*10} of ${total} entries
              	</c:if>
				<c:if test='${list.currentPage*10 > total}'>
               	to ${total} of ${total} entries
              	</c:if>
		</div>
		<div class="card-header border-bottom" style="margin-left: 600px;">
			 <!-- 페이징 처리 시작 -->
              <ul class="pagination">
			  <!-- 이전버튼 -->                                
               <li class="paginate_button page-item previous <c:if test='${list.startPage<6}'>disabled</c:if>" id="dataTable_previous">
               <a href="/cus/list?currentPage=${list.startPage-5}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>
               <!-- 이전버튼 -->
               
               <!-- 페이지번호 시작 -->
               <c:forEach var="pNo" begin="${list.startPage}" end="${list.endPage}" step="1" >
                <li class="paginate_button page-item <c:if test='${list.currentPage eq pNo}'>active</c:if>">
                <a href="/cus/list?currentPage=${pNo}" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">${pNo}</a></li>
               </c:forEach>
               <!-- 페이지번호 끝 -->
               
               <!-- 다음버튼 -->
               <li class="paginate_button page-item next <c:if test='${list.endPage>=list.totalPages}'>disabled</c:if>" id="dataTable_next">
               <a href="/cus/list?currentPage=${list.startPage+5}" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a></li>
               <!-- 다음버튼 -->
              </ul>
              <!-- 페이징 처리 끝-->
		</div>
		<a href="/cus/insert">
		<button type="button" class="mb-2 btn btn-outline-success mr-2" style="float:right;">
		고객등록</button></a>
	</div>
</div>

<script type="text/javascript">
	function fn_submit(){
		var frm = document.searchForm;
		frm.submit();
	} 
</script>