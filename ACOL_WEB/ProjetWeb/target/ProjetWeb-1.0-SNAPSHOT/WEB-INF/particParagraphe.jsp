<%@page import="modele.Utilisateur"%>
<%@page import="modele.Paragraphe"%>
<%@page import="modele.Choix"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${paragraphe.titre}</title>
    </head>
    <body>
        <div id="paraTitle">${paragraphe.titre}</div>
        <div id="contenuPara">${paragraphe.contenu}</div>
        
            <% Paragraphe paragraphe = ((Paragraphe) session.getAttribute("paragraphe"));
            List<Choix> lesChoix = paragraphe.getChoix();
            boolean supprimer = true;
            for(Choix choix:lesChoix){%>
                <%if(choix.getParagrapheSonId()!=0) supprimer = false;
                
                if(choix.isVerrouille() && choix.getParagrapheSonId() != 0){
                    // car il se peut qu'un utilisateur verrouille un choix et ne
                    //le termine pas donc il ne faut pas lui afficher le lien href %>
                    <form action="ctrlParticipation" method="post" accept-charset="UTF-8">
                        <input type="hidden" name="action" value="getParagraph"/>   
                        <input type="hidden" name="id" value="<%= choix.getParagrapheSonId() %>"/> 
                        <input type="submit" value="<%= choix.getNumero() %>" />
                    </form>
                    <ul><%= choix.getTitre() %></ul>
                <% } else if(!choix.isVerrouille()){%>
                    <ul><%= choix.getNumero() %></ul>
                    <ul><%= choix.getTitre() %></ul>
                    
                    <form action="ctrlParticipation" method="post" accept-charset="UTF-8">
                        <input type="hidden" name="action" value="rediger"/>   
                        <input type="hidden" name="title" value="<%= choix.getTitre() %>"/>   
                        <input type="hidden" name="idPara" value="${paragraphe.paragrapheId}"/> 
                        <input type="hidden" name="numero" value="<%= choix.getNumero() %>"/> 
                        <input type="submit" value="Rediger" />
                    </form>
                    <p id="errMessage" style="color: red;"> ${message} </p>
                        
                <% } else{%>
                    <ul><%= choix.getNumero() %></ul>
                    <ul><%= choix.getTitre() %></ul>
                <%}
            }
            Utilisateur user = (Utilisateur)session.getAttribute("utilisateur");
            if(paragraphe.getAuteur().equals(user.getLogin())){%>
            <td>
                <form action="ctrlParticipation" method="post" accept-charset="UTF-8">
                    <input type="hidden" name="action" value="switchModifier"/>   
                    <input type="hidden" name="titre" value="${paragraphe.titre}"/> 
                    <input type="hidden" name="contenu" value="${paragraphe.contenu}"/> 
                    <input type="hidden" name="idPara" value="${paragraphe.paragrapheId}"/> 
                    <input type="submit" value="Modifier" />
                </form>
                        
                <%if(supprimer){%>
                    <form action="ctrlParticipation" method="post" accept-charset="UTF-8">
                        <input type="hidden" name="action" value="supprimer"/>   
                        <input type="hidden" name="idPara" value="${paragraphe.paragrapheId}"/> 
                        <input type="submit" value="Supprimer" />
                    </form>
                    
                <%}
            }%>
                <form action="ctrlChoix" method="post" accept-charset="UTF-8">
                    <input type="hidden" name="action" value="rediregerChoix"/>   
                    <input type="hidden" name="numero" value="<%= lesChoix.size() %>"/> 
                    <input type="hidden" name="fatherId" value="${paragraphe.paragrapheId}"/> 
                    <input type="submit" value="Ajouter un choix" />
                </form>
            </td>
    </body>
</html>