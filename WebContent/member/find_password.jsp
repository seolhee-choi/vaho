<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

		String message=(String)session.getAttribute("message");
		if(message == null){
			
			message="";
			
		}else{
			session.removeAttribute("message");
		}
			
		

%>
<style type="text/css">
.box_filed{
	width: 100%;
    max-width: 400px;
    display: block;
    vertical-align: top;
    margin: 0 auto;
    display: block;
    font-size: 14px;
    line-height: 17px;
    margin-bottom: 12px;
}
#name, #email{
	font-size: 14px;
    line-height: 23px;
    border: 1px solid #ddd;
    padding: 10px 15px;
     width: 88%;
    margin-bottom: 40px;
}
.title{
	margin-bottom: 30px; 
}
#email_send:hover{
    opacity: 0.8;
}
#email_send{
   	font: 14px;
   	color:#FFFFFF;
   	width:50%;
   	background: #313131;
   	padding : 10px  24.5px; 
    margin-left: 100px;
   	
}
#message{ 
 
	font-size: 10px;
	color: #313131;
	padding-bottom: 30px;
	text-align: center;
}
</style>

	<form action="<%=request.getContextPath()%>/index.jsp?vaho=member&studio=find_password_action" method="post" id="findPasswordForm" name="findPasswordForm">
		<div class="box_filed">
			<div><span class="title">비밀번호찾기</span><br></div>
			<div><span class="title2">이메일</span><br>
					<input type="email" id="email" name="email"></div>
			<div><span class="title2">이름</span><br>
					<input type="text" id="name" name="name"></div>
					<div>
						<div id="message"><%=message %></div>
					<button type="button" name="email_send" id="email_send" onclick="submitCheck();">확인</button>
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
	 	
	 	if($("#name").val()==""){
	 		$("#name").text("이름을 입력해 주세요.");
	 		$("#name").focus();
	 		
	 		return;
	 	}
	 	
	 	findPasswordForm.submit();
	 	
 	}
	</script>
