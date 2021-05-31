<%@page import="java.text.DecimalFormat"%>
<%@page import="site.itwill.dao.ProductDAO"%>
<%@page import="site.itwill.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//전달값(제품번호)을 반환받아 저장
	int pNo=Integer.parseInt(request.getParameter("pNo"));

	//제품번호를 이용하여 PRODUCT 테이블에 저장된 해당 제품번호의 제품정보를 검색하여 반환하는
	//DAO 클래스의 메소드 호출
	ProductDTO product=ProductDAO.getDAO().selectNoProduct(pNo);
%>

<style type="text/css">
table {
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
}

td {
	border: 1px solid black;
}

.title {
	background: black;
	color: white;
	text-align: center;
	width: 100px;
}

.value {
	padding: 3px;
	text-align: left;
	width: 400px;
}
</style>

<h2>제품상세정보</h2>
<table>
	<tr>
		<td class="title">제품명</td>
		<td class="value"><%=product.getpName()%></td>
	</tr>
	<tr>
		<td class="title">제품이미지</td>
		<td class="value"><img src="<%=request.getContextPath() %>/site/product_image/<%=product.getpImage() %>" width="200"></td>
	</tr>
	<tr>
		<td class="title">상세설명</td>
		<td class="value"><%=product.getpInfomation().replace("\n", "<br>") %></td>
	</tr>
	<tr>
		<td class="title">제품가격</td>
		<td class="value"><%=DecimalFormat.getCurrencyInstance().format(product.getpPrice()) %></td>
	</tr>
</table>







