<%-- 
    Document   : AnsweredQuestion
    Created on : 25 Mar, 2019, 2:07:31 AM
    Author     : prakhar
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style>.blue{
    background-color: #44e5b2;
  }</style>
    <title>AnweredQuestion</title>
    <%
            int i=0;
            Class.forName("com.mysql.jdbc.Driver");
            String uname=(String)session.getAttribute("uname");
            if(uname==null){
                response.sendRedirect("index.html");
            }
            String cs="jdbc:mysql://localhost:3306/blogger?autoReconnect=true&useSSL=false";
            Connection con=(Connection) DriverManager.getConnection(cs,"root","root");
           PreparedStatement ps1=con.prepareStatement("select * from question where uname=?");
           ps1.setString(1, uname);
            ResultSet rs1=ps1.executeQuery();
        %>
  </head>
  <body class="blue">
    <div class="container mt-3">
    <span class="badge badge-danger container"><h2><%=uname%></h2></span>
    <% while(rs1.next()){%>
    <div class=" row">
    <div class="container col-auto breadcrumb">
      <h4>Q<%=(++i)%>. <%= rs1.getString(2) %></h4>
    </div>
 <%
        int j=0;
        int qid=rs1.getInt(1);
    PreparedStatement ps2=con.prepareStatement("select * from answer where qid=?");
           ps2.setInt(1, qid);
            ResultSet rs2=ps2.executeQuery();
            %> 
    </div>
    <% while(rs2.next()){%>
    <div class="row ">
    <div class="container col-auto breadcrumb">
     <h4>Ans<%=(++j)%>. <%= rs2.getString(3) %></h4>
    </div>
      </div>
    <%}%>
      <hr class="text-primary divider">
     <%}%>
     <div class="container">
        <form action="Logout" method="get">
        <input type="submit" value="Logout" class="btn btn-outline-dark btn-lg btn-block">
        </form>
    </div>
    </div>
<footer class="blockquote-footer">copyright © 2019  <cite title="Source Title">PM</cite></footer>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>
