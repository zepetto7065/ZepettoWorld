<%@page import="com.zepetto.world.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<%

	String boardType = (String) request.getAttribute("boardType");
	
%>
<html>
	<head>
		<jsp:include page="/WEB-INF/views/header.jsp" />
	</head>
	<body>

		<div class="body">

			<div role="main" class="main">

				<section class="page-header page-header-modern page-header-background page-header-background-sm overlay overlay-color-primary overlay-show overlay-op-8 mb-5" >
					<div class="container">
						<div class="row">
							<div class="col-md-12 align-self-center p-static order-2 text-center">
							<h1>게시판</h1>
							</div>
							<div class="col-md-12 align-self-center order-1">
								<ul class="breadcrumb breadcrumb-light d-block text-center">
									<li><a href="#">Home</a></li>
									<li class="active">Board</li>
								</ul>
							</div>
						</div>
						
					</div>
				</section>
				<form id="listPageForm">
					<input type="hidden" name="page" value="${searchCriteria.page}">
					<input type="hidden" name="perPageNum" value="${searchCriteria.perPageNum}">
					<input type="hidden" name="searchType" value="${searchCriteria.searchType}">
					<input type="hidden" name="keyword" value="${searchCriteria.keyword}">
				</form>

				<div class="container py-2">


							<div class="row">
							<div class="col pb-3">


								<hr class="solid my-5">

								<h4>글 목록</h4>

								<table class="table table-hover">
									<thead style="text-align: center">
										<tr>
											<th style="width: 50%">제목</th>
											<th>작성자</th>
											<th>작성일자</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="board">
											<tr>
												<td>
													<a href="/board/read${pageMaker.makeSearch(pageMaker.criteria.page)}&bno=${board.bno}&boardType=${board.boardType}">
														${board.title}
													</a>
													<span class="badge bn-teal"><i class="fa fa-comment-o"></i> + ${board.replyCnt}</span>
												</td>
												<td style="text-align: center">${board.userId}</td>
												<td style="text-align: center">${board.regDate}</td>
												<td style="text-align: center">${board.viewCnt}</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
								<div class="row float-right">
									<ul class="pagination">
										<c:if test="${pageMaker.prev}">
											<li class="page-item"><a
												href="/board/listall${pageMaker.makeSearch(startPage-1)}" class="page-link">이전</a></li>
										</c:if>
				
				
										<c:forEach var="idx" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
											<li 
												<c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>														
												<a href="/board/listall${pageMaker.makeSearch(idx)}" class="page-link">${idx}</a>
											</li>
										</c:forEach>
				
										<c:if test="${pageMaker.next && pageMaker.endPage>0}">
											<li  class="page-item"><a href="/board/listall${pageMaker.makeSearch(endPage+1)}" class="page-link">다음</a></li>
										</c:if>
									
									
									</ul>
								</div>	
								
							</div>

						
						</div>
						<div class="row">
							<div class="box-footer">
								<div class="form-group col-sm-2">
									<select class="form-control" name="searchType" id="searchType" style="width:132px;margin:11px;">
										<option value="n" <c:out value="${searchCriteria.searchType == null ? 'selected' : ''}"/>>선택</option>
										<option value="t" <c:out value="${searchCriteria.searchType eq 't'? 'selected' : ''}"/>>제목</option>
										<option value="c" <c:out value="${searchCriteria.searchType eq 'c'? 'selected' : ''}"/>>내용</option>
										<option value="w" <c:out value="${searchCriteria.searchType eq 'w'? 'selected' : ''}"/>>작성자</option>
										<option value="tc" <c:out value="${searchCriteria.searchType eq 'tc'? 'selected' : ''}"/>>제목+내용</option>
										<option value="cw" <c:out value="${searchCriteria.searchType eq 'cw'? 'selected' : ''}"/>>내용+작성자</option>
										<option value="tcw" <c:out value="${searchCriteria.searchType eq 'tcw'? 'selected' : ''}"/>>제목+내용+작성자</option>
									</select>
								</div>
							</div>
							<div class="form-group clo-sm-10" style="width:50%">
								<div class="input-group">
									<input type="text" class="form-control" name="keyword" id="keywordInput" value="${criteria.keyword}" style="height:40px;margin-top:9px" placeholer="검색어">
									<span class="input-group-btn" style=" margin:10px">
										<button type="button" class="btn btn-primary btn-flat" id="searchBtn">
											<i class="fa fa-search"></i>검색
										</button>
									</span>
									
								</div>
							</div>
							<div style="margin-top:9px">
								<c:if test="${(boardType eq 'q' || boardType eq 'f' || boardType eq 'd') && signedUser ne null}">	
									<a class="btn btn-outline btn-primary mb-2" href="/board/create?boardType=<%=boardType%>">
										글쓰기
									</a>
								</c:if>
								<c:if test="${signedUserAuth eq 'admin' && boardType eq 'a'}">
									<a class="btn btn-outline btn-primary mb-2" href="/board/create?boardType=<%=boardType%>">
										글쓰기
									</a>
								</c:if>		
							</div>					
						</div>
						</div>
						
					</div>
				</div>
				

		
	<script type="text/javascript">	
		var result='${msg}';
		if(result=="INSERT_SUCCESS"){
			//alert("입력 성공");
		}else if(result=="UPDATE_SUCCESS"){
			//alert("수정 성공");
		}else if(result=="DELETE_SUCCESS"){
			//alert("삭제 성공");
		}

/* 		$(".pagination li a").on("click", function(e){
			e.preventDefault();
			
			var targetPage = $(this).attr("href");
			var listPageForm = $("#listPageForm");
			
			listPageForm.find("[name='page']").val(targetPage);
			listPageForm.attr("action","/board/listall").attr("method","get");
			listPageForm.submit();
			
		}); */
		
		
		$("#searchBtn").click(function(){
			self.location="/board/listall${pageMaker.makeQuery(1)}" +
			"&searchType="+$("select option:selected").val() + "&keyword="+encodeURIComponent($("#keywordInput").val());
		 	location=encodeURI(uri); 
			
		}); 
	</script>
	
	</body>
</html>
