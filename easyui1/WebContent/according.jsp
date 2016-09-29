<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-easyui-1.5/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="jquery-easyui-1.5/themes/default/easyui.css" type="text/css">
<link rel="stylesheet" href="jquery-easyui-1.5/themes/icon.css" type="text/css">
</head>
<body>



	<div id="aa" class="easyui-accordion"
		style="width: 300px; height: 200px;">

		<div title="Title1" iconCls="icon-save"
			style="overflow: auto; padding: 10px;">

			<h3 style="color: #0099FF;">Accordion for jQuery</h3>

			<p>Accordion is a part of easyui framework for jQuery. It lets
				you define your accordion component on web page more easily.</p>

		</div>

		<div title="Title2" iconCls="icon-reload" selected="true"
			style="padding: 10px;">content2</div>

		<div title="Title3">content3</div>

	</div>

</body>
</html>