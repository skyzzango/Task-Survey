<%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-18
  Time: 오후 8:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/task/taskList.jsp" %>
<%
	taskList.remove(0);
	session.setAttribute("taskList", taskList);
	String title = request.getParameter("title");
	String answer = request.getParameter("answer");
	boolean result = title.equals(answer);
%>
<html lang="ko">
<head>
	<%@include file="/partials/head.jsp" %>
	<title>Result</title>
</head>

<body onload="myFunction()" style="margin:0;">

<%@include file="/partials/nav.jsp" %>

<div id="loader"></div>

<div class="container">
	<div style="display:none;" id="myDiv" class="animate-bottom">

		<div class="starter-template">
			<h1>Result Page</h1><br>
			<% if (result) { %>
			<h3>정답 입니다.</h3>
			<% } else { %>
			<h3>오답 입니다.</h3>
			<% } %>
			<br>
			<button type="button" class="btn btn-outline-primary" onclick="showLoad()">다음문제</button>
		</div>
	</div>


</div><!-- /.container -->


<%@include file="/partials/script.jsp" %>
<script>
	let myVar;

	function myFunction() {
		myVar = setTimeout(showPage, 1);
	}

	function showPage() {
		document.getElementById("loader").style.display = "none";
		document.getElementById("myDiv").style.display = "block";
	}

	function showLoad() {
		document.getElementById("loader").style.display = "block";
		document.getElementById("myDiv").style.display = "none";
		location.href="/task/"
	}

</script>
</body>
</html>
