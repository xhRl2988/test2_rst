<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="layout/db_connect.jsp" %>
<%
		String sql="select teacher_code code, teacher_name t_name, class_name c_name, "
		+" to_char(class_price,'999,999') price, "
		+" substr(teach_resist_date,1,4)||'년'||substr(teach_resist_date,5,2)||'월'||substr(teach_resist_date,7,2)||'일'  trd"
		+" from tbl_teacher_202201";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>골프연습장 회원관리 프로그램</title>
	<link rel="stylesheet" href="css/style.css?ver1.1.4">
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	<main id="section">
		<h2 class="title">강사조회</h2>
			<table class="table_line">
				<tr>
					<th>강사코드</th>
					<th>강사명</th>
					<th>강의명</th>
					<th>수강료</th>
					<th>강사자격취득일</th>
				</tr>
				<%
				while(rs.next()){
				%>
				<tr align="center">
					<td><%=rs.getString("code") %></td>
					<td><%=rs.getString("t_name") %></td>
					<td><%=rs.getString("c_name") %></td>
					<td>￦<%=rs.getString("price") %></td>
					<td><%=rs.getString("trd") %></td>
				</tr>
				<%} %>
				
			</table>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>