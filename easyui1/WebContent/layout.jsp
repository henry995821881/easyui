<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-easyui-1.5/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="jquery-easyui-1.5/themes/default/easyui.css" type="text/css">
<link rel="stylesheet" href="jquery-easyui-1.5/themes/icon.css" type="text/css">
<script type="text/javascript">
	
</script>
</head>

<body>

	<div class="easyui-layout">
		<div region="west" class="easyui-window" title="westtitle" style="width: 300px; height: 400px;" iconCls="icon-add">west</div>
		<div region="center" class="easyui-panel" title="centertitle" style="width: 500px; height: 400px;">center</div>

	</div>

	<div class="easyui-tabs" style="height: 100px; width: 350px;">

		<div id="first" iconCls="icon-add" closable=true>first</div>
		<div id="second" iconCls="icon-add" closable=true>second</div>
		<div id="third" iconCls="icon-add" closable=true>third</div>



	</div>
</body>
</html>