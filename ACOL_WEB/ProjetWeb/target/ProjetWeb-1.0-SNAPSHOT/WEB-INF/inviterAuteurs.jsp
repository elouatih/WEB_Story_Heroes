<%--
  Created by IntelliJ IDEA.
  User: elouati
  Date: 17/04/2021
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <link rel="stylesheet" href="./css/styleGeneral.css" />
    <title>L'histoire dont vous Ãªtes le HEROS</title>
    <link rel="SHORTCUT ICON" href="images/favicon.png" type="image/x-icon" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<p>L'histoire n'est pas ouverte. Vous devez inviter des auteurs.</p>
<h2 style="color: #f79f1f"">Inviter des auteurs</h2>
<form action="story" method="post" accept-charset="UTF-8">
    <div class="form-group">
        <label class="col-lg-2 control-label">Login de l'auteur :</label>
        <input class="form-control" type="text" name="loginAuteur" />
    </div>
    <p id="errMessage" style="color: red;"> ${message} </p>
    <%--<div class="form-group">
        <br/>
        <input type="submit" value="Ajouter un autre auteur" />
        <input type="hidden" name="action" value="ajouterAuteur" />
    </div>--%>
    <div class="form-group">
        <br/>
        <input style="width: 200px;height:45px;font-size:23px;" id="but1" type="submit" value="Valider l'invitation" />
        <input type="hidden" name="action" value="validerInvitation" />
    </div>
    <div class="form-group">
        <br/>
        <input style="width: 200px;height:45px;font-size:23px;" id="but1" type="submit" value="Finir l'invitation"/>
        <input type="hidden" name="action" value="finirInvitation"/>
    </div>
</form>
</body>
</html>