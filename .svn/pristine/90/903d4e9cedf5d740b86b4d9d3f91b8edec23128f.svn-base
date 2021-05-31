<%@page import="site.itwill.dto.CustomerDTO"%>
<%@page import="site.itwill.dto.qnaDTO"%>
<%@page import="site.itwill.dao.qnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	
	//게시글 번호로 테이블 검색 후 반환
	qnaDTO qna=qnaDAO.getDAO().selectNumQna(num);
	
	//없거나 삭제된 경우 - 비정상적인 요청
	if(qna==null || qna.getStatus()==9) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho =error&studio=error400';");
		out.println("</script>");
		return;
	}
	
	//회원정보
	CustomerDTO loginCustomer=(CustomerDTO)session.getAttribute("loginCustomer");
	
	
	//검색된 게시글이 비밀 게시글인 경우
	if (qna.getStatus() == 1) {
		//로그인 상태의 사용자가 작성자이거나 관리자가 아닌 경우 - 비정상적인 요청	
		//login상태@@@@@
		if (loginCustomer == null || !loginCustomer.getEmail().equals(qna.getEmail()) && loginCustomer.getAdmin() != 1) {
			out.println("<script type='text/javascript'>");
			out.println("location.href='" + request.getContextPath() + "/index.jsp?vaho=error&studio=error400';");
			out.println("</script>");
			return;
		}
	}
	
	//조회수 증가
	qnaDAO.getDAO().updateReadCount(num);
%>
<style type="text/css">
#qna_detail {
	width: 700px;
	margin: 0 auto;
	color: #666666;
	padding-top: 50px;
	
}

#content_top {
	padding-top: 30px;
	padding-bottom: 30px;
	float: right;
}

#cotent_body {
	border-top: 1px solid #CCCCCC;
	border-collapse: collapse;
	color: #666666;
}

button {
	background-color: rgba(0,0,0,0);
	border: none;
	padding: 15px 0;
	margin: 5px;
	display: inline-block;
	cursor: pointer;
}

</style>
<div id="qna_detail">
	 
	<div>
		<div id="content_top">
		<%if(loginCustomer!=null && (loginCustomer.getEmail().equals(qna.getEmail())
			|| loginCustomer.getAdmin()==1)) { %>
			<button type="button" id="modifyBtn">Edit</button>
			<button type="button" id="deleteBtn">Delete</button>
		<% } %>	
		<% if(loginCustomer!=null) { %>
			<button type="button" id="replyBtn">Reply</button>
		<% } %>
		<% if(loginCustomer==null) { %>
			<button type="button" id="replyBtn2">Reply</button>
		<% } %>
		</div>
		<div id="content_body">
			<div id="subject" style="font-weight: bold; font-size: 32px; text-color: #585858; padding: 10px;">
				<% if(qna.getStatus()==1)  { %>[비밀글]<% } %>
				<%=qna.getSubject() %>
			</div>
			
			<div id="wirter" style="padding: 10px; font-size: 14px; border-top: 1px solid #CCCCCC;
	border-collapse: collapse;">
				<%=qna.getWriter() %>&nbsp;/ Views&nbsp;<%=qna.getReadCount()+1 %>
			</div>
			
			<div id="content" style="padding: 10px; padding-top: 30px; padding-bottom: 300px; font-size: 17px;">
				<%=qna.getContent().replace("\n", "<br>") %>
			</div>
			
			<div id="content_bottom" style="padding-bottom: 100px; border-top: 1px solid #CCCCCC;
	border-collapse: collapse;">
				<button type="button" id="returnBtn">&lt; Return To List</button>
			</div>
		</div>
		
	</div>
	
	<form id="boardForm" method="post">
		<%-- 삭제페이지 요청을 위한 값 --%>
		<input type="hidden" name="num" value="<%=qna.getNum() %>">
		<%-- 답글페이지 요청을 위한 값 --%>
		<input type="hidden" name="ref" value="<%=qna.getRef() %>">
		<input type="hidden" name="reStep" value="<%=qna.getReStep()%>">
		<input type="hidden" name="reLevel" value="<%=qna.getReLevel() %>">
		<%-- list 출력 --%>
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		<input type="hidden" name="search" value="<%=search %>">
		<input type="hidden" name="keyword" value="<%=keyword %>">
	</form>
	
	<script type="text/javascript">
	$("#deleteBtn").click(function() {
		if(confirm("게시글을 삭제 하시겠습니까?")) {
			$("#boardForm").attr("action","<%=request.getContextPath()%>/index.jsp?vaho=qna&studio=qna_remove_action");
			$("#boardForm").submit();
		}
	});
	
	$("#modifyBtn").click(function() {
		$("#boardForm").attr("action","<%=request.getContextPath()%>/index.jsp?vaho=qna&studio=qna_modify");
		$("#boardForm").submit();
	});
	
	$("#replyBtn").click(function() {
		$("#boardForm").attr("action","<%=request.getContextPath()%>/index.jsp?vaho=qna&studio=qna_write");
		$("#boardForm").submit();
		
	});
	$("#replyBtn2").click(function() {
		alert('로그인 후 이용해주세요.');
		$("#boardForm").attr("action","<%=request.getContextPath()%>/index.jsp?vaho=member&studio=login");
		$("#boardForm").submit();
		
	});
	
	$("#returnBtn").click(function() {
		$("#boardForm").attr("action","<%=request.getContextPath()%>/index.jsp?vaho=qna&studio=qna_list");
		$("#boardForm").submit();
	})
	</script>	
</div>
	














