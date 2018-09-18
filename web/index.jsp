<%@ page import="task.TaskDto" %>
<%@ page import="task.Task" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-17
  Time: 오후 1:11
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
	session.setAttribute("taskList", taskList);
%>
<html lang="ko">
<head>
	<%@include file="/partials/head.jsp" %>
	<title>메인</title>
</head>

<body>

<%@include file="/partials/nav.jsp" %>


<div class="container">

	<div class="starter-template">
		<h1>메인 페이지</h1><br>

		<label class="sr-only" for="title">
			<input type="text" class="form-control" name="title" id="title" value="<%=taskList%>">
		</label>

		<a class="btn btn-info" href="/task/" role="button">문제 풀기</a>
	</div>

</div><!-- /.container -->


<%@include file="/partials/script.jsp" %>

</body>
</html>