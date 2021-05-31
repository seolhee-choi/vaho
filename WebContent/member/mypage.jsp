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
<%@include file="/security/login_check.jspf" %>
<style type="text/css">
.mypage{
   position: relative;
    width: 100%;
    max-width: 960px;
    min-height: 300px;
    height: auto;
    margin: 0 auto;
    padding: 60px 16px 70px;
    display: inline-block;
    margin-left: 300px;
    
}
.infoList{
    width: 43%;
    display: inline-block;
    vertical-align: top;
    float: left;
    margin-right: 14%;
}
.memberinfo{
	width: 43%;
    display: inline-block;
    vertical-align: top;
    float: left;
}
.context{
    color: #666666;
    font-family: Noto Sans KR, sans-serif;
    font-weight: 400;
    letter-spacing: 0.06em;
    text-align: center;   
    padding: 100px 0;
    line-height: 1.5em;
}
.memberinfo{
	width: 43%;
    display: inline-block;
    vertical-align: top;
    float: left;
}
.title{
	 display: block;
    font-size: 14px;
    line-height: 17px;
    margin-bottom: 12px;
}
#searchBtn{
	color: #313131 !important;
    background-color: transparent !important;
    border-color: #313131 !important;
    opacity: 1 !important;
    border: 2px solid transparent;
    text-align: center;
    width: 99px !important;
    height: 45px !important;
    margin-left: 10px;
    font-size: 14px !important;
    font-family: Open Sans, sans-serif;
    font-weight: 400;
    letter-spacing: 0.02em;
}
#searchBtn:hover {
	color: #FFFFFF !important;
    background-color: #313131 !important;
}
#zipcode ,#address1,#address2 , #name ,#email{
    font-size: 14px;
    line-height: 23px;
    width: 60%; 
    height: 20px;
    border: 1px solid #ddd;
    padding: 10px 15px;
}
.logout{
padding-left: 220px;
font-size: 14px;
}
#save{
    color: #FFFFFF !important;
    background-color: #313131 !important;
    border-color: #313131 !important;
    font-family: Open Sans, sans-serif;
    font-weight: 400;
    letter-spacing: 0.02em;
    margin-left: 70px;
    width: 133px;
    height: 46px;
}
.trans1{	
	padding-left: 45px;
}
.checkText{
	font-size: 14px;
	line-height: 17px;
	font-family: Noto Sans KR, sans-serif;
	color: #666666;
}
#save:hover {
    opacity: 0.8;
    cursor: pointer;
}	

#phone0,#phone1,#phone2{
	font-size: 14px; 
    line-height: 10px;
    width: 50px;
    height: 15px;
    border: 1px solid #ddd;
    padding: 10px 15px;
}
.message{
	text-align: center;
	font-size: 10px;
	color: #313131;
	margin-top: 35px;
	width: 280px;
}
</style>
<div class="mypage">
<div class="warrap"> 
<div class="infoList">

<div class="orderheader">
	<span>주문내역</span>
</div>
	<div>
		<div class="context">		
		주문내역이 없습니다.
		</div>
	</div>
	
<div class="orderheader">
	<span>내가 쓴 글</span>
</div>
	<div>
		<div class="context">내가 쓴 글이 없습니다.</div>
	</div>
<div class="orderheader">
	<span>쿠폰 내역</span>
</div>
	<div>
	 	<div class="context">쿠폰 내역이 없습니다.</div>
	</div>
<div class="orderheader">
	<span>적립금 내역</span>
</div>
	<div>
	 	<div class="context">적립금 내역이 없습니다.</div>
	</div>
