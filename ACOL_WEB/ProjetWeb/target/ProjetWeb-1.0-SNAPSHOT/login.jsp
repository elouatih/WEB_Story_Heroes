<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="stylesheet" href="./css/styleGeneral.css" />
        <title>L'histoire dont vous Ãªtes le HERO</title>
        <link rel="SHORTCUT ICON" href="images/favicon.png" type="image/x-icon" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div id="side"> Continuer en tant que visiteur ?
            <form action="ctrlAccueil" method="post" accept-charset="UTF-8">
            <input type="hidden" name="action" value="getPubliees"/>   
            <center><input id="sideButton" class="submit" type="submit" value="Continuer"> </center>
        </form>
        </div>
        <div id="conn">Connexion</div>
        <form id="forma" method="post" action="ctrlConnexion" accept-charset="UTF-8">
          <ul>
              <li id="login"><input placeholder="Veuillez saisir votre login ici .." type="text" name="login"/></li>
            <li id="pass"><input placeholder="Veuillez saisir votre mot de passe ici .." type="password" name="password"/></li>
          </ul>
          <input class="but1" id="submit" type="submit" value="Log In" />
          <input type="hidden" name="connexion" value="login" />
        </form>
        <p id="errMessage" style="color: red;"> ${message} </p>
        <hr id="line">
        <button class="but2" id="register">  <a href="register.jsp">S'incrire</a> </button>
    </body>
</html>
