<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="layout/db_connect.jsp" %>
<%
		String sql="select a.teacher_code code, a.class_name c_name, a.teacher_name t_name, "
				+" sum(to_char(b.tuition,'999,999')) tuition "
				+" from tbl_teacher_202201 a, tbl_class_202201 b "
				+" where a.teacher_code=b.teacher_code "
				+" group by a.teacher_code, a.class_name, a.teacher_name, b.tuition "
				+" order by a.teacher_code";
		
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
					<th>강의명</th>
					<th>강사명</th>
					<th>총매출</th>
				</tr>
				<%
				while(rs.next()){
				%>
				<tr align="center">
					<td><%=rs.getString("code") %></td>
					<td><%=rs.getString("c_name") %></td>
					<td><%=rs.getString("t_name") %></td>
					<td>￦<%=rs.getString("tuition") %></td>
				</tr>
				<%} %>
				
			</table>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>