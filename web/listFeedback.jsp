<%@ page import="java.util.List" %>
<%@ page import="entity.Feedback" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Account" %><%--
  Created by IntelliJ IDEA.
  User: wLink
  Date: 4/10/2019
  Time: 10:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<html>
<head>
    <title>Home</title>
</head>
<body>
<%
    List<Account> feedbackList;
    feedbackList = (List<Account>) request.getAttribute("acc");

    if (feedbackList == null) {
        feedbackList = new ArrayList<Account>() {
        };
    }
%>
<div class="container mt-5">
    <h2>List feedback</h2>
    <%--<p style="font-style: italic; color: grey">wo men bu yi yang...</p>--%>
    <a class="btn btn-primary mb-3" href="/feedback" role="button">Create a feedback</a>
    <table class="table">
        <thead>
        <tr>
            <th>No.</th>
            <th>Username</th>
            <th>Feedback</th>
        </tr>
        </thead>
        <tbody>
            <% int i = 1; %>
            <% for (Account acc : feedbackList) {
            for (Feedback fb : acc.getFeedbacks()) {
        %>
        <tr>
            <td><%= i %></td>
            <td><%= acc.getUsername() %></td>
            <td><%= fb.getContent() %></td>
            <% i++; %>
        </tr>
            <% } } %>
    </table>
</div>
</body>
</html>
