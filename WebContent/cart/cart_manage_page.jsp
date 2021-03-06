<%@page import="site.itwill.dto.CustomerDTO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="site.itwill.dto.CartDTO"%>
<%@page import="site.itwill.dto.ProductDTO"%>
<%@page import="site.itwill.dao.ProductDAO"%>
<%@page import="site.itwill.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	
	CustomerDTO logincart=(CustomerDTO)session.getAttribute("loginCustomer");
	if(logincart==null){ //비로그인 사용자
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=error&studio=error400';");
	out.println("</script>");
	return;
	}else{
		if( logincart.getAdmin()!=1){
			out.println("<script type='text/javascript'>");
			out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=error&studio=error400';");
			out.println("</script>");
			return;
		}
	}
	
	int pageNum=1;
	
	if(request.getParameter("pageNum")!=null){
		pageNum=Integer.parseInt(request.getParameter("pageNum"));
	}
	
	
	List<CartDTO> selectCart=CartDAO.getDao().selectCart();
	
%>
<style>
table{
	text-align: center;
	margin: 0 auto;
	border: 1px solid #666666;
	border-collapse: collapse;
	
}

th {
	border: 1px solid black;
	background: #666666;
	color: white;
}

td {
	border: 1px solid black;
	text-align: center;	
}

#page{
	text-align: center;
}
#totalcart{
	text-align: center;
}

</style>
<table>
	<tr>
		<th>로그인 계정(이메일)</th>
		<th>상품 번호</th>
		<th>상품 개수</th>
		<th>상품 단가</th>
		<th>상품 금액 (단가*개수)</th>
		<th>배송료 (2500원 고정)</th>
		<th>배송상태</th>
		<th>배송시작일자</th>
		<th>배송종료예정일자</th>
	</tr>
	<%for(CartDTO cart:selectCart){ %>
	<tr>
		<td id="email" width="200"><%=cart.getLoginid() %></td>
		<td id="no" width="50"><%=cart.getNo() %></td>
		<td id="count" width="50"><%=cart.getCount()%></td>
		<td id="price" width="100"><%=cart.getPrice() %></td>
		<td id="totalPrice" width="100"><%=cart.getTotalP() %></td>
		<td id="deliveryP" width="100"><%=cart.getDeliveryP() %></td>
		<td id="deliveryType" width="100"><%=cart.getDeliveryType() %></td>
		<td id="deliveryStartdate" width="100"><%=cart.getDeliveryStartdate() %></td>
		<td id="deliveryArriveddate" width="100"><%=cart.getDeliveryArriveddate() %></td>
	</tr>
	<%} %>
</table>
	
	

