<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="jquery,ui,easy,easyui,web">
<meta name="description" content="easyui help you build your web page easily!">
<title>shopingcart2</title>

<script type="text/javascript" src="jquery-easyui-1.5/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="jquery-easyui-1.5/themes/default/easyui.css" type="text/css">
<link rel="stylesheet" href="jquery-easyui-1.5/themes/icon.css" type="text/css">
<style type="text/css">
.products {
	list-style: none;
	margin-right: 300px;
	padding: 0px;
	height: 100%;
}

.products li {
	display: inline;
	float: left;
	margin: 10px;
}

.item {
	display: block;
	text-decoration: none;
}

.item img {
	border: 1px solid #333;
}

.item p {
	margin: 0;
	font-weight: bold;
	text-align: center;
	color: #c3c3c3;
}

.cart {
	position: fixed;
	right: 0;
	top: 0;
	width: 300px;
	height: 100%;
	background: #ccc;
	padding: 0px 10px;
}

h1 {
	text-align: center;
	color: #555;
}

h2 {
	position: absolute;
	font-size: 16px;
	left: 10px;
	bottom: 20px;
	color: #555;
}

.total {
	margin: 0;
	text-align: right;
	padding-right: 20px;
}
</style>
<script>
	var data = {
		"total" : 0,
		"rows" : []
	};
	var totalCost = 0;

	$(function() {
		$('#cartcontent').datagrid({
			singleSelect : true
		});

		$('.item').draggable({
			revert : true,
			proxy : 'clone',
			onStartDrag : function() {
				$(this).draggable('options').cursor = 'not-allowed';
				$(this).draggable('proxy').css('z-index', 10);
			},
			onStopDrag : function() {
				$(this).draggable('options').cursor = 'move';
			}
		});

		$('.cart').droppable({
			onDragEnter : function(e, source) {
				$(source).draggable('options').cursor = 'auto';
			},
			onDragLeave : function(e, source) {
				$(source).draggable('options').cursor = 'not-allowed';
			},
			onDrop : function(e, source) {
				var name = $(source).find('p:eq(0)').html();
				var price = $(source).find('p:eq(1)').html();
				addProduct(name, parseFloat(price.split('$')[1]));
			}
		});
	});

	function addProduct(name, price) {
		function add() {
			for (var i = 0; i < data.total; i++) {
				var row = data.rows[i];
				if (row.name == name) {
					row.quantity += 1;
					return;
				}
			}
			data.total += 1;
			data.rows.push({
				name : name,
				quantity : 1,
				price : price
			});
		}
		add();
		totalCost += price;
		$('#cartcontent').datagrid('loadData', data);
		$('div.cart .total').html('Total: $' + totalCost);
	}
</script>
</head>
<script type="text/javascript">


var products = [
                {id:1,imageUrl:"images/shirt1.gif",name:"Balloon",price:25},
                {id:2,imageUrl:"images/shirt2.gif",name:"Feeling",price:25},
                {id:3,imageUrl:"images/shirt3.gif",name:"Elephant",price:25},
                {id:4,imageUrl:"images/shirt4.gif",name:"Stamps",price:25},
                {id:5,imageUrl:"images/shirt5.gif",name:"Monogram",price:25},
                {id:6,imageUrl:"images/shirt6.gif",name:"Rolling",price:25},

];


   
$(function(){
	
	//init products
   for(i in products){
	   
    var li='<li>'+
          '<a href="productsDetails?id="'+products[i].id+' class="item">'+
	         '<img src="'+products[i].imageUrl+'" />'+
             '<div>'+
		        '<p>'+products[i].name+'</p>'+
		        '<p>Price:$'+products[i].price+'</p>'+
	         '</div>'+
           '</a>'+
      '</li>';
	      	   
	   $(".class").append(li);
   }   
	
});



</script>
<body style="margin: 0; padding: 0; height: 100%; background: #fafafa;">
	<ul class="products">
		
	</ul>
	<div class="cart">
		<h1>Shopping Cart</h1>
		<div style="background: #fff">
			<table id="cartcontent"  fitColumns="true" style="width: 300px; height: auto;">
				<thead>
					<tr>
						<th field="name" width=140>Name</th>
						<th field="quantity" width=60 align="right">Quantity</th>
						<th field="price" width=60 align="right">Price</th>
					</tr>
				</thead>
			</table>
		</div>
		<p class="total">Total: $0</p>
		<h2>Drop here to add to cart</h2>
		<button type="button" onclick="submitCart();">post order</button>
	</div>

	<script type="text/javascript">
		function submitCart() {

			$.ajax({
				type : "POST",
				url : "ShopCart",
				contentType : "application/json; charset=utf-8",
				//json object -->json string
				data : JSON.stringify(data),
				dataType : "json",
				success : function(message) {

					alert("already submit");

				},
				error : function(message) {
					alert("error");

				}
			});

		}
	</script>

</body>
</html>