<%@ page import="java.sql.*" %>
<%
int msgid = Integer.parseInt(request.getParameter("msgid"));
String reply = request.getParameter("reply");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
 "jdbc:mysql://localhost:3306/flowerproducts","root","Vicky345@"
);

// Save reply
PreparedStatement ps1 = conn.prepareStatement(
 "INSERT INTO contact_replies(message_id,reply) VALUES (?,?)"
);
ps1.setInt(1, msgid);
ps1.setString(2, reply);
ps1.executeUpdate();

// Update status
PreparedStatement ps2 = conn.prepareStatement(
 "UPDATE contact_messages SET status='replied' WHERE id=?"
);
ps2.setInt(1, msgid);
ps2.executeUpdate();

conn.close();
%>

<script>
alert("Reply sent successfully ?");
window.location.href="adminContact.jsp";
</script>
