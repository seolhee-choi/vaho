<%@page import="site.itwill.dto.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    CustomerDTO loginCustomer = (CustomerDTO)session.getAttribute("loginCustomer");
    
    if(loginCustomer==null ||loginCustomer.getAdmin()==2){ //1관리자 2일때 일반회원
    	
        	out.println("<script type='text/javascript'>");
    		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&swork=error400';");
    		out.println("</script>");
    		return;
    }
    %>
<div class="headerMenuList">
		<nav class="headerMenu">
			<ul>
				<li><a href="index.jsp?vaho=admin&studio=admin_customer_manager">회원관리</a>
				<li><a href="index.jsp?vaho=cart&studio=cart_manage_page">주문관리</a></li>
				<li><a href="index.jsp?vaho=admin&studio=admin_product_crud">제품관리</a></li>
				<li><a href="index.jsp?vaho=member&studio=main">일반회원</a></li>
			</ul>
		</nav>

		<div class="headerRight">
			<a href="index.jsp?vaho=admin&studio=admin_main"><img class="headerLogo" src="image/log.jpg"></a>
		</div>
	</div>