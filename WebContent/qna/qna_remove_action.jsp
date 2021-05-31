<%@page import="site.itwill.dao.qnaDAO"%>
<%@page import="site.itwill.dto.qnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>
<%
	//비정상 요청
	if(request.getParameter("num")==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=error&studio=error400';");
		out.println("</script>");
		return;
	}

	//전달값 저장
	int num=Integer.parseInt(request.getParameter("num"));
	
	qnaDTO qna=qnaDAO.getDAO().selectNumQna(num);
	
	//게시글이 없거나 삭제된 게시글인 경우 - 에러
	if(qna==null || qna.getStatus()==9) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=error&studio=error400';");
		out.println("</script>");
		return;
	}

	//작성자나 관리자가 아닌경우 - 에러
	if(!loginCustomer.getEmail().equals(qna.getEmail()) && loginCustomer.getAdmin()!=1) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=error&studio=error400';");
		out.println("</script>");
		return;
	}
	

	qnaDAO.getDAO().deleteQna(num);
	
	//게시판으로 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=qna&studio=qna_list';");
	out.println("</script>");
	
%>









































