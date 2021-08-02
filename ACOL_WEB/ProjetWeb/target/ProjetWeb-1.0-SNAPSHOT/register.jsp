<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <link rel="stylesheet" href="./css/styleGeneral.css" />
        <link rel="SHORTCUT ICON" href="images/favicon.png" type="image/x-icon" />
        <title>Register</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div id="conn">Création d'un nouveau compte</div>
        <form id="forma" method="post" action="ctrlConnexion" accept-charset="UTF-8">
          <ul>
            <li id="login"><input placeholder="Veuillez saisir votre login ici .." type="text" name="login"/></li>
            <li id="pass"><input placeholder="Veuillez saisir votre mot de passe ici .." type="password" name="password"/></li>
          </ul>
            <input class="but1" id="submit" type="submit" value="Sign Up" />
            <input type="hidden" name="connexion" value="register" />
        </form>
        <p id="errMessage" style="color: red;"> ${message} </p>
        <hr id="line">
        <button class="but2" id="register" style="width: 340px;margin-left: 37.5%;">  <a href="login.jsp">Vous avez déja un compte ? </a> </button>
        
        
        <div id="side"> Continuer en tant que visiteur ?
            <form action="ctrlAccueil" method="post" accept-charset="UTF-8">
            <input type="hidden" name="action" value="getPubliees"/>   
            <center><input id="sideButton" class="submit" type="submit" value="Continuer"> </center>
        </form>
        </div>
        
                
        
    </body>
</html>