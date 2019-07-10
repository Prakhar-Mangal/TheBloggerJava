<%-- 
    Document   : allUsers
    Created on : 26 Mar, 2019, 9:05:53 PM
    Author     : prakhar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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

    <title>All Users</title>
  </head>
  <body class="blue">
   <%
       String uname1= (String)session.getAttribute("uname");
       if(uname1==null){
                response.sendRedirect("index.html");
            }
            int i=1;
            Class.forName("com.mysql.jdbc.Driver");
            
            String cs="jdbc:mysql://localhost:3306/blogger?autoReconnect=true&useSSL=false";
            Connection con=(Connection) DriverManager.getConnection(cs,"root","root");
           PreparedStatement ps=con.prepareStatement("select * from users");
            ResultSet rs=ps.executeQuery();
        %>
       
     <div class="p-3 mb-2 bg-primary text-white text-center container">All Users</div>
   
    <div class="bd-example">
  <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
    
    <div class="carousel-inner">
        <% while(rs.next()){
           String uname=rs.getString(1);
           ResultSet q,a;
           int qi=0,ai=0;
            
           PreparedStatement ps1=con.prepareStatement("select * from question where uname=?");
            PreparedStatement ps2=con.prepareStatement("select * from answer where uname=?");
          ps1.setString(1, uname);
          ps2.setString(1, uname);
            q=ps1.executeQuery();
            a=ps2.executeQuery();
            while(q.next())
                qi++;
            
            while(a.next())
                ai++;
            
          if(i==1){
              i++;
          
        %>
      <div class="carousel-item active" data-interval="200">
        <div class="card container p-3  bg-warning text-white" style="width: 18rem;">
  <div class="card-body">
    <h5 class="card-title p-3  bg-success text-white"><%=uname%></h5>
  </div>
  <ul class="list-group list-group-flush p-3  bg-warning text-dark">
      <li class="list-group-item p-3  bg-dark text-white">Question Asked : <%=qi%></li>
    <li class="list-group-item p-3  bg-dark text-white">Answers Given : <%=ai%></li>
  </ul>
  <div class="card-body">
  </div>
</div>
        
      </div>
      <%} else {%>
      <div class="carousel-item"  data-interval="200">
        <div class="card container p-3  bg-warning text-white" style="width: 18rem;">
  <div class="card-body">
    <h5 class="card-title p-3  bg-success text-white"><%=uname%></h5>
  </div>
  <ul class="list-group list-group-flush p-3  bg-warning text-dark">
      <li class="list-group-item p-3  bg-dark text-white">Question Asked : <%=qi%></li>
    <li class="list-group-item p-3  bg-dark text-white">Answers Given : <%=ai%></li>
  </ul>
  <div class="card-body">
    
  </div>
</div>
        
      </div>
  <%} }%>
      
    </div>
    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
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
