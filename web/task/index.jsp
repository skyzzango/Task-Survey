<%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-17
  Time: 오후 1:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="/partials/head.jsp" %>
	<title>Task</title>
</head>

<body>

<%@include file="/partials/nav.jsp" %>


<div class="container">

	<div class="starter-template">
		<h1>Task Page</h1>
		<br>
		<form action="#" method="post">
			<div class="card">
				<h5 class="card-header">Quiz01</h5>
				<div class="card-body">
					<h5 class="card-title">title title title title</h5>
					<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
					<br>
					<div class="btn-group-vertical btn-group-md btn-group-toggle btn-block" data-toggle="buttons">
						<label class="btn btn-outline-primary" style="text-align: left">
							<input type="radio" name="options" id="option1" autocomplete="off">
							선택1
						</label>
						<label class="btn btn-outline-primary" style="text-align: left">
							<input type="radio" name="options" id="option2" autocomplete="off">
							선택2
						</label>
						<label class="btn btn-outline-primary" style="text-align: left">
							<input type="radio" name="options" id="option3" autocomplete="off">
							선택3
						</label>
						<label class="btn btn-outline-primary" style="text-align: left">
							<input type="radio" name="options" id="option4" autocomplete="off">
							선택4
						</label>
					</div>
					<br>
					<br>
					<button type="submit" class="btn btn-primary btn-block">Submit</button>
				</div>
			</div>
		</form>
	</div>


</div><!-- /.container -->


<%@include file="/partials/script.jsp" %>

</body>
</html>