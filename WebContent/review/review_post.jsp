<%@page import="site.itwill.dao.CustomerDAO"%>
<%@page import="site.itwill.dto.CustomerDTO"%>
<%@page import="site.itwill.dto.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@page import="site.itwill.dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageNum="1";
	
	CustomerDTO loginCustomer=(CustomerDTO)session.getAttribute("loginCustomer");
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
	width:716px; 
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

.returnBtn {
	border: 2px solid black;
	color: black;
    background-color: white;
    width : 150px;
  	height: 44px;
  	cursor: pointer;
}
.returnBtn:hover {
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
.commentBtn {
	border: 1px solid black;
	color: white;
    background-color: black;
    width : 90px;
  	height: 44px;
  	cursor: pointer;
  	
}
.commentBtn:hover {
	border: grey;
	color: white;
    background-color: grey;
}
.saveBtn {
	border: 1px solid black;
	color: white;
    background-color: black;
    width : 90px;
  	height: 44px;
  	cursor: pointer;
  	
}
.saveBtn:hover {
	border: grey;
	color: white;
    background-color: grey;
}
</style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<form action="<%=request.getContextPath()%>/index.jsp?vaho=review&studio=review_post_action"
	method="post" id="reviewForm" enctype="multipart/form-data">
	<input type="hidden" name="pageNum" value="<%=pageNum%>">

<div id="review_post">	
	<div class="posttop">
		
		<table class="column top">
			<tr><td>Product Name</td></tr>
			<tr>	
				<td><input class="column" type="text" name="product" id="product"></td>
			</tr>
		</table>
	</div>
	
	<%if(loginCustomer==null){ %>
	<div class="postmiddle">
		
		<table class="column left" >
			<tr><td>Writer</td></tr>
			<tr>
				<td><input type="text" name="writer" id="writer"></td>
			</tr>
			<tr><td>Password</td></tr>
			<tr>
				<td><input type="password" name="pw" id="pw"></td>
			</tr>
		</table>
		
		<table class="column right">
			<tr><td>Email</td></tr>
			<tr>
				<td><input type="email" name="email" id="email"></td>
			</tr>
			<tr><td>Confirm Password</td></tr>
			<tr>
				<td><input type="password" name="pw" id="confirmPw"></td>
			</tr>
		</table>
	</div>
	<% }else { %>
	<div class="postmiddle">
		
		<table class="column left" >
			<tr><td>Writer</td></tr>
			<tr>
				<td><input type="text" name="writer" id="writer" value="<%=loginCustomer.getName() %>"></td>
			</tr>
			<tr><td>Password</td></tr>
			<tr>
				<td><input type="password" name="pw" id="pw" value="<%=loginCustomer.getPassword() %>"></td>
			</tr>
		</table>
		
		<table class="column right">
			<tr><td>Email</td></tr>
			<tr>
				<td><input type="email" name="email" id="email" value="<%=loginCustomer.getEmail() %>"></td>
			</tr>
			<tr><td>Confirm Password</td></tr>
			<tr>
				<td><input type="password" name="pw" id="confirmPw" value="<%=loginCustomer.getPassword() %>"></td>
			</tr>
		</table>
	</div>
	<%	 } %>
	
	<div class="postcheck">
	
		<table>
			<tr style="color:grey">
				<td><input type="checkbox" id="agree" style="cursor:pointer;">
				<a>개인정보 수집 및 이용에 동의합니다.</a></td>
			</tr>
			<tr>
				<td><textarea rows="15" cols="47" name="content" id="review_content"></textarea></td>
			</tr>
		</table>
	</div>
	
		
		<div class="postbottom">
		
			<div class="bottomLeft" >
				
				<table>
					<tr>
						<td>
							<%-- <label class="ImageBtn" for="Image">업로드</label>--%>
							<input type="file" name="image" id="image" style="cursor: pointer;">
						</td>
						
					</tr>
					<tr><td><br>&nbsp;</td></tr>
					<tr>
						<td><button type="button" class="returnBtn" onclick="location.href='<%=request.getContextPath()%>/index.jsp?vaho=review&studio=review_list';" >RETURN TO LIST</button></td>
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
							
				<input class="saveBtn" type="submit" value="SAVE" >
			</div>
		</div>
</div>	
</form>

<script type="text/javascript">
$("#product").focus();

$("#reviewForm").submit(function () {
	if($("#product").val()=="") {
		alert("상품을 선택해 주세요");
		$("#product").focus();
		return false;
	}
	
	if($("#writer").val()=="") {
		alert("글쓴이를 입력해 주세요");
		$("#writer").focus();
		return false;
	}
	
	if($("#email").val()=="") {
		alert("유효하지 않은 이메일입니다.");
		$("#email").focus();
		return false;
	}
	
	var passwdReg=/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*_-]).{6,20}$/g;
	if($("#pw").val()=="") {
		alert("비밀번호를 입력해 주세요");
		$("#pw").focus();
		return false;
	} else if(!passwdReg.test($("#pw").val())) {
		alert("비밀번호는 영문/숫자/기호를 포함한 6자리 이상이어야합니다.");
		$("#pw").focus();
		return false;
	}
	
	if($("#confirmPw").val()=="") {
		alert("비밀번호를 다시 입력해 주세요");
		$("#confirmPw").focus();
		return false;
	} else if($("#pw").val()!=$("#confirmPw").val()) {
		alert("비밀번호를 다시 입력해 주세요");
		$("#confirmPw").focus();
		return false;
	}

	
	if($("#agree").is(":checked")==false) {
		alert("개인정보 수집 및 이용에 동의해주세요.");
		return false;
	}
	
	if($("#review_content").val()=="") {
		alert("내용을 입력해 주세요");
		$("#review_content").focus();
		return false;
	}	
	
	if($("#image").val()=="") {
		alert("이미지 파일을 첨부하세요");
		return false;
	}
});



</script>		
	
