<%@page import="site.itwill.dao.CustomerDAO"%>
<%@page import="site.itwill.dto.CustomerDTO"%>
<%@page import="sun.security.provider.MD5"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="site.itwill.dao.ProductDAO"%>
<%@page import="site.itwill.dto.ProductDTO"%>
<%@page import="javafx.scene.control.Alert"%>

<link href="<%=request.getContextPath()%>/CSS/Infomation.css" style="text/css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/JS/Infomation.js"></script>
<%

	CustomerDTO loginCustomer=(CustomerDTO)session.getAttribute("loginCustomer");

	int pNo = Integer.parseInt(request.getParameter("pNo"));

	ProductDTO Product = new ProductDTO();
	 Product = ProductDAO.getDAO().selectNoProduct(pNo);
	
	String Exp=Product.getpInfomation();
	
	String[] exps = Exp.split("\\.");

	DecimalFormat price = new DecimalFormat("#,###");
	
	
%>
<div>
 <form name="join" action="<%=request.getContextPath()%>/Buy/PaymentWindow_action.jsp" method="post" onsubmit="return inputCheck(join);">
		<table>
			<tr>
				<td class="AccessoryImg"><img class="BigImg"
					src="<%=request.getContextPath()%>/image/<%=Product.getpImage()%>"></img>
				</td>
				<td class="AccessoryBuy">
					<div class="AccessoryTitle"><%=Product.getpName()%></div>
					<div class="AccessoryExp">
						<%
							for (int i = 0; i < exps.length; i++) {
						%>
						<p><%=exps[i]%></p>
						<%}%>
						<br>
						<p>소재 - 925 silver</p>
						<p>사이즈 - 약 0.4cm</p>
					</div>

					<div class="Accessorypirce">
						<%=price.format(Product.getpPrice()) + "원"%>
					</div>

					<div class="Accessorydiscountrate">
						적립금
						<div class="inline">2%</div>
						배송비
						<div class="inline">2,500원</div>
					</div> <br>ring size
					<div class="AccessoryCount">
						<select class="Count" name="Count">
							<option value="">선택해주세요
								<%
								for (int i = 1; i < 31; i++) {
							%>
							
							<option value=<%=i%>><%=i%>
								<%}	%>
							
						</select>
						<div class="error" style="color: red"></div>
					</div>
			</tr>
			<tr>
				<td>
					<div class="AccessoryCount">
						
					</div>
				</td>

				<td><input type="hidden" name="AccessoryName"
					value=<%=Product.getpName().replaceAll(" ", "")%>>
					<input	type="hidden" name="pNo" value=<%=pNo%>>
					<%if(loginCustomer!=null){%>
					<input type="submit"  name ="Btn" class="Buy" value="buy" id="BtnBuy" onclick="location.href='<%=request.getContextPath() %>/index.jsp?vaho=Buy&studio=PaymentWindow';">
					<%	}else{ %>
					<input type="submit"  name ="Btn" class="Buy" value="buy" id="BtnBuy" onclick="location.href='<%=request.getContextPath() %>/index.jsp?vaho=member&studio=non_login';">
					<%	} %> 
					<input type="submit" name ="Btn" class="shoppingbasket" value="shoppingbasket" id="BtnBuy"></td>
			</tr>
		</table>
	  </form>
	
</div>
