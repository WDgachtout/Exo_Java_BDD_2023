<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>

<%
    // Récupération des tâches depuis la session
    ArrayList<HashMap<String, String>> tasks = (ArrayList<HashMap<String, String>>) session.getAttribute("tasks");

    if (tasks == null) {
        tasks = new ArrayList<>();
        session.setAttribute("tasks", tasks);
    }

    // Traitement du formulaire si envoyé
    String title = request.getParameter("title");
    String description = request.getParameter("description");

    if (title != null && description != null && !title.isEmpty() && !description.isEmpty()) {
        HashMap<String, String> task = new HashMap<>();
        task.put("title", title);
        task.put("description", description);
        tasks.add(task);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Gestionnaire de Tâches</title>
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
        form {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            max-width: 500px;
            margin: auto;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
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
    <h1>Gestionnaire de Tâches</h1>
</header>
<main>
    <h2>Ajouter une tâche</h2>
    <form method="post" action="index.jsp">
        <label>Titre :</label><br>
        <input type="text" name="title" required><br><br>
        <label>Description :</label><br>
        <textarea name="description" required></textarea><br><br>
        <input type="submit" value="Ajouter la tâche">
    </form>

    <div class="link">
        <a href="tasks.jsp">Voir la liste des tâches →</a>
    </div>
</main>
</body>
</html>
