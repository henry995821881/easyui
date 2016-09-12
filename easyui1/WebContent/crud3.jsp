<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="jquery,ui,easy,easyui,web">
<meta name="description" content="easyui help you build your web page easily!">
<title>Build CRUD Application with edit form in expanded row details - jQuery EasyUI Demo</title>


<link rel="stylesheet" type="text/css" href="http://www.jeasyui.net/Public/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="http://www.jeasyui.net/Public/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="http://www.jeasyui.net/Public/js/easyui/demo/demo.css">
<style type="text/css">
form {
	margin: 0;
	padding: 0;
}

.dv-table td {
	border: 0;
}

.dv-table input {
	border: 1px solid #ccc;
}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
<script type="text/javascript" src="http://www.w3cschool.cc/try/jeasyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="http://www.w3cschool.cc/try/jeasyui/datagrid-detailview.js"></script>
<script type="text/javascript">
	$(function() {
		$('#dg').datagrid(
				{
					view : detailview,
					detailFormatter : function(index, row) {
						return '<div class="ddv"></div>';
					},
					onExpandRow : function(index, row) {
						var ddv = $(this).datagrid('getRowDetail', index).find(
								'div.ddv');
						ddv.panel({
							border : false,
							cache : true,
							href : 'ShowForm?index=' + index,
							onLoad : function() {
								$('#dg').datagrid('fixDetailRowHeight', index);
								$('#dg').datagrid('selectRow', index);
								$('#dg').datagrid('getRowDetail', index).find(
										'form').form('load', row);
							}
						});
						$('#dg').datagrid('fixDetailRowHeight', index);
					}
				});
	});
	function saveItem(index) {
		var row = $('#dg').datagrid('getRows')[index];
		var url = row.isNewRecord ? 'AddUser' : 'UpdateUser?id='
				+ row.id;
		$('#dg').datagrid('getRowDetail', index).find('form').form('submit', {
			url : url,
			onSubmit : function() {
				return $(this).form('validate');
			},
			success : function(data) {
				//data = eval('(' + data + ')');
				//data.isNewRecord = false;
				//$('#dg').datagrid('collapseRow', index);
				//$('#dg').datagrid('updateRow', {
				//	index : index,
					//row : data
				//});
					$('#dg').datagrid('reload'); // reload the user data
			}
		});
	}
	function cancelItem(index) {
		var row = $('#dg').datagrid('getRows')[index];
		if (row.isNewRecord) {
			$('#dg').datagrid('deleteRow', index);
		} else {
			$('#dg').datagrid('collapseRow', index);
		}
	}
	function destroyItem() {
		var row = $('#dg').datagrid('getSelected');
		if (row) {
			$.messager.confirm('Confirm',
					'Are you sure you want to remove this user?', function(r) {
						if (r) {
							var index = $('#dg').datagrid('getRowIndex', row);
							$.post('RemoveUser', {
								id : row.id
							}, function() {
								$('#dg').datagrid('deleteRow', index);
							});
						}
					});
		}
	}
	function newItem() {
		$('#dg').datagrid('appendRow', {
			isNewRecord : true
		});
		var index = $('#dg').datagrid('getRows').length - 1;
		$('#dg').datagrid('expandRow', index);
		$('#dg').datagrid('selectRow', index);
	}
</script>
</head>
<body>
	<h2>Edit form in expanded row details</h2>
	<div class="demo-info" style="margin-bottom: 10px">
		<div class="demo-tip icon-tip">&nbsp;</div>
		<div>Click the expand button to expand a detail form.</div>
	</div>


	<table id="dg" title="My Users" style="width: 700px; height: 250px" url="GetUsers" toolbar="#toolbar" pagination="true" fitColumns="true" singleSelect="true">
		<thead>
			<tr>
				<th field="firstName" width="50">First Name</th>
				<th field="lastName" width="50">Last Name</th>
				<th field="phone" width="50">Phone</th>
				<th field="email" width="50">Email</th>
			</tr>
		</thead>
	</table>
	<div id="toolbar">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newItem()">New</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyItem()">Destroy</a>
	</div>

</body>
</html>