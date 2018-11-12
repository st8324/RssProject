<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
<div class="sub_head">
    <div class="sub_title">
        <h1>해외정책동향</h1>
    </div>
</div>
<form method="get">
<div class="input-group mb-3">
	<!-- <div class="form-group" style="margin:0;">
		<select class="form-control" name="type">
			<option value="1">제목</option>
			<option value="2">내용</option>
			<option value="3">제목+내용</option>
		</select>
	</div> -->
	<input type="text" class="form-control" placeholder="Search" name="search">
	<div class="input-group-append">
    	<button class="btn btn-success" type="submit">Go</button> 
  	</div>
</div>
</form>
	<table>
		<c:forEach var="item" items="${feed}" varStatus="status">
			<tr>
				<td>${size -(pageMaker.criteria.page-1)*pageMaker.criteria.perPageNum - status.count +1}</td>
				<td>${item.title }</td>
				<td>${item.pubdate}</td>
			</tr>
		</c:forEach>
	</table>
	<ul class="pagination" style="justify-content: center;">
	    <c:if test="${pageMaker.prev}">
	        <li class="page-item">
	            <a class="page-link" href="<%=request.getContextPath()%>/?page=${pageMaker.startPage-1}&search=${pageMaker.criteria.search }">Previous</a>
	        </li>
	    </c:if>
	    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="index">
	        <li class="page-item <c:if test="${pageMaker.criteria.page == index }">active</c:if>">
	            <a class="page-link" href="<%=request.getContextPath()%>/?page=${index}&search=${pageMaker.criteria.search }">${index}</a>
	        </li>
	    </c:forEach>
	    <c:if test="${pageMaker.next}">
	        <li class="page-item">
	            <a class="page-link" href="<%=request.getContextPath()%>/?page=${pageMaker.endPage+1}&search=${pageMaker.criteria.search }">Next</a>
	        </li>
	    </c:if>
	</ul>
</div>
</body>
</html>
