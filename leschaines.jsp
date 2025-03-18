<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les chaines</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les chaînes de caractères</h1>

<form action="#" method="post">
    <p>Saisir une chaîne (Du texte avec 6 caractères minimum) : 
       <input type="text" id="inputValeur" name="chaine">
    </p>
    <p><input type="submit" value="Afficher"></p>
</form>

<%-- Récupération des valeurs --%>
<% String chaine = request.getParameter("chaine"); %>

<% if (chaine != null && chaine.length() >= 6) { %>

    <%-- Obtention de la longueur de la chaîne --%>
    <% int longueurChaine = chaine.length(); %>
    <p>La longueur de votre chaîne est de <%= longueurChaine %> caractères.</p>

    <%-- Extraction du 3° caractère dans votre chaîne --%>
    <% char caractereExtrait = chaine.charAt(2); %>
    <p>Le 3° caractère de votre chaîne est la lettre : <%= caractereExtrait %></p>

    <%-- Obtention d'une sous-chaîne --%>
    <% String sousChaine = chaine.substring(2, Math.min(6, longueurChaine)); %>
    <p>Une sous-chaîne de votre texte : <%= sousChaine %></p>

    <%-- Recherche de la lettre "e" --%>
    <% char recherche = 'e'; 
       int position = chaine.indexOf(recherche); %>
    <p>Votre premier "e" est en position : <%= position >= 0 ? position : "Non trouvé" %></p>

<h2>Exercice 1 : Combien de 'e' dans notre chaîne de caractères ?</h2>
<%
int compteurE = 0;
for (int i = 0; i < chaine.length(); i++) {
    if (chaine.charAt(i) == 'e') {
        compteurE++;
    }
}
%>
<p>Le nombre de lettres 'e' dans votre chaîne est : <%= compteurE %></p>

<h2>Exercice 2 : Affichage vertical</h2>
<p style="font-family: monospace;">
<%
for (int i = 0; i < chaine.length(); i++) {
    out.println(chaine.charAt(i) + "<br/>");
}
%>
</p>

<h2>Exercice 3 : Retour à la ligne</h2>
<p style="font-family: monospace;">
<%
String[] mots = chaine.split(" ");
for (String mot : mots) {
    out.println(mot + "<br/>");
}
%>
</p>

<h2>Exercice 4 : Afficher une lettre sur deux</h2>
<p style="font-family: monospace;">
<%
for (int i = 0; i < chaine.length(); i += 2) {
    out.print(chaine.charAt(i));
}
%>
</p>

<h2>Exercice 5 : La phrase en verlant</h2>
<p style="font-family: monospace;">
<%
StringBuilder verlant = new StringBuilder(chaine);
out.println(verlant.reverse().toString());
%>
</p>

<h2>Exercice 6 : Consonnes et voyelles</h2>
<%
int voyelles = 0, consonnes = 0;
String voyelleSet = "aeiouAEIOU";
for (int i = 0; i < chaine.length(); i++) {
    char ch = chaine.charAt(i);
    if (Character.isLetter(ch)) {
        if (voyelleSet.indexOf(ch) >= 0) {
            voyelles++;
        } else {
            consonnes++;
        }
    }
}
%>
<p>Nombre de voyelles : <%= voyelles %></p>
<p>Nombre de consonnes : <%= consonnes %></p>

<% } else if (chaine != null && chaine.length() < 6) { %>
<p style="color:red;">Veuillez saisir une chaîne contenant au moins 6 caractères.</p>
<% } %>

<p><a href="index.html">Retour au sommaire</a></p>

</body>
</html>
