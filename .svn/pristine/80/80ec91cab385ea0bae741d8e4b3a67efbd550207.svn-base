<%@page import="site.itwill.dto.ReviewDTO"%>
<%@page import="site.itwill.dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int no=Integer.parseInt(request.getParameter("no"));
	ReviewDTO review=ReviewDAO.getDao().selectNoReview(no);
	//ReviewDTO loginMember=(ReviewDTO)session.getAttribute("loginMember");
	
	//여기서부터 추가됨
	String action=request.getParameter("action");
	
	

%>    
<style type="text/css">

.passwordConfirm {
	margin-top:10%;
	text-align: center;
	color: grey;
	height:300px;
	font-size: 13px;
}
#pw {
	border: 1px solid grey;
	height: 35px;
}

</style>
<form method="post" name="passwdForm" >
	
	<div class="passwordConfirm">
			<% if(action.equals("modify")) { %>
			<div>이 페이지는 비밀번호를 입력해야 볼 수 있습니다.</div>
			<% } else if(action.equals("remove")) { %>
			<div>게시글 삭제를 위한 비밀번호를 입력해주세요.</div>
			<% } %>
			<br>
			<input type="hidden" name="no" value="<%=no%>">
			<input type="password" name="pw" onkeyDown="pressEnter()">
	</div>
</form>

<script type="text/javascript">
passwdForm.pw.focus();

function pressEnter(){
	if(event.keyCode == 13) {
		<% if(action.equals("modify")) { %>
		passwdForm.action="<%=request.getContextPath()%>/index.jsp?vaho=review&studio=review_modify";
		<%} else if(action.equals("remove")) { %>
		passwdForm.action="<%=request.getContextPath()%>/index.jsp?vaho=review&studio=review_remove_action";
		<%} %>		
		passwdForm.submit();
	}
}
</script>

