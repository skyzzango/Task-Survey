<%@ page import="task.TaskDto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="task.Task" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-18
  Time: 오후 8:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	List<TaskDto> taskList = new ArrayList<>();
	if(session.getAttribute("taskList") != null) {
		taskList.addAll((List<TaskDto>) session.getAttribute("taskList"));
	}
	if (taskList.size() < 2) {
		taskList.addAll(Task.createTasks());
	}
	taskList.remove(0);
	session.setAttribute("taskList", taskList);
	String title = request.getParameter("title");
	String answer = request.getParameter("answer");
	boolean result = title.equals(answer);
%>
<html lang="ko">
<head>
	<%@include file="/partials/head.jsp" %>
	<title>Task</title>
</head>

<body>

<%@include file="/partials/nav.jsp" %>


<div class="container">

	<div class="starter-template">
		<h1>Result Page</h1><br>
		<% if (result) { %>
		<h3>정답 입니다.</h3>
		<% } else { %>
		<h3>오답 입니다.</h3>
		<% } %>
		<br>
		<a class="btn btn-info" href="/task/" role="button">다음문제</a>
	</div>


</div><!-- /.container -->


<%@include file="/partials/script.jsp" %>

</body>
</html>
