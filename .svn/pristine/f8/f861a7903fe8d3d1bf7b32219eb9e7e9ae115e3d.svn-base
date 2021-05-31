<%@page import="site.itwill.dao.CustomerDAO"%>
<%@page import="site.itwill.dto.CustomerDTO"%>
<%@page import="site.itwill.dao.CommentsDAO"%>
<%@page import="site.itwill.dto.CommentsDTO"%>
<%@page import="java.util.List"%>
<%@page import="site.itwill.dao.ReviewDAO"%>
<%@page import="site.itwill.dto.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no=Integer.parseInt(request.getParameter("no"));
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	
	
	int totalComments=CommentsDAO.getDAO().selectCommentsCount(no);
	List<CommentsDTO> commentsList=CommentsDAO.getDAO().selectAllComments(no);

	ReviewDTO review=ReviewDAO.getDao().selectNoReview(no);

	
			
	
	/*
	if(review==null ) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
	*/
	
%>
<style type="text/css">
@import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap");
@font-face {
	font-family: "NotoSansKR2";
	src: url("/semi/project/fonts/NotoSansKR2.otf") format("otf");  
}
#contentDetail {
	margin: 100px 130px 0px 230px;
	color: grey;

}
.product {
	font-size: 25px;
	color: black;
}
.name {
	font-size: 15px;
	color: grey;
}
.context {
	font: 17px bold;
}
.comment{
	border-top: 1px solid grey;
	border-bottom: 1px solid grey;
	width:640px;
}
#modifyBtn, #deleteBtn {
	border: 1px solid white;
	background: white;
	color: grey;
	float: right;
	cursor: pointer;
	font-size: 17px;
}
#commentBtn {
	border: 2px solid black;
	color: white;
    background-color: black;
    width : 150px;
  	height: 44px;
  	cursor: pointer;
}
#commentBtn:hover {
	opacity:1;
}
#returnBtn {
	border: 1px solid white;
	color: grey;
    background-color: white;
    width : 150px;
  	height: 44px;
  	cursor: pointer;
}

</style>
	
<form id=reviewForm method="post">	
	<div id="contentDetail">
		<div><button type="submit" id="deleteBtn" >Delete</button>&nbsp;&nbsp;&nbsp;
		<button type="submit" id="modifyBtn" >Edit</button></div>
		
				
		<div class="product"><%=review.getProduct()%> 후기</div>
		<div class="grade" style="font-size: 15px;"><%=review.getGrade()%></div>
		<div class="name"><%=review.getWriter()%> / <%=review.getRegDate().substring(0, 11)%></div>
		<br>	
		<div class="context"><%=review.getContent().replace("\n", "<br>")%></div>	
		<div><img src="<%=request.getContextPath() %>/review/content_image/<%=review.getImage() %>" 
				onclick="window.open('<%=request.getContextPath() %>/review/content_image/<%=review.getImage() %>');" width="100"  style="cursor: pointer;"></div>
		<br>
		<br>
			
			<div>Writer<br><input type="text" name="writer" id="writer" style="width:650px; height: 35px; border:1px solid grey;"></div>
			<div>Content<br>
			<textarea rows="" cols="" name="commentContent" id="commentContent" style="width:650px; height: 200px; border:1px solid grey;  resize: vertical;"></textarea>
	
			<div><button type="submit" id="commentBtn" >COMMENT</button></div>
	</div>
		
		<% if(totalComments==0) { %>
			
			<div>등록된 댓글이 없습니다.</div>
	
		<% } else { %>
		
			<% for(CommentsDTO comments:commentsList) {%>
			
			<div class="comment">
				<div><%=comments.getWriter()%>&nbsp;&nbsp;<%=comments.getRegDate().substring(0, 11)%></div>
				<div><%=comments.getContent() %></div>
			</div>
				
			<%}%> 
		<%} %>
				<br>
				<div>&lt;&nbsp;<button type="button" id="returnBtn" >RETURN TO LIST</button></div>
	</div>
	
	
		<input type="hidden" name="no" value="<%=no%>">
		<input type="hidden" name="pageNum" value="<%=pageNum %>">
		<input type="hidden" name="search" value="<%=search %>">
		<input type="hidden" name="keyword" value="<%=keyword %>">

		

	</form>
	
	<script type="text/javascript">
	$("#modifyBtn").click(function () {
	    $("#reviewForm").attr("action","<%=request.getContextPath()%>/index.jsp?vaho=review&studio=review_edit_confirm&action=modify")
        $("#reviewForm").submit();
 	});
	
	$("#deleteBtn").click(function () {
		if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
			$("#reviewForm").attr("action","<%=request.getContextPath()%>/index.jsp?vaho=review&studio=review_edit_confirm&action=remove")
        	$("#reviewForm").submit();
	   	}
 	});

	$("#commentBtn").click(function () {
		if($("#writer").val()=="") {
			alert("작성자명 또는 내용을 입력하세요");
			$("#writer").focus();
			return false;
		}			
		if($("#commentContent").val()=="") {
			alert("작성자명 또는 내용을 입력하세요");
			$("#commentContent").focus();
			return false;
		} 
			$("#reviewForm").attr("action","<%=request.getContextPath()%>/index.jsp?vaho=review&studio=comment_post_action")
			$("#reviewForm").submit();
	});
		
	$("#returnBtn").click(function () {
		$("#reviewForm").attr("action","<%=request.getContextPath()%>/index.jsp?vaho=review&studio=review_list")
		$("#reviewForm").submit();
	});
	
	
	var img = document.getElementsByTagName("img");
    	for (var x = 0; x < img.length; x++) {
 	   img.item(x).onclick=function() {window.open(this.src)} ; 
 	};
 	
	</script>
							


	

