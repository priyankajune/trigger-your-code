<%@page import="code.dao.UserDao"%>
<%@page import="code.util.DatabaseConnection"%>
<%@page import="java.sql.*"%>
<%@page import="code.model.User"%>
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
	UserDao user=new UserDao();	
	User u=new User();
	String username=request.getParameter("username");
	u.setUsername(username);

	session.setAttribute("username", username);
	String password=request.getParameter("password");
	u.setPassword(password);

	
	if(user.checkUser(u)){
		session.setAttribute("session", "TRUE");
		String sql="select page from user where username='"+username+"'";
		Connection connection = DatabaseConnection.getConnection();
    	Statement st = connection.createStatement();
    	ResultSet rs = st.executeQuery(sql);
    	String pagename=null;
    	while(rs.next()) {
    		pagename=rs.getString("page");
    	}
		response.sendRedirect(pagename);
	}
	else
		response.sendRedirect("login.html");
		
		
%>
</body>
</html>