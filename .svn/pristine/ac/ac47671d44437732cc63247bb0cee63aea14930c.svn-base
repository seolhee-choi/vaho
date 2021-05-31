<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String message = (String)session.getAttribute("message");

	if(message==null){
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
#email{
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
#changeBtn:hover{
    opacity: 0.8;
}
#changeBtn{
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

	<form action="<%=request.getContextPath() %>/index.jsp?vaho=member&studio=customer_drop_action" method="post" id="newPasswordForm" name="newPasswordForm">
		<div class="box_filed">
			<div><span class="title">탈퇴하기</span><br></div>
			<div><span class="title2">이메일</span><br>
					<input type="email" id="email" name="email"></div>
						<div id="message"><%=message %></div>
					<button type="button" name="changeBtn" id="changeBtn" onclick="submitCheck();">탈퇴하기</button>
		</div>
	</form>
	<script type="text/javascript">
		
	function submitCheck(){
		if($("#emial").val()==""){
			$("#message").text("이메일을 입력해주세요.");
			return;
		}
		
		$("#newPasswordForm").submit();
	}
		
	</script>
