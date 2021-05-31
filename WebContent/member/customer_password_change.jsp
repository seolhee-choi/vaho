<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
#password, #email{
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

	<form action="<%=request.getContextPath() %>/index.jsp?vaho=member&studio=new_password_action" method="post" id="newPasswordForm" name="newPasswordForm">
		<div class="box_filed">
			<div><span class="title">비밀번호 변경하기</span><br></div>
			<div><span class="title2">이메일</span><br>
					<input type="email" id="email" name="email"></div>
			<div><span class="title2">변경 비밀번호</span><br>
					<input type="password" id="password" name="password"></div>
						<div id="message"></div>
					<button type="button" name="changeBtn" id="changeBtn" onclick="submitCheck();">변경하기</button>
		</div>
	</form>
	<script type="text/javascript">
		
	function submitCheck(){
		if($("#emial").val()==""){
			$("#message").text("이메일을 입력해주세요.");
			return;
		}
		if($("#password").val()==""){
			$("#message").text("비밀번호를 입력해주세요.");
			return;
		}
		alert("변경이 완료되었습니다."); 
		
		$("#newPasswordForm").submit();
	}
		
	</script>
