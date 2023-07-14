<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/style.css">
    <title>Тест JSP</title>
</head>
<body>
<section>
    <table border="1" cellpadding="8" cellspacing="0">
        <tr>
            <th>Имя</th>
            <th>Email</th>
            <th>пусто 1</th>
            <th>пусто 2</th>
        </tr>

        <tr>
            <td>
<%--                получение атрибута transport_test старым или новым синтаксисом --%>
<%--                <%= request.getAttribute("transport_test")%>--%>
                ${transport_test}
            </td>
            <td>
<%--                получение атрибута name, который передается из transportServlet через /transport?name=Dima--%>
<%--                <%= request.getAttribute("name")%>--%>
                Hello, ${name}!
            </td>
            <td>
                3333 text
            </td>
            <td>
                4444 text
            </td>
        </tr>
    </table>
</section>
</body>
</html>