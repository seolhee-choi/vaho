<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="site.itwill.dto.CartDTO"%>
<%@page import="site.itwill.dao.CustomerDAO"%>
<%@page import="site.itwill.dto.CustomerDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="site.itwill.dao.ProductDAO"%>
<%@page import="site.itwill.dto.ProductDTO"%>
<%@page import="site.itwill.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<CartDTO> carts= new ArrayList<CartDTO>();
	List<ProductDTO> Products = new ArrayList<ProductDTO>();
	CustomerDTO Customer = (CustomerDTO) session.getAttribute("loginCustomer");

	int Total=0;
	String Name = "";
	String PhoneOne = "";
	String PhoneTwo = "";
	String PhoneThree = "";
	String Email = "";
	String Address1 = "";
	String Address2 = "";
	String Zipcode = "";

	if (Customer != null) {
		Name = Customer.getName();
		PhoneOne = Customer.getPhone().substring(0, Customer.getPhone().indexOf("-"));
		PhoneTwo = Customer.getPhone().substring(Customer.getPhone().indexOf("-") + 1,Customer.getPhone().lastIndexOf("-"));
		PhoneThree = Customer.getPhone().substring(Customer.getPhone().lastIndexOf("-") + 1);
		Email = Customer.getEmail();
		Address1 = Customer.getAddress1();
		Address2 = Customer.getAddress1();
		Zipcode = Customer.getZipcode();

		carts = CartDAO.getDao().getemail(Customer.getEmail());
		for (CartDTO cart : carts) {
			Products.add(ProductDAO.getDAO().selectNoProduct(cart.getNo()));
			Total+=Integer.parseInt(cart.getTotalP());
		}
	}
	else{
		ProductDTO Product=	(ProductDTO)session.getAttribute("Product");
		CartDTO cart=(CartDTO)session.getAttribute("Cart");
		Products.add(Product);
		carts.add(cart);
		
		for (CartDTO cart2 : carts) {
			Total+=Integer.parseInt(cart.getTotalP());
		}
	}
	

	DecimalFormat price = new DecimalFormat("#,###");

	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/CSS/PaymentWindow.css"
	style="text/css" rel="stylesheet">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div class="Orderproduct">
		<table>
			<tr>
				<th colspan="2">주문 상품
			</tr>
			<%
				for (int i = 0; i < carts.size(); i++) {
			%>
			<tr>
				<td><img height="86px" width="86px"	src="<%=request.getContextPath()%>/image/<%=Products.get(i).getpImage()%>"></td>
				<td class="product">
					<div class="ProductName"><%=Products.get(i).getpName()%></div> <br>
					<div class="ProductStock">
						ringsize:<%=Products.get(i).getpSize()%></div> <br>
					<div class="ProductPrice"><%=carts.get(i).getCount()%>개 /
						<%=price.format(Integer.parseInt(carts.get(i).getPrice()))%>원
					</div> <br>
				</td>
			</tr>
			<%
				}
			%>
			<tr>
				<td colspan="2"><hr></td>
			</tr>
			<tr>
				<td>상품합계</td>
				<td class="total"><%=price.format(Total)%>원</td>
			</tr>
		</table>
	</div>
	<div class="SendOrder">
		<table>
			<tr>
				<th>주문자</th>
			</tr>
			<tr>
				<td>이름</td>
			</tr>
			<tr>
				<td><input class="onecol" value="<%=Name%>"></td>
			</tr>
			<tr>
				<td id="error" class="name-error">이름이 옳바르지 않습니다.</td>
			</tr>
			<tr>
				<td>연락처</td>
			</tr>
			<tr>
				<td><input class="threecol" value="<%=PhoneOne%>"> - 
				<input class="threecol" value="<%=PhoneTwo%>">- 
				<input	class="threecol" value="<%=PhoneThree%>"></td>
			</tr>
			<tr>
				<td id="error" class="phone-error">연락처가 옳바르지 않습니다.</td>
			</tr>
			<tr>
				<td>이메일</td>
			</tr>
			<tr>
				<td><input class="onecol" value="<%=Email%>"></td>
			</tr>
			<tr>
				<td id="error" class="phone-email">이메일이 옳바르지 않습니다.</td>
			</tr>
		</table>
	</div>
	<div>
		<table>
			<tr>
				<th>배송지</th>
			</tr>
			<tr>
				<td>이름</td>
			</tr>
			<tr>
				<td><input class="onecol" value="<%=Name%>"></td>
			</tr>
			<tr>
				<td id="error">이름을 입력해주세요</td>
			</tr>
			<tr>
				<td>우편번호</td>
			</tr>
			<tr>
				<td><div id="wrap"
						style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
							id="btnFoldWrap"
							style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
							onclick="foldDaumPostcode()" alt="접기 버튼">
					</div> <input type="text" id="zipcode" name="zipcode"
					value="<%=Zipcode%>" readonly="readonly">
					<button type="button" id="searchBtn" name="searchBtn"
						onclick="postSearch();">검색하기</button></td>

			</tr>
			<tr>
				<td id="error">우편번호를 입력해주세요</td>
			</tr>
			<tr>
				<td>주소</td>
			</tr>
			<tr>
				<td>
					<div>

						<input type="text" name="address1" id="address1"
							value="<%=Address1%>" readonly="readonly"><br> <input
							type="text" name="address2" id="address2" value="<%=Address2%>">
					</div>
				</td>
			</tr>
			<tr>
				<td id="error">주소를 입력해주세요</td>
			</tr>
			<tr>
				<td>연락처</td>
			</tr>
			<tr>
				<td><input class="onecol"
					value="<%=PhoneOne%><%=PhoneTwo%><%=PhoneThree%>"></td>
			</tr>
			<tr>
				<td id="error">연락처를 입력해주세요</td>
			</tr>
			<tr>
				<td>배송시 요청 사항</td>
			</tr>
			<tr>
				<td><input class="onecol"></td>
			</tr>
			<tr>
				<td>제주 및 도서 산간 지역의 배송은 추가 배송비가 발생할 수 있습니다.</td>
			</tr>
		</table>
	</div>
	<div class="payInfoamtion">
		<table>
			<tr>
				<th colspan="2">결제 정보</th>
			</tr>
			<tr>
				<td colspan="2"><hr></td>
			</tr>
			<tr>
				<td class="PriceTitle">상품합계</td>
				<td class="Price"><%=price.format(Total)%>원
				</td>
			</tr>
			<tr>
				<td class="PriceTitle">배송비</td>
				<td class="Price">2,500원</td>
			</tr>
			<tr>
				<td class="PriceTitle">총 할인 금액</td>
				<td class="Price">0원</td>
			</tr>
			<tr>
				<td colspan="2"><hr></td>
			</tr>
			<tr>
				<td class="PriceTitle">결제금액</td>
				<td class="total"><%=price.format(Total + 2500)%>원
				</td>
			</tr>
		</table>
	</div>
	<div class="paymethod">
		<table>
			<tr>
				<th colspan="2">결제 방법</th>
			</tr>
			<tr>
				<td colspan="2">입금계좌</td>
			</tr>
			<tr>
				<td><input type="radio" onclick="chk_info(event);"
					value="신용/체크카드" name="gener">신용/체크카드</td>
				<td><input type="radio" onclick="chk_info(event);" value="계좌"
					name="gener">계좌</td>
			</tr>
			<tr>
				<td><input type="radio" onclick="chk_info(event);" value="휴대폰"
					name="gener">휴대폰 결제</td>
				<td><input type="radio" onclick="chk_info(event);" value="카카오"
					name="gener">카카오 페이</td>
			</tr>
			<tr>
				<td><input type="radio" onclick="chk_info(event);" value="무통장"
					name="gener">무통장 입금</td>
			</tr>
		</table>
	</div>
	<div class="Depositor">
		<table>
			<tr>
				<td colspan="2">입금자</td>
			</tr>
			<tr>
				<td colspan="2"><input class="onecol"></td>
			</tr>
			<tr>
				<td colspan="2">입급계좌</td>
			</tr>
			<tr>
				<td colspan="2"><input class="onecol"></td>
			</tr>
			<tr>
				<td colspan="2">환불계좌</td>
			</tr>
			<tr>
				<td><input class="twocol" placeholder="은행명"><input
					class="twocol" placeholder="예금주"></td>
			</tr>
			<tr>
				<td colspan="2"><input class="onecol" placeholder="계좌번호"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="radio">에스크로 사용</td>
			</tr>
		</table>
	</div>
	<div>
		<input class="Buygoods" type="button"
			value="<%=price.format(Total + 2500)%>원 결제하기">
	</div>
	<script type="text/javascript">
		window.onload = function() {
			$("table").children("tbody").children("tr").children("#error")
					.each(function(i, element) {
						if (
	<%=Email.equals("")%>
		)
							$(element).css("visibility", "visible");
					});
		}
		var ismu = false;
		function chk_info(event) {
			var name = event.target.value;

			if (name == '무통장') {
				$(".Depositor").css("display", "block");
			} else
				$(".Depositor").css("display", "none");
		}

		// 우편번호 찾기 찾기 화면을 넣을 element
		var element_wrap = document.getElementById('wrap');

		function foldDaumPostcode() {
			// iframe을 넣은 element를 안보이게 한다.
			element_wrap.style.display = 'none';
		}

		function postSearch() {
			// 현재 scroll 위치를 저장해놓는다.
			var currentScroll = Math.max(document.body.scrollTop,
					document.documentElement.scrollTop);
			new daum.Postcode(
					{
						oncomplete : function(data) {
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
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
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
							element_wrap.style.height = size.height + 'px';
						},
						width : '100%',
						height : '100%'
					}).embed(element_wrap);

			// iframe을 넣은 element를 보이게 한다.
			element_wrap.style.display = 'block';
		};
		
		$(".Buygoods").click(function() {
			
			location.href="<%=request.getContextPath()%>/cart/cart_manage_action.jsp";
		})
	</script>
</body>
</html>