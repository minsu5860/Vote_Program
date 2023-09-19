<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="layout/dbconnect.jsp" %>
    <%
    	String sql = "select a.m_no 후보번호, a.m_name 성명, "
	    		   +  "b.p_name 소속정당,"
	    		   +  "decode(a.p_school, '1','고졸','2','학사','3','석사',4,'박사') 학력, "
	    		   +  "substr(m_jumin, 1, 6) ||'-'|| substr(m_jumin, 6, 13) 주민번호, "
	    		   +  "m_city 지역구, "
	    		   +  "b.p_tell1 ||'-'|| b.p_tell2 ||'-'|| b.p_tell3 대표전화 "
	    		   +  "from tbl_member_202005 a, tbl_party_202005 b "
	    		   +  "where a.p_code = b.p_code "
	    		   +  "order by m_no";
    
    PreparedStatement pstmt = conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();  
     %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="css/style.css?ver1.1.1">
	</head>
	<body>
		<header>
			<jsp:include page="./layout/header.jsp"></jsp:include>		
		</header>
		<nav>
			<jsp:include page="./layout/nav.jsp"></jsp:include>
		</nav>
		<main id="section">
			<h2 class="title">후보조회</h2>
			<table class="table_line">
				
				<tr align="center">
				
					<th>후보번호</th>
					<th>성명</th>
					<th>소속정당</th>
					<th>학력</th>
					<th>주민번호</th>
					<th>지역구</th>
					<th>대표전화</th>
				
				</tr>
				
				<% while(rs.next()) { %>
				<tr align="center">
					<td><%= rs.getString("후보번호") %></td>
					<td><%= rs.getString("성명") %></td>
					<td><%= rs.getString("소속정당") %></td>
					<td><%= rs.getString("학력") %></td>
					<td><%= rs.getString("주민번호") %></td>
					<td><%= rs.getString("지역구") %></td>
					<td><%= rs.getString("대표전화") %></td>
				</tr>
				<% } %>
			</table>
		</main>
		<footer>
			<jsp:include page="./layout/footer.jsp"></jsp:include>
		</footer>
	</body>
</html>