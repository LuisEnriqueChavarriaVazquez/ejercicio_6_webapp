<%-- 
    Document   : eliminarUsuarios
    Created on : 6/12/2020, 09:02:57 AM
    Author     : Luis Enrique
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    Connection cnx = null;
    Statement sta = null;
    ResultSet rs = null;
    
    String cod = request.getParameter("cod");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        cnx = DriverManager.getConnection("jdbc:mysql://us-cdbr-east-02.cleardb.com/heroku_b1f36675180c036?user=bcbdb711ea320c&password=2efa6260");
        sta = cnx.createStatement();
        sta.executeUpdate("delete from usuario where idUsuario = '"+cod+"'");
        request.getRequestDispatcher("despliegueUsuarios.jsp").forward(request,response);
        sta.close();
        rs.close();
        cnx.close();

    } catch (Exception e) {
        out.print("Fallo" + e);
    }
%>