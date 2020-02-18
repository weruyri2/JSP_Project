<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/left.css" rel="stylesheet">
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	
	String id = (String)session.getAttribute("id");
	
	System.out.println("세션 값"+id);
	
	if(id==null){
		id = "";
	}
	
%>

<div class="left">
<div class="list">
<ul class="ul">
	<li><a href="../member/memain.jsp" >메인</a></li>
	<li><a href="../member/res_info.jsp" >항공권 예약확인</a></li>
	<li><a href="../member/infoForm.jsp" >회원 정보 조회</a></li>
	<li><a href="../member/updateForm.jsp" >회원 정보 수정</a></li>
	<li><a href="../member/deleteForm.jsp" >회원 정보 탈퇴</a></li>
	
	<%if(id.equals("admin")) { %>
	<li><a href="../member/meList.jsp">회원 리스트</a></li>	
<%} %>		
</ul>
</div>
</div>



</body>
</html>