<%-- 
    Document   : consulterHistorique
    Created on : Apr 19, 2021, 4:21:48 PM
    Author     : imadrafai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Historique de ${login}</title>
    </head>
    <body>
        <div> Vous êtes actuellement en train de lire l'histoire : <div> ${histoireTitle} </div> </div><br>
    <div> Vous pouvez revenir en arrière dans votre lecture à tout instant en cliquant sur l'élément voulue : </div><br>
    
    
    
    <div id="Historique">
            
            <c:forEach items="${listParagraphes}" var="paragraphe">
                <div class="trace">
                    <form action="ctrlLecture" method="post" accept-charset="UTF-8">
                        <input type="hidden" name="action" value="getParagraph"/>   
                        <input type="hidden" name="id" value="${paragraphe.paragrapheId}"/> 
                        <input type="hidden" name="boolean" value="retourDeLhistorique"/> 
                        <input type="submit" value="${paragraphe.titre}" />
                    </form>
                </div>
            </c:forEach>
        </div>
    
    </body>
</html>
