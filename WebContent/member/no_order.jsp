<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath()%>/CSS/hnf.css" style="text/css" rel="stylesheet">
<meta charset="UTF-8">
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
#name, #order{
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


</style>
<title>vahostudio</title>
</head>
<body>
	<form action="#">
		<div class="box_filed">
			<div><span class="title">비회원 주문조회</span><br></div>
			<div><span class="title2">이름</span><br>
					<input type="text" id="name" name="name"></div>
			<div><span class="title2">주문번호</span><br>
					<input type="text" id="order" name="order"></div>
					<button type="submit" name="email_send" id="email_send" >조회하기</button>
		</div>
	</form>

</body>
</html>