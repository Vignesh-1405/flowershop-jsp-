<%-- 
    Document   : register
    Created on : 22-Dec-2025, 10:17:29 am
    Author     : VIGNESH S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="reg2.css">
    <title>Register</title>
</head>
<body>
    <form  class="form-container" action="indexprocess.jsp">
        <h1>Register</h1>
        <label for="Username">Username</label>
        <input type="text" id="Username" name="Username" required minlength="5" maxlength="15">
         <label for="Email">Email</label>
        <input type="email" id="Email" name="Email" required>
        <label for="password">Password</label>
        <input type="password" id="password" name="password" required minlength="8" maxlength="20">
        <label for="Re-Password">Re-Password</label>
        <input type="password" id="Re-Password" required minlength="8" maxlength="20">
        <button type="submit" >Register</button>
        <a href="#">forget password ?</a>
        <a href="login.jsp">Aldready have account / Login here 💐</a>
    </form>
    <script>
    
        // Validate username length     
        let pass=document.getElementById("password").value.trim();
        let pass1=document.getElementById("Re-Password").value.trim();
        
        if(pass !== pass1){
            alert("Password not matching");
            return;
        } 
        
        
        
//         
    let regex = /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,20}$/;

    if(!regex.test(pass)){
        alert("Password must contain at least 1 uppercase letter, 1 number, 1 special character, and be 8-20 characters long");
        return;
    }

        
    
    </script>
</body>
</html>
