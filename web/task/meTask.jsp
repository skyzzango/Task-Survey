<%@ page import="task.TaskDto" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-19
  Time: 오후 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/task/meTaskList.jsp"%>
<%
	if (session.getAttribute("meQuiz") == null) session.setAttribute("meQuiz", 1);
	int num = (int) session.getAttribute("quiz");
	session.setAttribute("meQuiz", num + 1);
	List<String> results = new ArrayList<>();
%>
<html lang="ko">
<head>
	<%@include file="/partials/head.jsp" %>
	<title>Task</title>
</head>

<body onload="myFunction()" style="margin:0;">

<%@include file="/partials/nav.jsp" %>

<div id="loader"></div>

<div class="container">
	<div style="display:none;" id="myDiv" class="animate-bottom">

		<div class="starter-template">
			<h1>Medical Task Page</h1>
			<br>
			<form id="result" action="result.jsp" method="post">
				<% for (int i = 0; i < 1; i++) {
					MeTaskDto taskDto = meTaskList.get(0);
					String title = taskDto.getTitle();
					results.add(title);
					for (int j = 0; j < 3; j++) {
						results.add(taskDto.getAssociated().get(j));
					}
					Collections.shuffle(results); %>
				<div class="card bg-light mb-3">
					<h4 class="card-header">
						Quiz <%=num++%>. 다음 설명에 해당하는 것을 고르시오.
					</h4>
					<div class="card-body">
						<h5 class="card-title">
							<%=taskDto.getDescription()%>
						</h5>
						<h6 class="card-subtitle mb-2 text-muted"></h6>
						<br>
						<div class="btn-group-vertical btn-group-md btn-group-toggle btn-block" data-toggle="buttons">
							<label class="sr-only" for="title">
								<input type="text" class="form-control" name="title" id="title" value="<%=title%>">
							</label>
							<label class="btn btn-outline-dark" style="text-align: left">
								<input type="radio" name="answer" id="option1" autocomplete="off"
								       value="<%=results.get(0)%>">
								1. <%=results.get(0)%>
							</label>
							<label class="btn btn-outline-dark" style="text-align: left">
								<input type="radio" name="answer" id="option2" autocomplete="off"
								       value="<%=results.get(1)%>">
								2. <%=results.get(1)%>
							</label>
							<label class="btn btn-outline-dark" style="text-align: left">
								<input type="radio" name="answer" id="option3" autocomplete="off"
								       value="<%=results.get(2)%>">
								3. <%=results.get(2)%>
							</label>
							<label class="btn btn-outline-dark" style="text-align: left">
								<input type="radio" name="answer" id="option4" autocomplete="off"
								       value="<%=results.get(3)%>">
								4. <%=results.get(3)%>
							</label>
						</div>
						<br>
						<br>
						<button type="button" class="btn btn-secondary btn-block" onclick="showLoad()">Submit</button>
					</div>
				</div>
				<br><br>
				<% } %>
			</form>
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
		result.submit();
	}

</script>
</body>
</html>
