<%@page import="site.itwill.dto.ProductDTO"%>
<%@page import="site.itwill.dto.CartDTO"%>
<%@page import="site.itwill.dao.ProductDAO"%>
<%@page import="site.itwill.dto.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	CustomerDTO Customer = (CustomerDTO) session.getAttribute("loginCustomer");

	String Btn = request.getParameter("Btn");

	System.out.print(Btn);
	System.out.print(Customer);
	if (Btn.equals("shoppingbasket")) {	
		if (Customer == null) {
			out.println("<script type='text/javascript'>");
			out.println("location.href='" + request.getContextPath()+ "/index.jsp?vaho=member&studio=login';");
			out.println("</script>");
		}else{
		request.getRequestDispatcher("../index.jsp?vaho=cart&studio=cart_add").forward(request, response);
		}
	}
	
	else if (Btn.equals("buy")) {
		if (Customer == null) {	
			
			out.println("<script type='text/javascript'>");
			out.println("location.href='" + request.getContextPath()+ "/index.jsp?vaho=Product&studio=non_customer_agree';");
			out.println("</script>");
			
			String pNo =request.getParameter("pNo");
			System.out.print(pNo);
			int Count = Integer.parseInt(request.getParameter("Count"));
			ProductDTO Product=ProductDAO.getDAO().selectNoProduct(Integer.parseInt(pNo));
			
			CartDTO Cart= new CartDTO();
			Cart.setPrice(Product.getpPrice()+"");
			Cart.setCount(Count);
			Cart.setTotalP((Integer.parseInt( Cart.getPrice())*Count)+"");
			session.setAttribute("Product", Product);
			session.setAttribute("Cart", Cart);
			
		} else {
			out.println("<script type='text/javascript'>");
			out.println("location.href='" + request.getContextPath()+"/index.jsp?vaho=Buy&studio=PaymentWindow';");
			out.println("</script>");
		}
	}
%>