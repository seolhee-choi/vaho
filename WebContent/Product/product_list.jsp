<%@page import="java.text.DecimalFormat"%>
<%@page import="site.itwill.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="site.itwill.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String name= request.getParameter("pca");
	//전체상품 출력 메소드를 가져와서
	List<ProductDTO> productList=name.equals("all")?ProductDAO.getDAO().selectAllProduct():ProductDAO.getDAO().selectCategory(name);
%>

<style type="text/css">
#productList {
	width: 1500px;
	margin: 0 auto;
}

.product {
	padding: 10px 10px;
	border: 1px solid white;
	width: 300px;
	margin: 10px;
	text-align: center;
	float: left;
}
a {
	object-fit:cover
}

#productMenu{
	width: 1000px;
	padding-left: 50px;
}
 a:link {  text-decoration: none;}
 a:visited {  text-decoration: none;}
 
.productImg {
	width: 290px;
}
#explain {
	width: 290px;
	position: absolute;
	opacity: 0;
}

.productImg:hover #explain  {
	opacity: 0.8;
}

</style>


<%-- 반복문으로 하나씩 출력 --%>

<div>&nbsp;</div>
<div id="productMenu">
	&nbsp;<a href="index.jsp?vaho=Product&studio=product_list&pca=all">All</a>&nbsp;&nbsp;
	<a href="index.jsp?vaho=Product&studio=product_list&pca=1">ring</a>&nbsp;&nbsp;
	<a href="index.jsp?vaho=Product&studio=product_list&pca=2">neakace</a>&nbsp;&nbsp;
	<a href="index.jsp?vaho=Product&studio=product_list&pca=3">bracelet</a>&nbsp;&nbsp;
	<a href="index.jsp?vaho=Product&studio=product_list&pca=4">etc</a>
</div>    
<div>&nbsp;</div>

<div id="productList">
<% for(ProductDTO product:productList) { %>
	<div class="product">
		<div class="productImg">
			<a href="<%=request.getContextPath() %>/index.jsp?vaho=Product&studio=Information&pNo=<%=product.getpNo()%>">
		<%-- 	<a href="<%=request.getContextPath() %>/index.jsp?vaho=Product&studio=<%=product.getpCategory() %>&pNo=<%=product.getpNo() %>"> --%>
				<p id="explain"><br><br><br><br><br><br><br><br><br><br><%=product.getpName() %> <br><%=DecimalFormat.getInstance().format(product.getpPrice()) %>원</p>
				<img src="<%=request.getContextPath()%>/image/<%=product.getpImage() %>" width="290">
			
			</a>
		</div>
		<div>&nbsp;</div>
	</div>	
<% } %>	
</div>

<div style="clear: both;"></div>



