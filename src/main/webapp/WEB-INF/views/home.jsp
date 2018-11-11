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
	<table>
		<c:forEach var="item" items="${feed}" varStatus="status">
			<tr>
				<td>${size -(pageMaker.criteria.page-1)*pageMaker.criteria.perPageNum - status.count +1}</td>
				<td>${item.title }</td>
			</tr>
		</c:forEach>
	</table>
	<ul class="pagination" style="justify-content: center;">
	    <c:if test="${pageMaker.prev}">
	        <li class="page-item">
	            <a class="page-link" href="<%=request.getContextPath()%>/?page=${pageMaker.startPage-1}">Previous</a>
	        </li>
	    </c:if>
	    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="index">
	        <li class="page-item <c:if test="${pageMaker.criteria.page == index }">active</c:if>">
	            <a class="page-link" href="<%=request.getContextPath()%>/?page=${index}">${index}</a>
	        </li>
	    </c:forEach>
	    <c:if test="${pageMaker.next}">
	        <li class="page-item">
	            <a class="page-link" href="<%=request.getContextPath()%>/?page=${pageMaker.endPage+1}">Next</a>
	        </li>
	    </c:if>
	</ul>
</div>
</body>
</html>
