<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion à MariaDB via JSP</title> 
</head>
<body>
    <h1>Exemple de connexion à MariaDB avec JSP</h1>

    <% 
    // Définir les paramètres de connexion
    String url = "jdbc:mariadb://localhost:3306/films";
    String user = "cnam";
    String password = "cnam";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // Charger le pilote JDBC
        Class.forName("org.mariadb.jdbc.Driver");

        // Établir la connexion
        conn = DriverManager.getConnection(url, user, password);

        // Exemple de requête SQL pour afficher tous les films après 2000
        String sql = "SELECT idFilm, titre, annee FROM Film WHERE annee >= 2000";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        // Afficher les résultats
        out.println("<h2>Liste des films après l'année 2000 :</h2>");
        while (rs.next()) {
            String idFilm = rs.getString("idFilm");
            String titre = rs.getString("titre");
            int annee = rs.getInt("annee");
            out.println("ID : " + idFilm + ", Titre : " + titre + ", Année : " + annee + "<br/>");
        }

    } catch (Exception e) {
        out.println("<p style='color:red;'>Erreur : " + e.getMessage() + "</p>");
    } finally {
        // Fermer les ressources
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
    %>

<hr/>

<h2>Exercice 1 : Les films entre 2000 et 2015</h2>
<%
try {
    // Réutiliser la connexion pour une nouvelle requête
    conn = DriverManager.getConnection(url, user, password);
    String sqlFilmsEntreAnnees = "SELECT idFilm, titre, annee FROM Film WHERE annee > 2000 AND annee < 2015";
    pstmt = conn.prepareStatement(sqlFilmsEntreAnnees);
    rs = pstmt.executeQuery();

    out.println("<h3>Films entre 2000 et 2015 :</h3>");
    while (rs.next()) {
        out.println("ID : " + rs.getString("idFilm") + ", Titre : " + rs.getString("titre") +
                    ", Année : " + rs.getInt("annee") + "<br/>");
    }
} catch (Exception e) {
    out.println("<p style='color:red;'>Erreur : " + e.getMessage() + "</p>");
} finally {
    if (rs != null) rs.close();
    if (pstmt != null) pstmt.close();
}
%>

<hr/>

<h2>Exercice 2 : Recherche par année</h2>
<form action="#" method="post">
    <label for="anneeRecherche">Saisir une année :</label>
    <input type="text" id="anneeRecherche" name="anneeRecherche">
    <input type="submit" value="Rechercher">
</form>

<%
String anneeRecherche = request.getParameter("anneeRecherche");
if (anneeRecherche != null && !anneeRecherche.isEmpty()) {
    try {
        conn = DriverManager.getConnection(url, user, password);
        String sqlRechercheAnnee = "SELECT idFilm, titre, annee FROM Film WHERE annee = ?";
        pstmt = conn.prepareStatement(sqlRechercheAnnee);
        pstmt.setInt(1, Integer.parseInt(anneeRecherche));
        rs = pstmt.executeQuery();

        out.println("<h3>Résultats pour l'année " + anneeRecherche + " :</h3>");
        while (rs.next()) {
            out.println("ID : " + rs.getString("idFilm") + ", Titre : " + rs.getString("titre") +
                        ", Année : " + rs.getInt("annee") + "<br/>");
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Erreur : " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
    }
}
%>

<hr/>

<h2>Exercice 3 : Modification du titre d'un film</h2>
<form action="#" method="post">
    <label for="idFilm">ID du film :</label>
    <input type="text" id="idFilm" name="idFilm"><br/>
    
    <label for="nouveauTitre">Nouveau titre :</label>
    <input type="text" id="nouveauTitre" name="nouveauTitre"><br/>
    
    <input type="submit" value="Modifier">
</form>

<%
String idFilmModif = request.getParameter("idFilm");
String nouveauTitre = request.getParameter("nouveauTitre");

if (idFilmModif != null && nouveauTitre != null && !idFilmModif.isEmpty() && !nouveauTitre.isEmpty()) {
    try {
        conn = DriverManager.getConnection(url, user, password);
        String sqlUpdateTitre = "UPDATE Film SET titre = ? WHERE idFilm = ?";
        pstmt = conn.prepareStatement(sqlUpdateTitre);
        pstmt.setString(1, nouveauTitre);
        pstmt.setInt(2, Integer.parseInt(idFilmModif));
        
        int rowsUpdated = pstmt.executeUpdate();
        
        if (rowsUpdated > 0) {
            out.println("<p>Le titre du film avec ID " + idFilmModif + " a été mis à jour avec succès.</p>");
        } else {
            out.println("<p>Aucun film trouvé avec cet ID.</p>");
        }
        
    } catch (Exception e) {
        out.println("<p style='color:red;'>Erreur : " + e.getMessage() + "</p>");
    } finally {
        if (pstmt != null) pstmt.close();
    }
}
%>

<hr/>

<h2>Exercice 4 : Ajouter un nouveau film</h2>
<form action="#" method="post">
    <label for="nouveauId">ID du film :</label>
    <input type="text" id="nouveauId" name="nouveauId"><br/>
    
    <label for="nouveauTitreAjout">Titre :</label>
    <input type="text" id="nouveauTitreAjout" name="nouveauTitreAjout"><br/>
    
    <label for="nouvelleAnnee">Année :</label>
    <input type="text" id="nouvelleAnnee" name="nouvelleAnnee"><br/>
    
    <input type="submit" value="Ajouter">
</form>

<%
String nouveauId = request.getParameter("nouveauId");
String nouveauTitreAjout = request.getParameter("nouveauTitreAjout");
String nouvelleAnnee = request.getParameter("nouvelleAnnee");

if (nouveauId != null && nouveauTitreAjout != null && nouvelleAnnee != null &&
   !nouveauId.isEmpty() && !nouveauTitreAjout.isEmpty() && !nouvelleAnnee.isEmpty()) {
   
   try {
       conn = DriverManager.getConnection(url, user, password);
       String sqlInsertFilm = "INSERT INTO Film (idFilm, titre, annee) VALUES (?, ?, ?)";
       pstmt = conn.prepareStatement(sqlInsertFilm);
       pstmt.setInt(1, Integer.parseInt(nouveauId));
       pstmt.setString(2, nouveauTitreAjout);
       pstmt.setInt(3, Integer.parseInt(nouvelleAnnee));
       
       int rowsInserted = pstmt.executeUpdate();
       
       if (rowsInserted > 0) {
           out.println("<p>Le film a été ajouté avec succès.</p>");
       }
   } catch (Exception e) {
       out.println("<p style='color:red;'>Erreur : " + e.getMessage() + "</p>");
   } finally {
       if (pstmt != null) pstmt.close();
   }
}
%>

</body>
</html>
