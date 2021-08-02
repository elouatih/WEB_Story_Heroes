<%-- 
    Document   : lire
    Created on : Apr 12, 2021, 2:38:52 PM
    Author     : ensimag
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <link rel="stylesheet" href="./css/styleGeneral.css" />
            <title>L'histoire dont vous êtes le HERO</title>
        <link rel="SHORTCUT ICON" href="images/favicon.png" type="image/x-icon" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <h1>Liste des histoires que vous pouvez lire</h1>
        <table>
            <th>Titre</th>
            <th>Auteurs</th>
            </tr>
            <c:forEach items="${publiees}" var="histoire">
                <tr>
                    <td>
                        <form action="ctrlLecture" method="post" accept-charset="UTF-8">
                            <input type="hidden" name="action" value="getInitial"/>   
                            <input type="hidden" name="id" value="${histoire.histoireId}"/> 
                            <input type="submit" value="${histoire.titre}" />
                        </form>
                    </td>
                    
                    <td>
                        <form action="ctrlAccueil" method="post" accept-charset="UTF-8">
                            <input type="hidden" name="action" value="getAuteurs"/>   
                            <input type="hidden" name="id" value="${histoire.histoireId}"/> 
                            <input type="submit" value="Auteurs" />
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
        
        
        
    </body>
</html>
