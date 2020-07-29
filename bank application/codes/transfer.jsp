<%@ page language="java" contentType="text/html; charset=ISO-8859-1"     
pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %> 
 <!DOCTYPE html> 
 <html> 
 <head> 
 <meta charset="ISO-8859-1"> 
 <title>Insert title here</title> 
 </head> 
 <body bgcolor="#E6E6FA"> 
 <% 
 String url = "jdbc:mysql://localhost:3306/bank";
 String username = "root"; 
 String password = "root"; 
 String na=(String)session.getAttribute("key");
 
Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection(url,username,password); 
  Statement st = con.createStatement();  
  Statement st1=con.createStatement();
  String accountid=request.getParameter("id");
  String amount1=request.getParameter("amount");
  int m1=Integer.parseInt(amount1);
  int am1;
  int acc1=Integer.parseInt(accountid);
  int ba;

 
		  String s1="SELECT * FROM customers WHERE userid='"+na+"'";
		  ResultSet rs = st1.executeQuery(s1);
		  
		  while(rs.next()) 
		  {
			  if(rs.getString("userid").equals(na))
			  { 
				  int c1=rs.getInt("balance");
				  if (c1>=m1)
				  {
					  
				  ba=c1-m1; 
				  String sql1 = "update customers set balance =? where userid= ?";
					PreparedStatement pre =con.prepareStatement(sql1);
					pre.setInt(1,ba);
					pre.setString(2, na);
					int rowsAffected1 = pre.executeUpdate();
					 String s="SELECT * FROM customers WHERE id='"+accountid+"'";
					  ResultSet r1 = st.executeQuery(s);
					  while(r1.next()) 
					  {     
						  if(r1.getInt("id")==(acc1)) 
						  {
						   int c=r1.getInt("balance");
						   
							 am1=c+m1;
							 %>  Your Transaction was succesfull .. <a href="http://localhost:8086/DemoJSP/action.jsp?userid=<%out.println(na);%>&psw=srinu9177"> click here..</a>to go back.<% 
							String sql = "update customers set balance =? where id= ?";
							 PreparedStatement preparedStatement =con.prepareStatement(sql);
							preparedStatement.setInt(1, am1);
							preparedStatement.setInt(2, acc1);
							int rowsAffected = preparedStatement.executeUpdate();
			  }
			
		  }

		
		
	   }
	   else
	   {
		   out.println("INSUFFICIENT FUNDS");%><a href="http://localhost:8086/DemoJSP/action.jsp?userid=<%out.println(na);%>&psw=srinu9177"> click here..</a>  to go back.<% 
	   }
	  }
}


   %>
 

</body>
</html>