<%@page import="com.air.board.CometBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.air.board.CometDAO"%>
<%@page import="com.air.board.BoardBean"%>
<%@page import="com.air.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/table.css" rel="stylesheet">
</head>
<body>
<div id="map">
<%
//*페이지 이동시 전달되는 파라미터값 있을경우 항상 먼저 저장(처리)해야한다.
//~/content.jsp?num=5&pageNum=2
//파라미터값 저장 num(int), pageNum(String)

		request.setCharacterEncoding("utf-8");
		
		String id = (String)session.getAttribute("id");	

int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");

//DB 처리 객체 BoardDAO 생성
BoardDAO bdao = new BoardDAO();

//게시판 글의 조회수를 1증가
bdao.updateReadCount(num);

BoardBean bb = bdao.getBoard(num);
//num에 해당하는 글정보를 가져오는 메서드

		
		String conPath = request.getContextPath()+"/upload";
		
		System.out.println(conPath);		
		
		String imgPath = conPath+"\\"+bb.getFile();

%>

<jsp:include page="../inc/top.jsp"/>

<div class="main">	

<jsp:include page="../inc/bo_leftside.jsp" />

<div class="content">
<p>게시글</p>

	<table border="1" id="customers">
	<tr>
	  <td>글번호</td><td><%=bb.getNum() %></td>
	  <td>글 제목</td><td colspan="3"><%=bb.getSubject() %></td>
	</tr>
	<tr>
	  <td>글쓴이</td><td><%=bb.getName() %></td>
	  <td>작성일</td><td><%=bb.getDate() %></td>
	  <td>조회수</td><td><%=bb.getReadcount() %></td>
	</tr>	
	<tr>
	<td>첨부파일</td><td colspan="5"><a href="file_down.jsp?file_name=<%=bb.getFile()%>"><%=bb.getFile()%></a></td>
	</tr>
	
	</table>
	
	<table border="1" id="customers">
	
	
	<tr>
	<td width="20" rowspan="2">내용</td>
	<%if(bb.getFile()!=null){%>
	<td colspan="5" align="char" height="auto">
	<img src="<%=imgPath%>" width=750 height=400>
	<%} %>
	</td>
	</tr>
	<tr>	
	<td class="text" colspan="5" align="char" height="auto" style="word-break:break-all;" valign="top" >
	<%=bb.getContent() %></td>


	</tr>
	
	</table>
	
	<table border="1" id="customers">
	
	<tr>
	<td class="name">작성자</td>
	<td class="sub">댓글</td>
	</tr>
	<%
		int board_num = bb.getNum();
	
		CometDAO cdao = new CometDAO();
		
		ArrayList<CometBean> cometList = cdao.cometList(board_num);
		
		if(cometList != null) {
			for(int i=0; i<cometList.size(); i++){
				CometBean cb = (CometBean)cometList.get(i);
	
	%>
	<tr>
	<td class="name"><%=cb.getId()%></td>
	<td class="sub"><%=cb.getContent()%></td>
	</tr>
	
	<%	} 
	}%>
	</table>
		
	<form action="cometPro.jsp" method="post">
	<table class="tab">
	 <tr>
	 <td class="com1" 	align="center">
	 <p>Comment</p>
	 </td>
	 <td class="com2">
	 <input type="submit" value="댓글쓰기" >
	 <textarea rows="10" cols="20" name="content"></textarea>
	 	<input type="hidden" name="board_num" value="<%=bb.getNum()%>">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
	</td>
	</tr>
	
		
	</table>
	</form>	
	
	<table border="1" id="customers">
	
	<tr>
	<td colspan="6" align="right">
		<input type="button" value="수정하기" 
			onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>';"
			>
		<input type="button" value="삭제하기"
			onclick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>';"
			>
		<input type="button" value="목록보기" 
		onclick="location.href='boardList.jsp?pageNum=<%=pageNum%>';">
		</td>
	</tr>
	
</table>
	
	</div>
	
</div>

</div>
	
</body>
</html>