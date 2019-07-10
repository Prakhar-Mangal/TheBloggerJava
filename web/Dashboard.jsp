<%-- 
    Document   : Dashboard
    Created on : 22 Mar, 2019, 9:40:27 PM
    Author     : prakhar
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
      <%  
          response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
            response.setHeader("Pragma","no-cache");//HTTP 1.0
            response.setHeader("Expires","0");//proxies
          String uname=(String)session.getAttribute("uname");
          if(uname==null){
                response.sendRedirect("index.html");
            }
      %>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
     <style>.blue{
    background-color: #44e5b2;
  }</style>
    <title>Users</title>
    <%
           ResultSet q,a;
           int qi=0,ai=0;
            Class.forName("com.mysql.jdbc.Driver");
            String cs="jdbc:mysql://localhost:3306/blogger?autoReconnect=true&useSSL=false";
            Connection con=(Connection) DriverManager.getConnection(cs,"root","root");
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
        %>
  </head>
  <body class="blue">
    
  <div class="container mt-3">
      <span class="badge badge-danger container"><h2><%=uname%></h2></span>
  <div class="accordion" id="accordionExample">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h2 class="mb-0">
        <button class="btn btn-link container" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
          Ask Questions
        </button>
      </h2>
    </div>

    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
      <form action="Question">
<!--          <input type="hidden" name="uname" value=  >-->
  <div class="form-group"> <!-- Question field -->
    <textarea class="form-control" cols="25" id="message" name="que" rows="10"></textarea>
  </div>
  
  <div class="form-group">
    <button class="btn btn-primary container"  type="submit">Submit</button>
  </div>
  
</form>             
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingTwo">
      <h2 class="mb-0">
          <a href="QuestionAnswer.jsp"><button class="btn btn-link collapsed container" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          Give Answers for Questions
            </button></a>
      </h2>
    </div>
    
  </div>
  <div class="card">
    <div class="card-header" id="headingThree">
      <h2 class="mb-0">
        <a href="AnsweredQuestion.jsp"><button class="btn btn-link collapsed container" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          Check your questions here
            </button></a>
      </h2>
    </div>
   
  </div>
          <div class="card">
    <div class="card-header" id="headingThree">
      <h2 class="mb-0">
        <a href="AnswersByUsers.jsp"><button class="btn btn-link collapsed container" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          Check Answers given by you
            </button></a>
      </h2>
    </div>
   
  </div>
</div>
      <div class="card container p-3  bg-warning text-white" style="width: 18rem;">
  <div class="card-body">
    <h5 class="card-title p-3  bg-success text-white"><%=uname%></h5>
  </div>
  <ul class="list-group list-group-flush p-3  bg-warning text-dark">
      <li class="list-group-item p-3  bg-dark text-white">Question Asked : <%=qi%></li>
    <li class="list-group-item p-3  bg-dark text-white">Answers Given : <%=ai%></li>
  </ul>
  <div class="card-body">
    <a href="allUsers.jsp" class="card-link text-danger">Click here to see all users</a>
  </div>
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
