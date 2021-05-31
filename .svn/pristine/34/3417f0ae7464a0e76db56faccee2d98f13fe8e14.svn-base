<%@page import="site.itwill.dto.CommentsDTO"%>
<%@page import="site.itwill.dao.CommentsDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="site.itwill.dto.ReviewDTO"%>
<%@page import="site.itwill.dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=error&work=error400';");
		out.println("</script>");
		return;
	}
	
	//int reviewNo=CommentsDAO.getDAO().selectNextNo();
	//int reviewNo=ReviewDAO.getDao().selectNextNo();
	int no=Integer.parseInt(request.getParameter("no"));
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	String writer=request.getParameter("writer");
	//String content=request.getParameter("content");
	String content=request.getParameter("commentContent");
		
	CommentsDTO comments=new CommentsDTO();
	comments.setNo(no);
	comments.setWriter(writer);
	comments.setContent(content);
			
	CommentsDAO.getDAO().insertComments(comments);
	
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=review&studio=review_detail&no="+no+"&pageNum="+pageNum+"&search="+search+"&keyword="+keyword+"';");
	out.println("</script>");
%>