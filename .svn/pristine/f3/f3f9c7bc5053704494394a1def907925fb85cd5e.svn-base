<%@page import="site.itwill.dao.ProductDAO"%>
<%@page import="site.itwill.dto.ProductDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- => 제품정보변경 -> product_modify.jsp - 제품번호 전달 --%>
<%-- => 제품정보삭제 -> product_remove_action.jsp - 제품번호 전달 --%>
<%@include file="/security/admin_check.jspf" %>    
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

.wrap {
	text-align: center;
	display: flex;
	margin-left: 42%;	
}
#modifyBtn {
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: inline-block;
	margin: 20px auto;
	max-width: 180px;
	text-decoration: none;
	border-radius: 4px;
	padding: 20px 30px;
}
#listBtn {
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: inline-block;
	margin: 20px auto;
	max-width: 180px;
	text-decoration: none;
	border-radius: 4px;
	padding: 20px 30px;
}
#removeBtn {
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: inline-block;
	margin: 20px auto;
	max-width: 180px;
	text-decoration: none;
	border-radius: 4px;
	padding: 20px 30px;
}

.button1  {
	display: inline-block;	
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}
.button2  {
	display: inline-block;
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}
.button3  {
	display: inline-block;
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}

.button1:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
}
.button2:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
}
.button3:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
}

</style>
<div class="pInfo">
<h2 style="text-align: center;">상품상세정보</h2>
<table>
	<tr>
		<td class="title">카테고리</td>
		<td class="value"><%=product.getpCategory() %></td>
	</tr>
	<tr>
		<td class="title">상품 명</td>
		<td class="value"><%=product.getpName() %></td>
	</tr>
	<tr>
		<td class="title">상품 이미지</td>
		<td class="value"><img src="<%=request.getContextPath() %>/image/<%=product.getpImage() %>" width="200"></td>
	</tr>
	<tr>
		<td class="title">상세 설명</td>
		<td class="value"><%=product.getpInfomation().replace("\n", "<br>") %></td>
	</tr>
	<tr>
		<td class="title">상품수량</td>
		<td class="value"><%=DecimalFormat.getInstance().format(product.getpStock()) %></td>
	</tr>
	<tr>
		<td class="title">상품 가격</td>
		<td class="value"><%=DecimalFormat.getCurrencyInstance().format(product.getpPrice()) %></td>
	</tr>
</table>


<div class="wrap">
	<div>
		<button type="button" class="button1" id="modifyBtn" >변경</button>
	</div>
	<div>
		<button type="button" class="button2" id="listBtn" >목록</button>
	</div>
	<div>
		<button type="button" class="button3" id="removeBtn" >삭제</button>
	</div>
</div>

<script type="text/javascript">
$("#modifyBtn").click(function() {
	location.href="<%=request.getContextPath()%>/index.jsp?vaho=admin&studio=product_modify&pNo=<%=product.getpNo()%>";	
});

$("#listBtn").click(function() {
	location.href="<%=request.getContextPath()%>/index.jsp?vaho=admin&studio=admin_product_crud";	
});

$("#removeBtn").click(function() {
	if(confirm("선택한 제품정보를 삭제 하겠습니까?")) {
		location.href="<%=request.getContextPath()%>/index.jsp?vaho=admin&studio=product_remove_action&pNo=<%=product.getpNo()%>";
	}
});
</script>
















