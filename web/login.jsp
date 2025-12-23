<%-- 
    Document   : login
    Created on : 22-Dec-2025, 4:34:35 pm
    Author     : VIGNESH S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="log2.css">
    </head>
    <body>
        <form  class="form-container" action="loginprocess.jsp">
        <h1>Login</h1>
        <label for="Email">Email</label>
        <input type="text" id="Email" name="Email" required>
        <small id="usernameError" style="color:#ff6b6b;"></small>
        <label for="password">Password</label>
        <input type="text" id="password" name="password" required>
        <button type="submit">Login</button>
        <a href="#">forget password ?</a>
        <a href="index.jsp">New user / Create a account</a>
        </form>
    </body>
</html>
