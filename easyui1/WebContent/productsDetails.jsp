<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
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
	$(function() {

		$("#panel").panel({
			width : 300,
			height : 200,
			iconCls : "icon-add",
			collapsible : true,
			minimizable : true,
			maximizable : true,
			closable : true,
			draggable : true,
			content : "content"
		});

		$("#window").window({
			width : 300,
			height : 200,
			iconCls : "icon-edit",
			collapsible : true,
			minimizable : true,
			maximizable : true,
			closable : true,
			content : "content"
		});

		$("#dialog").dialog({
			width : 300,
			height : 200,
			iconCls : "icon-edit",
			collapsible : true,
			minimizable : true,
			maximizable : true,
			closable : true,
			content : "content",
			toolbar : [ {
				text : "edit",
				iconCls : "icon-edit",
				handler : function() {
					alert("edit")
				}
			}, {
				text : "cancel",
				iconCls : "icon-cancel",
				handler : function() {
					alert("cancel")
				}
			}, ],
			buttons : [ {
				text : "ok",
				iconCls : "icon-ok",
				handler : function() {
					alert("ok")
				}
			}, {
				text : "cancel",
				iconCls : "icon-cancel",
				handler : function() {
					alert("cancel")
				}
			}, ]

		});

	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="title"></div>
	<div id="window"></div>
	<div id="dialog"></div>

<!--menu -->
	<div class="easyui-layout">
		<div region="north" style="height:100px;width: auto;">

			<div class="easyui-panel" >
				
			</div>
		</div>
	</div>
</body>
</html>