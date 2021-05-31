<%@page import="site.itwill.dao.CustomerDAO"%>
<%@page import="site.itwill.dto.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CustomerDTO loginCustomer =(CustomerDTO)session.getAttribute("loginCustomer");
	if(loginCustomer==null){
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=error&studio=error400';");
	out.println("</script>");
	return;
	}
	
	String email = request.getParameter("email");
	
	if(!loginCustomer.getEmail().equals(email)){
		session.setAttribute("message", "이메일이 맞지 않습니다.");
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=member&studio=customer_drop';");
		out.println("</script>");
		return;
	}
		
	//탈퇴하기 DAO 호출
	CustomerDAO.getDAO().deleteAllCustomer(email);
	
	//세션에서 언바인딩
	session.invalidate();
	
	out.println("<script type='text/javascript'>");
	out.println("alert('회원 탈퇴 되셨습니다.')");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=member&studio=main';");
	out.println("</script>");
	

%>