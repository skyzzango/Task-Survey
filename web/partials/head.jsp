<%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-17
  Time: 오후 12:58
  To change this template use File | Settings | File Templates.
--%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
      integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<!-- My Css -->
<link rel="stylesheet" href="">

<!-- web font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua|Nanum+Gothic+Coding:700|Open+Sans">

<!-- Custom styles for this template -->
<style>
	body {
		padding-top: 5rem;
		font-family: 'Jua', monospace;
	}

	.starter-template {
		padding: 3rem 1.5rem;
		align-content: center;
		align-items: center;
	}

	/* Center the loader */
	#loader {
		position: absolute;
		left: 50%;
		top: 50%;
		z-index: 1;
		width: 150px;
		height: 150px;
		margin: -75px 0 0 -75px;
		border: 16px solid #f3f3f3;
		border-radius: 50%;
		border-top: 16px solid #3498db;
		width: 120px;
		height: 120px;
		-webkit-animation: spin 2s linear infinite;
		animation: spin 2s linear infinite;
	}

	@-webkit-keyframes spin {
		0% {
			-webkit-transform: rotate(0deg);
		}
		100% {
			-webkit-transform: rotate(360deg);
		}
	}

	@keyframes spin {
		0% {
			transform: rotate(0deg);
		}
		100% {
			transform: rotate(360deg);
		}
	}

	/* Add animation to "page content" */
	.animate-bottom {
		position: relative;
		-webkit-animation-name: animatebottom;
		-webkit-animation-duration: 1s;
		animation-name: animatebottom;
		animation-duration: 1s
	}

	@-webkit-keyframes animatebottom {
		from {
			bottom: -100px;
			opacity: 0
		}
		to {
			bottom: 0;
			opacity: 1
		}
	}

	@keyframes animatebottom {
		from {
			bottom: -100px;
			opacity: 0
		}
		to {
			bottom: 0;
			opacity: 1
		}
	}

	#myDiv {
		display: none;
		text-align: left;
	}
</style>
