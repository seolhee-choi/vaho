<%@page import="site.itwill.util.Utility"%>
<%@page import="site.itwill.dto.qnaDTO"%>
<%@page import="site.itwill.dao.qnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>
<%
	//비정상 요청
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=error&studio=error400';");
		out.println("</script>");
		return;
	}

	//전달값 저장
	int ref=Integer.parseInt(request.getParameter("ref"));
	int reStep=Integer.parseInt(request.getParameter("reStep"));
	int reLevel=Integer.parseInt(request.getParameter("reLevel"));
	String pageNum=request.getParameter("pageNum");
	
	//Utility
	String subject=Utility.escapeTag(request.getParameter("subject"));
	int status=0;//전달값이 없는 경우   
	if(request.getParameter("secret")!=null) {//전달값이 있는 경우
		status=Integer.parseInt(request.getParameter("secret"));
	}
	String content=Utility.escapeTag(request.getParameter("content"));
	
	//새글 또는 답글의 글번호로 저장
	int num=qnaDAO.getDAO().selectNextNum();
	
	//새글과 답글 구분
	if(ref==0) {//새글
		ref=num;
	} else {//답글
		qnaDAO.getDAO().updateReStep(ref, reStep);
	
		reStep++;
		reLevel++;
	}
	
	//DTO 인스터스를 생성하고 필드값 변경
	qnaDTO qna=new qnaDTO();
	qna.setNum(num);
	qna.setEmail(loginCustomer.getEmail());
	qna.setWriter(loginCustomer.getName());
	qna.setSubject(subject);
	qna.setRef(ref);
	qna.setReStep(reStep);
	qna.setReLevel(reLevel);
	qna.setContent(content);
	qna.setStatus(status);
	
	//테이블에 저장
	qnaDAO.getDAO().insertQna(qna);
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=qna&studio=qna_list&pageNum="+pageNum+"';");
	out.println("</script>");
%>
































