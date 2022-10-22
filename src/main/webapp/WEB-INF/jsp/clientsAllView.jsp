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
    <title>Liste de clients</title>
</head>
<body>

<form class="d-flex" role="search" action="${pageContext.request.contextPath}/clients/search" method="get">
    <input class="form-control me-2" type="search" placeholder="Rechercher" aria-label="Search" name="search">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    <button class="btn btn-outline-success" type="submit">Search</button>
</form>

<div><a href="${pageContext.request.contextPath}/prospects/all">all prospects</a> <a href="${pageContext.request.contextPath}/prospects/add">Ajout de prospect</a></div>

<h1>Liste Clients</h1>
<c:forEach items="${clients}" var="client">
    <div>Prenom: ${client.firstName}</div>
    <div>Nom de famille: ${client.lastName}</div>
    <div><a href="${pageContext.request.contextPath}/clients/details/${prospect.id}">Details</a> <a href="${pageContext.request.contextPath}/clients/delete/${prospect.id}">Suppression</a> <a href="${pageContext.request.contextPath}/clients/edit/${prospect.id}">Mise a jour</a></div>
</c:forEach>

</body>
</html>