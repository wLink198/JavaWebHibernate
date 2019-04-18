<%--
  Created by IntelliJ IDEA.
  User: wLink
  Date: 4/18/2019
  Time: 9:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<html>
<head>
    <title>Register</title>
</head>
<body>
    <div class="container mt-5">
        <form method="post">
            <div class="form-group">
                <label for="exampleInputUser">Username</label>
                <input name="user" type="text" class="form-control" id="exampleInputUser" placeholder="Enter username">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1">Email address</label>
                <input name="mail" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input name="pass" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
            </div>
            <div class="form-group">
                <label for="exampleInputPhone">Phone</label>
                <input name="phone" type="text" class="form-control" id="exampleInputPhone" placeholder="Enter your phone">
            </div>
            <div class="form-group">
                <label for="exampleInputAddress">Address</label>
                <input name="address" type="text" class="form-control" id="exampleInputAddress" placeholder="Enter your address">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</body>
</html>
