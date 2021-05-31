<%@page import="site.itwill.dao.ReviewDAO"%>
<%@page import="site.itwill.dto.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	if(request.getMethod().equals("GET")) {		
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=error&studio=error400';");
		out.println("</script>");
		return;
	}	

	int no=Integer.parseInt(request.getParameter("no"));
	String pw=request.getParameter("pw");
	ReviewDTO review=ReviewDAO.getDao().selectNoReview(no);

	if(review==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=error&studio=error400';");
		out.println("</script>");
		return;
	
	}
	
	if(!review.getPw().equals(pw) || review.getPw()==null ){
		out.println("<script type='text/javascript'>");
		out.println("alert('비밀번호가 일치하지않습니다. 다시 입력해주세요');");
		out.println("history.go(-1);");
		out.println("</script>");
		return;
	}
	
	ReviewDAO.getDao().deleteReview(no);
	
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=review&studio=review_list';");
	out.println("</script>");

%>    


