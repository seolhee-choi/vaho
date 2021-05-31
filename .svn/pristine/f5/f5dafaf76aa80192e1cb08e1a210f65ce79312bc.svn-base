<%@page import="java.text.DecimalFormat"%>
<%@page import="site.itwill.dao.ProductDAO"%>
<%@page import="site.itwill.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 상품번호 전달받아 제품목록출력 JSP --%>    
<%-- => [카테고리]를 변경한 경우 제품목록 출력페이지(product_manager.jsp)로 이동 - 입력값(카테고리) 전달 --%>
<%-- => [제품등록]을 클릭한 경우 제품정보 입력페이지(product_add.jsp)로 이동 --%>
<%-- => [제품명]을 클릭한 경우 제품정보 상세 출력페이지(product_detail.jsp)로 이동 - 제품번호 전달 --%>
<%-- 관리자 권한 추가해야함 --%>
<%-- @include file="/security/admin_check.jspf" --%>    
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

#btnDiv {
	text-align: right;
	margin-bottom: 5px;
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
	color: blue;
}
</style>

<div id="product">
	<h2>상품 목록</h2>
	
	<div id="btnDiv">
		<button type="button" id="addBtn">상품 등록</button>
	</div>
	
	<table>
		<tr>
			<td>상품 카테고리</td>
			<td class="pname">상품 명</td>
			<td>상품 재고</td>
			<td>상품 가격</td>
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
					<a href="<%=request.getContextPath()%>index.jsp?vaho=admin&studio=product_infomaion&pNo=<%=product.getpNo()%>">
					<%=product.getpName() %></a>
				</td>
				<td><%=DecimalFormat.getInstance().format(product.getpStock()) %></td>
				<td><%=DecimalFormat.getCurrencyInstance().format(product.getpPrice()) %></td>
			</tr>
			<% } %>
		<% } %>
	</table>
	<div>&nbsp;</div>
	
	<!-- action 속성이 생략된 경우 현재 URL 주소의 웹문서를 재요청 -->
	<!-- 아직 미구현 -->
	<form method="post" id="categoryForm">
		<select name="pCategory" id="pCategory">
			<option value="all" <% if(pCategory.equals("1")) { %> selected="selected" <% } %>>
				전체
			</option>
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
</div>

<script type="text/javascript">
$("#addBtn").click(function() {
	location.href="<%=request.getContextPath()%>/index.jsp?vaho=admin&studio=product_insert";
});

$("#category").change(function() {
	$("#categoryForm").submit();
});

</script>
