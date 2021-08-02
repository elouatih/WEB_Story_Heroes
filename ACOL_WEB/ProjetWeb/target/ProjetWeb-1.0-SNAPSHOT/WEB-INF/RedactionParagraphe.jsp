<%-- 
    Document   : RedactionParagraphe
    Created on : Apr 18, 2021, 11:34:09 AM
    Author     : imadrafai
--%>

<%@page import="modele.Utilisateur"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Redaction de paragraphe</title>
    </head>
    <body>

        <form action="RedactionParagraphe" method="post" accept-charset="UTF-8">
            <div><div>Titre : </div><input disabled name="titreParagraphe" value="<%= session.getAttribute("titreChoix")%>"/></div><br>
            <textarea name="contenuParagraphe" required> Ecrivez votre texte ici </textarea>
            <div> Votre paragraphe est-il conclusif ? </div>
            <input type="radio" name="isFinal" value="Oui" > Oui </input>
            <input type="radio" name="isFinal" value="Non" checked> Non </input>
            <input type="hidden" name="fatherId" value="${idPara}"/> 

            <input type="hidden" name="action" value="validerEdition"/>   
            <input type="submit" value="Valider" />
        </form>
        <form action="RedactionParagraphe" method="post" accept-charset="UTF-8">
            <input type="hidden" name="action" value="renoncerEdition"/>   
            <input type="hidden" name="fatherId" value="${idPara}"/> 
            
            <input type="submit" value="Renoncer" />
        </form>
    </body>
</html>
