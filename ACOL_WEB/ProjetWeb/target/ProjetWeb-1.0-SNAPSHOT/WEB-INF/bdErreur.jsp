<%-- 
    Document   : bdErreur
    Created on : Apr 11, 2021, 12:26:56 PM
    Author     : ensimag
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8"/>
        <title>Erreur BD</title>
        <link rel="SHORTCUT ICON" href="images/scared.png" type="image/x-icon" />
    </head>
    <body>
        <h1 style="text-align: center">Erreur</h1>
        <p>Une erreur d’accès à la base de données vient de se produire.</p>
        <p>Message : </p>
        <pre>${erreurMessage}</pre>
        
</body>
</html>
