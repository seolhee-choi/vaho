<%@page import="site.itwill.dao.ProductDAO"%>
<%@page import="site.itwill.dto.ProductDTO"%>
<%@page import="java.io.File"%>
<%@page import="site.itwill.util.Utility"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- -> product_detail.jsp - 제품번호 전달 --%>    
<%@include file="/security/admin_check.jspf" %>    
<%
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=error&studio=error400';");
		out.println("</script>");
		return;
	}
	String saveDirectory=request.getServletContext().getRealPath("image");
	MultipartRequest mr=new MultipartRequest(request, saveDirectory, 30*1024*1024, "utf-8"
			, new DefaultFileRenamePolicy());

	int pNo=Integer.parseInt(mr.getParameter("pNo"));
	String currentpImage=mr.getParameter("currentpImage");
	String pCategory=mr.getParameter("pCategory");
	String pName=mr.getParameter("pName");
	String mainpImage=mr.getFilesystemName("mainpImage");
	String pInfomation=Utility.escapeTag(mr.getParameter("pInfomaion"));
	//int pStock=Integer.parseInt(mr.getParameter("pStock"));
	int pPrice=Integer.parseInt(mr.getParameter("pPrice"));
	
	ProductDTO product=new ProductDTO();
	product.setpNo(pNo);
	product.setpCategory(pCategory);
	product.setpName(pName);

	//제품이미지를 변경
	if(mainpImage!=null) {
		product.setpImage(mainpImage);
		new File(saveDirectory, currentpImage).delete();
	//안할 때
	} else {
		product.setpImage(currentpImage);
	}
	product.setpInfomation(pInfomation);
	//product.setpStock(pStock);
	product.setpPrice(pPrice);
	
	ProductDAO.getDAO().updateProduct(product);
	
	//제품정보 상세 출력페이지 이동	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=admin&studio=product_detail&pNo="+pNo+"';");
	out.println("</script>");
%>