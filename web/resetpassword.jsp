<%
String resetUser = (String)session.getAttribute("resetUser");
if(resetUser == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<form action="resetpasswordprocess.jsp" method="post">
    <input type="password" name="newpass" placeholder="New Password" required>
    <input type="password" name="confirmpass" placeholder="Confirm Password" required>
    <button type="submit">Reset Password</button>
</form>
