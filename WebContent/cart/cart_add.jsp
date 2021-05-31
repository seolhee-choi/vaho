<%@page import="site.itwill.dto.CustomerDTO"%>
<%@page import="site.itwill.dto.CartDTO"%>
<%@page import="site.itwill.dto.ProductDTO"%>
<%@page import="site.itwill.dao.ProductDAO"%>
<%@page import="site.itwill.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	
	//cartDAO 관련 추가 
		int no= Integer.parseInt(request.getParameter("pNo"));
		int Count= Integer.parseInt(request.getParameter("Count"));
		boolean isCheck=false;			
		isCheck= CartDAO.getDao().selectCheck(no);

	//카트에 같은 상품이 있을 시 개수 더하기
		if(isCheck){
			CartDAO.getDao().updateCartCount(no,Count);
		}
	
	//카트에 같은 상품이 없을 시 새로 추가
		if(!isCheck){	
		ProductDTO product=ProductDAO.getDAO().selectNoProduct(no);
		CartDTO cart=new CartDTO();
		cart.setLoginid(((CustomerDTO)session.getAttribute("loginCustomer")).getEmail());
		cart.setNo(no);
		cart.setCount(Count);
		cart.setPrice(""+product.getpPrice());
		cart.setTotalP(""+(product.getpPrice()*Count));
		cart.setDeliveryP("2500");
		CartDAO.getDao().insertCart(cart);
		}
	
	//카트로 넘기기
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=cart&studio=cart';");
	out.println("</script>");
	
%>
	
