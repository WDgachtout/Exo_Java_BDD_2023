<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>

<%
    ArrayList<HashMap<String, String>> tasks = (ArrayList<HashMap<String, String>>) session.getAttribute("tasks");
%>

<html>
<head>
    <title>Mes tâches</title>
</head>
<body>
    <h2>Liste des tâches</h2>

    <%
        if (tasks == null || tasks.isEmpty()) {
    %>
        <p>Aucune tâche enregistrée.</p>
    <%
        } else {
            for (HashMap<String, String> task : tasks) {
    %>
        <div style="border:1px solid #ccc; padding:10px; margin-bottom:10px;">
            <strong><%= task.get("title") %></strong><br>
            <em><%= task.get("description") %></em>
        </div>
    <%
            }
        }
    %>

    <a href="index.jsp">← Retour à l’ajout</a>
</body>
</html>
