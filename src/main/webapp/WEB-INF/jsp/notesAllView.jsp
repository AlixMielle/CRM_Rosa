<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!doctype html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <title>Liste de contacts</title>
</head>
<body>

<div><a href="${pageContext.request.contextPath}/notes/${idProspect}">all notes</a> <a href="${pageContext.request.contextPath}/notes/add/${idProspect}">Ajout de prospect</a></div>

<h1>Liste Notes</h1>
<c:forEach items="${notes}" var="note">
    <div>Date: ${note.createdAt}</div>
    <div>Titre: ${note.title}</div>
    <div><a href="${pageContext.request.contextPath}/notes/${idProspect}/${note.id}">Details</a> <a href="${pageContext.request.contextPath}/notes/delete/${note.id}">Suppression</a> <a href="${pageContext.request.contextPath}/notes/edit/${prospect.id}">Mise a jour</a></div>
</c:forEach>

</body>
</html>