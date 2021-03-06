<%@page import="site.itwill.dto.ReviewDTO"%>
<%@page import="site.itwill.dao.ReviewDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String search=request.getParameter("search");
	if(search==null) search="";
	String keyword=request.getParameter("keyword");
	if(keyword==null) keyword="";
	
	int pageNum=1;
	
	if(request.getParameter("pageNum")!=null && !request.getParameter("pageNum").equals("null")) {
		pageNum=Integer.parseInt(request.getParameter("pageNum"));
	}
	
	int pageSize=12;
	
	int totalReview=ReviewDAO.getDao().selectReviewCount(search, keyword);
	
	int totalPage=(int)Math.ceil((double)totalReview/pageSize);
	
	if(pageNum<=0 || pageNum>totalPage) {
		pageNum=1;
	}
	
	int startRow=(pageNum-1)*pageSize+1;
	
	int endRow=pageNum*pageSize;
	
	if(endRow>totalReview) {
		endRow=totalReview;
	}
	
	List<ReviewDTO> reviewList=ReviewDAO.getDao().selectReviewList(startRow, endRow, search, keyword);
	
	int number=totalReview-(pageNum-1)*pageSize;
	
	String currentDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
%>
<style type="text/css">


#content {
	margin: 10 0 0 0px;
	padding: 0 0 0 0px;

	text-overflow: ellipsis; 
	overflow: hidden;
	border: 1px solid white;
	text-align: center;
	min-height: 300px;
	
}

.photoReview {
	display:inline-block;
	border: 1px solid white;	
	width: 21%;
	height: 300px;
	line-height: 1.9;
	cursor: pointer;
	color: grey;
	position: relative;
	
}
.photoReview li {
	overflow: hidden; 
	text-overflow: ellipsis;
	white-space: nowrap; 
	width: 100%;
	display: block;
}

.photoReview img:hover {
	opacity:0.5;
}
.photoReview .text1{
     position: absolute;
     top:50%;
     left: 30%;
     transform: translate(-50%, -50%);                                                                   
     font: 1rem bold;
     color: white;
     z-index: 2;
}
.photoReview .text2{
     position: absolute;
     top:70%;
     left:80%;
     transform: translate(-50%, -50%);                                                                   
     font: 1rem bold;
     color: white;
     z-index: 2;
}

#button button {
    border: 1px solid black;
    background-color: black;
    color: white;
    padding: 13px;
    text-transform: uppercase;
    cursor: pointer;
}
#button button:hover {
	border: 1px solid grey;
	background-color: grey;
	
}
.searchInput {
	height: 45px;
	width: 220px;
	border: 0.5px solid grey;
}
.pageNumber{
	text-align: center;
}
</style>


	<div id="content" >
			<% if(totalReview==0) { %>
				
				<a>????????? ???????????? ????????? ????????????.</a>
				
			<% } else { %>
				<% for(ReviewDTO review:reviewList) { %>
					<input type="hidden" value="<%=number%>">
					<div class="photoReview"  onclick="location.href='<%=request.getContextPath()%>/index.jsp?vaho=review&studio=review_detail&no=<%=review.getNo()%>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>';" >
						<img src="<%=request.getContextPath()%>/review/content_image/<%=review.getImage()%>" width="265" height="260" >
						<div class="text1"><%=review.getProduct() %></div>
						<div class="text2"><%=review.getGrade()%></div>
						<li><%=review.getContent()%></li>(<%=review.getCommentCount()%>)
						<br><%=review.getWriter() %> / <%=review.getRegDate().subSequence(0,10) %>
					</div>	
				<% number--; %>
			
			<% }//for ????????? %>
		<% }//else ????????? %>
		<div>&nbsp;</div>
	</div>	
		 
		<%
			int blockSize=5;
		
			int startPage=(pageNum-1)/blockSize*blockSize+1;
			
			int endPage=startPage+blockSize-1;
			
			if(endPage>totalPage) {
				endPage=totalPage;
			}
		%>
		
		<div class="pageNumber">
		<% if(startPage>blockSize) { %>
			<a href="<%=request.getContextPath()%>/index.jsp?vaho=review&studio=review_list&pageNum=1&search=<%=search%>&keyword=<%=keyword%>">??????</a>
			<a href="<%=request.getContextPath()%>/index.jsp?vaho=review&studio=review_list&pageNum=<%=startPage-blockSize%>&search=<%=search%>&keyword=<%=keyword%>">??????</a>
		<% } else { %>
			?????? ??????
		<% } %>
		
		<% for(int i=startPage;i<=endPage;i++) { %>
			<% if(pageNum!=i) { %>
				<a href="<%=request.getContextPath()%>/index.jsp?vaho=review&studio=review_list&pageNum=<%=i%>&search=<%=search %>&keyword=<%=keyword%>">[<%=i %>]</a>
			<% } else { %>
				<%=i %>
			<% } %>
		<% } %>
			
		<% if(endPage!=totalPage) { %>
			<a href="<%=request.getContextPath()%>/index.jsp?vaho=review&studio=review_list&pageNum=<%=startPage+blockSize%>&search=<%=search %>&keyword=<%=keyword%>">??????</a>
			<a href="<%=request.getContextPath()%>/index.jsp?vaho=review&studio=review_list&pageNum=<%=totalPage%>&search=<%=search %>&keyword=<%=keyword%>">?????????</a>
		<% } else { %>
			?????? ?????????
		<% } %>
		</div>
		<div>&nbsp;</div>
		
		
		<div id="button">
			<button type="button" onclick="location.href='<%=request.getContextPath()%>/index.jsp?vaho=review&studio=review_post';" style="float:right;">Post Review</button>
							
			<form action="<%=request.getContextPath()%>/index.jsp?vaho=review&studio=review_list" method="post" >
				<table>
					<tr>
						<td><input type="text" name="keyword" class="searchInput"  placeholder="????????? ???????????????"  style="float: left; display: inline;"></td>
						<td><button type="submit" name="search" class="searchBtn"  style=" width: 100px;">Search</button></td>						
					</tr>
				</table>
			</form>
		</div>
	
