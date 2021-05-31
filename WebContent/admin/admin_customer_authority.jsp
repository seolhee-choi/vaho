<%@page import="site.itwill.dao.CustomerDAO"%>
<%@page import="site.itwill.dto.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	CustomerDTO loginCustomer = (CustomerDTO)session.getAttribute("loginCustomer");
	if(loginCustomer.getAdmin()!=1){
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=error&studio=error400';");
		out.println("</script>");
		return;
	}
	
	String email =request.getParameter("email");
	int admin = Integer.parseInt(request.getParameter("admin"));
	
	CustomerDAO.getDAO().updateAdminCustomer(email, admin);
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=admin&studio=admin_customer_manager';");
	out.println("</script>");
	
	
%>