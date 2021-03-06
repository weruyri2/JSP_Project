<%@page import="com.air.airplane.AirplaneBean"%>
<%@page import="com.air.airplane.AirplaneDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/infoForm.css" rel="stylesheet">
</head>
<body>
<div id="map">
  <%
	request.setCharacterEncoding("UTF-8");
	
	String id = (String)session.getAttribute("id");

	if(!(id.equals("admin"))) {
		response.sendRedirect("../main/main.jsp");
	}

  	String airname = request.getParameter("airname");
     
     
     AirplaneDAO adao = new AirplaneDAO();

     AirplaneBean ab = adao.getAirPlane(airname);
     
  %>
  
<jsp:include page="../inc/top.jsp"/>

<div class="main">

<jsp:include page="../inc/air_leftside.jsp" />

<div class="content">

<p>운항 일정 수정</p>
    
    <form action="air_updatePro.jsp" method="post">
	 <table id="customers"> 	
	 	<tr>
	 	<td>비행기명  </td> <td><input type="text" name="airname" value="<%=ab.getAirname() %>" readonly> </td>
	 	</tr>
	 	<tr>
	 	<td>출발지 </td> <td><input type="text" name="depart" value="<%=ab.getDepart() %>" > </td>
	 	</tr>
	 	<tr>
	 	<td>목적지 </td> <td><input type="text" name="arrive" value="<%=ab.getArrive() %>"> </td>
	 	</tr>
	 	<tr>
	 	<td>좌석 수 </td> <td><input type="text" name="seat" value="<%=ab.getSeat() %>"> </td>
	 	</tr>
	 	<tr>
	 	<td>출발 일 </td> <td><input type="date" name="start" value="2020-02-01" > </td>
	 	</tr>
	 	<tr>
	 	<td>도착 일 </td> <td><input type="date" name="end" value="2020-02-21" > </td>
	 	</tr>
	 	

	 	<tr>
	 	<td colspan="2" align="center"><input type="submit" value="수정하기"></td>
	 	</tr>
	 
	 </table>
	</form>

</div>
  
</div>
 </div>
</body>
</html>