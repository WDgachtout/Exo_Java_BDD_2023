<%-- Récupération de la valeur saisie par l'utilisateur --%>
<% String valeur = request.getParameter("valeur"); %>

<%-- Vérification de l'existence de la valeur --%>
<% if (valeur != null && !valeur.isEmpty()) { 
    int cpt = Integer.parseInt(valeur); 
%>

<h2>Exercice 1 : Le carré d'étoiles</h2>
<p>
<% for(int i = 1; i <= cpt; i++) { 
     for(int j = 1; j <= cpt; j++) { %>
        *
<%   } %><br/>
<% } %>
</p>

<h2>Exercice 2 : Triangle rectangle gauche</h2>
<p>
<% for(int i = 1; i <= cpt; i++) { 
     for(int j = 1; j <= i; j++) { %>
        *
<%   } %><br/>
<% } %>
</p>

<h2>Exercice 3 : Triangle rectangle inversé</h2>
<p>
<% for(int i = cpt; i >= 1; i--) { 
     for(int j = 1; j <= i; j++) { %>
        *
<%   } %><br/>
<% } %>
</p>

<h2>Exercice 4 : Triangle rectangle aligné à droite</h2>
<p style="font-family: monospace;">
<% for(int i = 1; i <= cpt; i++) {
     for(int espace = cpt - i; espace > 0; espace--) { %>&nbsp;<% }
     for(int etoile = 1; etoile <= i; etoile++) { %>*<% } %><br/>
<% } %>
</p>

<h2>Exercice 5 : Triangle rectangle aligné à droite (variante)</h2>
<p style="font-family: monospace;">
<% for(int i = 1; i <= cpt; i++) {
     for(int espace = cpt - i; espace > 0; espace--) { %>&nbsp;<% }
     for(int etoile = 1; etoile <= i; etoile++) { %>*<% } %><br/>
<% } %>
</p>

<h2>Exercice 6 : Demi-losange</h2>
<p style="font-family: monospace;">
<!-- Partie haute -->
<% for(int i = 1; i <= cpt; i++) {
     for(int espace = cpt - i; espace > 0; espace--) {%>&nbsp;<%}
     for(int etoile = 1; etoile <= i; etoile++) {%>*<%}%><br/>
<%}%>

<!-- Partie basse -->
<% for(int i = cpt; i >= 1; i--) {
     for(int espace = cpt - i; espace > 0; espace--) {%>&nbsp;<%}
     for(int etoile = 1; etoile <= i; etoile++) {%>*<%}%><br/>
<%}%>
</p>

<h2>Exercice 7 : Table de multiplication</h2>
<p style="font-family: monospace;">
<%
for (int i=1;i<=cpt;i++){ 
    out.println(cpt + " x " + i + " = " + (cpt*i) + "<br/>");
}
%>
</p>

<%
} // Fin du if
%>

