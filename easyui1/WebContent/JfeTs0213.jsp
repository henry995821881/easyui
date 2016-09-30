<!DOCTYPE HTML>
<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<html>

<script type="text/javascript" src="jquery-easyui-1.5/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="jquery-easyui-1.5/themes/default/easyui.css" type="text/css">
<link rel="stylesheet" href="jquery-easyui-1.5/themes/icon.css" type="text/css">
<head>

<script type="text/javascript">
	
</script>
<title>相手先マスタ</title>
<style type="text/css">
#tblBase {
	border: white thin outset;
	border-collapse: collapse; /* セルのボーダーを重ねる 	*/
}
</style>
</head>
<body class="noFrameBody">
	<div id="header"></div>
	<p>相手先一覧</p>
	<br>
	<div id="content">
		<script type="text/javascript">
			var d = [ {
				"aitesakiCd" : "02",
				"kensinkikanCd" : "0001",
				"kikanCd" : "0001",
				"kikanNm" : "事業主健診"
			}, {
				"kikanCd" : "0002",
				"kikanNm" : "パート先健診"
			}, {
				"kikanCd" : "001",
				"kikanNm" : "札幌フジクリニック"
			}, {
				"kikanCd" : "002",
				"kikanNm" : "エスエスサーティ健康管理センター"
			}, {
				"kikanCd" : "003",
				"kikanNm" : "総合太田病院"
			}, {
				"kikanCd" : "004",
				"kikanNm" : "宇都宮記念病院総合健診センター"
			}, {
				"kikanCd" : "005",
				"kikanNm" : "城西総合健診センター"
			}, {
				"kikanCd" : "006",
				"kikanNm" : "大宮シティクリニック"
			}, {
				"kikanCd" : "007",
				"kikanNm" : "藤間病院総合健診システム"
			}, {
				"kikanCd" : "008",
				"kikanNm" : "柏健診クリニック"
			} ];

			var tblCel2L = 'border-collapse: collapse;   border: 1px #ABABAB solid;padding: 0px; word-break: break-all; background-color: #FFFFEE; color: #333333; text-align: left; height: 22px';

			$(function() {
				$("#dg").datagrid(
								{
									data : d,
									columns : [ [
											{
												field : 'kikanCd',
												title : 'kikanCd',
												width : 120,
												//add style to <td>
												styler : function(value, row,
														index) {
													return tblCel2L;
												},

											},
											{
												field : 'kikanNm',
												title : 'kikanNm',
												width : 240
											},
											{
												field : 'kikanCd',
												title : 'kikanCd',
												hidden : true,
												formatter : function(value,
														row, index) {

													return '<input type="hidden" name="kikanCd",value='+value+'>';
												}

											},

											{
												field : 'aitesakiCd',
												title : 'aitesakiCd',
												width : 120,
												//format data of <td>
												//paramter value,rowdata,index
												formatter : function(value,
														row, index) {

													if (value == null
															|| typeof value == "undefined") {

														return '<input type="text" size="3" maxlength="4" name="aitesakiCd">';

													} else {

														return '<input type="text" size="3" value='+value+' maxlength="4" name="aitesakiCd">';
													}

												}
											},
											{

												title : 'opt',

												field : 'custom_name',

												width : 120,

												formatter : function(value,
														row, index) {

													if (row.kensinkikanCd) {

														var del = '<a href="javascript:setMaitesaki('
																+ index
																+ ',del)">[削除]</a>';
														var update = '<a href="javascript:setMaitesaki('
																+ index
																+ ',update)">[更新]</a>';
														return update
																+ "&nbsp;"
																+ del;
													} else {

														return '<a href="javascript:setMaitesaki('
																+ index
																+ ',add)">[追加]</a>';

													}

												}

											}

									] ]

								});

			});

			
			function checkAitesakiCd(value){
				
				if(value ==null) return false;
				
				value = $.trim(value);
				var reg =/^[0-9a-zA-Z]+$/g;
				
				if(!reg.test(value)){
					return false;
				}
				
				return true;
				
			}
			function setMaitesaki(index, type) {

				var $kikanCd = $("[name='kikanCd']").eq(index);
				var $aitesakiCd = $("[name='aitesakiCd']").eq(index);
				
				switch (type) {

				case 'add':
					
					if(!checkAitesakiCd($aitesakiCd.val())){
						alert("input char error");
						return;
					}
					
					add($kikanCd, $aitesakiCd);
					
					
					break;
				case 'update':
					
					if(!checkAitesakiCd($aitesakiCd.val())){
						alert("input char error");
						return;
					}
					
					
					 update($kikanCd, $aitesakiCd);
					break;
				case 'del':
					
					del($kikanCd, $aitesakiCd);
					
					break;
				default:
					break;

				}
			}
			
			
			function add($kikanCd, $aitesakiCd){
				
				if(confrim("add ??"))
				{
					
					
					//
					for(row in d)
					{
						if(row.kikanCd ==$kikanCd.val())
						{
							
							row.aitesakiCd =$aitesakiCd.val();
							row.kensinkikanCd = $kikanCd.val();
							break;
						}
						
					}
					
					
					$("#dg").datagrid("reload");
				}
				
			}
			function update($kikanCd, $aitesakiCd){
				if(confirm("update ??"))
				{
					
					for(row in d){
						
						if(row.kikanCd ==$kikanCd.val()){
							
							row.aitesakiCd =$aitesakiCd.val();
							break;
						}
					}
					
					
					$("#dg").datagrid("reload");
				}
				
				
			}
			function del($kikanCd, $aitesakiCd){
				
				if(confirm("delete ??")){
					
					for(row in d){
						if(row.kikanCd ==$kikanCd.val()){
							
							delete row.kensinkikanCd ;
							delete row.aitesakiCd ;
							
							break;
						}
					}
					
					$("#dg").datagrid("reload");
				}
			}
		</script>


		<table id="dg" class="easyui-datagrid" style="width: 600px;">
		</table>
	</div>

</body>

</html>