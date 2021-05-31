<%@page import="site.itwill.dao.CustomerDAO"%>
<%@page import="site.itwill.dto.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
		if(request.getMethod().equals("GET")){
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=error&studio=error400';");
		out.println("</script>");
		return;
		}
	
		String email = request.getParameter("email");
		String name  = request.getParameter("name");  
 		
		CustomerDTO customer =  CustomerDAO.getDAO().selectCustomer(email);
		
		if(customer == null){
			session.setAttribute("message", "입력한 이메일이 존재하지않습니다.");
			out.println("<script type='text/javascript'>");
			out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=member&studio=find_password';");
			out.println("</script>");
			return;
		}
		
		if(!customer.getName().equals("name")){
			session.setAttribute("message", "입력한 이메일 또는 이름이 존재하지않습니다.");
			out.println("<script type='text/javascript'>");
			out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=member&work=password_find';");
			out.println("</script>");
			return;
		}
		
		if(customer!=null){
			out.println("<script type='text/javascript'>");
			out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=member&studio=new_password';");
			out.println("</script>");
			
		}
			
			
%>