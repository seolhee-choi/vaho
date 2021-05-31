<%@page import="site.itwill.dao.CustomerDAO"%>
<%@page import="site.itwill.dto.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equals("GET")){
		out.println("<script type='text/script'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=error&studio=error400';");
		out.println("</script>");
		return;
	}
	
	String email = request.getParameter("email");
	String password =request.getParameter("password");
	
	
	CustomerDTO customer = new CustomerDTO();
	customer.setEmail(email);
	customer.setPassword(password);
	
	//비밀번호 변경 DAO 호출
	CustomerDAO.getDAO().newPasswordCustomer(customer);
	
	
	
	out.println("<script type='text/script'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=member&studio=login';");
	out.println("</script>");
	
		
		
























%>