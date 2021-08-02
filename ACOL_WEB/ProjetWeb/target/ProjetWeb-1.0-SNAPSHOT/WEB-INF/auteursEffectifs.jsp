<%-- 
    Document   : auteursEffectifs
    Created on : Apr 13, 2021, 2:23:07 PM
    Author     : imadrafai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Auteurs</title>
    </head>
    <body>
        <div>Les auteurs qui ont contribué à l'histoire : ${titre}</div>
        <ul>
        <c:forEach items="${auteurs}" var="auteur">
            <li>${auteur}</li>
        </c:forEach>
        </ul>       
        
    <%-- Retour vers lire.jsp --%>
        
    </body>
</html>
