<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Boucles</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les boucles</h1>

<form action="#" method="post">
<label for="inputValeur">Saisir le nombre d'étoiles : </label>
<input type="text" id="inputValeur" name="valeur">
<input type="submit" value="Afficher">
</form>

<%-- Récupération de la valeur saisie par l'utilisateur --%>
<% String valeur = request.getParameter("valeur"); %>

<%-- Vérification de l'existence de la valeur --%>
<% if (valeur != null && !valeur.isEmpty()) { %>

<% int cpt = Integer.parseInt(valeur); %>

<p><strong>Ligne d'étoiles :</strong><br/>
<% for (int i = 1; i <= cpt; i++) { %>
    <%= "*" %>
<% } %>
</p>

<h2>Exercice 1 : Le carré d'étoiles</h2>
<p style="font-family: monospace;">
<% for(int i=1; i<=cpt; i++){ 
     for(int j=1; j<=cpt; j++){ %>*<% } %><br/>
<% } %>
</p>

<h2>Exercice 2 : Triangle rectangle gauche</h2>
<p style="font-family: monospace;">
<% for(int i=1; i<=cpt; i++){
     for(int j=1; j<=i; j++){ %>*<% } %><br/>
<% } %>
</p>

<h2>Exercice 3 : Triangle rectangle inversé</h2>
<p style="font-family: monospace;">
<% for(int i=cpt; i>=1; i--){
     for(int j=1; j<=i; j++){ %>*<% } %><br/>
<% } %>
</p>

<h2>Exercice 4 : Triangle rectangle aligné à droite</h2>
<p style="font-family: monospace;">
<% for(int i=1;i<=cpt;i++){
     for(int espace=cpt-i; espace>0; espace--) {%>&nbsp;<%}
     for(int etoile=1; etoile<=i; etoile++) {%>*<%}%><br/>
<%}%>
</p>

<h2>Exercice 5 : Triangle isocèle (variante du triangle droit)</h2>
<p style="font-family: monospace;">
<% for(int i=1;i<=cpt;i++){
     for(int espace=cpt-i; espace>0; espace--) {%>&nbsp;<%}
     for(int etoile=1; etoile<=i; etoile++) {%>*<%}%><br/>
<%}%>
</p>

<h2>Exercice 6 : Le demi-losange</h2>
<p style="font-family: monospace;">
<!-- Partie haute -->
<%
for (int i = 1; i <= cpt; i++) {
    for (int espace = cpt - i; espace > 0 ; espace--) {
        out.print("&nbsp;");
    }
    for (int etoile = 1 ; etoile <= i ; etoile++) {
        out.print("*");
    }
    out.println("<br/>");
}
%>

<!-- Partie basse -->
<%
for (int i = cpt - 1 ; i >= 1 ; i--) {
    for (int espace = cpt - i ; espace > 0 ; espace--) {
        out.print("&nbsp;");
    }
    for (int etoile = 1 ; etoile <= i ; etoile++) {
        out.print("*");
    }
    out.println("<br/>");
}
%>
</p>

<h2>Exercice 7 : La table de multiplication</h2>
<p style="font-family: monospace;">
<%
for (int i=1;i<=cpt;i++){ 
    out.println(cpt + " x " + i + " = " + (cpt*i) + "<br/>");
}
%>
</p>

<% } %>

<p><a href="index.html">Retour au sommaire</a></p>

</body>
</html>
