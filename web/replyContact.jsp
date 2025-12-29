<%
int id = Integer.parseInt(request.getParameter("id"));
%>

<!DOCTYPE html>
<html>
<head>
<title>Reply Message</title>
<style>
body{
    background:#f7f7f7;
    padding:40px;
    font-family:Arial;
}
.box{
    max-width:500px;
    margin:auto;
    background:white;
    padding:30px;
    border-radius:15px;
}
textarea{
    width:100%;
    height:120px;
}
button{
    margin-top:15px;
    padding:10px 25px;
    background:#e84393;
    color:white;
    border:none;
    border-radius:25px;
}
</style>
</head>

<body>
<div class="box">
<h3>Reply to User</h3>

<form action="saveReply.jsp" method="post">
    <input type="hidden" name="msgid" value="<%=id%>">
    <textarea name="reply" required></textarea>
    <button type="submit">Send Reply</button>
</form>

</div>
</body>
</html>
