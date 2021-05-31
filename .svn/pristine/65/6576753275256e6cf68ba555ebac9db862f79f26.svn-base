<%@page import="java.io.File"%>
<%@page import="site.itwill.dao.ProductDAO"%>
<%@page import="site.itwill.dto.ProductDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- PRODUCT 테이블에 저장 후 --> product_crud.jsp 이동 --%>
<%-- multipart/form-data 사용 --> cos.jar 라이브러리 파일 설치 필요 --%>
<%-- 제품이미지는 서버 디렉토리에 저장, PRODUCT 테이블에는 업로드 파일명 저장 --%>

<%@include file="/security/admin_check.jspf" %>
<%
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=error&studio=error400';");
		out.println("</script>");
		return;
	}

	
	//WorkSpace 아니고 WebApps  경로를 반환
	//image 만들어야 경로지정 가능
	String saveDirectory=request.getServletContext().getRealPath("/image");
	
	MultipartRequest mr=new MultipartRequest(request, saveDirectory, 30*1024*1024, "utf-8"
			, new DefaultFileRenamePolicy());
	
	
	//전달값과 업로드 파일명을 반환받아 저장
	String pCategory=mr.getParameter("pCategory");
	if(pCategory=="1") {
		pCategory=mr.getParameter("pCategory")+"[ring]";
	}
	if(pCategory=="2") {
		pCategory=mr.getParameter("pCategory")+"[neckace]";
	}
	if(pCategory=="3") {
		pCategory=mr.getParameter("pCategory")+"[bracelet]";
	}
	if(pCategory=="4") {
		pCategory=mr.getParameter("pCategory")+"[etc]";
	}
	if(pCategory==null) {
		out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=admin&studio=product_detail';");
	}
	String pName=mr.getParameter("pName");
	String pImage=mr.getFilesystemName("pImage");
	String pInfomation=mr.getParameter("pInfomation");
	
	int pStock=Integer.parseInt(mr.getParameter("pStock"));
	int pPrice=Integer.parseInt(mr.getParameter("pPrice"));
	int pSize=Integer.parseInt(mr.getParameter("pSize"));
	
	//전달값으로 필드값 변경
	ProductDTO product=new ProductDTO();
	product.setpCategory(pCategory);
	product.setpName(pName);
	product.setpImage(pImage);
	product.setpInfomation(pInfomation);
	product.setpStock(pStock);
	product.setpPrice(pPrice);
	product.setpSize(pSize);
	
	
	
	//테이블 저장 DAO메소드
	ProductDAO.getDAO().insertProduct(product);
	
	//제품목록 출력페이지 이동	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=admin&studio=admin_product_crud';");
	out.println("</script>");
%>




