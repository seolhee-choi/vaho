<%@page import="site.itwill.dao.qnaDAO"%>
<%@page import="site.itwill.dto.qnaDTO"%>
<%@page import="site.itwill.dto.CustomerDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//검색어
	String search=request.getParameter("search");
	if(search==null) search="";
	String keyword=request.getParameter("keyword");
	if(keyword==null) keyword="";
	
	int pageNum=1;
	if(request.getParameter("pageNum")!=null) {
		pageNum=Integer.parseInt(request.getParameter("pageNum"));
	}
	
	//한 페이지에 출력될 게시글 갯수
	int pageSize=10;
	
	//테이블에 저장된 전체 게시글 갯수
	int totalQna=qnaDAO.getDAO().selectQnaCount(search, keyword);
	
	//전체 페이지 갯수
	int totalPage=(int)Math.ceil((double)totalQna/pageSize);
	
	if(pageNum<=0 || pageNum>totalPage) {
		pageNum=1;
	}
	
	int startRow=(pageNum-1)*pageSize+1;
	
	int endRow=pageNum*pageSize;
	
	if(endRow>totalQna) {
		endRow=totalQna;
	}
	
	List<qnaDTO> qnaList=qnaDAO.getDAO().selectQnaList(startRow, endRow, search, keyword);
	
	int number=totalQna-(pageNum-1)*pageSize;
	
	//세션에 저장된 권한 관련 정보(회원정보)를 반환받아 저장
	// => 로그인 사용자에게만 글쓰기 권한 부여
	// => 비밀글인 경우 게시글 작성자와 관리자에게만 게시글 상세보기 권한 부여
	CustomerDTO loginCustomer=(CustomerDTO)session.getAttribute("loginCustomer");
	
	//현재 날짜를 반환받아 저장
	String currentDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
%>
<style type="text/css">
table {
	width: 50%;
	border-top: 1px solid #CCCCCC;
	border-collapse: collapse;
	color: #666666;
	max-width: 100%;
	table-layout: fixed;
	margin-left: auto;
	margin-right: auto;
}

th, td {
	border-bottom: 1px solid #CCCCCC;
	padding: 10px 10px;
	font-size: 14px;
}

a, a:visited {
	text-decoration: none;
	color: #666666;
}

button {
	padding: 14px 24.5px;
	color: white;
	background-color: #313131;
}

input {
	padding: 14px 24.5px;
	border:1px solid #CCCCCC;
}

