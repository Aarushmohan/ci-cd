<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("userName");   
    String password = request.getParameter("password");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://db:3306/testdb1",
            "testuser", "root");
    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into USER(first_name, last_name, email, username, password, regdate) values ('" + firstName + "','"
    + lastName + "','" + email + "','" + userName + "','" + password + "', CURDATE())");
    if (i > 0) {
        response.sendRedirect("welcome.jsp");
        
    } else {
        response.sendRedirect("index.jsp");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Your XSLT Here</title>
    </head>
    <body>
        <p>
            helloworld
        </p>
        <form action="../AdminServlet">
            URL <input type="text" name="txtUrl" value="" /><br/>
            Start Promotion <input type="text" name="txtStart" value="" /><br/>
            Produt Name <input type="text" name="txtProductName" value="" /><br/>
            <input type="submit" value="View" name="action" />
        </form>
        <c:if test="${not empty requestScope.website}">
            <div>
                ${requestScope.website}
            </div>
        </c:if>
    </body>
</html>
