<%@page import="com.air.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
	request.setCharacterEncoding("UTF-8");

	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	%>
	<jsp:useBean id="mb" class="com.air.member.MemberBean"/>
	<jsp:setProperty property="*" name="mb"/>
	<%
	System.out.println("삭제할 정보 : " + mb);

	MemberDAO mdao = new MemberDAO();
	
	
	int check = mdao.deleteMember(id,pass);
 	
	System.out.println("check : " +check);
	
	if(check == 1){
		%>
		<script type="text/javascript">
		alert("정보 삭제 완료");
		history.back();
		</script>
		<%
	}else if(check == 0){
		System.out.println("비밀 번호 오류 !");
		%>
		<script type="text/javascript">
		alert("비밀 번호 오류 !");
		history.back();
		</script>
		<%
	}else {
		System.out.println("아이디 없음 !");
		%>
		<script type="text/javascript">
		alert("아이디 없음 !");
		history.back();
		</script>	
		<%	
	}
	
	%>
</body>
</html>