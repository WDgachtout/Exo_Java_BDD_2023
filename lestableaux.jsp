<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Les tableaux</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les tableaux</h1>
<form action="#" method="post">
    <p>Saisir au minimum 3 chiffres à la suite, exemple : 6 78 15 <input type="text" id="inputValeur" name="chaine">
    <p><input type="submit" value="Afficher">
</form>

<%-- Récupération des valeurs --%>
<% String chaine = request.getParameter("chaine"); %>
    
<% if (chaine != null) { %>

<%-- Division de la chaîne de chiffres séparés par des espaces --%>
<% String[] tableauDeChiffres = chaine.split("\\s+"); %>
<p>Le tableau contient <%= tableauDeChiffres.length %> valeurs</br>
    <% for (int i = 0; i < tableauDeChiffres.length; i++) { %>
        Chiffre <%= i + 1 %> : <%= Integer.parseInt(tableauDeChiffres[i]) %></br>
    <% } %>
</p>

<h2>Exercice 1 : Le carré de la première valeur</h2>
<p>Le carré de la première valeur est : <%= Integer.parseInt(tableauDeChiffres[0]) * Integer.parseInt(tableauDeChiffres[0]) %></p>

<h2>Exercice 2 : La somme des 2 premières valeurs</h2>
<p>La somme des deux premières valeurs est : <%= Integer.parseInt(tableauDeChiffres[0]) + Integer.parseInt(tableauDeChiffres[1]) %></p>

<h2>Exercice 3 : La somme de toutes les valeurs</h2>
<%
    int somme = 0;
    for (String chiffre : tableauDeChiffres) {
        somme += Integer.parseInt(chiffre);
    }
%>
<p>La somme de toutes les valeurs est : <%= somme %></p>

<h2>Exercice 4 : La valeur maximale</h2>
<%
    int max = Integer.parseInt(tableauDeChiffres[0]);
    for (String chiffre : tableauDeChiffres) {
        int val = Integer.parseInt(chiffre);
        if (val > max) {
            max = val;
        }
    }
%>
<p>La valeur maximale est : <%= max %></p>

<h2>Exercice 5 : La valeur minimale</h2>
<%
    int min = Integer.parseInt(tableauDeChiffres[0]);
    for (String chiffre : tableauDeChiffres) {
        int val = Integer.parseInt(chiffre);
        if (val < min) {
            min = val;
        }
    }
%>
<p>La valeur minimale est : <%= min %></p>

<h2>Exercice 6 : La valeur la plus proche de 0</h2>
<%
    int valeurProcheDeZero = Integer.parseInt(tableauDeChiffres[0]);
    for (String chiffre : tableauDeChiffres) {
        int val = Integer.parseInt(chiffre);
        if (Math.abs(val) < Math.abs(valeurProcheDeZero)) {
            valeurProcheDeZero = val;
        }
    }
%>
<p>La valeur la plus proche de 0 est : <%= valeurProcheDeZero %></p>

<h2>Exercice 7 : La valeur la plus proche de 0 (2° version)</h2>
<%
    int valeurProcheDeZero2 = Integer.parseInt(tableauDeChiffres[0]);
    for (String chiffre : tableauDeChiffres) {
        int val = Integer.parseInt(chiffre);
        if (Math.abs(val) < Math.abs(valeurProcheDeZero2) || (Math.abs(val) == Math.abs(valeurProcheDeZero2) && val > valeurProcheDeZero2)) {
            valeurProcheDeZero2 = val;
        }
    }
%>
<p>La valeur la plus proche de 0 est : <%= valeurProcheDeZero2 %></p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
