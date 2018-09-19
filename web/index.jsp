<%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-17
  Time: 오후 1:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	session.setAttribute("quiz", 1);
%>
<html lang="ko">
<head>
	<%@include file="/partials/head.jsp" %>
	<title>메인</title>
</head>

<body onload="myFunction()" style="margin:0;">

<div id="loader"></div>

<%@include file="/partials/nav.jsp" %>


<div class="container">
	<div style="display:none;" id="myDiv" class="animate-bottom">

		<div class="starter-template">
			<h1>메인 페이지</h1><br>
			<a class="btn btn-outline-primary" href="/task/" role="button">문제 풀기</a>
		</div>
	</div>

</div><!-- /.container -->


<%@include file="/partials/script.jsp" %>
<script>
	let myVar;

	function myFunction() {
		myVar = setTimeout(showPage, 1000);
	}

	function showPage() {
		document.getElementById("loader").style.display = "none";
		document.getElementById("myDiv").style.display = "block";
	}
</script>
</body>
</html>