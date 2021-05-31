<%@page import="site.itwill.dao.CustomerDAO"%>
<%@page import="site.itwill.dto.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 

if(request.getMethod().equals("GET")) {
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=error&studio=error400';");
	out.println("</script>");
	return;
	}
	CustomerDTO loginCustomer=(CustomerDTO)session.getAttribute("loginCustomer");
	if(loginCustomer==null){ //비로그인 사용자
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=error&studio=error400';");
	out.println("</script>");
	return;
	}
	
	String email = request.getParameter("email");	
	String name = request.getParameter("name").trim();
	String phone= request.getParameter("phone0")+"-"+request.getParameter("phone1")+"-"+request.getParameter("phone2");
	String zipcode = request.getParameter("zipcode");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");


	CustomerDTO customer = new CustomerDTO();	
	customer.setEmail(email);
	customer.setName(name);
	customer.setPhone(phone);
	customer.setZipcode(zipcode);
	customer.setAddress1(address1);
	customer.setAddress2(address2);

	CustomerDAO.getDAO().updateCustomer(customer);

	session.setAttribute("loginCustomer", customer);

	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=member&studio=mypage';");
	out.println("</script>");


%>
