<%--
  Created by IntelliJ IDEA.
  User: elouati
  Date: 17/04/2021
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <link rel="stylesheet" href="css/styleGeneral.css" />
    <title>L'histoire dont vous êtes le HEROS</title>
    <link rel="SHORTCUT ICON" href="images/favicon.png" type="image/x-icon" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <h2 style="font-size: 25px;text-align: center;margin-top: 15px;margin-bottom: 15px;color: #f79f1f">Créer ma propre histoire</h2>
    <center><form action="story" method="post" accept-charset="UTF-8">
        <div class="form-group">
            <label style="color: #f79f1f;font-size :20px;" class="col-lg-2 control-label">Titre de l'histoire :</label>
            <input class="form-control" type="text" name="titre" required />
        </div>
        <p id="errMessage" style="color: red;"> ${message} </p>
        <center>
                        <label class="col-lg-2 control-label">Histoire Ouverte :</label>

                        <div style="width: 100px;" class="flexDisplay form-group">
            <div>Oui</div>
            <input type="radio" name="ouverte" value="oui" checked/>
            <div>Non</div>
            <input type="radio" name="ouverte" value="non" />
            </div></center>
        <br>
        <h3 style="color: #f79f1f;font-size: 25px;">Paragraphe Initial : </h3>
            <label class="col-lg-2 control-label">Rédiger le paragraphe initial :</label><br>
            <textarea name="paragraphe initial" rows="10" cols="50" required></textarea>
        </p>
        <div class="form-group">
            <br/>
            <input style="width: 200px;height:45px;font-size:23px;" id="but1" type="submit" class="btn btn-primary" value="Valider" />
            <input type="hidden" name="action" value="createStory" />
        </div>
        </form></center>
    
</body>
</html>