<%@page import="site.itwill.dao.CustomerDAO"%>
<%@page import="java.util.List"%>
<%@page import="site.itwill.dto.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	
	CustomerDTO loginCustomer=(CustomerDTO)session.getAttribute("loginCustomer");
	if(loginCustomer==null && loginCustomer.getAdmin()!=1){ //비로그인 사용자
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=error&studio=error400';");
	out.println("</script>");
	return;
	}
	

	
	int pageNum=1;
	
	if(request.getParameter("pageNum")!=null){
		pageNum=Integer.parseInt(request.getParameter("pageNum"));
	}
	
	int pageSize=10;
	
	int totalCustomer=CustomerDAO.getDAO().selectCountCustomer();
	
	//전체 고객/페이지사이즈 = 고객/10
	int totalPage=(int)Math.ceil((double)totalCustomer/pageSize);
	
	if(pageNum<=0 || pageNum>totalPage){
		pageNum=1;
	}
	//오라클은 페이지 번호가 1부터시작
	int startRow=(pageNum-1)*pageSize+1;
	
	int endRow=pageNum*pageSize;
			
	List<CustomerDTO> customerList=CustomerDAO.getDAO().selectAllCustomer(startRow, endRow);
	
	if(endRow>totalCustomer){
		endRow=totalPage;
	}
	
	int number=totalCustomer-(pageNum-1)*pageSize;
	
	
	
	
%>
<style>
table{
	text-align: center;
	margin: 0 auto;
	border: 1px solid #666666;
	border-collapse: collapse;
	
}

th {
	border: 1px solid black;
	background: #666666;
	color: white;
}

td {
	border: 1px solid black;
	text-align: center;	
}

#page{
	text-align: center;
}
#totalCustomer{
	text-align: center;
}

</style>
<div id="totalCustomer">총고객수=[&nbsp;<%=totalCustomer %>&nbsp;]</div>
<table>
	<tr>
		<th>이메일</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>가입일자</th>
		<th>로그인날짜</th>
		<th>권한</th>
	</tr>
	<%for(CustomerDTO customer:customerList){ %>
	<tr>
		<td id="email" width="200"><%=customer.getEmail() %></td>
		<td id="name" width="100"><%=customer.getName() %></td>
		<td id="phone" width="150"><%=customer.getPhone() %></td>
							<%if(customer.getAddress1()!=null){ %>
		<td id="address" width="400"><%=customer.getZipcode() %>&nbsp;<%=customer.getAddress1() %>&nbsp;<%=customer.getAddress2() %></td>
										<%}else{ %>
		<td id="address" width="400"></td>
										
										<%	} %>
		<td id="joindate" width="150"><%=customer.getNewDate().substring(0, 9) %></td>
						<%if(customer.getLastDate()!=null) {%>
		<td id="lastdate" width="150"><%=customer.getLastDate().substring(0, 9) %></td>
						<%}else { %>
		<td id="lastdate" width="150"></td>
						
						<%} %>
		<td id="admin" width="100">
			<select class="select" name="<%=customer.getEmail() %>" >
				<option value="2" <%if(customer.getAdmin()==2){ %> selected="selected"  <% } %>>일반회원</option>
				<option value="1" <%if(customer.getAdmin()==1){ %> selected="selected"  <% } %>>관리자</option>
			</select>
		</td>
	</tr>
		<%	} %>
</table>
	<%
		int blockSize=5;
	
		int startPage=(pageNum-1)/blockSize*blockSize+1;
		
		int endPage =startPage+blockSize;
		if(endPage>=totalPage){
			endPage=totalPage;
		}
	%>
	<div id="page">
	<% if(startPage>blockSize){ %>
		<a href="<%=request.getContextPath()%>/index.jsp?vaho=admin&studio=admin_customer_manager&pageNum=1">처음</a>
		<a href="<%=request.getContextPath()%>/index.jsp?vaho=admin&studio=admin_customer_manager&pageNum=<%=startPage-blockSize %>">이전</a>
	<%}else{ %>
	[처음][이전]
	<%	} %>
	
	<% for(int i=startPage; i<=endPage; i++){ %>
		<%	if(pageNum!=i){ %>
			<a href="<%=request.getContextPath() %>/index.jsp?vaho=admin&studio=admin_customer_manager&pageNum=<%=i %>">[<%=i %>]</a>
			
		<%	}else{ %>
			[<%=i %>]
		<%	} %>
	<% } %>
	<%if(endPage!=totalPage) { %>
		<a href="<%=request.getContextPath()%>/index.jsp?vaho=admin&studio=admin_customer_manager&pageNum=<%=startPage+blockSize%>">다음</a>
		<a href="<%=request.getContextPath()%>/index.jsp?vaho=admin&studio=admin_customer_manager&pageNum=<%=endPage %>">마지막</a>
	<%	}else{ %>
	[다음][마지막]
	<%} %>
	</div>


<script type="text/javascript">

	$(".select").change(function() {
	var email=$(this).attr("name");
	var admin=$(this).val();

	location.href="<%=request.getContextPath()%>/index.jsp?vaho=admin&studio=admin_customer_authority&email="+email+"&admin="+admin;
	
	alert("변경이 완료되었습니다");
	});
</script>
