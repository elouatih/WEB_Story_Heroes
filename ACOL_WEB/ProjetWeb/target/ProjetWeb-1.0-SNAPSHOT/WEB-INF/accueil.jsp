<%-- 
    Document   : accueil
    Created on : Apr 12, 2021, 2:14:42 PM
    Author     : ensimag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="./css/styleGeneral.css" />
            <title>L'histoire dont vous êtes le HERO</title>
        <link rel="SHORTCUT ICON" href="images/favicon.png" type="image/x-icon" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accueil</title>
    </head>
    <body>
        <div id="bienvenueAccueil">Bienvenue ${utilisateur.login}</div>
        <div class="flexDisplay">
        <div class="flexDisplayColumn">
            <center><div class="imglist"> <center><img style="margin-top: 87px;" class="imgaccueil" src="images/participer.svg" /> </center></div>
            <div class="bottomside"><form action="ctrlAccueil" method="post" accept-charset="UTF-8">
                <input type="hidden" name="action" value="participer"/>   
                <input id="but1" class="accueiltext submit" type="submit" value="Participer à une histoire" />
                </form></div></center>
            </div>
        <div class="flexDisplayColumn">
             <center><div class="imglist"><img class="imgaccueil" src="images/lire.png" /> </div>
            <div class="bottomside">
                <form action="ctrlAccueil" method="post" accept-charset="UTF-8">
                <input type="hidden" name="action" value="getPubliees"/>   
                <input id="but1" class="accueiltext submit" type="submit" value="Lire une histoire" />
                </form>
            </div></center>
            </div>
        <div class="flexDisplayColumn">
             <center><div class="imglist"> <img class="imgaccueil" src="images/ecriture.png" /> </div>
            <div class="bottomside">
            <form action="story" method="get" accept-charset="UTF-8">
                <input type="hidden" name="action" value="newStory"/>
                <input type="hidden" name="id" value="${utilisateur.login}"/>
                <input id="but1" class="accueiltext submit" type="submit" value="Créer ma propre Histoire" />
            </form>
            </div></center>
            </div>
       </div>
    </body>
</html>