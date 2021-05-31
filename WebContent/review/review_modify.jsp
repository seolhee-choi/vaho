<%@page import="site.itwill.dao.ReviewDAO"%>
<%@page import="site.itwill.dto.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	int no=Integer.parseInt(request.getParameter("no"));
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	
	ReviewDTO review=ReviewDAO.getDao().selectNoReview(no);
	if(review==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=error&work=error400';");
		out.println("</script>");
		return;
	}

	String pw=request.getParameter("pw");
	if(!review.getPw().equals(pw) || review.getPw()==null ){
		out.println("<script type='text/javascript'>");
		out.println("alert('비밀번호가 일치하지않습니다. 다시 입력해주세요');");
		out.println("history.go(-1);");
		out.println("</script>");
		return;
	}

%>

<style type="text/css">
 td {
	color: grey;
	
}
.posttop {
	display: flex;
   	justify-content: center;
	text-align: left;
	
}
.column input {
	width:717px; 
	height: 40px; 
	border:1px solid grey;
}
.postmiddle {
	display: flex;
    flex-direction: row;
   	justify-content: center;
	text-align: left;
	color: grey;
}
.postmiddle input{
	width:350px; 
	height: 40px; 
	border:1px solid grey;
}
.btn {
	border: 1px solid black;
	color: white;
    background-color: black;
    width : 100px;
  	height: 44px;
  	cursor: pointer;
}
.btn:hover {
	border: grey;
	color: white;
    background-color: grey;
}

.postcheck {
	display: flex;
   	justify-content: center;
	text-align: left;
	
}
.postcheck textarea {
	width: 720px; 
	height: 300px;
	resize: vertical; 
	border:1px solid grey; 
	border-left-color: white;
	border-right-color: white;
}
.postbottom {
	margin-left:200px;
	width:750px;
	height: 140px;
	border: 1px solid white;
	
}
.bottomLeft {
	float:left;
}

.bottomRight {
	float:right;
}
.ImageBtn {
	display: block;
	text-align: center;
	width: 80px;
	border: 1px solid red;
	background-color: white;
  	cursor: pointer;
  	font-size: 18px;
  
}

#returnBtn {
	border: 2px solid black;
	color: black;
    background-color: white;
    width : 150px;
  	height: 44px;
  	cursor: pointer;
}
#returnBtn:hover {
	color: white;
    background-color: black;
}

.rating {
	width : 120px;
  	height: 44px;
	text-align: center;
	font-family: "Font Awesome 5 Free";
}
.rating option {
	font-family: "Font Awesome 5 Free";
}
.savebtn {
	border: 1px solid black;
	color: white;
    background-color: black;
    width : 90px;
  	height: 44px;
  	cursor: pointer;
  	
}
.savebtn:hover {
	border: grey;
	color: white;
    background-color: grey;
}
</style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<form action="<%=request.getContextPath()%>/index.jsp?vaho=review&studio=review_modify_action"
	method="post" id="reviewForm" enctype="multipart/form-data">
	<input type="hidden" name="no" value="<%=no%>">
	<input type="hidden" name="pageNum" value="<%=pageNum%>">
	<input type="hidden" name="search" value="<%=search%>">
	<input type="hidden" name="keyword" value="<%=keyword%>">
	<input type="hidden" name="currentImage" value="<%=review.getImage()%>">
	
<div id="review_post">	
	<div class="posttop">
		
		<table class="column top">
			<tr><td>Product Name</td></tr>
			<tr>	
				<td><input class="column" type="text" name="product" id="product" readonly="readonly" value="<%=review.getProduct() %>">
			</tr>
		</table>
	</div>
	
	
	<div class="postmiddle">
		
		<table class="column left" >
			<tr><td>Writer</td></tr>
			<tr>
				<td><input type="text" name="writer" id="writer" value="<%=review.getWriter()%>"></td>
			</tr>
		</table>
		
		<table class="column right">
			<tr><td>Email</td></tr>
			<tr>
				<td><input type="email" name="email" id="email" value="<%=review.getEmail()%>"></td>
			</tr>
		</table>
	</div>
	
	<div class="postcheck">
	
		<table>
			<tr>
				<td><textarea rows="15" cols="47" name="content" id="review_content"><%=review.getContent() %></textarea></td>
			</tr>
		</table>
	</div>
	
	<div class="postbottom">
		
		<div class="bottomLeft" >
				
			<table>
				<tr>
					<td>
						<%-- <label class="ImageBtn" for="Image">업로드</label>--%>
						<img src="<%=request.getContextPath() %>/review/content_image/<%=review.getImage() %>" width="50">
						<br>
						<input type="file" name="image" id="image" >
					</td>
					
				</tr>
				<tr><td><br>&nbsp;</td></tr>
				<tr>
					<td><button type="button" id="returnBtn" onclick="location.href='<%=request.getContextPath() %>/index.jsp?vaho=review&studio=review_detail&no=<%=review.getNo() %>';" >RETURN TO POST</button></td>
				</tr>
			</table>
		
		</div>
			
			<div class="bottomRight" >
				<br>
				<br>
				<br>
				<br>

				<select class="rating" name="grade" id="grade">
				  <option selected="selected" value="★★★★★"> ★★★★★</option>
				  <option value="★★★★☆"> ★★★★☆ </option>
				  <option value="★★★☆☆"> ★★★☆☆ </option>
				  <option value="★★☆☆☆"> ★★☆☆☆ </option>
 				  <option value="★☆☆☆☆"> ★☆☆☆☆ </option>
				</select>
							
				<input class="savebtn" type="submit" value="SAVE" >
			</div>
		</div>
</div>	
</form>


<script type="text/javascript">
$("#reviewForm").submit(function(){
	
});
</script>
