<%@page import="java.util.ArrayList"%>
<%@page import="dbconnection.Mainclass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exam</title>
</head>
<body>
	<%
	Mainclass mc = new Mainclass();
	ArrayList arr = new ArrayList();
	arr = mc.getData();
	%>
	<h1 style="text-align: center;">
		<u>XYZ Super Market</u>
	</h1>
	<br>
	<table style="width: 98%;">
		<tr>
			<td>

				<table>
					<tr>
						<td><a href="Add.jsp">Add</a></td>
						<td><a href="view.jsp">View</a></td>
					</tr>
				</table>

			</td>
		</tr>
		<tr>
			<td align="center">
				<div id="view" style="border: solid 1px;">
					<table border="1">
						<thead>
							<tr>
								<th>Sl.No</th>
								<th>Customer Name</th>
								<th>Phone Number</th>
								<th>Date</th>
								<th>Item</th>
								<th>Mfg Date</th>
								<th>Exp date</th>
								<th>Nos</th>
								<th>Payment Mode</th>
							</tr>
						</thead>
						<tbody>
							<%
							for (int i = 0; i < arr.size(); i++) {
								ArrayList temp = (ArrayList) arr.get(i);
							%>
							<tr>
								<td><%=i + 1%></td>
								<td><%=temp.get(0)%></td>
								<td><%=temp.get(1)%></td>
								<td><%=temp.get(2)%></td>
								<td><%=temp.get(3)%></td>
								<td><%=temp.get(4)%></td>
								<td><%=temp.get(5)%></td>
								<td><%=temp.get(6)%></td>
								<td><%=temp.get(7)%></td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>