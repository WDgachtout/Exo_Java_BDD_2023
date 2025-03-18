<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les conditions</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les conditions</h1>

<form action="#" method="post">
    <p>Saisir la valeur 1 : <input type="text" id="inputValeur1" name="valeur1"></p>
    <p>Saisir la valeur 2 : <input type="text" id="inputValeur2" name="valeur2"></p>
    <p>Saisir la valeur 3 : <input type="text" id="inputValeur3" name="valeur3"></p>
    <p><input type="submit" value="Afficher"></p>
</form>

<%-- Récupération des valeurs --%>
<% String valeur1 = request.getParameter("valeur1"); %>
<% String valeur2 = request.getParameter("valeur2"); %>
<% String valeur3 = request.getParameter("valeur3"); %>

<% if (valeur1 != null && valeur2 != null && valeur3 != null) { %>

    <%-- Conversion des valeurs en entiers pour la comparaison --%>
    <% int intValeur1 = Integer.parseInt(valeur1); %>
    <% int intValeur2 = Integer.parseInt(valeur2); %>
    <% int intValeur3 = Integer.parseInt(valeur3); %>

    <%-- Comparaison entre les deux premières valeurs --%>
    <% if (intValeur1 > intValeur2) { %>
        <p>Valeur 1 est supérieure à Valeur 2.</p>
    <% } else if (intValeur1 < intValeur2) { %>
        <p>Valeur 1 est inférieure à Valeur 2.</p>
    <% } else { %>
        <p>Valeur 1 est égale à Valeur 2.</p>
    <% } %>

<h2>Exercice 1 : Comparaison de trois valeurs</h2>
<%-- Vérification si C est compris entre A et B --%>
<%
boolean cComprise = (intValeur3 > Math.min(intValeur1, intValeur2)) && (intValeur3 < Math.max(intValeur1, intValeur2));
%>
<p>La valeur de C (<%= intValeur3 %>) est-elle comprise entre A (<%= intValeur1 %>) et B (<%= intValeur2 %>) ? 
<%= cComprise ? "Oui, C est comprise entre A et B." : "Non, C n'est pas comprise entre A et B." %></p>

<h2>Exercice 2 : Pair ou Impair ?</h2>
<%-- Vérification si la troisième valeur est paire ou impaire --%>
<p>La valeur de C (<%= intValeur3 %>) est : 
<%= (intValeur3 % 2 == 0) ? "Paire." : "Impaire." %></p>

<% } else { %>
<p style="color:red;">Veuillez saisir toutes les valeurs pour effectuer les comparaisons.</p>
<% } %>

<p><a href="index.html">Retour au sommaire</a></p>

</body>
</html>
