<%-- 
    Document   : Participation
    Created on : Apr 15, 2021, 9:44:16 AM
    Author     : ensimag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Participation</title>
    </head>
    <body>
        <h1>Vous pouvez contribuer à ces histoires</h1>
        <table>
            <th>Titre</th>
            <th></th>
            </tr>
            <c:forEach items="${hsitoireAParticiper}" var="histoire">
                <tr>
                    
                    <td>
                        <form action="ctrlParticipation" method="post" accept-charset="UTF-8">
                            <input type="hidden" name="action" value="getInitial"/>   
                            <input type="hidden" name="id" value="${histoire.histoireId}"/> 
                            <input type="submit" value="${histoire.titre}" />
                        </form>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${histoire.userCreator==utilisateur.login}">
                                <c:if test="${not histoire.ouverte}">
                                    <form action="story" method="post" accept-charset="UTF-8">
                                        <input type="hidden" name="action" value="inviter"/>   
                                        <input type="hidden" name="id" value="${histoire.histoireId}"/> 
                                        <input type="submit" value="Inviter un utilisateur" />
                                    </form>
                                </c:if>
                                
                                <c:choose>
                                <c:when test="${histoire.achevee}">
                                    <c:choose>
                                    <c:when test="${histoire.publiee}">
                                        <form action="ctrlAccueil" method="post" accept-charset="UTF-8">
                                            <input type="hidden" name="action" value="dePublier"/>   
                                            <input type="hidden" name="id" value="${histoire.histoireId}"/> 
                                            <input type="submit" value="dépublier" />
                                        </form>
                                    </c:when>
                                    <c:otherwise>
                                        <form action="ctrlAccueil" method="post" accept-charset="UTF-8">
                                            <input type="hidden" name="action" value="publier"/>   
                                            <input type="hidden" name="id" value="${histoire.histoireId}"/> 
                                            <input type="submit" value="publier" />
                                        </form>
                                    </c:otherwise>
                                    </c:choose>
                                </c:when>
                                </c:choose>
                            </c:when>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
