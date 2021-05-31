<%@page import="site.itwill.dao.ReviewDAO"%>
<%@page import="site.itwill.dto.ReviewDTO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="site.itwill.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equals("GET")) {		
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=error&work=error400';");
		out.println("</script>");
		return;
	}
		
	String saveDirectory=request.getServletContext().getRealPath("/review/content_image");
	MultipartRequest mr=new MultipartRequest(request, saveDirectory, 30*1024*1024, "utf-8"
			, new DefaultFileRenamePolicy());
	
	int no=Integer.parseInt(mr.getParameter("no"));
	String pageNum=mr.getParameter("pageNum");
	String search=mr.getParameter("search");
	String keyword=mr.getParameter("keyword");
	String currentImage=mr.getParameter("currentImage");

	String product=mr.getParameter("product");
	String writer=Utility.escapeTag(mr.getParameter("writer"));
	String email=mr.getParameter("email");
	String content=Utility.escapeTag(mr.getParameter("content"));
	String grade=mr.getParameter("grade");
	String image=mr.getFilesystemName("image");
	
	ReviewDTO review=new ReviewDTO();
	review.setNo(no);
	review.setProduct(product);
	review.setWriter(writer);
	review.setEmail(email);
	review.setContent(content);
	review.setGrade(grade);
	if(image!=null) {
		review.setImage(image);
		new File(saveDirectory, currentImage).delete();
	} else {
		review.setImage(currentImage);
	}
	
	
	ReviewDAO.getDao().updateReview(review);
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=review&studio=review_detail&no="+no+"&pageNum="+pageNum+"&search="+search+"&keyword="+keyword+"';");
	out.println("</script>");
	
	
%>