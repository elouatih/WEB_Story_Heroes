<%-- 
    Document   : modifier
    Created on : Apr 17, 2021, 12:40:41 PM
    Author     : ensimag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <link rel="stylesheet" href="./css/styleGeneral.css" />
        <title>L'histoire dont vous êtes le HERO</title>
        <link rel="SHORTCUT ICON" href="images/favicon.png" type="image/x-icon" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifier</title>
    </head>
    <body>
        <form action="ctrlParticipation" method="post" accept-charset="UTF-8">
            Titre :
            <input id="titreModif" type="text" name="titre" value="${titre}"/>   
            <br />
            Contenu : 
            <textarea id="contenuModif" name="contenu" cols="100" rows="15">${contenu}</textarea>
            <!--input type="text" name="contenu" value="${contenu}"/--> 
            <br />
            <input type="hidden" name="action" value="modifier" />
            <input type="submit" value="Valider" />
            <input type="hidden" name="id" value="${idPara}" />
        </form>
        <form action="ctrlParticipation" method="post" accept-charset="UTF-8">
            <input type="hidden" name="action" value="AnnulerModif" />
            <input type="submit" value="Annuler" />
            <input type="hidden" name="id" value="${idPara}" />
        </form>
    </body>
</html>
