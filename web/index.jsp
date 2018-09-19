<%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-17
  Time: 오후 1:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="/partials/head.jsp" %>
	<title>메인</title>
</head>

<body onload="myFunction()" style="margin:0;">

<%@include file="/partials/nav.jsp" %>

<div id="loader"></div>

<div class="container">
	<div style="display:none;" id="myDiv" class="animate-bottom">

		<div class="starter-template">
			<h1>메인 페이지</h1><br>
			<button type="button" class="btn btn-primary" onclick="showLoad('/task/')">문제 풀러 가기</button>
			<button type="button" class="btn btn-primary" onclick="showLoad('/task/meTask.jsp')">문제 풀러 가기</button>
		</div>
	</div>

</div><!-- /.container -->


<%@include file="/partials/script.jsp" %>
<script>
	let myVar;

	function myFunction() {
		myVar = setTimeout(showPage, 100);
	}

	function showPage() {
		document.getElementById("loader").style.display = "none";
		document.getElementById("myDiv").style.display = "block";
	}

	function showLoad(url) {
		document.getElementById("loader").style.display = "block";
		document.getElementById("myDiv").style.display = "none";
		location.href = url;
	}

</script>
</body>
</html>
