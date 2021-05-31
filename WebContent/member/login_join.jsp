<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String message=(String)session.getAttribute("message");
	if(message==null){
		message="";
	}else{
		session.removeAttribute("message");
	} 
	

%>

<style type="text/css">
/* 전체 글씨 */

.log_filed{
	width: 100%;
    max-width: 400px;
    display: block;
    vertical-align: top;
    margin: 0 auto;
}
.title, .title_email, .title_pass,title_name,title_repass{

    width: 100%;
    height:23px;
    margin-bottom: 40px;
    font-size: 14px;

}
.title{
	line-height: 50px;
	font-size: 20px !important;
}
#email, #name, #password, #repassword{
	font-size: 14px;
    line-height: 23px;
    border: 1px solid #ddd;
    padding: 10px 15px;
    width: 88%;
    margin-bottom: 40px;
}
#join{
	left: 50px;
}
#join{
	display:block;
	width: 100% !important;
    max-width: 240px;
    height: 54px !important;
    font-size: 14px !important;
    background-color: #222;
    color: white;
    text-align: center !important;
    margin-left: 60px;
    margin-top: 50px;
}
#join:hover {
	
	background-color: #313131;
	color: white; 
	cursor: pointer;
}
.contextBox{
    color: #666666;
    font-family: Noto Sans KR, sans-serif;
    font-weight: 400;
    letter-spacing: 0.06em;
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
}
.checkbox{
	font-size: 14px !important;
}
#message{
	text-align: center;
	font-size: 10px;
	color: #313131;
	margin-top: 35px;
}
</style>

</head>
<body>
		
	<div class="log_filed">
	<form action="<%=request.getContextPath()%>/index.jsp?vaho=member&studio=login_join_action" method="post" name="loginfiled" id="join2">
	<div class="contextBox">
	<span class="title">회원가입</span><br>
	<span class="title_email">이메일 *</span><br>
	<input type="email" id="email" name="email">	<br>
	<span class="title_name">이름 *</span><br>
	<input type="text" id="name" name="name"><br>
	<span class="title_pass">비밀번호 *</span><br>
	<input type="password" id="password" name="password" placeholder="비밀번호는 6자리 이상 입니다"><br>
	<span class="title_repass">비밀번호 확인 *</span><br>
	<input type="password" id="repassword" name="repassword">
	<div  class="checkbox">
	<input type="checkbox" id="checkAll" name="checkAll"><label>모두동의합니다</label></div>
	<input type="checkbox" id="agree" name="select"><label>(필수)이용약관과 개인정보 수집및 이용에 동의합니다</label><br>
	<input type="checkbox" id="agree1" name="select"><label>(필수)만14세 이상입나다<br>
					만 19세미만의 미성년자가 결제시 법정대리인이 거래를 취소 <br>할 수 있습니다</label><br>
	<input type="checkbox" id="agree2" name="select"><label>(선택)이메일 및 SMS 마켓팅 정보 수신에 동의합니다.<br>
	회원은 언제든지 화면 정보에 수신서부로 변경할 수 있습니다.</label><br>
	<div id="message"><%=message %></div>
	<button type="button" id="join" name="join" >가입하기</button>
	</div>
	</form>
	</div>	
	

		
	<script type="text/javascript">
	//유효값 검사
	$("#email").focus();
	$("#join").click(function() {
		var emailReg=/^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+(\.[-a-zA-Z0-9]+)+)*$/g;
		if($("#email").val()=="") {
			$("#message").text("이메일을입력해주세요.");
			return;
		} else if(!emailReg.test($("#email").val())) {
			$("#message").text("형식에 맞게 이메일을 입력해주세요.");
			return;
		}
				
		if($("#name").val()=="") {
			$("#message").text("이름을 입력해주세요.");
			return;
			}
			var passwdReg=/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*_-]).{6,20}$/g;
		if($("#password").val()=="") {
			$("#message").text("비밀번호를입력해주세요.");
				return;
			} else if(!passwdReg.test($("#password").val())) {
				$("#message").text("비밀번호를 형식에 맞게 입력해주세요.");
				return;
			} 
				
		if($("#repassword").val()=="") {
			$("#message").text("비밀번호확인를입력해주세요.");
				return;
			} else if($("#password").val()!=$("#repassword").val()) {
				$("#message").text("비밀번호를 확인해 주세요.");
				return;
			}
				
		
		if($("#agree").is(":checked")==false) {
			$("#message").text("필수사항를 확인해주세요.");
			return;
		}
		
		if($("#agree1").is(":checked")==false) {
			$("#message").text("필수사항를 확인해주세요.");
			return;
		}
				
		
			
			$("#join2").submit();
	});
			
		//체크박스 모두 동의 함수
	$('#checkAll').click(function() {
		// '전체' 선택 시 전부 체크하기
	 if ($("#checkAll").prop("checked")) {
		 $("input[type=checkbox][name=select]").prop("checked", true);
		// '전체' 선택 해제 시 전부 체크해제
		   } else {
		$("input[type=checkbox][name=select]").prop("checked", false);
		    }
		});
		
	$('input:checkbox[name="select"]').click(function() {
		// 모두 선택되어 있을 때 '전체' 체크
	if($("input[name='select']:checked").length == $("input[name='select']").length){
		 $("#checkAll").prop("checked", true);
		    // 하나라도 체크 해제할 때 '전체' 체크해제
		}else{
		 $("#checkAll").prop("checked", false);
		 }
		});
	
		
		</script>