<%@page import="site.itwill.dao.qnaDAO"%>
<%@page import="site.itwill.dto.qnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>
<%
	if(request.getParameter("num")==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	
	qnaDTO qna=qnaDAO.getDAO().selectNumQna(num);

	if(qna==null || qna.getStatus()==9) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	//작성자나 관리자가 아닌경우
	if(!loginCustomer.getEmail().equals(qna.getEmail()) && loginCustomer.getAdmin()!=1) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
%>
<style type="text/css">
table {
	margin: 0 auto;
	color: #666666;
	width: 750px;
}

button {
	float: right;
	padding: 5px 10px;
	color: #FFFFFF;
	background-color: #313131;
}
</style>
<form action="<%=request.getContextPath() %>/index.jsp?vaho=qna&studio=qna_modify_action" method="post" id="boardForm">
	<input type="hidden" name="num" value="<%=num %>">
	<input type="hidden" name="pageNum" value="<%=pageNum %>">
	<input type="hidden" name="search" value="<%=search %>">
	<input type="hidden" name="keyword" value="<%=keyword %>">
	<table>
		<tr>
			<th>Subject</th>
			<td>
				<%--input type="text" name="subject" id="subject" size="40" value="<%=qna.getSubject() -" --%>
				<textarea rows="1" cols="60" name="subject" id="subject"><%=qna.getSubject() %></textarea>
				<input type="checkbox" name="secret" value="1"
					<% if(qna.getStatus()==1) { %> checked="checked" <% } %>>비밀글
			</td>
		<tr>
			<th>Content</th>
			<td>
				<textarea rows="7" cols="60" name="content" id="board_content"><%=qna.getContent() %></textarea>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<button type="submit">SAVE</button>
			</th>
		</tr>
	</table>
</form>
<div id="message" style="color: red;"></div>
<script type="text/javascript">
$("#subject").focus();

$("#boardForm").submit(function() {
	if($("#subject").val()=="") {
		$("#message").text("제목을 입력해 주세요");
		$("#subject").focus();
		return false;
	}
	
	if(#("#baord_content").val()=="") {
		$("#message").text("내용을 입력해 주세요");
		$("#board_content").focus();
		return false;
	}
});
</script>

























