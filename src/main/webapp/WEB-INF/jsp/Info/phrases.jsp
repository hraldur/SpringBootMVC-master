<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<html lang="en">

<head>
    <title>Phrases</title>

</head>
    <body>

    <h1>Phrases</h1>

    <sf:form method="POST" commandName="phrases" action="/phrases">
        <table>
            <tr>
                <td> Name:</td>
                    <%--the `path` attribute matches the `name` attribute of the Entity that was passed in the model--%>
                <td><sf:input path="type" type="text" placeholder="TYPE"/></td>
            </tr>
            <tr>
                <td>Notes:</td>
                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                <td><sf:textarea path="english" type="text" placeholder="ENGLISH"/></td>
            </tr>
            <tr>
                <td>Notes:</td>
                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                <td><sf:textarea path="icelandic" type="text" placeholder="ICELANDIC"/></td>
            </tr>
        </table>

        <input type="submit" VALUE="Post It!"/>



    </sf:form>




    <c:choose>
        <%--If the model has an attribute with the name `postitNotes`--%>
        <c:when test="${not empty phrase}">
            <%--Create a table for the Postit Notes--%>
            <table>

                    <tr>
                        <th>Type</th><th>English</th><th>Icelandic</th>
                    </tr>
                    <%--For each postit note, that is in the list that was passed in the model--%>
                    <%--generate a row in the table--%>
                    <%--Here we set `postit` as a singular item out of the list `postitNotes`--%>
               <c:forEach  var="phrases" items="${phrase}">
                    <tr>
                            <%--We can reference attributes of the Entity by just entering the name we gave--%>
                            <%--it in the singular item var, and then just a dot followed by the attribute name--%>

                            <%--Create a link based on the name attribute value--%>
                        <td>${phrases.type}</td>
                        <td>${phrases.english}</td>
                                <td>${phrases.icelandic}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:when>

        <%--If all tests are false, then do this--%>
        <c:otherwise>
            <h3>No phrases!</h3>
        </c:otherwise>
    </c:choose></body>
</html>