<%@ page language="java" contentType="text/html; charset=ISO-8859-1"     
pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %> 
 <!DOCTYPE html> 
 <html> 
 <head> 
 <meta charset="ISO-8859-1"> 
 <title>Insert title here</title> 
 </head> 
 <style>
body, html {
  height: 100%;
}

* {
  box-sizing: border-box;
}



/* Add styles to the form container */
.container {
  position: absolute;
  right: 0;
  margin: 20px;
  max-width: 350px;
  padding: 16px;
  background-color: white;
}

/* Full-width input fields */
  input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit button */
.btn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}
.btn1{
  background-color: #4CAF50;
  color: white;
  padding: 8px 10px;
  border: none;
  cursor: pointer;
  width: 20%;
  opacity: 0.9;
}

.btn:hover {
  opacity: 1;
}
</style>
 <body bgcolor="#E6E6FA"> 
 <% String url = "jdbc:mysql://localhost:3306/bank";
 String username = "root"; 
 String password = "root"; 
Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection(url,username,password); 
  Statement st = con.createStatement();  
  String userid=request.getParameter("userid");
  String psw=request.getParameter("psw");%>
  
 
    <% 

  String s="SELECT * FROM customers WHERE userid='"+userid+"' AND pass='"+psw+"' ";
  ResultSet rs = st.executeQuery(s);
  int i=1;
  %>
  <% 
  if(rs.next()) 
      {
      %>
      <B> ACCOUNT HOLDER : <% out.println(rs.getString("name1"));%></B>
       <br><br>
      <B> ACCOUNT BALANCE : <% out.println(rs.getInt("balance"));%></B>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
       <br><br>
       <form method="get" action="login1.jsp" > 
       <button type="submit" class="btn1">LOGOUT</button>
       </form>
       
<div class="bg-img">
  <form method="get" action="transfer.jsp" class="container">
    <h1>Funds Transfer</h1>
    

    <label for="amount"><b>Amount</b></label>
    <input type="text" placeholder="Enter amount" name="amount" required><br><br>

    <label for=""><b>Account No </b></label>
    <input type="text" placeholder="Enter account no" name="id" required><br><br>
    
    <label for=""><b>Description </b></label>
    <input type="text" placeholder="(optional)" name="id" required><br><br>

    <button id="sai" type="submit" class="btn">transfer</button>
  </form>
 <% String name=request.getParameter("userid"); 

   session.setAttribute("key",name) ; %>
</div>
       
      <B> <h3> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;TRANSACTIONS </h3></B>
     <B>  S.NO&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;TRANSACTION ID&emsp;&emsp;&emsp;&emsp;&emsp;DESCRIPTION&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;AMOUNT&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;TYPE</B><br><br>
       <%out.println(i); i=i+1;%>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<%out.println(rs.getString("trans1")); %>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<%out.println(rs.getString("des1"));%>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<%out.println(rs.getInt("am1"));%>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<%out.println(rs.getString("ty1"));%><br>
       <%out.println(i); i=i+1;%>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<%out.println(rs.getString("trans2")); %>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<%out.println(rs.getString("des2"));%>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;&nbsp;<%out.println(rs.getInt("am2"));%>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<%out.println(rs.getString("ty2"));%><br>
       <%out.println(i); i=i+1;%>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<%out.println(rs.getString("trans3")); %>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<%out.println(rs.getString("des3"));%>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;<%out.println(rs.getInt("am3"));%>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<%out.println(rs.getString("ty3"));%><br>
       <%out.println(i); i=i+1;%>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<%out.println(rs.getString("trans4")); %>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<%out.println(rs.getString("des4"));%>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<%out.println(rs.getInt("am4"));%>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<%out.println(rs.getString("ty4"));%><br>
       <%out.println(i); i=i+1;%>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<%out.println(rs.getString("trans5")); %>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<%out.println(rs.getString("des5"));%>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;&nbsp;&nbsp;<%out.println(rs.getInt("am5"));%>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;<%out.println(rs.getString("ty5"));%><br>
       <% 
       }
       
   else {
     %>
      WRONG CREDENTIALS... <a href="login1.jsp">CLICK HERE</a> TO LOGIN
       
       <% } %>
   

  

</body>
</html>