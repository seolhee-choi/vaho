<%@page import="java.io.File"%>
<%@page import="site.itwill.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %>   
<%
	int pNo=Integer.parseInt(request.getParameter("pNo"));

	String saveDirectory=request.getServletContext().getRealPath("/image");
	
	//삭제할 제품의 이미지 파일명을 반환받아 저장
	// => 제품번호를 이용하여 PRODUCT 테이블에 저장된 해당 제품번호의 제품정보를 검색하여 반환하는 DAO 클래스의 메소드 호출
	String mainImage=ProductDAO.getDAO().selectNoProduct(pNo).getpImage();
	
	ProductDAO.getDAO().deleteProduct(pNo);
	
	new File(saveDirectory, mainImage).delete();
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=admin&studio=admin_product_crud';");
	out.println("</script>");
%>






