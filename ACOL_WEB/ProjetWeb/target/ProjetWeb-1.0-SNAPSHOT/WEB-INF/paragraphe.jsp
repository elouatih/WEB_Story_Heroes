<%-- 
    Document   : paragraphe
    Created on : Apr 13, 2021, 4:35:20 PM
    Author     : imadrafai
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="./css/styleGeneral.css" />
        <title>L'histoire dont vous êtes le HERO</title>
        <link rel="SHORTCUT ICON" href="images/favicon.png" type="image/x-icon" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <div class="flexDisplay">
    <div id="but1"  style="width: 350px;height:45px;text-align:center;line-height: 45px;font-size: 20px;margin-top: 10px;margin-right: 15px;">   
    <form action="CtrlHistorique" method="post" accept-charset="UTF-8" target="_blank">
        <input type="hidden" name="action" value="sauvegarderHistorique"/>   
        <input type="submit" value="Sauvegarder Votre avancement" />
    </form></div>
    
    
    <div id="but1" style="width: 350px;height:45px;text-align:center;line-height: 45px;font-size: 20px;margin-top: 10px;margin-right: 15px;"><form action="CtrlHistorique" method="post" accept-charset="UTF-8" target="_blank">
        <input type="hidden" name="action" value="consulterHistorique"/>   
        <input type="hidden" name="fatherId" value="${paragraphe.paragrapheId}"/> 
        <input  type="submit" value="Consulter votre historique" />
        </form></div></div>
    
    
        <title>${paragraphe.titre}</title>
    </head>
    <body>
        <div id="paraTitle">${paragraphe.titre}</div>
        <div id="contenuPara">${paragraphe.contenu}</div>
        <div style="background-color: #f79f1f;height: 54020px;">
        <div id="queFaire"> Que faire Ensuite ? </div>

        <div id="tableChoix">
            <c:set var="num" value="1" scope="page" />
            <c:forEach items="${paragraphe.choix}" var="choix">
                <div class="choix">
                    <div class="numChoix">
                        <form action="ctrlLecture" method="post" accept-charset="UTF-8">
                            <input type="hidden" name="action" value="getParagraph"/>   
                            <input type="hidden" name="id" value="${choix.paragrapheSonId}"/> 
                            <input type="submit" value="${num} ${choix.titre}" />
                        </form>
                    </div>
                    <c:set var="num" value="${num + 1}" scope="page"/>
                    <div class="titreChoix">
                    <form action="ctrlLecture" method="post" accept-charset="UTF-8">
                            <input type="hidden" name="action" value="getParagraph"/>   
                            <input type="hidden" name="id" value="${choix.paragrapheSonId}"/> 
                            <input type="submit" value="XXXXXX" />
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div></div>
    </body>
</html>
