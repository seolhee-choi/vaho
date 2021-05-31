<%@page import="java.util.List"%>
<%@page import="site.itwill.dto.CustomerDTO"%>
<%@page import="site.itwill.dto.CartDTO"%>
<%@page import="site.itwill.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	CustomerDTO Customer = (CustomerDTO) session.getAttribute("loginCustomer");
	
	if(Customer!=null)	CartDAO.getDao().deliveryStatus(CartDTO.Delivery,Customer.getEmail());
	
	response.sendRedirect(request.getContextPath()+"/index.jsp");
%>