</div>
<div class="memberinfo">
	<div><span class="title">회원정보</span></div>
	<form action="<%=request.getContextPath()%>/index.jsp?vaho=member&studio=mypage_modify_action" id="mypage_field" name="myPage" method="post">
	
		<input type="hidden" id="memberNo" name="memberNo">
		<a class="logout" href="index.jsp?vaho=member&studio=logout_action">로그아웃</a>
		<div><span class="title">이메일</span></div>
		<input type="text" id="email" name="email" value="<%=loginCustomer.getEmail()%>" readonly="readonly">
		<div><span class="title">이름</span></div>
		<input type="text" id="name" name="name" value="<%=loginCustomer.getName() %>">
		<div><span class="title">휴대폰 번호</span></div>
							<% if (loginCustomer.getPhone() != null) { %>
							<% String[] phone = loginCustomer.getPhone().split("-"); %>
		  <input type="text" id="phone0" name="phone0" value="<%=phone[0] %>">
		- <input type="text" id="phone1" name="phone1" value="<%=phone[1] %>">
		- <input type="text" id="phone2" name="phone2" value="<%=phone[2] %>">
								<% }else{ %>
		  <input type="text" id="phone0" name="phone0" >
		- <input type="text" id="phone1" name="phone1" >
		- <input type="text" id="phone2" name="phone2" >
								<% } %>
		<div><span class="title">우편번호</span></div>
		<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
		</div>
		
															<% if(loginCustomer.getZipcode()!=null) { %>
		<input type="text" id="zipcode" name="zipcode" value="<%=loginCustomer.getZipcode() %>" readonly="readonly">
																	<% }else {%>
															<%String zipcode= ""; %>
		<input type="text" id="zipcode" name="zipcode" value="<%=zipcode %>" readonly="readonly">
																		
																	<% } %>
		<button type="button" id="searchBtn" name="searchBtn" onclick="postSearch();">검색하기</button>
		<div><span class="title">주소</span></div>
		<div>														
																		<%if(loginCustomer.getAddress1()!=null ){ %>
				<input type="text" name="address1" id="address1" value="<%=loginCustomer.getAddress1() %>" readonly="readonly"><br>
																					<%}else{ %>
																		<%String address1 = ""; %>
				<input type="text" name="address1" id="address1" value="<%=address1 %>" readonly="readonly"><br>
																					<% } %>
																					
																		<%if(loginCustomer.getAddress2()!=null){ %>					
				<input type="text" name="address2" id="address2" value="<%=loginCustomer.getAddress2() %>">
																					<%}else{ %>
																		<%String address2 =""; %>
				<input type="text" name="address2" id="address2" value="<%=address2 %>">
																					<% } %>
		</div>		
		<div class="checkText">
			<span>마켓팅 정보 수신동의</span><br>
			<input type="checkbox"> 이메일
			<input type="checkbox"> 문자메세지
		</div>
		<div class="trans1">
				<a href="<%=request.getContextPath() %>/index.jsp?vaho=member&studio=new_password">비밀번호 변경하기</a>
				<a href="<%=request.getContextPath() %>/index.jsp?vaho=member&studio=customer_drop">탈퇴하기</a>
		</div>
		<div>
		<div class="message"><%=message %></div>
			<button type="button" id="save" name="save" onclick="submitCheck();">변경사항 저장하기</button>
		</div>
	</form>
</div>
	</div>
</div>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	
	
	
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function postSearch() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("zipcode").value = extraAddr;
                
                } else {
                    document.getElementById("sample3_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address2").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
        
        
    };
    
    function submitCheck(){
    	
    	if($("#phone0").val()==""){
    		$(".message").text("전화번호를 입력해주세요.");
    		return;
    	}
    	if($("#phone1").val()==""){
    		$(".message").text("전화번호를 입력해주세요.");
    		return;
    	}
    	if($("#phone2").val()==""){
    		$(".message").text("전화번호를 입력해주세요.");
    		return;
    	}
    	if($("#zipcode").val()==""){
    		$(".message").text("우편번호를 입력해주세요.");
    		return;
    	}
    	if($("#address1").val()==""){
    		$(".message").text("주소를 입력해주세요.");
    		return;
    	}
    	
    	
    	alert("회원정보 변경이 완료되었습니다.");
    	myPage.submit();
    };
   
</script>
