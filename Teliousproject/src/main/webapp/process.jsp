<%@page import="dbconnection.Mainclass"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Mainclass mc = new Mainclass();

	String custName = request.getParameter("custName");
	String phoneNo = request.getParameter("phoneNo");
	String entDate = request.getParameter("entDate");
	String item = request.getParameter("item");
	String nos = request.getParameter("nos");
	String pay = request.getParameter("pay");

	/* System.out.println("custName = "+custName);
	System.out.println("phoneNo = "+phoneNo);
	System.out.println("entDate = "+entDate);
	System.out.println("item = "+item);
	System.out.println("nos = "+nos);
	System.out.println("pay = "+pay); */

	int save = mc.save(custName, phoneNo, entDate, item, nos, pay);
	if(save==1)
		response.sendRedirect("Add.jsp");
	%>
</body>
</html>