#pageNum {
	color: #666666;
	margin-left: auto;
	margin-right: auto;
	table-layout: fixed;
}
.search{
	margin-left: 16%;
}
.pageNumber{
text-align: center;
}
</style>
<div id="qna_list" class="qna_container" >
	
	
	<table>
		<tr>
			<th width="70">No.</th>
			<th width="700">Subject</th>
			<th width="70">Writer</th>
			<th width="70">Views</th>
		</tr>
		
		<% if(totalQna==0) { %>
			<tr>
				<td colspan="5" style="text-align: center;">검색된 게시글이 하나도 없습니다.</td>
			</tr>
		<% } else { %>
			<% for(qnaDTO qna:qnaList) { %>
			<tr>
				<td style="text-align: center;"><%=number %></td>
				
				<td class="subject">
				<% if(qna.getReStep()!=0) {//답글인 경우 %>
					<span style="font-weight: bold; margin-left: <%=qna.getReLevel()*20%>px;">[Re]</span>
				<% } %>
				
				<% if(qna.getStatus()==0) {//일반 게시글인 경우 %>
					<a href="<%=request.getContextPath()%>/index.jsp?vaho=qna&studio=qna_detail&num=<%=qna.getNum()%>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>"><%=qna.getSubject() %></a>
				<% } else if(qna.getStatus()==1) {//비밀 게시글인 경우 %>
					<span class="secret"><img src="image/lock.png" style="width: 2%;"/></span>
					<% if(loginCustomer!=null && (loginCustomer.getEmail().equals(qna.getEmail())
						|| loginCustomer.getAdmin()==1)) {//권한이 있는 경우 %>
						<a href="<%=request.getContextPath()%>/index.jsp?vaho=qna&studio=qna_detail&num=<%=qna.getNum()%>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>"><%=qna.getSubject() %></a>
						<% } else {//권한이 없는 경우 %>
						작성자와 관리자만 읽기 가능한 글입니다.
					<% } %>
				<% } else if(qna.getStatus()==9) {//삭제 게시글인 경우 %>
					<span class="remove" style="font-weight: bold;">[삭제글]</span>
					게시글이 존재하지 않거나 접근할 수 없는 게시물입니다.
					
				<% } %>		
				</td>

				<% if(qna.getStatus()!=9) {//삭제 게시글이 아닌 경우 %>
					<td style="text-align: center;"><%=qna.getWriter() %></td>
					
					<td style="text-align: center;"><%=qna.getReadCount() %></td>
					
				<% } else { %>
					<td style="text-align: center;"></td>
					
					<td style="text-align: center;"></td>
					
				<% } %>	
			</tr>
			<% number--; %>
			<% } %>
		<% } %>
	
	</table>
	
	
	<%-- 페이지 번호 출력(페이징 처리) --%>
	<%
		//페이지 블럭에 출력될 페이지 번호의 갯수 설정
		int blockSize=5;
	
		//페이지 블럭에 출력될 시작 페이지 번호를 계산하여 저장
		int startPage=(pageNum-1)/blockSize*blockSize+1;
		                 
		//페이지 블럭에 출력될 종료 페이지 번호를 계산하여 저장
		int endPage=startPage+blockSize-1;
		
		//마지막 페이지 블럭의 종료 페이지 번호 변경
		if(endPage>totalPage) {
			endPage=totalPage;
		}
	%>
	<%-- 게시글 검색 --%>
	<%-- 
	<form action="<%=request.getContextPath()%>/index.jsp?vaho=qna&studio=qna_list" method="post">
		<input type="text" name="keyword">
		<button type="submit" name="search">검색</button>
		<% if(loginCustomer!=null) {//로그인 사용자인 경우 %>
		<div id="btn" style="float: right;">
			<button type="button" onclick="location.href='<%=request.getContextPath()%>/index.jsp?vaho=qna&studio=qna_write';">글쓰기</button>
		</div>
		<% } %>
	</form>
	--%>
	<%-- 
	<form action="<%=request.getContextPath()%>/index.jsp?vaho=qna&studio=qna_list" method="post">
		<select name="search">
			<option value="writer" selected="selected">&nbsp;작성자&nbsp;</option>
			<option value="subject">&nbsp;제목&nbsp;</option>
			<option value="content">&nbsp;내용&nbsp;</option>
		</select>
		<input type="text" name="keyword">
		<button type="submit">검색</button>
	</form>
	--%>
	<form action="<%=request.getContextPath()%>/index.jsp?vaho=qna&studio=qna_list" method="post" style="width: 75%; margin-left: auto; margin-right: auto;">
	<span class="search">
	<input type="text" name="keyword" placeholder="     제목을 검색해주세요.">
	<button type="submit">SEARCH</button>
	</span>
	
	<% if(loginCustomer!=null) {//로그인 사용자인 경우 %>
		
		<div id="btn" style="float: right; color: #FFFFFF; margin-right: 15%">
			<button type="button" onclick="postlocation();">POST</button>
		</div>
		
	<% } %>
	<p></p>
	</form>
	
	<%-- @@@@@@@@@@@@@@@@@@@else if로 첫페이지 마지막페이지는 화살표 미출력 @@@@@@@@@@@@@@@@@@@@@@@@첫 페이지로 이동 삭제? --%>
	<div id="pageNum" style="width: 30%; margin-left: 600px; margin-top: 25px; text-align: center;" >
	<% if(startPage>blockSize) { %>
		<a href="<%=request.getContextPath()%>/index.jsp?vaho=qna&studio=qna_list&pageNum=1&search=<%=search%>&keyword=<%=keyword%>">&lt;&lt;</a>
		<a href="<%=request.getContextPath()%>/index.jsp?vaho=qna&studio=qna_list&pageNum=<%=startPage-blockSize%>&search=<%=search%>&keyword=<%=keyword%>">&lt;</a>
	<% } else { %>
		&lt;&lt;&nbsp;&lt;	
	<% } %>
	
	<% for(int i=startPage;i<=endPage;i++) { %>
		<% if(pageNum!=i) { %>
			<a href="<%=request.getContextPath()%>/index.jsp?vaho=qna&studio=qna_list&pageNum=<%=i%>&search=<%=search%>&keyword=<%=keyword%>" ><%=i %></a>
		<% } else { %>
			<%=i %>
		<% } %>
	<% } %> 
	
	<% if(endPage!=totalPage) { %>
		<a href="<%=request.getContextPath()%>/index.jsp?vaho=qna&studio=qna_list&pageNum=<%=startPage+blockSize%>&search=<%=search%>&keyword=<%=keyword%>">&gt;</a>
		<a href="<%=request.getContextPath()%>/index.jsp?vaho=qna&studio=qna_list&pageNum=<%=totalPage%>&search=<%=search%>&keyword=<%=keyword%>">&gt;&gt;</a>
	<% } else { %>
		&gt;&nbsp;&gt;&gt;	
	<% } %>
	</div>
	<div>&nbsp;</div>
	

</div>
<script type="text/javascript">


function postlocation(){
	location.href="<%=request.getContextPath()%>/index.jsp?vaho=qna&studio=qna_write";
}
</script>


















