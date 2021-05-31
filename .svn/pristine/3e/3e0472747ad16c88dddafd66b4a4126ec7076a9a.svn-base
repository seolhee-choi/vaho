<%@page import="java.util.List"%>
<%@page import="site.itwill.dto.CustomerDTO"%>
<%@page import="site.itwill.dto.CartDTO"%>
<%@page import="site.itwill.dto.ProductDTO"%>
<%@page import="site.itwill.dao.ProductDAO"%>
<%@page import="site.itwill.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %>   
<%
	//전달값(제품번호)을 반환받아 저장
	int index= Integer.parseInt(request.getParameter("index"));
	
	
	CustomerDTO email = (CustomerDTO)session.getAttribute("loginCustomer");
	
	if(email==null){
	 email=new CustomerDTO();
	}else{
	 session.removeAttribute("email");
	}
	
	List<CartDTO> cart=CartDAO.getDao().getemail(email.getEmail());

	
	//게시글 번호를 이용하여 cart 테이블에 저장된 해당 게시글을 삭제하는 DAO 클래스의 메소드 호출
	CartDAO.getDao().deleteCart(cart.get(index).getNo());
	
	//카트로 넘기기
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=cart&studio=cart';");
	out.println("</script>");
%>






