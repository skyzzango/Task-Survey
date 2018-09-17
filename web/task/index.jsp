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
	<title>설문</title>
</head>

<body>

<%@include file="/partials/nav.jsp" %>


<div class="container">

	<div class="starter-template">
		<h1>설문 페이지</h1>
		<div class="card" style="width: auto;">
			<h5 class="card-header">Featured</h5>
			<div class="card-body">
				<h5 class="card-title">Card title</h5>
				<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
				<div class="card" style="width: auto;">
					<h5 class="card-header">Quiz01</h5>
					<div class="card-body">
						<h5 class="card-title">Card title Card title Card title ?</h5>
						<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
						<label>
							<select class="custom-select" multiple>
								<option selected>Open this select menu</option>
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
							</select>
						</label>
					</div>
				</div>
				<div class="card" style="width: auto;">
					<h5 class="card-header">Quiz02</h5>
					<div class="card-body">
						<h5 class="card-title">Card title Card title Card title ?</h5>
						<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">Cras justo odio</li>
							<li class="list-group-item">Dapibus ac facilisis in</li>
							<li class="list-group-item">Vestibulum at eros</li>
						</ul>
					</div>
				</div>
				<a href="#" class="btn btn-primary">button</a>
			</div>
		</div>

	</div>

</div><!-- /.container -->


<%@include file="/partials/script.jsp" %>

</body>
</html>