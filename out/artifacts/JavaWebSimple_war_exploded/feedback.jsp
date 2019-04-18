<%--
  Created by IntelliJ IDEA.
  User: wLink
  Date: 4/18/2019
  Time: 11:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<html>
<head>
    <title>feedback</title>
</head>
<body>
<%
    String cookieName = "login";
    int account_id = 0;
    Cookie[] cookies = request.getCookies();
    if (cookies != null)
    {
        for(int i=0; i<cookies.length; i++)
        {
            Cookie cookie = cookies[i];
            if (cookieName.equals(cookie.getName()))
            {
                account_id = Integer.valueOf(cookie.getValue());
            }
        }
    }
%>
<div class="container mt-5">
    <form method="post">
        <div class="form-group">
            <label for="exampleInputUser">Content</label>
            <input name="content" type="text" class="form-control" id="exampleInputUser" placeholder="Enter username">
        </div>
        <input name="account_id" type="text" hidden value="<%= account_id %>">
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</body>
</html>
