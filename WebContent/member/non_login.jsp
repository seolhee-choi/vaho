<%@page import="site.itwill.dao.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
  
  String message=(String)session.getAttribute("message");
  
  if(message==null){
	  message="";
	  
  }else{
	  session.removeAttribute("message");
  }
  
  String email = (String)session.getAttribute("email");
  
  if(email==null){
	  email="";
  }else{
	  session.removeAttribute("email");
  }
  
  
  
  %>
<style type="text/css">
/*텍스트몸통*/
.text-body{
	color: #666666;
    font-family: Noto Sans KR, sans-serif;
    font-weight: 400;
    letter-spacing: 0.06em;
}
.btn-wrap{
	text-align: center;
    margin-top: 20px;
    
}
.btn1 , .btn2{
    width: 100% !important;
    max-width: 240px;
    height: 54px !important;
    font-size: 14px !important
}
/*로그인*/
.text-title1{
    color: #313131;
    font-family: Noto Sans KR, sans-serif;
    font-size: 20px;
    line-height:32px;
    margin-bottom: 40px;
    letter-spacing: 0.05em;
    
}
/*로그인 타이틀*/
.row{
    margin-bottom: 20px;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
}
/*로그인 박스 위에 필드*/
.loginfield{
	 width: 100%;
    max-width: 400px;
    display: block;
    margin: 0 auto;
}
/*로그인필드 위에 바탕*/
.canvas{
	position: relative;
    padding: 0;
    min-height: 100%;
}
.column-wrapper{
margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
}
/*회원가입 버튼 관련*/
.btn2:hover{
	background-color: #313131;
	color: white;
	cursor: pointer;
}
.btn2{
	font:14px;
	color:#313131;
	width:100%;
	background: white;
	padding: 14px 24.5px;
}
/*버튼 라벨*/
.title{
	display: block;
    line-height: 17px;
    margin-bottom: 12px;

}
/*로그인 버튼 관련*/
.btn1:hover{
    opacity: 0.8;
     cursor: pointer;
}
.btn1{
   	font: 14px;
   	color:#FFFFFF;
   	width:100%;
   	background: #313131;
   	padding : 10px  24.5px;
   	
}

/*텍스트 필드 크기조절*/
#email{
     font-size: 14px;
    line-height: 23px;
    width: 100%;
    height: 30px;
    border: 1px solid #ddd;
    padding: 10px 15px;
}
#password{
    font-size: 14px;
    line-height: 23px; 
    width: 100%;
    height: 30px;
    border: 1px solid #ddd;
    padding: 10px 15px;
}
.check{
	font-size: 14px;
    text-align: center;
    line-height: 17px;
    margin: 20px 0 30px;
}
a {
	color: #999999;
	border-color: #999999;
	text-decoration:none;
}
#message{
	font-size: 10px;
	color: #313131;
	padding-bottom: 30px;
}
</style>
<form action="<%=request.getContextPath() %>/index.jsp?vaho=member&studio=login_action"  method="post"  name="joinForm" class="wrapper">
 				<div class="column-wrapper">
				<div class="loginfield">
				<div class="text-title1">
					<span  class="title">로그인</span>
				</div>
			<div class="text-body">
				<div class="row">
					<span class="title">이메일</span>
					<input type="email" id="email" name="email" value="<%=email %>">
				</div>
				<div class="row">
					<span class="title">비밀번호</span>
					<input type="password" id="password" name="password">
				</div>
				<div class="check">
					<a class="idfind" href="index.jsp?vaho=member&studio=find_password">비밀번호찾기</a>
					<a class="checkorder" style="margin-left: 20px;" href="index.jsp?vaho=member&studio=no_order">비회원 주문 조회하기</a>
				</div>
				<div class="btn-wrap">
					<div id="message"><%= message %></div>
					<button class="btn1" type="button" id="loginBtn" onclick="submitCheck();">로그인하기</button> 
				</div>	
				<div class="btn-wrap">
					<button class="btn2" type="button" onclick="location.href='index.jsp?vaho=member&studio=login_join';">회원 가입하기</button>
				</div>
				<div class="btn-wrap">
					<button class="btn1" type="button" onclick="location.href='<%=request.getContextPath() %>/Product/non_customer_agree.jsp';">비회원 주문</button>
				</div>
			</div>
 				</div>
			</div>
		</form>
 
 <script type="text/javascript">
 
	 $("#email").focus();
	 
 	
 	function submitCheck(){
 		
 		if($("#email").val()==""){
	 		$("#message").text("이메일을 입력해 주세요.");
	 		$("#email").focus();
	 		return;
	 	}
	 	
	 	if($("#password").val()==""){
	 		$("#message").text("비밀번호를 입력해 주세요.");
	 		$("#password").focus();
	 		
	 		return;
	 	}
	 	
	 	joinForm.submit();
	 	
 	}
 	
 	
 
 </script>
