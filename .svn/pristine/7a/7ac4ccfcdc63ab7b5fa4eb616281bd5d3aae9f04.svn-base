<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>
<%
	//전달값을 저장하기 위한 변수 => 전달값 없을시 새글
	String ref="0",reStep="0",reLevel="0";
	String pageNum="1";
	
	if(request.getParameter("ref")!=null) {
		ref=request.getParameter("ref");
		reStep=request.getParameter("reStep");
		reLevel=request.getParameter("reLevel");
		pageNum=request.getParameter("pageNum");
	}

%>
<style type="text/css">
.h2 {
	margin: 0 auto;
}
table {
	margin: 0 auto;
	color: #666666;
	width: 750px;
}

button {
	float: right;
	padding: 3px 8px;
	color: #FFFFFF;
	background-color: #313131;
}

</style>
<% if(ref.equals("0")) { %>
	<h2></h2>
<% } else { %>
	<h2></h2>
<% } %>
<form action="<%=request.getContextPath()%>/index.jsp?vaho=qna&studio=qna_write_action"
	method="post" id="boardForm">
	<input type="hidden" name="ref" value="<%=ref%>">
	<input type="hidden" name="reStep" value="<%=reStep%>">
	<input type="hidden" name="reLevel" value="<%=reLevel%>">
	<input type="hidden" name="pageNum" value="<%=pageNum%>">
	<table>
		<tr>
			<th>제목</th>
			<td>
				<textarea rows="1" cols="60" name="subject" id="subject"></textarea>
				<%--input type="text" name="subject" id="subject" size="40"--%>
				<input type="checkbox" name="secret" value="1">비밀글
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea rows="7" cols="60" name="content" id="board_content"></textarea>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<button type="submit">글저장</button>
				<button type="reset" id="resetBtn">다시쓰기</button>
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
	
	if($("#board_content").val()=="") {
		$("#message").text("내용을 입력해 주세요");
		$("#board_content").focus();
		return false;
	}
});

$("#resetBtn").click(function() {
	$("#subject").focus();
	$("#message").text("");	
});
</script>




































