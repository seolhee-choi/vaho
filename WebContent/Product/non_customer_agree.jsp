<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>vaho studio</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<style>
a{
	color:black;
	text-decoration:none;
}
body{
	font-family: 'Noto Sans KR', sans-serif;
}
.iframe{
	width: 540px;
	height: 100px;
	overflow: auto;
}
.h1{
	font-size: 18px;
	display: flex;
    flex-direction: column;
    padding: 24px 16px;
    margin-bottom: 16px;
 	border-bottom : 30px solid #ececec;
    
}
#payBtn{
	background-color: #000 !important;
	color: #ffffff !important;
	margin-bottom: 0;
	text-align: center;
	width: 540px;
	font-size:25px;
	height: 63px;
}
.agree{
	
}
.wrap{
	display: flex;
    flex-direction: column;
    min-height: 100%;
    max-width: 540px;
    margin: 0 auto;

}
.card{
    display: flex;
    flex-direction: column;
	line-height: 35px;
    margin-bottom: 16px;
    background-color: 
}
</style>
<body>
<div class="wrap">
	<div class="h1"><h1><a href="#">vaho studio</a></h1></div>
	<div class="card">
		<div class="h2">
		<h2 style="font-size: 18px;">이용약관 및 개인정보 처리방침</h2>
		</div>
	<div>
		<label>이용약관</label>
		<div><iframe class="iframe" src="<%=request.getContextPath()%>/Product/non_customer_agree1.jsp"></iframe></div>
		<div><label class="agree" id="agree1" for="agreeOne"><input type="checkbox" id="agreeOne">이용약관에 동의합니다.</label></div>
	</div>
		<label>비회원 구매 개인정보처리방침</label>
		<div><iframe class="iframe" src="<%=request.getContextPath() %>/Product/non_customer_agree2.jsp"></iframe></div>
		<div><label class="agree" id="agree2" for="agreeTwo"><input type="checkbox" id="agreeTwo">비회원 구매 개인정보처리방침에 동의합니다</label></div>
	</div>
	<div><button type="submit" id="payBtn">결제진행하기</button></div>
</div> 
<script type="text/javascript">

	$("#payBtn").click(function() {
		
		if($("#agreeOne").is(":checked")==false) {
			return;
		}
		if($("#agreeTwo").is(":checked")==false) {
			return;
		}
		location.href="<%=request.getContextPath()%>/index.jsp?vaho=Buy&studio=PaymentWindow";
		
	});	
</script>
</body>
</html>