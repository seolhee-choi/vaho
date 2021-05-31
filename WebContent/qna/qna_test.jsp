<%@page import="site.itwill.dao.qnaDAO"%>
<%@page import="site.itwill.dto.qnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	for (int i = 1; i <= 2; i++) {
	qnaDTO board = new qnaDTO();
	int num = qnaDAO.getDAO().selectNextNum();
	board.setNum(num);
	board.setEmail("abc@itwill.site");
	board.setWriter("고길동");
	board.setSubject("연습글-" + i);
	board.setRef(num);
	board.setContent("게시글 연습-" + i);
	qnaDAO.getDAO().insertQna(board);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>5개의 글 생성</h1>
</body>
</html>