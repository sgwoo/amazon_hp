<!DOCTYPE html>
<html>
<head>
	<div th:replace="fragments/header :: header">
		<title>Spring Social Example</title>
		<meta charset="utf-8"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>

		<link rel="stylesheet" type="text/css" href="/css/ax5.css" id="ax5-theme">
		<link rel="stylesheet" type="text/css" href="/css/style.css">
		<link rel="stylesheet" type="text/css" href="http://cdn.axisj.com/axicon/axicon.min.css">
		<script type="text/javascript" src="/js/ax5.min.js"></script>
		<script type="text/javascript" src="/js/all.min.js"></script>
	</div>
</head>
<body>
	<div class="container">
		<div class="ax-sample-header">
			<div class="ax-logo"></div>
			<h1 class="ax info">AXISJ SAMPLE CODES</h1>
		</div>

		<div layout:fragment="content">
		</div>
	</div>
		<div th:replace="fragments/footer :: footer">
		</div>
</body>
</html>