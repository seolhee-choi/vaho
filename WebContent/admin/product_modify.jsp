<%@page import="site.itwill.dao.ProductDAO"%>
<%@page import="site.itwill.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 제품번호를 전달받아 PRODUCT 테이블에 저장된 해당 제품번호의 제품정보를 검색하여 입력태그의
초기값으로 설정하고 변경값을 입력받는 JSP 문서 --%>
<%-- => 로그인 상태의 관리자만 접근 가능하도록 권한 설정 --%>
<%-- => [제품변경]을 클릭한 경우 제품정보 변경 처리페이지(product_modify_action.jsp)로 이동 - 입력값(제품정보) 전달 --%>
<%@include file="/security/admin_check.jspf" %>    
<%
	//전달값(제품번호)을 반환받아 저장
	int pNo=Integer.parseInt(request.getParameter("pNo"));

	//제품번호를 이용하여 PRODUCT 테이블에 저장된 해당 제품번호의 제품정보를 검색하여 반환하는
	//DAO 클래스의 메소드 호출
	ProductDTO product=ProductDAO.getDAO().selectNoProduct(pNo);
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
}
table {
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
}

td {
	border: 1px solid black;
	text-align: left;
}

.title {
	background: gray;
	color: white;
	text-align: center;
	width: 100px;
	font-weight: bold;
}

.value {
	padding: 3px;
	text-align: left;
	width: 400px;
}

.btn{
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
	<h2 style="text-align: center;">상품변경</h2>
	<form action="<%=request.getContextPath()%>/index.jsp?vaho=admin&studio=product_modify_action"
		method="post" enctype="multipart/form-data" id="productForm">
	<input type="hidden" name="pNo" value="<%=product.getpNo()%>">
	<input type="hidden" name="currentpImage" value="<%=product.getpImage()%>">	
	<table>
		<tr>
			<td class="title">상품카테고리</td>
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
			<td class="title">상품명</td>
			<td>
				<input type="text" name="productName" id="productName" maxlength="20" value="<%=product.getpName()%>">
			</td>
		</tr>
		<tr>
			<td class="title">상품이미지</td>
			<td>
				<img src="<%=request.getContextPath() %>/image/<%=product.getpImage() %>" width="200">
				<br>
				<input type="file" name="mainpImage" id="mainpImage">
			</td>
		</tr>
		<tr>
			<td class="title">상품상세설명</td>
			<td>
				<textarea rows="7" cols="60" name="pInfomaion" id="pInfomarion">
				<%=product.getpInfomation()%>
				</textarea>
			</td>
		</tr>
		<tr>
			<td class="title">상품수량</td>
			<td>
				<input type="text" name="productQty" id="productQty" value="<%=product.getpStock() %>">
			</td>
		</tr>
		<tr>
			<td class="title">상품가격</td>
			<td>
				<input type="text" name="pPrice" id="pPrice" value="<%=product.getpPrice()%>">
			</td>
		</tr>
	</table>
		<p class="wrap">
		<button type="submit" class="button" id="addBtn" >상품 등록</button>
		</p>
	</form>
	
	<div id="message" style="color: red;"></div>
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
	
	if($("#pSize").val("none")) {
		$("#message").text("상품 사이즈를 입력해 주세요.");
		$("#pPrice").focus();
		return false;
	}
});
</script>