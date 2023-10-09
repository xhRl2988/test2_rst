<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db_connect.jsp" %>
<%
	String sql="select * from tbl_class_202201";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>지역구의원투표 프로그램</title>	
	<link rel="stylesheet" type="text/css"href="css/style.css?ver1.1.1.8">
	<script type="text/javascript">
			function checkValue(){
				var cv = document.data;
				
				if(!cv.reskst_month.value){
					alert("수강월이 입력되지 않았습니다!")
					cv.reskst_month.focus();
					return false;
				}
				if(!cv.c_name.value){
					alert("회원명이 선택되지 않았습니다!")
					cv.c_name.focus();
					return false;
				}
				if(!cv.v_area.value){
					alert("강의장소가 입력되지 않았습니다!")
					cv.v_area.focus();
					return false;
				}
				if(!cv.teacher_code.value){
					alert("강의명이 선택되지 않았습니다!")
					cv.teacher_code.focus();
					return false;
				}
			}
			function checkReset(){
				location.href="join.jsp";
				alert("정보를 지우고 처음부터 다시 입력합니다!");
		}


		</script>
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	<main id=section>
		<h2 class="title">투표하기</h2>
			<form name="data" action="join_p.jsp" method="post" onsubmit="return checkValue()">
		<table class="table_line">
			<tr>
				<th>수강월</th>
				<td><input type="text" name="reskst_month" size="20" autofocus>2022년03월 예)202203ㅤㅤㅤㅤㅤㅤ</td>
			</tr>
			<tr>
				<th>회원명</th>
                <td>
                	<select name="c_name" id="c_name">
                	<option value="">회원명</option>
                		<% sql = "select c_no,c_name from tbl_member_202201";
                   		 pstmt=conn.prepareStatement(sql);
                    	 rs =  pstmt.executeQuery();
                       	while(rs.next()) {
                    	%>
                   	 	<option value=<%=rs.getString("c_no") %>><%=rs.getString("c_name") %>
                    	<% } %>
                   	</select>
            	</td>
            </tr>
			<tr>
				<th>회원번호</th>
				<td><input type="text" name="c_no" size="20" autofocus></td>
			</tr>
			
			<tr>
				<th>강의장소</th>
				<td><input type="text" name="v_area" size="20" autofocus> </td>
			</tr>
			<tr>
				<th>강의명</th>
				 <td>
                	<select name=teacher_code id="teacher_code">
                	<option value="">강의신청</option>
                		<% sql = "select class_name,teacher_code from tbl_teacher_202201";
                   		 pstmt=conn.prepareStatement(sql);
                    	 rs =  pstmt.executeQuery();
                       	while(rs.next()) {
                    	%>
                   	 	<option value=<%=rs.getString("teacher_code") %>><%=rs.getString("class_name") %>
                    	<% } %>
                   	</select>
            	</td>
			</tr>
			<tr>
				<th>수강료</th>
				<td><input type="text" name="v_area" size="20" autofocus>원 </td>
			</tr>
			
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수강신청">
					<input type="button"  value="다시쓰기" onclick="checkReset();">
					<input type="button"  value="강사조회" onclick="location.href='member_list.jsp'">
				</td>
			</tr>
		</table>
		</form>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>