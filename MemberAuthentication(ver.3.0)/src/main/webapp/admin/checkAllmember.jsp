<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.List"%>
<%@ page import="dataControl.about.member.DAO"%>
<%@ page import="dataControl.about.member.DTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
</head>
<body>
	<h1>Member List</h1>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Password</th>
				<th>Identity Number</th>
				<th>Phone Number</th>
				<th>Email</th>
				<th>Postal Code</th>
				<th>Address</th>
				<th>Detail Address</th>
				<th>Jibun Address</th>
				<th>Extra Address</th>
				<th>Grade</th>
				<th>Status</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<% List<DTO> memberList = (List<DTO>) request.getAttribute("memberList"); %>
			<% for (DTO dto : memberList) { %>
			<tr>
				<td><%= dto.getId() %></td>
				<td><%= dto.getName() %></td>
				<td><%= dto.getPassword() %></td>
				<td><%= dto.getIdentityNum() %></td>
				<td><%= dto.getPhoneNum() %></td>
				<td><%= dto.getEmail() %></td>
				<td><%= dto.getPostalCode() %></td>
				<td><%= dto.getAddress() %></td>
				<td><%= dto.getDetailAddress() %></td>
				<td><%= dto.getJibunAddress() %></td>
				<td><%= dto.getExtraAddress() %></td>
				<td><%= dto.getGrade() %></td>
				<td><%= dto.getStatus() %></td>

				<td>
					<form action="manageMemberInput.bank" method="post">
						<input type="hidden" name="loggedInId" value="<%= dto.getId() %>">
						<button type="submit">Edit</button>
					</form>
				</td>
				<% } %>
			
		</tbody>
	</table>
</body>
</html>
