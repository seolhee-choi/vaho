<%@page import="site.itwill.dao.CustomerDAO"%>
<%@page import="site.itwill.dto.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//비정상적인 요청에 대한 응답
	if(request.getMethod().equals("GET")){
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=error&studio=error400';");
		out.println("</script>");
		return;
	}
	//전달값을 받아 저장
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	String name = request.getParameter("name");
	

	//DTO 클래스 클래스로 인스턴스를 생성하여 전달값으로 필드값 변경
	CustomerDTO customer = new CustomerDTO();
	customer.setEmail(email);
	customer.setPassword(password);
	customer.setName(name);
	
	if(CustomerDAO.getDAO().selectCustomer(email)!=null){
		session.setAttribute("message", "중복된 이메일입니다.");
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=member&studio=login_join';");
		out.println("</script>");
		return;
	}
	
	//DTO 인스턴스를 전달하여 Customer 테이블에 삽입하는 DAO 클래스의 메소드 호출
	CustomerDAO.getDAO().insertCustomer(customer);
	
	session.invalidate();
	
	//로그인 페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("alert('회원가입이 되셨습니다.')");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?vaho=member&studio=login';");
	out.println("</script>");
	
%>