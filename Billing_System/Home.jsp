<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>Shopping Website</title>
</head>
<body>
<%
    Connection conn = null;
    Statement stmt = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "");
        if (conn != null) {
            out.println("<h1> XYZ Online Shop</h1>");
        }
        stmt = conn.createStatement();
        // Update the contact information of the customer with the given name
        String sql = "Select * from shop";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            // Retrieve by column name
            String id = rs.getString("id");
            String PRODUCT = rs.getString("PRODUCT");
            String price = rs.getString("price");
            // Display values
            out.println("<p id="+id+"> ID: " + id + "<br>");
            out.println("PRODUCT Name: " + PRODUCT + "<br>");
            out.println("Price: " + price + " $&emsp;&emsp;&emsp;");
            out.println("<button onclick='AddPRODUCT(\"" + id + "\",event,\"" + price + "\")'>ADD PRODUCT</button></p>");
	    out.println("<form action='success.jsp' method='post'>");

        }
        out.println("&emsp;&emsp;<a href='cart.html'>View Cart</a>");
        rs.close();
        // Clean-up environment
        stmt.close();
        conn.close();
    } catch (Exception e) {
        System.out.print("Error connecting to DB - Error:" + e);
    }
%>
<script>
    function AddPRODUCT(id, event, price)
    {
        console.log(id);
        console.log(price);
        alert("PRODUCT added to Cart");
        if(sessionStorage.getPRODUCT(id))
        {
            var count = Number(JSON.parse(sessionStorage.getPRODUCT(id)).count);
            count++;
            var arr = {price: price,count : count};
            window.sessionStorage.setPRODUCT(id,JSON.stringify(arr));
        }
        else
        {
            var arr = {price: price,count :1};
            window.sessionStorage.setPRODUCT(id,JSON.stringify(arr));
        }
    }
</script>
</body>
</html>
