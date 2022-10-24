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
    <title>Details évènement</title>
</head>
<body>

<h1>Evenement details</h1>
<div>Date: ${events.startingDate}</div>
<div>Titre: ${events.endingDate}</div>
<div>Titre: ${events.title}</div>
<div>Titre: ${events.prospect}</div>
<div>Titre: ${events.description}</div>
<div>Titre: ${events.adresse}</div>
<div>Titre: ${events.tel}</div>

<c:if test="${deletedForm}">
    <div>
        <form action="${pageContext.request.contextPath}/events/delete/${note.id}" method="post">
            <input id="id" name="id" type="text" value="${event.id}" required hidden=/>
            <div>Spprimer cet évènement?</div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <button type="submit">Oui</button>
        </form>
    </div>
</c:if>
<div><a href="${pageContext.request.contextPath}/events/${event.prospect.id}">Retour</a></div>

</body>
</html>