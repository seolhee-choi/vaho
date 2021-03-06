
<%@page import="site.itwill.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="site.itwill.dao.ProductDAO"%>
<%@page import="site.itwill.dto.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	CustomerDTO loginCustomer = (CustomerDTO)session.getAttribute("loginCustomer");
 
 %>
	<div class="headerMenuList">
		<nav class="headerMenu">
			<ul>
				<li><a class="shop_link" href="index.jsp?vaho=Product&studio=product_list&pca=all">SHOP</a>
					<nav class="ShopMenu">
						<a href="index.jsp?vaho=Product&studio=product_list&pca=all">all</a><br> 
						<a href="index.jsp?vaho=Product&studio=product_list&pca=1">ring</a><br> 
						<a href="index.jsp?vaho=Product&studio=product_list&pca=2">necklace</a><br> 
						<a href="index.jsp?vaho=Product&studio=product_list&pca=3">bracelet</a><br>
						<a href="index.jsp?vaho=Product&studio=product_list&pca=4">etc</a>
					</nav></li>
				<li><a href="index.jsp?vaho=member&studio=about">ABOUT</a></li>
				<li><a href="index.jsp?vaho=qna&studio=qna_list">Q&amp;A</a></li>
				<li><a href="index.jsp?vaho=review&studio=review_list">REVIEW</a></li>
				<% if(loginCustomer==null) {//비로그인  %>
				<li><a href="index.jsp?vaho=member&studio=login">LOG IN</a></li>
				<% }else{ // 로그인 %>
				<li><a href="index.jsp?vaho=member&studio=mypage">MY PAGE</a></li>
				<%if(loginCustomer.getAdmin()==1) {%>
				<li><a href="index.jsp?vaho=admin&studio=admin_main">ADMIN</a></li>
					<%	} %>
				<% } %>
				<li><a href="index.jsp?vaho=cart&studio=cart">CART</a></li> 
				
			</ul>
		</nav>

		<div class="headerRight">
			<a href="index.jsp?vaho=member&studio=main"><img class="headerLogo" src="image/log.jpg"></a>
		</div>
	</div>
