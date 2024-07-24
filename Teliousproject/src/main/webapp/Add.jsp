<%@page import="dbconnection.Mainclass"%>
<%@page import="java.util.ArrayList"%>
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
	ArrayList arr = mc.getComboVals();
	ArrayList itemIds = (ArrayList) arr.get(0);
	ArrayList itemNames = (ArrayList) arr.get(1);

	ArrayList payIds = (ArrayList) arr.get(2);
	ArrayList payNames = (ArrayList) arr.get(3);
	%>
	<form action="process.jsp">
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
					<div id="add" style="border: solid 1px;">
						<table>
							<tr>
								<td>Name Of Customer :</td>
								<td><input type="text" name="custName" required></td>
							</tr>
							<tr>
								<td>Phone No :</td>
								<td><input type="text" name="phoneNo" required></td>
							</tr>
							<tr>
								<td>Date :</td>
								<td><input type="date" name="entDate" required></td>
							</tr>
							<tr>
								<td>Items :</td>
								<td><select name="item">
										<%
										for (int i = 0; i < itemIds.size(); i++) {
										%>
										<option value="<%=itemIds.get(i)%>"><%=itemNames.get(i)%></option>
										<%
										}
										%>

								</select></td>
							</tr>
							<tr>
								<td>Item Nos :</td>
								<td><input type="number" name="nos" min="0" required></td> <!-- Added min attribute here -->
							</tr>
							<tr>
								<td>Payment :</td>
								<td><select name="pay">
										<%
										for (int i = 0; i < payIds.size(); i++) {
										%>
										<option value="<%=payIds.get(i)%>"><%=payNames.get(i)%></option>
										<%
										}
										%>
								</select></td>
							</tr>
							<tr style="height: 10px;">

							</tr>
							<tr>
								<td align="right"><input type="submit" value="Save"></td>
								<td><input type="reset" value="Cancel"></td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
