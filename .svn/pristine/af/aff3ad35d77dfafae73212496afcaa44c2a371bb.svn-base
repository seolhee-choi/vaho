<%@page import="site.itwill.dao.CustomerDAO"%>
<%@page import="site.itwill.dto.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equals("GET")){
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=error&studio=error400';");
		out.println("</script>");
		return;
		}
		
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	CustomerDTO customer = CustomerDAO.getDAO().selectCustomer(email);
	
	if(customer == null){
		session.setAttribute("message", "입력한 아이디가 존재하지 않습니다.");
		session.setAttribute("email",email);
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=member&studio=login';");
		out.println("</script>");
		return;
	}
	
	if(!customer.getPassword().equals(password)){
		session.setAttribute("message", "입력한 이메일이 없거나 비밀번호가 틀렸습니다.");
		session.setAttribute("email",email);
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=member&studio=login';");
		out.println("</script>");
		return;
	}
	
	//마지막 로그인 날짜갱신 메소드 호출
	CustomerDAO.getDAO().updateLastDate(customer);
	
	session.setAttribute("loginCustomer", CustomerDAO.getDAO().selectCustomer(email));
	
	String url=(String)session.getAttribute("url");//세션에 저장된 기존 요청페이지를 반환받아 저장
	if(url==null) {//기존 요청페이지가 없는 경우 - 메인페이지 이동
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=member&studio=main';");
		out.println("</script>");
	} else {//기존 요청페이지가 있는 경우 - 요청페이지 이동
		session.removeAttribute("url");
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+url+"';");
		out.println("</script>");
	}
	


%>