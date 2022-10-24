<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <title>Ajout d'évènement</title>
</head>
<body>

<div><a href="${pageContext.request.contextPath}/events/${idProspect}">Evènements</a></div>

<div>
    <form action="${pageContext.request.contextPath}/events<c:choose><c:when test="${empty prospect}">/add</c:when><c:otherwise>/edit</c:otherwise></c:choose>" method="post">
        <c:if test="${!empty event}"><input hidden type="text" name="id" value="${event.id}"></c:if>
        <input hidden type="text" name="idProspect" id="idProspect" value="${idProspect}">
        <div>
            <label for="title">Titre:</label>
            <input type="text" name="title" id="title" <c:if test="${!empty event}">value="${event.title}"</c:if>>
        </div>
        <div>
            <label for="content">Contenu:</label>
            <input type="textarea" name="content" id="content" <c:if test="${!empty event}">value="${event.content}"</c:if>>
        </div>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

        <div>
            <button type="submit"><c:choose><c:when test="${empty prospect}">Ajouter</c:when><c:otherwise>Editer</c:otherwise></c:choose></button>
        </div>
    </form>
</div>

</body>
</html>