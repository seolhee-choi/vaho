<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    request.setCharacterEncoding("utf-8");
    String vaho = request.getParameter("vaho");
    if(vaho==null) vaho="member";
    
    String studio =request.getParameter("studio");
    if(studio==null) studio="main";
    
    String headerPath="header.jsp";
    if(vaho.equals("admin")){
    	headerPath="admin/header.jsp";
    }
   
    String contentPath=vaho+"/"+studio+".jsp";
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/information.js"></script>
<link href="<%=request.getContextPath()%>/CSS/hnf.css" style="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/CSS/main.css" style="text/css" rel="stylesheet">
<meta charset="UTF-8">
<title>vaho studio</title>
</head>
<body>
<div>
	<jsp:include page="<%= headerPath %>"/>
</div>
<div>
	<jsp:include page="<%= contentPath %>"/>
</div>
<div>
	<jsp:include page="footer.jsp"/>
</div>

</body>
</html>