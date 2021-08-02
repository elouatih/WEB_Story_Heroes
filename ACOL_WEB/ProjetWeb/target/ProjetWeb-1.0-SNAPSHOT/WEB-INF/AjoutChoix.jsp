<%-- 
    Document   : AjoutChoix
    Created on : Apr 19, 2021, 4:00:24 PM
    Author     : ensimag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajouter choix</title>
    </head>
    <body>
        
        <h1>Vous pouvez ajouter un Choix en:</h1>
        <h2>Créant un nouveau</h2>
        <form action="ctrlChoix" method="post" accept-charset="UTF-8">
            <div class="form-group">
                <label class="col-lg-2 control-label">Titre du choix :</label>
                <input type="hidden" name="action" value="updNouveau"/>  
                <input class="form-control" type="text" name="titre" />
                <input type="hidden" name="numero" value="${numero}"/> 
                <input type="hidden" name="id" value="${fatherId}"/>
                <input type="submit" value="Valider"/>
            </div>
        </form>
        
        <c:if test="${tousParagraphes.size() gt 0}">
            <h2>Lier ce choix à un paragraphe déjà existant</h2>
        </c:if>
        <c:forEach items="${tousParagraphes}" var="paragraphe">
            <c:choose>
                <c:when test="${paragraphe.paragrapheId != fatherId}">
                    ${paragraphe.titre}
                    <form action="ctrlChoix" method="post" accept-charset="UTF-8">
                        <div class="form-group">
                            <input type="hidden" name="action" value="updExistant"/>  
                            <input type="hidden" name="numero" value="${numero}"/> 
                            <input type="hidden" name="id" value="${fatherId}"/>
                            <input type="hidden" name="titre" value="${paragraphe.titre}"/>
                            <input type="hidden" name="sonId" value="${paragraphe.paragrapheId}"/>
                            <input type="submit" value="Valider"/>
                        </div>
                    </form>
                </c:when>
            </c:choose>
        </c:forEach>
    </body>
</html>
