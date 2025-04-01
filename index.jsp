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

<html>
<head>
    <title>Ajouter une tâche</title>
</head>
<body>
    <h2>Ajouter une tâche</h2>
    <form method="post" action="index.jsp">
        <label>Titre :</label><br>
        <input type="text" name="title" required><br><br>
        <label>Description :</label><br>
        <textarea name="description" required></textarea><br><br>
        <input type="submit" value="Ajouter la tâche">
    </form>

    <hr>

    <a href="tasks.jsp">Voir la liste des tâches</a>
</body>
</html>
