<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>

<%
    ArrayList<HashMap<String, String>> tasks = (ArrayList<HashMap<String, String>>) session.getAttribute("tasks");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Mes Tâches</title>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }
        header {
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            text-align: center;
        }
        main {
            padding: 20px;
        }
        .task {
            background-color: white;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-bottom: 10px;
        }
        .task strong {
            font-size: 18px;
        }
        .link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<header>
    <h1>Mes Tâches</h1>
</header>
<main>
    <h2>Liste des tâches</h2>

    <% if (tasks == null || tasks.isEmpty()) { %>
        <p>Aucune tâche enregistrée.</p>
    <% } else { 
           for (HashMap<String, String> task : tasks) { %>
               <div class="task">
                   <strong><%= task.get("title") %></strong><br/>
                   <em><%= task.get("description") %></em><br/>
               </div>
       <% } 
       } %>

       <div class="link">
           <a href="index.jsp">← Retour à l’ajout</a>
       </div>

</main>
</body>
</html>
