<%@page import="java.text.DecimalFormat"%>
<%@page import="site.itwill.dao.ProductDAO"%>
<%@page import="site.itwill.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/security/admin_check.jspf" %>    
<%
	//int로 형변환
	//int pNo=Integer.parseInt(request.getParameter("pNo"));

	String pCategory=request.getParameter("pCategory");
	
	//카테고리를 받아서 select박스 검색 기능을 위한 변수
	List<ProductDTO> productList=ProductDAO.getDAO().selectCategoryProductList(pCategory);
%>

<style type="text/css">
#product {
	width: 800px;
	margin: 10px auto;
}	

table {
	border: 1px solid black;
	border-collapse: collapse;
}

td {
	border: 1px solid black;
	text-align: center;
	width: 200px;
}

.pname { width: 400px; }

td a, td a:visited {
	text-decoration: none;
}

td a:hover {
	text-decoration: underline;
	color: aqua;
}

.title {
	background: gray;
	font-weight: bold;
	color: white;
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
	<h2 style="text-align: center;">상품 목록</h2>
	<table>
		<tr>
			<td class="title">상품 카테고리</td>
			<td class="title">상품 명</td>
			<td class="title">상품 재고</td>
			<td class="title">상품 가격</td>
		</tr>
		
		
		
		<% if(productList.isEmpty()) { %>
			<tr>
				<td colspan="4">등록된 상품이 하나도 없습니다.</td>
			</tr>
		<% } else { %>
			<% for(ProductDTO product:productList) { %>
			<tr>
				<td><%=product.getpCategory() %></td>
				<td>
					<a href="<%=request.getContextPath() %>/index.jsp?vaho=admin&studio=product_detail&pNo=<%=product.getpNo()%>">
					<%=product.getpName() %></a>
				</td>
				<td><%=DecimalFormat.getInstance().format(product.getpStock()) %></td>
				<td><%=DecimalFormat.getCurrencyInstance().format(product.getpPrice()) %></td>
			</tr>
			<% } %>
		<% } %>
	</table>
	<div>&nbsp;</div>
	
	<p class="wrap">
		<button type="button" class="button" id="addBtn" >상품 등록</button>
	</p>
	
	
	
	<%--
	<form method="post" id="categoryForm">
		<select name="pCategory" id="pCategory">
		
			<option value="ring" <% if(pCategory.equals("1")) { %> selected="selected" <% } %>>
				Ring
			</option>
			<option value="neckace" <% if(pCategory.equals("2")) { %> selected="selected" <% } %>>
				Neckace
			</option>
			<option value="bracelet" <% if(pCategory.equals("3")) { %> selected="selected" <% } %>>
				Bracelet
			</option>
			<option value="etc" <% if(pCategory.equals("4")) { %> selected="selected" <% } %>>
				etc
			</option>
		</select>
	</form>
	--%>
	
</div>

<script type="text/javascript">
$("#addBtn").click(function() {
	location.href="<%=request.getContextPath()%>/index.jsp?vaho=admin&studio=product_insert";
});

$("#category").change(function() {
	$("#categoryForm").submit();
});

</script>
