<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="site.itwill.dto.ProductDTO"%>

<%@include file="/security/admin_check.jspf" %> 
<%
	String message=(String)session.getAttribute("message");
	if(message==null) {
		message="";
	} else {
		session.removeAttribute("message");
	}
	
	ProductDTO product=(ProductDTO)session.getAttribute("product");
	if(product!=null) {
		session.removeAttribute("product");
	}
%>

<style type="text/css">
#product {
	width: 800px;
	margin: 0 auto;
}


#pName{
	border: 1px solid black;
}

#pPrice {
	border: 1px solid black;
}

table {
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
}

td {
	text-align: left;
	border: 1px solid black;
}

.title {
	background: gray;
	color: white;
	text-align: center;
	width: 100px;
}

.value {
	padding: 3px;
	text-align: left;
	width: 400px;
}

.message{
	text-align: center;
}

.wrap {
	text-align: center;
}
#addBtn{
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: block;
	margin: 20px auto;
	max-width: 180px;
	text-decoration: none;
	border-radius: 4px;
	padding: 20px 30px;
}

.button {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}

.button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
}



</style>



<div id="product">
	<h2 style="text-align: center;">상품등록</h2>
	<form action="<%=request.getContextPath()%>/index.jsp?vaho=admin&studio=product_insert_action"
		method="post" enctype="multipart/form-data" id="productForm">
	<table>
		<tr>
			<td class="title">상품카테고리</td>
			<td>
				<select name="pCategory">
					<option value="1" selected="selected">반지(ring)</option>
					<option value="2">neckace(목걸이)</option>
					<option value="3">bracelet(팔찌)</option>
					<option value="4">etc(기타)</option>
				</select>
			</td>
		<tr>
		<tr>
			<td class="title">상품명</td>
			<td>
				<input type="text" name="pName" id="pName" maxlength="30"
					<% if(product!=null) { %> 
						value="<%=product.getpName()%>" 
					<% } %>>
			</td>
		</tr>
		<tr>
			<td class="title">상품이미지</td>
			<td>
				<input type="file" name="pImage" id="pImage">
			</td>
		</tr>
		<tr>
			<td class="title">상품상세설명</td>
			<td>
				<textarea rows="7" cols="60" name="pInfomation" id="pInfomation" >
				<% if(product!=null) { %>
					<%=product.getpInfomation()%>
				<% } %>
				</textarea>
			</td>
		</tr>
		<tr>
			<td class="title">제품수량</td>
			<td>
				<input type="text" name="pStock" id="pStock" 
					<% if(product!=null) { %>
						value="<%=product.getpStock()%>" 
					<% } %>>
			</td>
		</tr>
		<tr>
			<td class="title">상품가격</td>
			<td>
				<input type="text" name="pPrice" id="pPrice" 
					<% if(product!=null) { %> 
						value="<%=product.getpPrice()%>" 
					<% } %>>
			</td>
		</tr>
		<tr>
			<td class="title">상품 사이즈</td>
			<td>
			<select name="pSize">
				<option value="5" selected="selected">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				<option value="25">25</option>
			</select>
			</td>
		</tr>
	</table>
	<p class="wrap">
		<button type="submit" class="button" id="addBtn" >상품 등록</button>
	</p>
	</form>
	
	<div id="message" style="color: red;"><%=message %></div>
</div>

<script type="text/javascript">
$("#productForm").submit(function() {

	if($("#pName").val()=="") {
		$("#message").text("상품 명을 입력해 주세요.");
		$("#pName").focus();
		return false;
	}
	
	if($("#pImage").val()=="") {
		$("#message").text("상품 이미지를 등록해 주세요.");
		$("#pImage").focus();
		return false;
	}
	
	if($("#pInfomation").val()=="") {
		$("#message").text("상품 상세설명을 입력해 주세요.");
		$("#pInfomation").focus();
		return false;
	}
	
	if($("#pStock").val()=="") {
		$("#message").text("상품 수량을 입력해 주세요.");
		$("#pStock").focus();
		return false;
	}
	
	if($("#pPrice").val()=="") {
		$("#message").text("상품 가격을 입력해 주세요.");
		$("#pPrice").focus();
		return false;
	}
	
});
</script>
