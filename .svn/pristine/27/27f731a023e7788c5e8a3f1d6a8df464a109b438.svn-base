<%@page import="site.itwill.util.Utility"%>
<%@page import="site.itwill.dao.qnaDAO"%>
<%@page import="site.itwill.dto.qnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>
<%
	//비정상 요청
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	//전달값 반환
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	
	
	String subject=Utility.escapeTag(request.getParameter("subject"));
	int status=0;//전달값이 없는 경우   
	if(request.getParameter("secret")!=null) {//전달값이 있는 경우
		status=Integer.parseInt(request.getParameter("secret"));
	}
	String content=Utility.escapeTag(request.getParameter("content"));
	
	
	//DTO 인스턴스를 생성하고 필드값 변경
	qnaDTO qna=new qnaDTO();
	qna.setNum(num);
	qna.setSubject(subject);
	qna.setContent(content);
	qna.setStatus(status);
	
	qnaDAO.getDAO().updateQna(qna);
	
	//@@@@@@@@@@@@@@@@@@ 44행 +search+ 변경하기 qnaDAO 참고
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()
		+"/index.jsp?vaho=qna&studio=qna_detail&num="+num+"&pageNum="
		+pageNum+"&search="+search+"&keyword="+keyword+"';");
	out.println("</script>");
	
%>
























