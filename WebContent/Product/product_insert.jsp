<%@page import="site.itwill.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 제품등록 --> product_insert_action.jsp --%>

<%-- 관리자 권한 추가해야함 --%>
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

table {
	margin: 0 auto;
}

td {
	text-align: left;
}
</style>

<div id="product">
	<h2>상품등록</h2>
	<form action="<%=request.getContextPath()%>/index.jsp?vaho=admin&studio=product_insert_action"
		method="post" enctype="multipart/form-data" id="productForm">
	<table>
		<tr>
			<td>상품카테고리(1.ring 2.neckace 3.bracelet 4.etc)</td>
			<td>
				<select name="pCategory">
					<option value="1">반지(ring)</option>
					<option value="2">neckace(목걸이)</option>
					<option value="3">bracelet(팔찌)</option>
					<option value="4">etc(기타)</option>
					<option value="none" selected="selected">선택안됨</option>
				</select>
			</td>
		<tr>
		<tr>
			<td>상품명</td>
			<td>
				<input type="text" name="pName" id="pName" maxlength="30"
					<% if(product!=null) { %> 
						value="<%=product.getpName()%>" 
					<% } %>>
			</td>
		</tr>
		<tr>
			<td>상품이미지</td>
			<td>
				<input type="file" name="pImage" id="pImage">
			</td>
		</tr>
		<tr>
			<td>상품상세설명</td>
			<td>
				<textarea rows="7" cols="60" name="pInfomation" id="pInfomation">
				<% if(product!=null) { %>
					<%=product.getpInfomation()%>
				<% } %>
				</textarea>
			</td>
		</tr>
		<%-- 주문 결정되면 추가 
		<tr>
			<td>제품수량</td>
			<td>
				<input type="text" name="pStock" id="pStock" 
					<% if(product!=null) { %>
						value="<%=product.getpStock()%>" 
					<% } %>>
			</td>
		</tr>
		--%>
		<tr>
			<td>상품가격</td>
			<td>
				<input type="text" name="pPrice" id="pPrice" 
					<% if(product!=null) { %> 
						value="<%=product.getpPrice()%>" 
					<% } %>>
			</td>
		</tr>
		<tr>
			<td>상품 사이즈</td>
			<td>
			<select name="pSize">
				<option value="5">5</option>
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
				<option value="none">선택안됨</option>
			</select>
			</td>
		</tr>
		<tr>
			<td colspan="2"><button type="submit">상품등록</button></td>
		</tr>
	</table>
	</form>
	
	<div id="message" style="color: red;"><%=message %></div>
</div>

<script type="text/javascript">
$("#productForm").submit(function() {
	<%-- 카테고리 기본값을 선택안됨으로 하고 선택안된으로 submit하면 select 박스에 포커스 --%>
	if($("#pCategory").val("none")) {
		$("#message").text("제품코드를 입력해 주세요.");
		document.getElementsByName("category")[0].focus();
		return false;
	}
		

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
	
	<%-- 주문 결정되면 ㄱㄱ 
	if($("#pStock").val()=="") {
		$("#message").text("상품 수량을 입력해 주세요.");
		$("#pStock").focus();
		return false;
	}
	--%>
	
	if($("#pPrice").val()=="") {
		$("#message").text("상품 가격을 입력해 주세요.");
		$("#pPrice").focus();
		return false;
	}
	
	if($("#pSize").val("none")) {
		$("#message").text("상품 사이즈를 입력해 주세요.");
		document.getElementsByName("category")[0].focus();
		return false;
	}
});
</script>
