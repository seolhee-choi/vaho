<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="site.itwill.dto.CustomerDTO"%>
<%@page import="site.itwill.dao.CustomerDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="site.itwill.dto.CartDTO"%>
<%@page import="site.itwill.dto.ProductDTO"%>
<%@page import="site.itwill.dao.ProductDAO"%>
<%@page import="site.itwill.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
		
	//로그인 검사
	String message=(String)session.getAttribute("message");
	if(message==null){
		message="";
	} else {
		session.removeAttribute("message");
	}
	
	CustomerDTO email = (CustomerDTO)session.getAttribute("loginCustomer");
	
	if(email==null){
	 email=new CustomerDTO();
	}else{
	 session.removeAttribute("email");
	}
	

	//상품 불러오기
	List<ProductDTO> product=new ArrayList<ProductDTO>();
    List<CartDTO> cart=CartDAO.getDao().getemail(email.getEmail());
	for(int i=0;i<cart.size();i++){
		 product.add(ProductDAO.getDAO().selectNoProduct(cart.get(i).getNo()));
	}
	
	 int Total=0;
 
	for(int i=0;i<cart.size();i++){
		Total+=Integer.parseInt(cart.get(i).getTotalP());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style type="text/css">

/*전체 세팅*/
.totalSetting{
	padding:15px;
}
/*장바구니*/
.cartPageHeader{
	color: rgb(168, 160, 149);
    border-color: rgb(77, 83, 86);
	width: 100%;
	margin-bottom: 40px;
	color: rgb(201, 196, 189);
	font-size: 18px;
    font-family: Noto Sans KR, sans-serif;
    font-weight: 400;
    letter-spacing: 0.05em;
    line-height: 1.15em; 
}
/*장바구니외 전체*/
.cartPage{
	color: rgb(168, 160, 149);
    border-color: rgb(77, 83, 86);
    width: 100%;
    
}

/*상품정보,수량,가격,배송비*/
.cartListHeader{
	width: 100%;
	color: rgb(168, 160, 149);
    border-color: rgb(77, 83, 86);
    border-bottom: 1px solid #ddd;
    border-collapse: collapse;
}

/*상품정보*/
#productInform{
	float: left;
}

/*배송비*/
#deliveryPrice{
}

/*상품합계, 배송비, 총합계*/
.priceTitle{
	float: left;
	margin-left: 43%;
}

/*상품합계, 배송비, 총합계의 금액*/
.content{
	margin-right:30px;
	font-size: 14px;
	float: right;
}
/*상품합계, 배송비, 총합계+각 금액*/
#inlineContent1, #inlineContent2, #inlineContent3{
	display: inline-block;
	width: 500px;
	margin-right: 50%;
}
/*총합계 윗부분 줄*/
#inlineContent3{
	border-top: 1px solid #ddd;
}

/*주문하기 버튼*/
#orderBtn:hover{
	background-color: #313131;
	color: white;
}
#orderBtn{
 	float: right;
    margin-top: 10px;
	font-size: 14px !important;
	color:#313131;
	padding: 1em 1.75em;
    border-color: rgb(124, 115, 102) !important;
    box-sizing: border-box;
    border: 2px solid;
    text-align: center;
	transition: all .2s cubic-bezier(.33,0,.2,1);
}

/*상품합계~총합계 // 버튼빼고*/
#priceHeader{
    margin-left: 10px;
    padding: 5%;
}


/*상품합계~버튼까지 다 */
.priceClass{
    float: right;
    margin-right: 5%;
	margin-top: 3%;
}



/*상품 이미지 사이즈*/
img{
	width: 5em;
	height: 5em;
	object-fit: cover;
}

/* 행 추가별 설정*/
tr, td {
	padding:20px;
	border-top: 1px solid #ddd;
	
	
}

</style>
<title>Cart</title>
</head>
<body>
<div class="totalSetting">
	<div class="cartPageHeader">
	    <span class="title">장바구니<span id="cartSize"></span></span> 
	</div>
	<br>
	<div class="cartPage">
		<div class="cartListHeader">
			<table style="width: 100%">
				<tr>
					<th id="productInform" width="60%">상품정보</th>
					<th width="10%">수량</th>
					<th width="15%">가격</th>
					<th id="deliveryPrice" width="15%">배송비</th>
				</tr>
				<%for(int i=0;i<cart.size();i++) {%>
				<tr id="plusMinusHeader">
					<td>
						<a href="<%=request.getContextPath()%>/index.jsp?vaho=Product&studio=Information&pNo=<%=cart.get(i).getNo() %>">
						<img src="<%=request.getContextPath()%>/image/<%=product.get(i).getpImage() %>">&nbsp;&nbsp;</a> 
						<%=product.get(i).getpName() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" id="removeBtn">삭제하기</button>
					</td>
					<td align = "center">
						<%=cart.get(i).getCount() %>
					
						<!-- 
						<a href="#" onclick="change(1);">+</a>
						<a href="#" onclick="change(-1);">-</a>
						 -->
						 				
					</td>
					
					<td align = "center"><%=cart.get(i).getTotalP() %>원</td>
					<% if(i==0){%><td rowspan="<%= cart.size()%>" align = "center">2500원</td><%}%>
						<!-- <%=cart.size()%>  -->				<!-- .get(i).getDeliveryP()  -->
				</tr>
				<%} %>
			</table>
		</div>
		<div class="priceClass">
			<div id="priceHeader">
				<div class="price">
					<div id="inlineContent1">
						<div class="priceTitle">상품합계</div>
						<div class="content" id="content1">	<%= Total%>원</div>
					</div>
					<br>
					<div id="inlineContent2">
						<div class="priceTitle">배송비</div>
						<div class="content" id="content2" >2500원</div>
					</div>
				</div>
				<div>
					<div id="inlineContent3">
						<br>
						<div class="priceTitle">총 합계</div>
						<div class="content"><%= Total+2500%>원</div>
					</div>
				</div>
			</div>
				<button id="orderBtn" type="button">주문하기</button> 
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	</div>
</div>
<script type="text/javascript">
/* 수량 버튼 기능 구현.... 
$(document).ready (function() { 
	$('#plus').each(function(i, element) {
		
		$(element).on("click",function(){
			 var Count=	$(element).parent("div").children("input").val();
			 var Countint= parseInt(Count)+1;
			 $(element).parent("div").children("input").val(Countint);
        })
	}) ;
	$('#minus').each(function(i, element) {
		$(element).on("click",function(){
		 var Count=	$(element).parent("div").children("input").val();
		 var Countint= parseInt(Count)-1<0?0:parseInt(Count)-1;
		 $(element).parent("div").children("input").val(Countint);
        })
	}) ;
});
*/

$("#removeBtn").click(function() {
	if(confirm("선택한 제품을 삭제 하겠습니까?")) {
		var index=$("#removeBtn").index(this);
		location.href="<%=request.getContextPath()%>/cart/cart_remove_action.jsp?index="+index;
	}
});


$("#orderBtn").click(function() {
	location.href="<%=request.getContextPath()%>/index.jsp?vaho=Buy&studio=PaymentWindow";	
});
</script>
</body>
</html>